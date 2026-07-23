-- SafePass v3.2 — RLS policies for core tables
-- Default-deny: no policy means no access at all.

alter table public.users enable row level security;
alter table public.bracelets enable row level security;
alter table public.payment_transactions enable row level security;
alter table public.gps_positions enable row level security;
alter table public.buddy_groups enable row level security;
alter table public.buddy_group_members enable row level security;

-- ── users ──────────────────────────────────────────────────────────────────
create policy "users_select_own_row"
  on public.users for select
  using ( auth.uid() = id );

create policy "users_update_own_row"
  on public.users for update
  using ( auth.uid() = id );

-- ── bracelets ──────────────────────────────────────────────────────────────
create policy "bracelets_select_own"
  on public.bracelets for select
  using ( auth.uid() = user_id );

create policy "bracelets_update_own"
  on public.bracelets for update
  using ( auth.uid() = user_id );

-- ── payment_transactions ───────────────────────────────────────────────────
create policy "txn_select_own_bracelet"
  on public.payment_transactions for select
  using (
    bracelet_id in (
      select id from public.bracelets where user_id = auth.uid()
    )
  );

-- ── gps_positions ──────────────────────────────────────────────────────────
create policy "gps_upsert_own"
  on public.gps_positions for all
  using ( auth.uid() = user_id );

-- Buddy can see positions of users in the same group
create policy "gps_select_buddy_group"
  on public.gps_positions for select
  using (
    user_id in (
      select m2.user_id
      from public.buddy_group_members m1
      join public.buddy_group_members m2 using (group_id)
      where m1.user_id = auth.uid()
        and m2.sharing = true
    )
  );

-- ── event_analytics_view ───────────────────────────────────────────────────
-- Staff dashboard access via dedicated JWT claim — never a blanket grant.
create policy "staff_select_aggregated_view"
  on public.event_analytics_view for select
  using ( (auth.jwt() ->> 'role') = 'event_staff' );
