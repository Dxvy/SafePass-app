# Changelog — SafePass

Toutes les versions déployées en production sont documentées ici.
Format : [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/).

---

## [3.3.2] — 17/07/2026

### Corrigé
- **ANO-045** — `payment_locked` non réinitialisé après annulation SOS en cas
  de connexion BLE instable au moment de la confirmation « Je vais bien ».
  Correction : mécanisme d'accusé de réception avec retentatives jusqu'à
  confirmation explicite du bracelet.

### Ajouté
- Journal d'audit des déverrouillages de paiement (traçabilité support).

---

## [3.3.1] — 13/07/2026

### Corrigé
- **ANO-041** — Latence P95 de `calculate-bac` passée de 180 ms à 640 ms
  sous charge de pic (~2 400 utilisateurs simultanés).
  Cause : recalcul intégral de l'historique à chaque appel.
  Correction : cache incrémental de l'état BAC par utilisateur (table
  `bac_state`). Latence revenue à 165 ms confirmée sur 48 h.

### Ajouté
- Test de non-régression k6 automatisé sur `calculate-bac` dans la CI.

---

## [3.3.0] — 10/07/2026

### Ajouté
- Ouverture production — festival pilote (~3 000 festivaliers).
- Supervision Sentry Flutter SDK + Supabase Logs & Observability.
- Alertes Slack `#safepass-incidents` sur seuils latence / taux d'erreur.

---

## [3.2.0] — 16/06/2026

### Corrigé
- BUG-014, BUG-021, BUG-027, BUG-033 (cf. dossier Bloc 2).

### Ajouté
- Procédure bracelet perdu (`BraceletLostService`).
- Harnais de tests unitaires (63 tests, couverture 93 %).
- Pipeline CI/CD GitHub Actions (analyze → test → build APK).
- Politique RLS Supabase sur toutes les tables sensibles.
- Redesign UI complet (thème magenta, Safety Monitor, carte festival).
- Carte Safety Monitor sur l'écran d'accueil + bouton SOS pulsant.
