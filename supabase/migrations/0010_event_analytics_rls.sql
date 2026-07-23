-- SafePass v3.2 — Feature flags RLS + buddy group membership policies

alter table public.feature_flags enable row level security;
alter table public.buddy_groups enable row level security;
alter table public.buddy_group_members enable row level security;

-- Feature flags: read-only for all authenticated users
create policy "feature_flags_select_all_authenticated"
  on public.feature_flags for select
  using ( auth.role() = 'authenticated' );

-- Staff can update feature flags
create policy "feature_flags_update_staff"
  on public.feature_flags for update
  using ( (auth.jwt() ->> 'role') = 'event_staff' );

-- Buddy groups: creator can manage, members can read
create policy "buddy_groups_select_member"
  on public.buddy_groups for select
  using (
    id in (
      select group_id from public.buddy_group_members
      where user_id = auth.uid()
    )
  );

create policy "buddy_groups_insert_own"
  on public.buddy_groups for insert
  with check ( created_by = auth.uid() );

create policy "buddy_group_members_select_own_group"
  on public.buddy_group_members for select
  using (
    group_id in (
      select group_id from public.buddy_group_members where user_id = auth.uid()
    )
  );

create policy "buddy_group_members_update_own_sharing"
  on public.buddy_group_members for update
  using ( user_id = auth.uid() );
