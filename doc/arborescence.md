# SafePass — Mobile Application Structure
## v3.0 — Based on Léa Dubois User Journey & Claude Code Documentation v3

---

## 🏗️ GLOBAL STRUCTURE

The app is organised around **5 main sections** accessible via a persistent bottom navigation bar, preceded by onboarding and authentication flows.

```
[Home]  [Payment]  [Safety]  [Map]  [Profile]
```

> **🆕 v3 changes reflected in this file:**
> - Backend: Firebase → Supabase (Auth, PostgreSQL, Realtime, Edge Functions)
> - Personal info (name, birth year, sex assigned at birth) now collected at sign-up
> - Multiple emergency contacts (max 5, reorderable by priority)
> - Granular map sharing: master invisible toggle + per-friend `sharing_enabled`
> - No-pulse alert (amber overlay) + NFC payment auto-lock
> - SOS button enlarged to 120dp diameter
> - Light theme added (dark remains default) — toggled in Appearance settings
> - Notification preferences split into 8 categories
> - Demo Mode (mock data, no hardware required)
> - flutter_flavor: dev / staging / prod build configurations
> - l10n: FR-fr default locale

---

## 📱 DETAILED STRUCTURE

```
SafePass App
│
├── 🚪 ONBOARDING (first use only)
│   ├── Screen 1 — Welcome
│   │   └── SafePass introduction: 3 key benefits
│   ├── Screen 2 — Features
│   │   └── Interactive carousel (Payment, Safety, Friends, Alerts)
│   ├── Screen 3 — Permissions
│   │   └── Bluetooth, Location, Notifications
│   └── → /auth/login or /auth/signup
│
├── 🔐 AUTHENTICATION
│   ├── /auth/login — Login Screen
│   │   ├── Apple Sign-In
│   │   ├── Google Sign-In
│   │   ├── Email + Password (show/hide toggle)
│   │   ├── Magic Link option
│   │   └── → Forgot Password
│   │
│   └── /auth/signup — Sign-Up Form          ← 🆕 v3: collects personal info at creation
│       ├── Full Name (required, 2–60 chars)
│       ├── Email (validated)
│       ├── Password (min 8 chars, show/hide)
│       ├── Birth Year picker (used for BAC age-gate: disabled if <18)
│       ├── Sex Assigned at Birth            ← field: sex_assigned_at_birth (NOT biological_sex)
│       │   └── 3-option selector: Male | Female | Prefer not to say
│       │       └── Affects Widmark r constant in BAC calculation
│       ├── GDPR consent card (mandatory checkbox — cannot create account without)
│       └── CTA: "Create Account" → creates Supabase Auth user + writes to users table
│
├── 🏠 HOME (Tab 1) — /home
│   ├── Header
│   │   ├── SafePass logo
│   │   ├── Bracelet connection status (Connected / Disconnected)
│   │   ├── OfflineBanner (shown when network unavailable)    ← 🆕 v3
│   │   └── Notification icon (badge if unread)
│   │
│   ├── Bracelet Section
│   │   ├── "Bracelet Status" card
│   │   │   ├── Bracelet ID (#SP-XXXX)
│   │   │   ├── Battery level + power mode indicator
│   │   │   ├── Last BLE sync timestamp
│   │   │   └── payment_locked status indicator         ← 🆕 v3
│   │   └── "Activate my bracelet" button (if not yet activated)
│   │
│   ├── Balance Section
│   │   ├── "My Balance" card (large display)
│   │   └── CTA button: "Top Up"
│   │
│   ├── Quick Actions (4 tiles)
│   │   ├── Top Up
│   │   ├── My BAC
│   │   ├── My Friends
│   │   └── Event Map
│   │
│   └── Recent History
│       ├── Last 3–4 transactions (time, vendor, amount, type icon)
│       └── Link: "View full history"
│
├── 💳 PAYMENT (Tab 2) — /payment
│   │
│   ├── /payment — Wallet Screen
│   │   ├── Current balance (large card)
│   │   ├── Spending chart (by hour or by type — fl_chart)
│   │   ├── payment_locked modal if active                ← 🆕 v3
│   │   │   └── "Payments are locked. Open SafePass to re-enable."
│   │   └── CTA: "Top Up Now"
│   │
│   ├── /payment/recharge — Recharge Screen
│   │   ├── Current balance reminder
│   │   ├── Suggested amounts (€10, €20, €50, €100)
│   │   ├── Custom amount input
│   │   ├── Payment method selector
│   │   │   ├── Apple Pay / Google Pay
│   │   │   ├── Bank card
│   │   │   └── Physical terminal (shows location)
│   │   └── "Top Up" button → Confirmation Screen
│   │       ├── Success animation (Lottie)
│   │       ├── New balance
│   │       ├── Transaction summary
│   │       └── "Back to Home" button
│   │
│   ├── /payment/history — Transaction History
│   │   ├── Filters: by date | by type (bar/food/recharge) | by amount
│   │   ├── Full transaction list
│   │   │   └── Each row: timestamp, vendor, amount, source (bracelet|phone)
│   │   └── Export (PDF / Email)
│   │
│   └── Error States (all handled)                        ← 🆕 v3
│       ├── Insufficient balance modal
│       ├── Alcohol NFC purchase blocked (BAC High zone)
│       ├── Payment locked (no-pulse triggered)
│       │   └── "I'm OK" flow to re-enable payments
│       └── Offline payment confirmation (token queued)
│
├── 🛡️ SAFETY (Tab 3) — /safety
│   │
│   ├── /safety/health-gate — Health Gate Modal        (first Safety tab visit only)
│   │   ├── Explanation of why health data is needed
│   │   ├── GDPR data usage reminder
│   │   └── "Enter my health data" → /profile/health
│   │       └── Weight (kg) | Height (cm)
│   │           (sex assigned at birth already collected at sign-up)
│   │
│   ├── /safety — Safety Dashboard
│   │   │
│   │   ├── SOS Button                                   ← 🆕 v3: 120dp (was 80dp)
│   │   │   ├── 120dp diameter circular button
│   │   │   ├── Persistent label "HOLD 3s" below
│   │   │   ├── Countdown ring animation on press
│   │   │   └── → /safety/sos after 3s hold
│   │   │
│   │   ├── BAC Wellness Card
│   │   │   ├── Circular gauge (fl_chart RadialBarChart)
│   │   │   │   └── Colour + icon per BacZone (colour-blind safe)
│   │   │   ├── "X units / Y max" inside ring
│   │   │   └── Mandatory disclaimer chip (always visible, cannot be hidden):
│   │   │       "This is an estimate based on your declared drinks, not a medical
│   │   │        measurement. If you feel impaired, act on how you feel."
│   │   │
│   │   ├── Heart Rate Card
│   │   │   ├── Current BPM (36sp bold)
│   │   │   ├── Mini sparkline chart
│   │   │   └── Status badge: colour + icon (colour-blind safe)
│   │   │
│   │   ├── No-Pulse Alert (auto-triggered)              ← 🆕 v3
│   │   │   ├── Trigger: MAX30102 reports absent pulse >10 consecutive seconds
│   │   │   ├── Effect: payment_locked = true (bracelet + Supabase)
│   │   │   ├── UI: fullscreen amber overlay (NOT red — not a confirmed emergency)
│   │   │   ├── MDR-safe text: "Unusual sensor reading — no pulse detected.
│   │   │   │   Please check your wristband and confirm you are OK."
│   │   │   ├── Button "I'm OK" → cancels, re-enables NFC payments
│   │   │   ├── Button "I need help" → dispatches wellness alert
│   │   │   └── Auto-cancel after 60s if no response (event logged)
│   │   │
│   │   ├── "I feel impaired" button
│   │   │   └── Triggers SOS countdown regardless of BAC estimate
│   │   │
│   │   ├── Emergency Contacts card                      ← 🆕 v3: multiple contacts
│   │   │   ├── All emergency contacts listed (name + phone)
│   │   │   ├── Primary contact shown first (priority_order)
│   │   │   └── Edit icon → /profile/emergency-contacts
│   │   │
│   │   ├── Nearest First Aid
│   │   │   └── "First Aid — 120m — Zone B3" → /map with first aid filter
│   │   │
│   │   └── Emergency Numbers (collapsible)
│   │       └── SAMU 15 | Police 17 | Pompiers 18 | European 112 (tel: links)
│   │
│   ├── /safety/bac — BAC Wellness Monitor (detail)
│   │   ├── Hero: animated progressive circle (fl_chart RadialBarChart)
│   │   │   ├── BAC g/L value (large display)
│   │   │   ├── Units consumed / max recommended
│   │   │   └── BacZone colour + icon (colour-blind safe — always both)
│   │   ├── BacZone classification:
│   │   │   ├── Safe (0.00–0.40): Green + check_circle — no restrictions
│   │   │   ├── Moderate (0.40–0.80): Orange + warning — push notification + water suggestion
│   │   │   ├── High (0.80–1.20): Red + dangerous (pulsing) — alcohol NFC blocked
│   │   │   └── Critical (>1.20): Red + SOS icon — alert all emergency contacts + SOS modal
│   │   ├── "Last drink" card (time, type, alcohol units)
│   │   ├── "Estimated sober time" card (~2h30 / 23:45)
│   │   ├── Hydration suggestion (water icon + nearest water point location)
│   │   ├── Mandatory disclaimer (always visible)
│   │   ├── "How does this work?" → Modal: Widmark formula explanation
│   │   └── "Edit my info" → /profile/health
│   │
│   ├── /safety/cardiac — Heart Rate Wellness Monitor
│   │   ├── Current BPM (36sp bold)
│   │   ├── Real-time chart (last 60 seconds — fl_chart LineChart)
│   │   ├── Daily history (mini sparkline)
│   │   ├── Status zones: Rest / Normal / Elevated / Unusual
│   │   └── Automatic wellness alert if unusual pattern detected
│   │
│   └── /safety/sos — Emergency Alert (fullscreen modal)
│       ├── MDR-safe header: "Wellness Alert — Requesting Assistance"
│       ├── Alert type (movement anomaly / cardiac unusual / no-pulse / manual SOS)
│       ├── Details: detection time, GPS location, sensor readings
│       ├── Countdown: "Alert sent — help is on the way"
│       ├── Large button "I'M OK" (green) → cancels + logs
│       └── Large button "I NEED HELP" (red) → dispatches to all emergency contacts
│
├── 🗺️ MAP (Tab 4) — /map
│   │
│   ├── /map — Interactive Event Map
│   │   ├── Search bar: "Find a location..."
│   │   │
│   │   ├── Interactive map (flutter_map — OSM or custom event image overlay)
│   │   │   ├── My position (pulsing turquoise dot)
│   │   │   ├── Friends' positions (avatar + name)
│   │   │   │   └── Only shown if sharing_enabled: true for that friend  ← 🆕 v3
│   │   │   ├── Stale position indicator (last seen X min ago)           ← 🆕 v3
│   │   │   └── Points of interest:
│   │   │       ├── Stages (music icon)
│   │   │       ├── Bars (drink icon)
│   │   │       ├── Food trucks (cutlery icon)
│   │   │       ├── Toilets (WC icon)
│   │   │       ├── First Aid (red cross)
│   │   │       ├── Water points (blue drop)
│   │   │       └── Rest areas (green bench)
│   │   │
│   │   ├── Quick filters (horizontal scroll)
│   │   │   └── All | Friends | Bars | Stages | Toilets | First Aid | Water
│   │   │
│   │   └── Privacy controls (top-right)                  ← 🆕 v3
│   │       ├── Master invisible toggle (hides my position from everyone)
│   │       └── → /map/buddy for per-friend granular control
│   │
│   └── /map/buddy — Buddy System Management
│       ├── My group list
│       │   ├── Create / join group
│       │   └── Group members (avatar, name, last seen)
│       ├── Per-friend sharing toggle                      ← 🆕 v3
│       │   └── sharing_enabled bool per buddy_group_member row
│       ├── "Meeting point" feature (drop pin + notify group)
│       └── Beacon mode: "I'm here!" alert to group
│
└── 👤 PROFILE (Tab 5) — /profile
    │
    ├── /profile — Profile Screen
    │   ├── Avatar (image_picker upload to Supabase Storage)
    │   ├── Name + birth year
    │   ├── App version (package_info_plus)                ← 🆕 v3
    │   ├── Bracelet battery + power mode selector         ← 🆕 v3
    │   │   └── Performance | Balanced | Ultra
    │   └── Navigation links to sub-screens
    │
    ├── /profile/health — Health Info Form
    │   ├── Note: sex assigned at birth already set at signup (editable here)
    │   ├── Weight (kg) — required for Widmark
    │   ├── Height (cm)
    │   └── health_data_provided flag updated on save
    │
    ├── /profile/emergency-contacts — Emergency Contacts   ← 🆕 v3: multiple contacts
    │   ├── Reorderable list (drag to set priority_order)
    │   ├── Max 5 contacts
    │   ├── Each contact: full name + phone + country code
    │   ├── Add contact button
    │   └── Primary contact badge (priority_order = 1)
    │
    └── /profile/settings — App Settings
        │
        ├── /profile/settings/notifications — Notification Preferences    ← 🆕 v3
        │   └── 8 toggle categories:
        │       ├── Buddy System alerts
        │       ├── Safe zone alerts
        │       ├── BAC & Wellness alerts
        │       ├── Payment alerts
        │       ├── Heart rate alerts
        │       ├── Hydration reminders
        │       ├── Event information
        │       └── System / app notifications
        │
        ├── /profile/settings/appearance — Appearance Settings             ← 🆕 v3
        │   ├── Theme toggle: Dark (default) | Light
        │   │   └── ThemeModeNotifier persisted in SharedPreferences
        │   ├── Language (FR-fr default | EN fallback)
        │   └── Font size accessibility option
        │
        └── GDPR / Account
            ├── Download my data
            ├── Delete my account (GDPR full deletion flow)   ← 🆕 v3
            └── Privacy policy link
```

---

## ⚙️ MODALS & OVERLAYS (contextually accessible)

```
├── Bracelet Activation Modal
│   ├── Scan QR code on bracelet
│   ├── Manual ID entry
│   └── Visual pairing instructions
│
├── NFC Payment Failed Modal
│   ├── Clear error message
│   ├── Suggested solutions
│   └── "Retry" / "Contact support"
│
├── Payment Locked Modal                    ← 🆕 v3
│   ├── "Payments locked — no-pulse detected"
│   ├── "I'm OK" button → unlocks payment
│   └── "I need help" button → dispatches alert
│
├── Alcohol Purchase Blocked Modal
│   ├── Pedagogical explanation (BAC zone reached)
│   ├── Alternatives (water, soda, food)
│   ├── Estimated sober time
│   └── Nearest rest zone location
│
├── No-Pulse Alert Overlay                  ← 🆕 v3
│   ├── Amber background (NOT red)
│   ├── MDR-safe text (wellness language)
│   ├── 60s auto-cancel countdown
│   ├── "I'm OK" → cancels + re-enables payment
│   └── "I need help" → dispatches wellness alert
│
├── Buddy Found Modal
│   ├── Success animation (Lottie)
│   ├── Friend position on mini-map
│   └── "I'm on my way!" button
│
├── Emergency Alert Sent Confirmation
│   ├── Reassuring message
│   ├── Who was alerted (all emergency contacts in priority order + buddy group)
│   └── "Cancel" button (false alarm)
│
└── Event Exit Modal
    ├── Exit scan confirmation
    ├── Short recap (balance, top transactions)
    └── "View full recap" → Post-Event Recap
```

---

## 🔔 NOTIFICATIONS (overlay accessible everywhere)

```
Notification Centre
├── List by category (8 categories — configurable in /profile/settings/notifications)
│   ├── Safety alerts (red) — cardiac unusual, no-pulse, movement anomaly
│   ├── BAC & Wellness (orange) — zone change, disclaimer reminders
│   ├── Buddy System (purple) — friend found, friend needs help
│   ├── Payment (green) — transaction confirmed, balance low, payment locked
│   ├── Hydration (cyan) — hydration reminders (Hydration Guard)
│   ├── Safe zone (blue) — friend left zone
│   ├── Event info (grey) — programme updates, announcements
│   └── System (grey) — app updates, connectivity
├── Mark as read / Delete
└── Quick settings (gear icon → /profile/settings/notifications)
```

---

## 📊 POST-EVENT RECAP (special end screen)

```
/recap — Post-Event Summary Screen (BONUS feature)
├── Thank-you message
├── Personal statistics
│   ├── Total spent
│   ├── Number of transactions
│   ├── Most visited location
│   ├── Distance walked
│   └── Time at event
├── Key moments timeline (artists seen, etc.)
├── Anonymous comparison (vs average festival-goer)
└── Action buttons
    ├── "Download recap" (PDF)
    ├── "Share on social media"
    └── "Give feedback"
```

---

## 🎯 NAVIGATION & CRITICAL FLOWS

### Critical Flow 1 — First Use

```
Onboarding (3 screens) → /auth/signup (name + birth year + sex assigned at birth + GDPR)
→ /home → Activate bracelet modal → Top up balance → Home (ready)
```

### Critical Flow 2 — NFC Payment (Online)

```
/home → "Top Up" → /payment/recharge → Select amount → Apple Pay
→ Confirmation → /home (balance updated via Supabase Realtime)
```

### Critical Flow 3 — NFC Payment (Offline)

```
Bracelet tap → Pre-cached token validated locally → Balance deducted on bracelet flash
→ Transaction queued in OfflineQueueService (Hive) → Sync to Supabase on reconnect
```

### Critical Flow 4 — Friend Location

```
/map → Activate "My Friends" filter → Select friend (if sharing_enabled: true)
→ View real-time position → "Navigate" → Route on map
OR
/map/buddy → Per-friend sharing toggle → Notify group: "I'm here!"
```

### Critical Flow 5 — BAC Alert

```
Safety → BAC Wellness Monitor → Moderate alert (orange push notif)
→ Hydration suggestions + nearest water point
OR
NFC tap at bar → Edge Function: BAC = High → Payment blocked → Alcohol modal
→ Alternatives displayed
```

### Critical Flow 6 — No-Pulse Detection *(🆕 v3)*

```
[AUTO] MAX30102 reports absent pulse >10s
→ payment_locked = true (written to bracelet flash + Supabase via BLE/queue)
→ Amber fullscreen overlay (MDR-safe language)
→ IF "I'm OK": payment re-enabled, event logged
→ IF "I need help": wellness alert dispatched to all emergency contacts (priority order)
→ IF no response after 60s: auto-cancel + event logged
```

### Critical Flow 7 — Manual SOS

```
/safety → SOS button (hold 3s) → Countdown ring animation
→ /safety/sos modal → Alert dispatched
→ "I'M OK" cancels | "I NEED HELP" confirms + GPS shared
```

### Critical Flow 8 — Offline Sync (Bracelet-First) *(🆕 v3)*

```
BLE reconnects after gap
→ BraceletSyncService.syncOnReconnect()
→ Pull bracelet flash records (source of truth)
→ Pull phone Hive records for same time range
→ Merge: bracelet data OVERWRITES phone data for any overlapping timestamps
→ Push merged records to Supabase (tagged source: 'bracelet')
```

---

## 📐 INFORMATION HIERARCHY

### Priority 1 (always visible — persistent in UI)
- Bracelet connection status
- Available balance
- BAC level indicator (visual chip)
- Critical alerts (no-pulse, cardiac unusual)
- OfflineBanner (when disconnected)

### Priority 2 (accessible in 1 tap)
- Top Up
- Friend location
- Event map
- Transaction history

### Priority 3 (accessible in 2+ taps)
- Detailed statistics
- Notification settings
- Appearance settings
- Health info form
- Emergency contacts management

---

## ✅ VALIDATION AGAINST USER JOURNEY

| Journey Step | Screens | Notes |
|-------------|---------|-------|
| 1. Buys ticket | (External) | SafePass mention + download link |
| 2. Downloads app | Onboarding (3 screens) | Smooth, no health form here |
| 3. Creates account | /auth/signup | Name + birth year + sex assigned at birth + GDPR |
| 4. Top-up €50 | /payment/recharge | Suggested amounts, Apple Pay 2 taps |
| 5. Activates bracelet | /home → Activation modal | BLE QR scan, <30s |
| 6. Pays first drink | NFC tap (external) → push notif | Instant feedback, history updated |
| 7. Locates friends | /map → per-friend toggle | Real-time positions (Supabase Realtime) |
| 8. BAC alert | /safety/bac → push notif | Benevolent wording, hydration suggestions |
| 9. Purchase refused | NFC blocked → modal | Pedagogical, time-to-sober shown |
| 10. No-pulse detected | Auto → amber overlay | MDR-safe, payment locked, 60s countdown |
| 11. First aid arrives | /safety/sos + external | Contacts alerted in priority order |
| 12. Resumes festival | /home | Payments re-enabled (I'm OK flow) |
| 13. Event exit | Exit scan → /recap | Full stats, PDF download, feedback |

---

## 📊 STRUCTURE SUCCESS METRICS

- ✅ All 13 user journey steps covered by dedicated screens or flows
- ✅ Maximum 3 taps to reach any core feature from home
- ✅ Consistent with Léa persona (simplicity, speed, safety-first)
- ✅ MDR-compliant language throughout Safety tab
- ✅ Colour-blind accessible (colour + icon always paired)
- ✅ Offline-first architecture (bracelet flash → Hive → Supabase)
- ✅ GDPR-compliant (consent at signup, deletion flow in settings)
- ✅ Scalable for MVP 2–3 additional features

---

**This structure is ready for Figma wireframing and Claude Code session-by-session implementation. 🚀**

*SafePass v3.0 — Because every life counts, every second counts.*
