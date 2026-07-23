-- SafePass v3.2 — Initial schema
-- All tables start with RLS disabled; individual migration files enable it.

create extension if not exists "uuid-ossp";

-- Users
create table public.users (
  id            uuid primary key references auth.users on delete cascade,
  display_name  text not null,
  year_of_birth int  not null,
  sex           text check (sex in ('male', 'female', 'unspecified')) default 'unspecified',
  weight_kg     numeric,
  consent_given boolean not null default false,
  consent_at    timestamptz,
  created_at    timestamptz not null default now()
);

-- Bracelets
create table public.bracelets (
  id              uuid primary key default uuid_generate_v4(),
  user_id         uuid references public.users on delete cascade,
  nfc_uid         text unique not null,
  balance_eur     numeric not null default 0 check (balance_eur >= 0),
  payment_locked  boolean not null default false,
  locked_reason   text,
  last_seen_at    timestamptz,
  created_at      timestamptz not null default now()
);

-- Payment transactions
create table public.payment_transactions (
  id              uuid primary key default uuid_generate_v4(),
  bracelet_id     uuid references public.bracelets on delete cascade,
  amount_eur      numeric not null,
  label           text,
  created_at      timestamptz not null default now()
);

-- GPS positions (Buddy System — purged on event end)
create table public.gps_positions (
  user_id     uuid primary key references public.users on delete cascade,
  lat         double precision not null,
  lng         double precision not null,
  updated_at  timestamptz not null default now()
);

-- Buddy groups
create table public.buddy_groups (
  id          uuid primary key default uuid_generate_v4(),
  name        text,
  created_by  uuid references public.users,
  event_id    text not null,
  created_at  timestamptz not null default now()
);

create table public.buddy_group_members (
  group_id    uuid references public.buddy_groups on delete cascade,
  user_id     uuid references public.users on delete cascade,
  sharing     boolean not null default true,
  primary key (group_id, user_id)
);

-- Feature flags (progressive rollout)
create table public.feature_flags (
  flag_name     text primary key,
  enabled       boolean not null default false,
  rollout_pct   int check (rollout_pct between 0 and 100) default 0,
  updated_at    timestamptz not null default now()
);

-- Event analytics view (staff only via JWT claim)
create view public.event_analytics_view as
  select
    date_trunc('hour', created_at) as hour,
    count(*) as transaction_count,
    sum(amount_eur) as total_eur
  from public.payment_transactions
  group by 1;
