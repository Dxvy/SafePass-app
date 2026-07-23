# 🎫 SafePass — Connected Festival Wristband

> **Intelligent safety and seamless experience for festivals and large-scale events**

![Version](https://img.shields.io/badge/version-3.0-blue.svg)
![Status](https://img.shields.io/badge/status-MVP%20Development-orange.svg)
![Platform](https://img.shields.io/badge/platform-Flutter%20iOS%20%26%20Android-informational.svg)
![Backend](https://img.shields.io/badge/backend-Supabase-green.svg)
![License](https://img.shields.io/badge/license-Proprietary-red.svg)

---

## 📋 Table of Contents

1. [Project Vision](#-project-vision)
2. [Problem Statement](#-problem-statement)
3. [SafePass Solution](#-safepass-solution)
4. [Personas](#-personas)
5. [User Journey](#-user-journey)
6. [Features](#-features)
7. [Technical Architecture](#-technical-architecture)
8. [App Structure](#-app-structure)
9. [Design System](#-design-system)
10. [MVP Roadmap](#-mvp-roadmap)
11. [Competitive Analysis](#-competitive-analysis)
12. [Budget & Revenue Model](#-budget--revenue-model)
13. [Team & Contacts](#-team--contacts)
14. [Changelog](#-changelog)

---

## 🎯 Project Vision

SafePass is a **next-generation connected event wristband** combining **proactive safety, contactless payments, and an optimised social experience** — transforming how festivals and events are lived and organised.

### Strategic Goals

- 🛡️ **Safety:** Reduce medical incidents by 60% through automatic wellness detection
- ⚡ **Fluidity:** Cut waiting times by 40% with NFC payment
- 👥 **Social:** Enable seamless friend coordination in crowds
- 📊 **Data:** Provide organisers with real-time insights to optimise events
- 💰 **Viability:** Sustainable business model from 3,000 participants

---

> ### ⚠️ EU MDR Compliance Notice — Read Before Development
>
> Describing SafePass features as *"medical detection"* or *"emergency detection"* may trigger EU Medical Device Regulation 2017/745 (MDR) requirements, including CE-MDR certification.
>
> All feature descriptions in this document intentionally use **wellness and guidance language** (e.g. *"wellness monitoring"*, *"safety indicators"*) rather than clinical language.
>
> **Do not change this wording in the app UI without consulting a regulatory lawyer. Consult legal counsel before the pilot event regarding liability scope.**

---

## ❌ Problem Statement

### For Participants

| Problem | Impact | Frequency |
|---------|--------|-----------|
| **Alcohol overconsumption** | Blackouts, risky behaviour, alcohol poisoning | 15–20% of festival-goers |
| **Slow payments** | 10–15 min queues, stress over lost cash/card | 100% of participants |
| **Lost friends in crowds** | Stress, wasted time, degraded experience | 60–70% of groups |
| **Dehydration** | Fainting, hospitalisations | 10–15% of participants |
| **Delayed medical response** | Complications, preventable fatalities | 5% of critical cases |

### For Organisers

- ⚠️ **Legal liability** in the event of a serious incident
- 💸 **Financial losses** from fraud and cash management
- 🚨 **High rescue costs** (medical teams, evacuations)
- 📉 **Reputation damage** from media-covered incidents
- ⏱️ **Complex flow management** without real-time data

---

## ✨ SafePass Solution

SafePass addresses these challenges through **4 core features + 2 innovative additions**:

### 1️⃣ Instant NFC Payment
- Transaction under 2 seconds with instant balance display
- AES-128 encrypted — pre-cached offline tokens on bracelet flash
- Recharge via app (Apple Pay / Google Pay / bank card)
- Payment automatically locked if no-pulse is detected

### 2️⃣ Wellness BAC Monitor (Widmark Formula)
- Personalised estimation (weight, height, sex assigned at birth)
- Progressive alert system: Safe → Moderate → High → Critical
- Automatic NFC alcohol purchase block at High zone
- Mandatory disclaimer always visible: *"This is an estimate, not a medical measurement"*

### 3️⃣ Safety Indicators (Wellness Monitoring)
- **Heart rate wellness monitor:** current BPM + sparkline + status badge
- **No-pulse alert:** if absent pulse detected >10s → amber fullscreen overlay + NFC payments auto-locked
- **SOS button:** 120dp diameter, hold 3s to activate, MDR-safe language
- Nearest first aid point displayed with estimated distance

### 4️⃣ Buddy System — Friend Location Tracking
- Real-time positions via Supabase Realtime
- Master invisible toggle + per-friend `sharing_enabled` granular control
- Interactive event map (flutter_map / OpenStreetMap or custom image overlay)
- Stale position detection (last seen X minutes ago)

### 🆕 Hydration Guard *(NICE — MVP)*
- BPM + ambient temperature based hydration reminders
- Nearest water point localisation
- Gamified daily objective (1L/4h)

### 🔋 Smart Battery Management *(NICE — MVP)*
- 3 modes: Performance (~1.5 days) / Balanced (~2.5 days) / Ultra (~3+ days)
- Auto-switch on both bracelet AND in-app when phone battery <20%
- Critical safety features always prioritised in economy mode

---

## 👥 Personas

### 🎯 Primary Persona: Léa Dubois

| Attribute | Detail |
|-----------|--------|
| **Age** | 24 years old |
| **Occupation** | Communication student & part-time waitress |
| **Context** | Attends 3–4 festivals/year, iOS user, pays with Apple Pay, uses WhatsApp/Instagram |
| **Goals** | Enjoy the event stress-free, keep in touch with friends, pay quickly, stay safe without limiting fun |
| **Frustrations** | Often loses friends in crowds, fears phone/money theft, has experienced a dehydration episode, hates long bar queues |
| **Quote** | *"I just want to have fun without stressing about my phone, my money, or losing my friends."* |

### 🎯 Secondary Persona: Marc Lefevre

| Attribute | Detail |
|-----------|--------|
| **Age** | 42 years old |
| **Occupation** | Event security chief (5K–20K attendee events) |
| **Key Need** | Real-time wellness alerts, fast intervention, legal liability reduction |
| **Quote** | *"Every second counts. If I can save a life with an automatic alert, I've done my job."* |

### ❌ Excluded Persona: Gérard Moreau (68 years old, retired)

Not in target audience — does not attend festivals, rejects connected devices, pays cash only.

---

## 🗺️ User Journey

### Léa at a Festival — 13 Key Steps

| # | Action | Touchpoint | Emotion | UX Opportunity |
|---|--------|------------|---------|----------------|
| **1** | Buys ticket online | Organiser website | 🤩 Excitement | Mention SafePass included + download link |
| **2** | Downloads SafePass | Mobile onboarding | 🤔 Curiosity | 3 screens max, Apple/Google Sign-In |
| **3** | Fills in signup info | /auth/signup form | 😟 Data hesitation | Explain GDPR + why name/birth year/sex needed |
| **4** | Top-up €50 | Recharge screen | ✅ Confidence | Suggested amounts, Apple Pay 2 taps |
| **5** | Activates wristband | Welcome booth + QR | 🎉 Excitement | Activation <30s, immediate BLE connection test |
| **6** | Pays for first drink | NFC terminal | 😊 Satisfaction | Instant feedback, balance display |
| **7** | Locates lost friends | Map + Buddy System | 😰→😌 Relief | Clear map, per-friend sharing toggles |
| **8** | Receives BAC alert | Push notification | 😮 Surprise | Benevolent wording, hydration suggestions |
| **9** | Alcohol purchase refused | NFC block modal | 😤→😌 Acceptance | Pedagogical explanation, time until sober |
| **10** | Wellness anomaly detected | No-pulse/cardiac alert | 😱 Fear | Amber overlay, MDR-safe language, clear CTA |
| **11** | First aid arrives | External + app | 😌 Reassurance | Medical info accessible, alert confirmation |
| **12** | Resumes festival | Home screen | 😊 Relief | Incident recap, re-enable payments |
| **13** | Exits event | Exit scan + recap | 🥹 Nostalgia | Full stats, PDF download, next event suggestion |

---

## ⚡ Features

### MVP Priority Matrix

| Feature | Description (MDR-safe language) | Priority |
|---------|----------------------------------|----------|
| NFC Payments | Contactless payments under 2 seconds | **MUST — MVP** |
| Wellness BAC Monitor | Widmark-based alcohol intake guidance (wellness indicator, not medical measurement) | **MUST — MVP** |
| Safety Indicators | Accelerometer + heart rate sensors surface unusual readings — wellness alerts, not diagnosis | **MUST — MVP** |
| No-Pulse Alert | Absent pulse >10s → wellness alert + NFC payments auto-locked | **MUST — MVP** |
| Buddy System | Real-time friend location tracking on interactive festival map | **MUST — MVP** |
| Hydration Guard | BPM + ambient temperature based hydration reminders | NICE — MVP |
| Smart Battery Mgmt | 3 power modes with auto-switching on bracelet AND in-app | NICE — MVP |
| Post-Event Recap | Personalised statistics screen after festival ends | BONUS |
| Organiser Dashboard | Web admin panel with real-time analytics for event managers | OUT OF SCOPE |

---

## 🏗️ Technical Architecture

### 2.1 Mobile Application

| Layer | Choice & Rationale |
|-------|-------------------|
| **Framework** | Flutter 3.x (Dart) — cross-platform iOS & Android from a single codebase |
| **State Mgmt** | Riverpod — reactive, testable state management |
| **Navigation** | go_router — declarative, URL-based navigation with deep linking |
| **Local Storage** | Hive (phone-side offline cache) + SharedPreferences for settings |
| **Maps** | flutter_map (OpenStreetMap) or custom event image overlay |
| **BLE/NFC** | flutter_blue_plus (Bluetooth LE) + nfc_manager (NFC read/write) |
| **Charts** | fl_chart — BAC gauge, heart rate graphs, spending charts |
| **Animations** | flutter_animate + Lottie for success/alert micro-animations |
| **Permissions** | permission_handler — Bluetooth, Location, Notifications |
| **Push Notifs** | Supabase Realtime + flutter_local_notifications for in-app alerts |
| **Offline Sync** | Hive offline cache + supabase-flutter + connectivity_plus |
| **Secure Storage** | flutter_secure_storage — Auth refresh tokens, NFC pre-cached tokens |
| **Flavours** | flutter_flavor — separates dev / staging / prod build configurations |
| **Localisation** | flutter_localizations + intl — **FR-fr default locale** |
| **App Info** | package_info_plus — app version, build number, package name at runtime |

### 2.2 Backend — Supabase *(🆕 v3: migrated from Firebase)*

| Service | Usage |
|---------|-------|
| **Authentication** | Supabase Auth — Apple Sign-In, Google Sign-In, Email/Password, Magic Link |
| **Database** | PostgreSQL — users, events, bracelets, transactions, emergency_contacts |
| **Realtime** | Supabase Realtime channels — live GPS positions for Buddy System |
| **Edge Functions** | Deno/TypeScript — Widmark calculation, alert dispatch, NFC payment processing |
| **Storage** | Supabase Storage — profile pictures, event maps |
| **Analytics** | PostHog (self-hosted) or Supabase custom events — anonymised funnel tracking |
| **Crash Reporting** | Sentry Flutter SDK — production stability monitoring |

### 2.3 Hardware — Wearable (ESP32)

| Component | Specification |
|-----------|--------------|
| **Microcontroller** | ESP32-S3 — dual-core, BLE 5.0, low power modes |
| **Heart Rate** | MAX30102 PPG sensor — HR + SpO2 monitoring |
| **Accelerometer** | MPU-6050 — 6-axis IMU for movement and impact detection |
| **NFC** | PN532 module — ISO 14443A/B, AES-128 encrypted transactions |
| **Communication** | BLE 5.0 (to phone) + MQTT over WiFi (to cloud when available) |
| **Battery** | LiPo 300mAh — ~36h in balanced mode |
| **Flash Storage** | Bracelet onboard flash — **primary offline data store**. Sensor data written here first. On BLE reconnect, bracelet data is synced to phone Hive and then Supabase. **Bracelet data always takes priority over phone Hive data when a gap is detected.** |
| **Firmware OTA** | ESP-IDF OTA updates triggered from app when bracelet is connected |

### 2.4 Key Flutter Packages

| Package | Purpose |
|---------|---------|
| `supabase_flutter` | Supabase client (Auth, DB, Realtime, Storage) |
| `flutter_blue_plus` | BLE communication with bracelet |
| `nfc_manager` | NFC payment tap interactions |
| `flutter_map` | Interactive event map |
| `fl_chart` | BAC gauge, HR chart, spending donut |
| `go_router` | Declarative app navigation |
| `flutter_riverpod` | State management |
| `hive_flutter` | Local encrypted cache (phone-side) |
| `connectivity_plus` | Network state detection for offline mode UI |
| `flutter_secure_storage` | Secure keychain for tokens and pre-cached NFC keys |
| `flutter_animate` | Micro-animations (pulse, fade, slide) |
| `lottie` | JSON animations (success, loading, alert) |
| `permission_handler` | Runtime permissions (BLE, Location, Notifs) |
| `local_auth` | Biometric / PIN lock for payment confirmation |
| `package_info_plus` | App version, build number, package name at runtime |
| `flutter_flavor` | Build flavour configuration (dev/staging/prod) |
| `flutter_local_notifications` | Local push notifications when app is foreground |
| `sentry_flutter` | Crash reporting and performance monitoring |

---

## 📱 App Structure

### Navigation — 5 Bottom Bar Tabs

```
[Home]  [Payment]  [Safety]  [Map]  [Profile]
```

### GoRouter Route Map

| Route | Screen | Auth Required |
|-------|--------|--------------|
| `/` | Splash / redirect logic | No |
| `/onboarding` | Onboarding carousel (3 screens) | No |
| `/auth/login` | Login screen | No |
| `/auth/signup` | Sign-up form + personal info (name, birth year, sex assigned at birth) | No |
| `/home` | Home dashboard (Tab 1) | Yes |
| `/payment` | Wallet screen (Tab 2) | Yes |
| `/payment/recharge` | Recharge flow | Yes |
| `/payment/history` | Full transaction history | Yes |
| `/safety` | Safety dashboard (Tab 3) | Yes |
| `/safety/health-gate` | Health data consent modal (first Safety visit) | Yes |
| `/safety/bac` | BAC wellness monitor detail | Yes — health data required |
| `/safety/cardiac` | Heart rate wellness monitor | Yes — health data required |
| `/safety/sos` | Emergency alert fullscreen modal | Yes |
| `/map` | Interactive map (Tab 4) | Yes |
| `/map/buddy` | Buddy System management | Yes |
| `/profile` | Profile & settings (Tab 5) | Yes |
| `/profile/health` | Health info form | Yes |
| `/profile/settings` | App settings | Yes |
| `/profile/settings/notifications` | Notification preferences by category (8 categories) | Yes |
| `/profile/settings/appearance` | Dark/light theme toggle + language + font size | Yes |
| `/profile/emergency-contacts` | Multi-contact emergency list (add/edit/reorder, max 5) | Yes |

### Supabase Data Model

| Table | Key Columns |
|-------|------------|
| `users` | id, name, email, photo_url, weight_kg, height_cm, **sex_assigned_at_birth**, birth_year, consent_gdpr, consent_timestamp, health_data_provided |
| `emergency_contacts` | id, user_id, name, phone, country_code, **priority_order** — supports multiple contacts |
| `bracelets` | id, user_id, event_id, battery_level, balance, power_mode, offline_tokens_remaining, **payment_locked** (bool) |
| `events` | id, name, start_date, end_date, map_url, organiser_id, max_capacity, features (jsonb) |
| `transactions` | id, user_id, bracelet_id, amount, vendor, type, timestamp, synced_at, **source** (bracelet\|phone) |
| `buddy_groups` | id, event_id + buddy_group_members (group_id, user_id, **sharing_enabled** bool) |
| `positions` | user_id, lat, lng, accuracy, updated_at — Supabase Realtime, only written when sharing_enabled: true |
| `alerts` | id, user_id, type (movement_anomaly\|cardiac_unusual\|bac_high\|**no_pulse**), severity, status, timestamp |
| `notification_preferences` | user_id + 8 boolean categories (buddy_system, safe_zone, bac_alerts, payment_alerts, hr_alerts, hydration…) |

---

## 🎨 Design System

### Color Palette

#### Dark Theme (Default)

| Role | Hex | Usage |
|------|-----|-------|
| **Primary** | `#6B46C1` | Main CTAs, active tab, branding |
| **Secondary** | `#00D4AA` | Accents, success states |
| **Background** | `#0F0E17` | App background |
| **Surface** | `#1A1A2E` | Cards, bottom sheets |
| **On Surface** | `#F0EBF8` | Body text on dark cards |
| **Error** | `#E53E3E` | Destructive actions, critical alerts |

#### Light Theme *(🆕 v3)*

| Role | Hex | Usage |
|------|-----|-------|
| **Background** | `#F7F8FC` | App background |
| **Surface** | `#FFFFFF` | Cards |
| **On Surface** | `#1A202C` | Body text |
| **Input Fill** | `#F0EBF8` | Form field backgrounds |

> **Theme toggle:** driven by `ThemeModeNotifier` (Riverpod provider), persisted in SharedPreferences. Dark is the default. Users can switch in Profile → Settings → Appearance.

### Safety Semantic Colours (Theme-Independent)

| BAC Zone | Colour | Icon | Accessibility |
|----------|--------|------|---------------|
| Safe (0.00–0.40 g/L) | Green `#38A169` | `check_circle_rounded` | Solid fill arc |
| Moderate (0.40–0.80 g/L) | Orange `#ED8936` | `warning_rounded` | Dashed arc segment |
| High (0.80–1.20 g/L) | Red `#E53E3E` | `dangerous_rounded` | Cross-hatch + pulsing ring |
| Critical (>1.20 g/L) | Red `#E53E3E` | `emergency` (SOS) | Full red fill + haptic vibration |

> ⚠️ **Colour-blind requirement:** ~8% of male users have red-green colour blindness. All safety indicators MUST combine colour **AND** a distinct icon/shape. Never rely on colour alone.

### Typography

| Style | Font | Size | Weight | Usage |
|-------|------|------|--------|-------|
| Display | Inter / SF Pro | 32sp | Bold 700 | Hero numbers (balance, BAC %) |
| Heading 1 | Inter | 24sp | SemiBold 600 | Screen titles |
| Heading 2 | Inter | 20sp | SemiBold 600 | Card titles |
| Body | Inter | 16sp | Regular 400 | Main content text |
| Body Small | Inter | 14sp | Regular 400 | Secondary info, timestamps |
| Caption | Inter | 12sp | Regular 400 | Labels, units, hints |
| Button | Inter | 16sp | SemiBold 600 | Button labels |
| Monospace | JetBrains Mono | 14sp | Regular 400 | Transaction IDs, bracelet IDs |

### Spacing & Layout

| Token | Value |
|-------|-------|
| Base unit | 8dp grid — all spacing is a multiple of 4 or 8 |
| Screen padding | horizontal: 16dp \| vertical: 16dp |
| Card radius | 16dp (primary) \| 12dp (secondary) \| 8dp (chips) |
| Bottom nav height | 64dp, icon 24dp, active indicator 32dp pill |
| Button height | primary: 56dp \| secondary: 48dp |
| **SOS button** | **120dp diameter** *(🆕 v3, up from 80dp)* — hold 3s, countdown ring animation |
| Touch targets | Minimum 48×48dp |

---

## 🚀 MVP Roadmap

### Phase-by-Phase Build Plan (9 Claude Code sessions)

| Session | Focus |
|---------|-------|
| **1** | Project setup: Flutter, flutter_flavor (3 flavours), Supabase init, l10n (FR-fr default), app_colors/theme/sizes, OfflineBanner |
| **2** | Demo Mode: DemoModeProvider, all mock data, no Supabase calls in demo |
| **3** | Auth flow: Supabase Auth, GoRouter, 3-screen onboarding, Sign-Up with name/birth year/sex assigned at birth/GDPR |
| **4** | Home + BLE: BraceletModel (with `payment_locked`), BleService, BraceletSyncService, HomeScreen, OfflineQueueService |
| **5** | Payment: PaymentLockService, Edge Function `processPayment`, Wallet/Recharge/History screens, all error states |
| **6** | Safety: BacZone enum, WidmarkFormula, BacMonitorProvider, HealthGateModal, Safety Dashboard (120dp SOS), PulseAlertModal, BAC Monitor, Cardiac Monitor — MDR-safe language |
| **7** | Map: MapScreen (Supabase Realtime positions), master invisible toggle, per-friend `sharing_enabled`, BuddySystemScreen |
| **8** | Profile: EmergencyContactsScreen (max 5, reorderable), NotificationSettingsScreen (8 categories), AppearanceSettingsScreen, Health Info Form, battery modes, GDPR deletion |
| **9** | All unit + widget + integration tests: BraceletSyncService merge, PaymentLockService round-trip, SOS button size, sex assigned at birth label, notification toggle persistence |

### Key Invariants for Every Session

> - Always include the **BacZone enum** (colour + icon pairing)
> - Always include **MDR language rules** when working on Safety features
> - Always include the **offline path** requirement (BraceletSyncService + OfflineQueueService) for any networked feature
> - Health form must **NOT** appear in onboarding — only in Safety gate or Profile
> - Use `sex_assigned_at_birth` as the field name everywhere — **never** `biological_sex`
> - SOS button must be **120dp** — defined in `app_sizes.dart` as `SOS_BUTTON_SIZE`
> - NFC payments must check `payment_locked` flag before every transaction
> - Bracelet data **always takes priority** over phone Hive data when a gap is detected

---

## 📊 Competitive Analysis

| Competitor | Strengths | SafePass Differentiators |
|------------|-----------|--------------------------|
| **Weezevent** | Established NFC payments | Adds proactive wellness monitoring |
| **Woov** | Social features, friend finding | Adds NFC payment + medical safety layer |
| **RFID Wristbands (generic)** | Low cost, proven payments | Adds BAC, cardiac monitoring, Buddy System |
| **Fitbit/Apple Watch** | Advanced health tracking | Event-specific, NFC payment, no monthly subscription |

**Unique Value Proposition:**
> *"SafePass is the only event wristband combining instant payment, proactive wellness monitoring (BAC + cardiac), and social coordination — all in a 3-day autonomous device at €8/unit."*

---

## 💰 Budget & Revenue Model

### Costs (5,000 Participants Event)

| Item | Unit Cost | Qty | Total |
|------|-----------|-----|-------|
| SafePass Wristbands (ESP32-S3 + NFC + sensors + LiPo) | €8 | 5,000 | €40,000 |
| Scan/activation terminals | €400 | 20 | €8,000 |
| Recharge terminals | €500 | 10 | €5,000 |
| Mobile app development (Flutter + Supabase) | Flat | 1 | €20,000 |
| Cloud infrastructure (Supabase, Sentry, PostHog) | €300/mo | 3 mo | €900 |
| MQTT local servers | €80 | 5 | €400 |
| Maintenance & support | Flat | 1 | €2,000 |
| Logistics | Flat | 1 | €3,000 |
| Marketing | Flat | 1 | €2,000 |
| Insurance | Flat | 1 | €1,500 |
| **TOTAL** | | | **€82,800** |

### Revenue Streams

- **Wristband rental:** €3/participant × 5,000 = **€15,000**
- **Transaction commission:** 2% on average €40 spend/participant = **€4,000**
- **Anonymised analytics:** flat fee = **€5,000**
- **Total per event:** **€24,000**

### Profitability Path

| Milestone | Result |
|-----------|--------|
| Pilot event (5K pax) | -€68,800 (initial investment) |
| From 2nd event (hardware reused) | +€14,000/event |
| Break-even | After 5 events of 5K pax OR 2 events of 15K pax |
| Year 1 (10 events × 5K pax) | **+€57,200 net** |
| Year 3 (50 events × 5K pax) | **+€700,000 net** |

---

## 👥 Team & Contacts

### Core Team

| Role | Name | Responsibilities |
|------|------|-----------------|
| **Product Owner** | Davy MARTHELY | Product vision, roadmap, feature prioritisation |
| **Lead UX/UI Designer** | [To recruit] | Personas, journeys, wireframes, UI design |
| **Lead Mobile Dev** | [To recruit] | Flutter iOS/Android app, sensor integration |
| **Lead Backend Dev** | [To recruit] | Supabase, Edge Functions, GDPR |
| **Hardware Engineer** | [To recruit] | Wristband design, component selection, testing |
| **Data Analyst** | [To recruit] | Event analytics, organiser dashboards |
| **Business Developer** | [To recruit] | Organiser partnerships, festival deployment |

### Contacts

- **Email:** contact@safepass-events.com
- **LinkedIn:** linkedin.com/company/safepass-events
- **GitHub:** github.com/safepass-events *(private repo)*
- **Support:** support@safepass-events.com

---

## ✅ Validation & Next Steps

### Validation Checklist

- [x] Personas defined and validated (Léa, Marc, Gérard excluded)
- [x] User journey mapped (13 steps)
- [x] Complete app structure (5 sections, all routes)
- [x] Technology stack justified (Flutter, Supabase, ESP32)
- [x] Design system documented (colours, typography, spacing, themes)
- [x] MVP prioritised (MUST / NICE / BONUS)
- [x] Supabase data model defined (RLS, Realtime, PostgreSQL)
- [x] 9-session Claude Code build plan structured
- [x] MDR compliance strategy documented
- [ ] Wireframes — all MVP screens → Figma
- [ ] Interactive high-fidelity prototype
- [ ] User testing (A/B tests)
- [ ] First pilot organiser partnership

---

## 📄 Changelog

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| **1.0** | 30/04/2024 | Davy MARTHELY | Initial document (case study PDF) |
| **1.1** | — | Davy MARTHELY | Added complete app structure |
| **1.2** | — | Davy MARTHELY | Added personas + user journey |
| **1.3** | 03/02/2026 | Davy MARTHELY | Added Hydration Guard, Smart Battery, MVP reorganisation |
| **3.0** | 16/03/2026 | Davy MARTHELY | **Supabase migration** \| SOS button 120dp \| Bracelet-first offline sync \| Personal info at signup \| Sex assigned at birth field \| Multiple emergency contacts \| Granular map sharing \| package_info_plus \| 8 notification categories \| l10n FR-fr default \| flutter_flavor \| No-pulse alert + payment lock \| Light theme (dark default) \| Demo Mode |

---

## 📚 Technical References

- **Widmark Formula:** [Cerema PDF](https://www.cerema.fr/fr/system/files/documents/2017/11/Estimation_alcoolemie_cle674a37.pdf)
- **BLE Spec:** [Silabs Bluetooth Docs](https://docs.silabs.com/bluetooth/9.0.1/bluetooth-start/)
- **NFC Security:** [NIST Certification](https://ajax.systems/fr/blog/nist-sertification/)
- **Supabase Docs:** [supabase.com/docs](https://supabase.com/docs)
- **Flutter Riverpod:** [riverpod.dev](https://riverpod.dev)
- **GDPR Compliance:** [CNIL Guide](https://www.cnil.fr/)
- **EU MDR 2017/745:** [EUR-Lex](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32017R0745)

---

## 🔒 License

© 2024–2026 SafePass Events. All rights reserved.

This document is confidential and proprietary. Any reproduction, distribution, or use without written authorisation is prohibited.

---

**🚀 SafePass v3.0 — Because every life counts, every second counts.**
