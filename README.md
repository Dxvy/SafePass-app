# 🎫 SafePass - Bracelet Connecté Événementiel

> **Sécurité intelligente et expérience optimisée pour festivals et événements de grande ampleur**

![Version](https://img.shields.io/badge/version-1.0-blue.svg)
![Status](https://img.shields.io/badge/status-MVP%20Development-orange.svg)
![License](https://img.shields.io/badge/license-Proprietary-red.svg)

---

## 📋 Table des matières

1. [Vision du Projet](#-vision-du-projet)
2. [Problématique](#-problématique)
3. [Solution SafePass](#-solution-safepass)
4. [Personas](#-personas)
5. [Parcours Utilisateur](#-parcours-utilisateur)
6. [Fonctionnalités](#-fonctionnalités)
7. [Architecture Technique](#-architecture-technique)
8. [Arborescence Application](#-arborescence-application)
9. [Roadmap MVP](#-roadmap-mvp)
10. [Wireframes Prioritaires](#-wireframes-prioritaires)
11. [Analyse Concurrentielle](#-analyse-concurrentielle)
12. [Budget & Rentabilité](#-budget--rentabilité)
13. [Équipe & Contacts](#-équipe--contacts)

---

## 🎯 Vision du Projet

SafePass est un **bracelet connecté événementiel nouvelle génération** qui combine **sécurité proactive, paiement sans contact et expérience sociale optimisée** pour transformer la manière dont les festivals et événements sont vécus et organisés.

### Objectifs stratégiques

- 🛡️ **Sécurité:** Réduire les incidents médicaux de 60% via détection automatique
- ⚡ **Fluidité:** Diminuer les temps d'attente de 40% grâce au paiement NFC
- 👥 **Social:** Faciliter la coordination entre amis dans la foule
- 📊 **Data:** Fournir aux organisateurs des insights temps réel pour optimiser l'événement
- 💰 **Rentabilité:** Modèle économique viable dès 3000 participants

---

## ❌ Problématique

### Pour les participants

| Problème | Impact | Fréquence |
|----------|--------|-----------|
| **Surconsommation d'alcool** | Malaises, comportements à risque, comas éthyliques | 15-20% des festivaliers |
| **Paiements lents** | Files d'attente 10-15 min, stress perte CB/espèces | 100% des participants |
| **Perte amis dans foule** | Stress, temps perdu, expérience dégradée | 60-70% des groupes |
| **Déshydratation** | Malaises, hospitalisations | 10-15% des participants |
| **Intervention médicale tardive** | Complications, décès évitables | 5% cas critiques |

### Pour les organisateurs

- ⚠️ **Responsabilité juridique** en cas d'incident grave
- 💸 **Pertes financières** liées à la fraude et gestion espèces
- 🚨 **Coûts secours** élevés (équipes médicales, évacuations)
- 📉 **Image ternie** si incidents médiatisés
- ⏱️ **Gestion flux** complexe sans données temps réel

---

## ✨ Solution SafePass

SafePass répond à ces problématiques via **4 fonctionnalités core** :

### 1️⃣ Paiement NFC Instantané
```
💳 Transaction < 2 secondes
🔒 Sécurisé (chiffrement AES-128)
📱 Rechargement via app ou bornes
💰 Réduction fraude et pertes espèces
```

### 2️⃣ Monitoring Alcoolémie Intelligent (Widmark)
```
🧮 Calcul personnalisé (poids, taille, sexe)
🟢🟠🔴 Système d'alertes progressif
🚫 Blocage automatique si limite atteinte
💧 Suggestions hydratation alternatives
```

### 3️⃣ Détection Médicale Automatique
```
❤️ Capteur fréquence cardiaque (BPM)
📉 Accéléromètre (détection chute)
🚨 Alerte automatique secours + localisation GPS
⏱️ Temps intervention réduit de 70%
```

### 4️⃣ Buddy System - Localisation Amis
```
📍 Carte interactive temps réel
👥 Groupes jusqu'à 10 personnes
🔔 Notifications "ami retrouvé"
🎯 Points de rendez-vous intelligents
```

### 🆕 Fonctionnalités Innovantes (MVP1)

#### 💧 Hydration Guard
- Détection déshydratation via BPM + température ambiante
- Notifications préventives personnalisées
- Localisation fontaines les plus proches
- Objectif quotidien gamifié (1L/4h)

#### 🔋 Smart Battery Management
- 3 modes: Performance (1.5j) / Balanced (2.5j) / Ultra (3+j)
- Basculement automatique selon niveau batterie
- Priorisation fonctions critiques en mode économie

---

## 👥 Personas

### 🎯 Persona Primaire: Léa Dubois

<table>
<tr>
<td><strong>Âge</strong></td>
<td>24 ans</td>
</tr>
<tr>
<td><strong>Profession</strong></td>
<td>Étudiante en communication & serveuse temps partiel</td>
</tr>
<tr>
<td><strong>Contexte</strong></td>
<td>Festivale 3-4x/an, smartphone iOS, Apple Pay, utilise WhatsApp/Instagram</td>
</tr>
<tr>
<td><strong>Objectifs</strong></td>
<td>
• Profiter sans stress logistique<br>
• Garder contact avec amis facilement<br>
• Payer rapidement sans sortir CB<br>
• Être en sécurité sans limiter son plaisir
</td>
</tr>
<tr>
<td><strong>Frustrations</strong></td>
<td>
• Perd souvent ses amis dans foule<br>
• Peur vol téléphone/argent<br>
• A déjà eu malaise déshydratation<br>
• Files d'attente interminables bars
</td>
</tr>
<tr>
<td><strong>Citation</strong></td>
<td><em>"Je veux juste m'amuser sans flipper pour mon téléphone, mon argent ou perdre mes potes."</em></td>
</tr>
</table>

### 🎯 Persona Secondaire: Marc Lefevre

<table>
<tr>
<td><strong>Âge</strong></td>
<td>42 ans</td>
</tr>
<tr>
<td><strong>Profession</strong></td>
<td>Chef sécurité événementielle (5K-20K personnes)</td>
</tr>
<tr>
<td><strong>Objectifs</strong></td>
<td>
• Détecter incidents le plus tôt possible<br>
• Localiser rapidement personnes en détresse<br>
• Vue temps réel zones à risque<br>
• Réduire temps intervention secours<br>
• Limiter responsabilité juridique organisateurs
</td>
</tr>
<tr>
<td><strong>Citation</strong></td>
<td><em>"Chaque seconde compte. Si je peux sauver une vie grâce à une alerte automatique, j'ai fait mon job."</em></td>
</tr>
</table>

### ❌ Persona Exclu: Gérard Moreau (68 ans, retraité)

**Raisons exclusion:**
- Ne fréquente pas festivals/concerts (préfère théâtre/opéra assis)
- Rejet technologique (pas de smartphone moderne)
- Paie uniquement espèces/chèques
- Se méfie tracking et objets connectés

---

## 🗺️ Parcours Utilisateur

### Léa au Festival - 13 Étapes Détaillées

| # | Action | Point de Contact | Émotion | Opportunité UX |
|---|--------|------------------|---------|----------------|
| **1** | Achète billet en ligne | Site organisateur | 🤩 Excitation | Mentionner SafePass inclus + lien app |
| **2** | Télécharge app SafePass | Onboarding mobile | 🤔 Curiosité | 3 écrans max, Apple/Google Sign-in |
| **3** | Renseigne infos santé | Formulaire profil | 😟 Hésitation données | Expliquer RGPD + pourquoi nécessaire |
| **4** | Recharge 50€ | Écran rechargement | ✅ Confiance | Montants suggérés, Apple Pay 2 clics |
| **5** | Active bracelet | Borne accueil + scan QR | 🎉 Excitation | Activation <30s, test connexion immédiat |
| **6** | Paie 1ère bière | Terminal NFC bar | 😊 Satisfaction | Feedback instantané, affichage solde |
| **7** | Localise amis perdus | Carte + Buddy System | 😰➡️😌 Stress puis soulagement | Carte claire, beacon mode simple |
| **8** | Reçoit alerte alcoolémie | Notif + écran monitoring | 😳 Responsabilisation | Message bienveillant, alternatives eau |
| **9** | Refus bar (limite) | Terminal + app | 😤 Frustration | Explication pédagogique + temps dégrisement |
| **10** | Malaise déshydratation | Détection auto chute | 😵 Vulnérabilité | Alerte secours + GPS + notif amis |
| **11** | Secours arrivent 3 min | Dashboard Marc + bracelet | 😌 Soulagement | Infos médicales accessibles secours |
| **12** | Reprend festival | Écran accueil | 😊 Prudence | Afficher incident, suggestions hydratation |
| **13** | Sortie + récap | Scan sortie + app | 😴😊 Fatigue satisfaite | Timeline événement, téléchargement facture |

### 🎭 Analyse Émotionnelle

**Points de friction identifiés:**
- ⚠️ Étape 3: Hésitation données personnelles (RGPD)
- ⚠️ Étape 6: Frustration si NFC rate
- ⚠️ Étape 7: Stress perte amis
- ⚠️ Étape 9: Frustration refus service
- ⚠️ Étape 10: Vulnérabilité malaise

**Points de satisfaction:**
- ✅ Étape 5: Excitation bracelet
- ✅ Étape 6: Plaisir paiement rapide
- ✅ Étape 7: Soulagement retrouvailles
- ✅ Étape 11: Sécurité secours rapides
- ✅ Étape 13: Satisfaction festival sécurisé

---

## 🚀 Fonctionnalités

### 🔴 MVP 1 - MUST HAVE (Launch Festival)

#### Core Features

1. **💳 Paiement NFC**
    - Rechargement: app mobile (Apple/Google Pay) + bornes physiques
    - Montants suggérés: 10€, 20€, 50€, 100€ + montant libre
    - Transaction <2s avec feedback visuel/vibration
    - Historique temps réel avec filtres (date, type, montant)

2. **🍺 Monitoring Alcoolémie (Widmark)**
    - Calcul personnalisé: poids + taille + sexe + âge
    - Zones colorées: 🟢 Vert (0-50%) / 🟠 Orange (50-80%) / 🔴 Rouge (>80%)
    - Compteur unités consommées / capacité max
    - Estimation temps dégrisement
    - Blocage automatique paiement alcool si limite atteinte

3. **❤️ Détection Médicale Automatique**
    - Capteur BPM optique (mesure continue)
    - Accéléromètre 3 axes (détection chute)
    - Seuils critiques: BPM <40 ou >160 + immobilité >30s
    - Countdown 30s pour annulation si faux positif
    - Alerte auto: secours + GPS précis + notif groupe amis

4. **📍 Buddy System - Localisation Amis**
    - Création groupe 2-10 personnes (scan QR mutuel)
    - Carte interactive avec photos + noms
    - Beacon mode: "Je cherche mes amis!" (visible 1h)
    - Notifications: "Sarah est à 50m de toi"
    - Points rendez-vous suggérés (zones calmes)

5. **🗺️ Carte Interactive Événement**
    - Plan illustré avec POI: scènes, bars, toilettes, secours, fontaines
    - Position utilisateur (point turquoise pulsant)
    - Positions amis temps réel
    - Filtres rapides: Tout / Bars / Scènes / Toilettes / Secours / Amis
    - Overlay chaleur affluence (via densité bracelets BLE)

6. **👤 Profil & Santé**
    - Infos perso: nom, email, téléphone, photo
    - Infos santé: poids, taille, groupe sanguin, allergies, contact urgence
    - Gestion bracelet: ID, batterie, dernière synchro
    - Groupe d'amis: ajout/retrait via QR code

7. **🔔 Notifications Critiques**
    - Alertes médicales (rouge - priorité max)
    - Alertes alcoolémie (orange - préventif)
    - Amis localisés (violet - social)
    - Paiement confirmé (vert - transaction)
    - Infos événement (bleu - général)

8. **📊 Historique Transactions**
    - Liste complète achats avec heure, lieu, montant, type
    - Filtres: date, catégorie (bar/food/autre)
    - Graphiques: dépenses par heure, répartition par type
    - Export PDF/Email

9. **🏠 Écran Accueil (Hub Central)**
    - Statut connexion bracelet (connecté/déconnecté)
    - Niveau batterie + dernière synchro
    - Solde actuel (grand format) + bouton CTA "Recharger"
    - 4 tuiles actions rapides: Recharger / Mon alcoolémie / Mes amis / Carte
    - Dernières transactions (3-4) avec scroll
    - Bannière contextuelle (hydratation, sécurité)

#### 🆕 Nouveautés MVP1

10. **💧 Hydration Guard (Nouveau)**
    - Déclencheurs:
        - Consommation >2 unités alcool sans eau
        - Température ambiante >28°C (via météo API)
        - Exposition soleil >2h (GPS + horaire)
        - BPM élevé prolongé (>120 bpm sur 30min)
    - Actions:
        - Notif push: "💧 Pensez à vous hydrater"
        - Carte: mise en avant fontaines proches
        - Compteur visuel: objectif 1L/4h
        - Badge gamification: "Hydration Hero"

11. **🔋 Smart Battery Management (Nouveau)**
    - Mode Performance (1.5j):
        - Monitoring cardiaque continu
        - Localisation temps réel
        - Toutes notifications
    - Mode Balanced (2.5j) ← Par défaut:
        - Monitoring cardiaque intervalles 5min
        - Localisation sur demande
        - Notifications essentielles
    - Mode Ultra (3+j):
        - Paiement + alcoolémie uniquement
        - Pas localisation continue
        - Alertes critiques seulement
    - Automatisation:
        - Suggestion passage économie à 30%
        - Activation auto Ultra à 15%
        - Notif amis si passage mode Ultra

### 🟠 MVP 1.5 - NICE TO HAVE (+3 mois)

12. **🎵 Programme Événement Intégré**
    - Timeline interactive artistes/concerts
    - Ajout favoris avec notifications 15min avant
    - Partage avec groupe: "On se retrouve à cette scène?"
    - Estimation affluence par scène (via data bracelets)
    - Rappel hydratation avant concert long

13. **⏱️ Queue Intelligence**
    - Estimation temps attente bars/food trucks
    - Calcul: nombre bracelets zone + historique transactions
    - Affichage badge: "~8 min" (vert/orange/rouge)
    - Suggestions alternatives: "Bar Jardin → 4 min"
    - Notification: "Le bar X est maintenant dégagé"

14. **📋 Récapitulatif Post-Festival Amélioré**
    - Statistiques détaillées: total dépensé, nb transactions, lieux visités
    - Distance parcourue via GPS
    - Timeline personnalisée (artistes vus, moments clés)
    - Téléchargement facture PDF
    - Partage réseaux sociaux (anonymisé)
    - Proposition prochain événement SafePass

15. **🔒 Export Données RGPD**
    - Téléchargement complet données JSON
    - Historique tous événements
    - Suppression compte définitive

### 🟢 MVP 2 - DIFFERENTIATION (+6 mois)

16. **👥 Squad Hub (Social Avancé)**
    - Chat textuel léger (messages courts uniquement)
    - Vote collectif: "On va où?" avec 3 options
    - Partage position temporaire (1h auto-off)
    - Alerte groupe si membre zone rouge alcoolémie
    - "Last seen": "Sarah - Bar Principal - Il y a 12 min"

17. **🧭 Itinéraires Optimisés**
    - Navigation évitant foule dense
    - Calcul temps trajet réaliste
    - Suggestions chemin le plus rapide/calme
    - Points d'intérêt en route

18. **🏆 Gamification Badges**
    - Badge "Hydration Master": 8 verres eau
    - Badge "Balanced Party": jamais zone rouge
    - Badge "Squad Leader": retrouvé amis <10min
    - Leaderboard anonyme: Top 10% festivaliers responsables

19. **📴 Mode Offline**
    - Cache carte événement
    - Paiement NFC sans connexion
    - Synchronisation différée

20. **🗓️ Multi-Événements**
    - Historique global tous festivals
    - Statistiques cross-événements
    - Programme fidélité organisateurs partenaires

### ❌ Fonctionnalités Retirées

- ~~Statistiques comparatives anonymes~~ (complexité RGPD, peu valeur)
- ~~Scan sortie obligatoire~~ (friction utilisateur) → Rendu optionnel avec incitation
- ~~Monitoring cardiaque continu UI~~ (anxiogène) → Affichage si anomalie seulement

---

## 🏗️ Architecture Technique

### 📡 Technologies Réseau

#### Choix: BLE + NFC

<table>
<tr>
<th>Critère</th>
<th>BLE (Bluetooth Low Energy)</th>
<th>NFC (Near Field Communication)</th>
</tr>
<tr>
<td><strong>Portée</strong></td>
<td>10-30 mètres</td>
<td><10 cm</td>
</tr>
<tr>
<td><strong>Consommation</strong></td>
<td>Très faible (µW)</td>
<td>Aucune (passif)</td>
</tr>
<tr>
<td><strong>Vitesse</strong></td>
<td>1 Mbps</td>
<td>424 kbps</td>
</tr>
<tr>
<td><strong>Sécurité</strong></td>
<td>AES-128 chiffré</td>
<td>Protocole EMV sécurisé</td>
</tr>
<tr>
<td><strong>Cas d'usage</strong></td>
<td>Communication continue (pouls, alertes, localisation)</td>
<td>Paiements, scans rapides</td>
</tr>
<tr>
<td><strong>Avantage</strong></td>
<td>Autonomie préservée sur plusieurs jours</td>
<td>Transactions ultra-rapides (<2s)</td>
</tr>
</table>

**Alternatives rejetées:**

| Techno | Raison rejet |
|--------|--------------|
| **Wi-Fi** | Trop énergivore, instable sites ouverts |
| **LoRa/Sigfox** | Débit trop faible, non adapté temps réel ni paiements |
| **4G/5G eSIM** | Très énergivore, coût élevé, dépendance opérateur |

### 🔐 Protocoles Communication

#### Choix: MQTT (local) + HTTPS/TLS 1.3 (cloud)

**MQTT (Message Queuing Telemetry Transport):**
- Protocole léger, rapide, adapté IoT
- Communication bidirectionnelle bracelets ↔ bornes ↔ serveurs locaux
- Exemples messages:
  ```json
  // Health monitoring
  {"id":"1234", "bpm":88, "status":"ok"}
  
  // Payment transaction
  {"id":"1234", "action":"buy", "amount":4.50, "vendor":"Bar Principal"}
  
  // Emergency alert
  {"id":"1234", "alert":"fall_detected", "location":"zone B", "bpm":42}
  ```

**HTTPS + TLS 1.3:**
- Communication sécurisée vers cloud
- Chiffrement end-to-end
- Authentification serveur obligatoire

**Architecture globale:**

```
[Bracelet SafePass]         [Smartphone / Bornes]        [Cloud Backend]
     (BLE + NFC)      <--->     (BLE + Wi-Fi)      <--->  (Firebase/AWS)
         |                           |                           |
    Capteurs:                  Passerelle                  Services:
    - BPM optique              MQTT local           - Auth (JWT)
    - Accéléromètre            HTTPS distant        - Database (Firestore)
    - Puce NFC                                      - Notifications (FCM)
    - Module BLE ESP32                              - Analytics
```

### 🧩 Composants Embarqués

| Composant | Modèle | Fonction | Conso |
|-----------|--------|----------|-------|
| **Capteur cardiaque** | MAX30102 (PPG optique) | Mesure BPM continue | ~1mA |
| **Accéléromètre** | MPU6050 (3 axes) | Détection chute/immobilité | ~500µA |
| **Puce NFC** | PN532 / NTAG216 | Paiement sans contact | 0mA (passif) |
| **Module BLE** | ESP32-C3 | Communication locale | ~10mA (actif) / <100µA (sleep) |
| **Batterie** | LiPo 300mAh | Autonomie 2-3 jours | - |
| **Écran** | OLED 0.96" (optionnel) | Affichage solde/statut | ~15mA (actif) |

**Autonomie calculée (mode Balanced):**
- Batterie: 300mAh
- Conso moyenne: 5mA
- Autonomie théorique: 300/5 = **60 heures (~2.5 jours)** ✅

### 🔒 Sécurité & Confidentialité

#### Mesures implémentées:

1. **Chiffrement:**
    - BLE: AES-128 sur toutes communications
    - Cloud: HTTPS + TLS 1.3 (Perfect Forward Secrecy)
    - Stockage: Chiffrement AES-256 données sensibles (santé, paiement)

2. **Authentification:**
    - JWT (JSON Web Token) pour sessions utilisateurs
    - Refresh tokens sécurisés (rotation automatique)
    - 2FA optionnel via SMS/Email

3. **Isolation données:**
    - Aucune info personnelle stockée sur bracelet physique
    - Données pseudonymisées (ID aléatoire non lié identité)
    - Séparation stricte données santé / paiement / localisation

4. **RGPD:**
    - Consentement explicite collecte données
    - Droit accès, rectification, suppression
    - Suppression automatique données 30 jours post-événement
    - Minimisation collecte (uniquement nécessaire)
    - DPO (Data Protection Officer) désigné

5. **Audit:**
    - Logs sécurisés toutes actions critiques
    - Surveillance intrusions (SIEM)
    - Pentests réguliers (trimestre)

---

## 📱 Arborescence Application

### Structure Globale - 5 Sections (Bottom Navigation)

```
SafePass App
│
├── 🏠 ACCUEIL (Tab 1) - Hub Central
├── 💳 PAIEMENT (Tab 2) - Wallet & Historique
├── 🛡️ SÉCURITÉ (Tab 3) - Alcoolémie & Santé
├── 🗺️ CARTE (Tab 4) - Interactive Map & Amis
└── 👤 PROFIL (Tab 5) - Paramètres & Groupe
```

### Détail Écrans par Section

#### 🏠 ACCUEIL

```
Home Screen
├── Header
│   ├── Logo SafePass
│   ├── Statut connexion bracelet (Connecté/Déconnecté)
│   └── Icône notifications (badge si nouvelles)
│
├── Section Bracelet
│   ├── Card "Statut du bracelet"
│   │   ├── ID Bracelet (#SP-XXXX)
│   │   ├── Niveau batterie (%)
│   │   └── Dernière synchro (timestamp)
│   └── Bouton "Activer mon bracelet" (si pas encore activé)
│
├── Section Solde
│   ├── Card "Mon solde" (montant en grand)
│   └── Bouton CTA "Recharger"
│
├── Section Actions rapides (4 tuiles)
│   ├── Recharger
│   ├── Mon alcoolémie
│   ├── Mes amis
│   └── Carte événement
│
├── Section Historique récent
│   ├── Dernières transactions (3-4)
│   │   ├── Heure
│   │   ├── Lieu/Vendeur
│   │   ├── Montant
│   │   └── Icône type (bar, food, etc.)
│   └── Lien "Voir tout l'historique"
│
└── Section Alertes/Infos
    └── Bannière contextuelle (hydratation, sécurité, etc.)
```

#### 💳 PAIEMENT

```
Wallet Section
├── Écran principal "Wallet"
│   ├── Card Solde actuel (grand format)
│   ├── Graphique dépenses (par heure ou type)
│   └── Bouton "Recharger maintenant"
│
├── Écran Rechargement
│   ├── Solde actuel rappelé
│   ├── Montants suggérés (10€, 20€, 50€, 100€)
│   ├── Montant personnalisé (input)
│   ├── Sélection moyen paiement
│   │   ├── Apple Pay / Google Pay
│   │   ├── Carte bancaire
│   │   └── Borne physique (indique emplacement)
│   └── Bouton "Recharger"
│       └── → Écran Confirmation rechargement
│           ├── Animation succès
│           ├── Nouveau solde
│           ├── Récapitulatif transaction
│           └── Bouton "Retour à l'accueil"
│
├── Écran Historique complet
│   ├── Filtres
│   │   ├── Par date
│   │   ├── Par type (bar, food, recharge)
│   │   └── Par montant
│   ├── Liste complète transactions
│   └── Export (PDF/Email)
│
└── Écran Statistiques
    ├── Total dépensé
    ├── Répartition par catégorie (graphique)
    ├── Moyenne par achat
    └── Comparaison anonyme (optionnel)
```

#### 🛡️ SÉCURITÉ

```
Safety Section
├── Écran principal "Ma sécurité"
│   ├── Section Alcoolémie
│   │   ├── Indicateur circulaire (0-100%)
│   │   ├── Statut (Vert/Orange/Rouge)
│   │   ├── Message contextuel
│   │   └── Bouton "Voir détails"
│   │
│   ├── Section Hydratation 💧 [NOUVEAU]
│   │   ├── Compteur verres d'eau (0/8)
│   │   ├── Objectif journée (1L/4h)
│   │   ├── Dernière hydratation (timestamp)
│   │   └── Bouton "Trouver une fontaine"
│   │
│   ├── Section Santé
│   │   ├── Fréquence cardiaque actuelle (BPM)
│   │   ├── Historique (mini graphique)
│   │   └── Dernière mesure
│   │
│   ├── Section Urgence
│   │   ├── Bouton SOS (gros, rouge)
│   │   └── Contact d'urgence configuré
│   │
│   └── Section Infos utiles
│       ├── Localisation secours les plus proches
│       └── Numéros d'urgence
│
├── Écran Monitoring Alcoolémie (détaillé)
│   ├── Hero: Cercle progressif animé
│   │   ├── Pourcentage de capacité
│   │   ├── Unités consommées / max
│   │   └── Zones colorées (vert/orange/rouge)
│   │
│   ├── Card "Dernière consommation"
│   │   ├── Heure
│   │   ├── Type de boisson
│   │   └── Unités d'alcool
│   │
│   ├── Card "Estimation dégrisement"
│   │   ├── Temps restant (~2h30)
│   │   └── Heure estimée (23:45)
│   │
│   ├── Conseil hydratation
│   │   ├── Icône goutte d'eau
│   │   ├── Message "Pensez à boire de l'eau"
│   │   └── Localisation fontaines/bars
│   │
│   ├── Bouton "Comment ça marche?"
│   │   └── → Modal explicative (Formule Widmark)
│   │
│   └── Bouton "Modifier mes infos"
│       └── → Écran Profil (section Santé)
│
├── Écran Monitoring Cardiaque
│   ├── Fréquence actuelle (BPM gros chiffre)
│   ├── Graphique temps réel (1 minute)
│   ├── Historique journée (mini graphique)
│   ├── Zones (repos, normal, élevé, critique)
│   └── Alerte si anomalie détectée
│
└── Modal Alerte Médicale (full-screen)
    ├── Bannière rouge "⚠️ ALERTE DÉTECTÉE"
    ├── Type d'alerte
    │   ├── Chute détectée + impact
    │   └── OU Rythme cardiaque anormal
    ├── Détails
    │   ├── Heure détection
    │   ├── Localisation précise
    │   └── Valeurs mesurées
    ├── Countdown automatique (30s)
    │   └── "Secours alertés dans XXs"
    ├── 2 gros boutons
    │   ├── "JE VAIS BIEN" (vert) → Annule alerte
    │   └── "J'AI BESOIN D'AIDE" (rouge) → Alerte immédiate
    └── Lien "Fausse alerte?"
```

#### 🗺️ CARTE

```
Map Section
├── Écran principal "Carte interactive"
│   ├── Header
│   │   └── Barre de recherche "Rechercher un lieu..."
│   │
│   ├── Carte illustrée de l'événement
│   │   ├── Ma position (point turquoise pulsant)
│   │   ├── Positions amis (photos + nom)
│   │   ├── Points d'intérêt
│   │   │   ├── Scènes (icône musique)
│   │   │   ├── Bars (icône verre)
│   │   │   ├── Food trucks (icône couverts)
│   │   │   ├── Toilettes (icône WC)
│   │   │   ├── Secours (croix rouge)
│   │   │   ├── Fontaines (goutte bleue) 💧
│   │   │   └── Zones repos (banc vert)
│   │   └── Overlay chaleur (affluence temps réel)
│   │
│   ├── Filtres rapides (horizontal scroll)
│   │   ├── Tout
│   │   ├── Bars
│   │   ├── Scènes
│   │   ├── Toilettes
│   │   ├── Secours
│   │   ├── Fontaines 💧 [NOUVEAU]
│   │   └── Mes amis uniquement
│   │
│   ├── Boutons flottants
│   │   ├── Centrer sur moi (bottom-right)
│   │   └── Calques (top-right)
│   │
│   └── Bottom Sheet (draggable)
│       └── Détails lieu sélectionné
│
├── Bottom Sheet "Détails lieu"
│   ├── Nom du lieu
│   ├── Type + badge
│   ├── Statut
│   │   ├── Ouvert/Fermé + horaires
│   │   └── Temps d'attente estimé ⏱️ [NOUVEAU MVP1.5]
│   ├── Affluence (faible/moyenne/élevée)
│   ├── Distance depuis ma position
│   ├── Boutons actions
│   │   ├── "Y aller" (itinéraire)
│   │   ├── "Ajouter aux favoris"
│   │   └── "Signaler à mes amis"
│   └── Programme (si scène)
│
└── Écran "Mes amis sur la carte"
    ├── Liste amis connectés
    │   ├── Photo + nom
    │   ├── Distance
    │   ├── Dernière position vue
    │   └── Bouton "Localiser sur carte"
    ├── Bouton "Activer Beacon Mode"
    │   └── → Je deviens visible + notification au groupe
    └── Bouton "Point de rendez-vous"
        └── → Sélectionner un lieu sur la carte
```

#### 👤 PROFIL

```
Profile Section
├── Écran principal "Mon profil"
│   ├── Header
│   │   ├── Photo/Avatar
│   │   ├── Nom
│   │   ├── ID Bracelet
│   │   └── Badge statut connexion
│   │
│   ├── Section "Mon bracelet"
│   │   ├── Card Bracelet
│   │   │   ├── Batterie (%)
│   │   │   ├── Mode batterie actif 🔋 [NOUVEAU]
│   │   │   ├── Signal BLE
│   │   │   ├── Dernière synchro
│   │   │   └── Bouton "Tester connexion"
│   │   └── Bouton "Désactiver le bracelet"
│   │
│   ├── Section "Mes informations"
│   │   ├── Infos personnelles
│   │   │   ├── Email
│   │   │   ├── Téléphone
│   │   │   └── Bouton "Modifier"
│   │   └── Infos santé (collapsible)
│   │       ├── Poids
│   │       ├── Taille
│   │       ├── Groupe sanguin
│   │       ├── Allergies
│   │       ├── Contact d'urgence
│   │       └── Bouton "Modifier"
│   │
│   ├── Section "Mon groupe d'amis"
│   │   ├── Liste amis (photos circulaires)
│   │   ├── Statut connexion de chacun
│   │   └── Bouton "+ Ajouter un ami"
│   │
│   ├── Section "Paramètres"
│   │   ├── Notifications
│   │   │   ├── Toggle Push générales
│   │   │   ├── Toggle Alertes médicales
│   │   │   ├── Toggle Alertes alcoolémie
│   │   │   └── Toggle Suggestions hydratation 💧
│   │   ├── Confidentialité
│   │   │   ├── Toggle Partage position avec groupe
│   │   │   ├── Toggle Historique visible par amis
│   │   │   └── Bouton "Gérer mes données"
│   │   ├── Préférences
│   │   │   ├── Toggle Mode économie énergie 🔋
│   │   │   ├── Toggle Mode sombre
│   │   │   └── Langue
│   │   └── Liens
│   │       ├── Historique complet
│   │       ├── Données et confidentialité
│   │       ├── Conditions d'utilisation
│   │       └── FAQ / Aide
│   │
│   └── Section Actions
│       ├── Bouton "Besoin d'aide?" (support)
│       └── Bouton "Se déconnecter" (outlined red)
│
├── Écran "Modifier profil"
│   ├── Formulaire infos perso
│   ├── Validation temps réel
│   └── Bouton "Enregistrer"
│
├── Écran "Infos santé"
│   ├── Formulaire détaillé
│   │   ├── Poids (kg)
│   │   ├── Taille (cm)
│   │   ├── Groupe sanguin (sélecteur)
│   │   ├── Allergies (texte libre)
│   │   ├── Conditions médicales
│   │   └── Contact d'urgence (nom + tel)
│   ├── Pourquoi ces infos? (icône info)
│   │   └── → Modal explication (alcoolémie + secours)
│   └── Bouton "Enregistrer"
│
├── Écran "Gérer mes amis"
│   ├── Liste amis actuels
│   │   ├── Photo + nom
│   │   ├── Statut connexion
│   │   └── Action "Retirer"
│   ├── Bouton "+ Ajouter"
│   │   └── → Écran Ajout ami
│   │       ├── Scanner QR Code ami
│   │       ├── Partager mon QR Code
│   │       └── Rechercher par ID bracelet
│   └── Lien "Créer un groupe"
│
├── Écran "Confidentialité et données"
│   ├── Mes données collectées
│   ├── Utilisation des données
│   ├── Partage avec tiers
│   ├── Bouton "Télécharger mes données" (RGPD)
│   ├── Bouton "Supprimer mon compte"
│   └── Conformité RGPD
│
└── Écran "FAQ / Aide"
    ├── Catégories
    │   ├── Bracelet et connexion
    │   ├── Paiement et rechargement
    │   ├── Sécurité et santé
    │   ├── Amis et localisation
    │   └── Compte et données
    ├── Questions fréquentes (collapsibles)
    ├── Barre de recherche
    ├── Bouton "Contacter le support"
    └── Chat en direct (si disponible)
```

### 🔔 Notifications (Overlay Global)

```
Notifications Panel
├── Liste notifications
│   ├── Par catégorie
│   │   ├── Alertes sécurité (rouge)
│   │   ├── Alcoolémie (orange)
│   │   ├── Hydratation 💧 (bleu clair) [NOUVEAU]
│   │   ├── Amis (violet)
│   │   ├── Paiement (vert)
│   │   └── Infos événement (bleu)
│   ├── Marquer comme lu
│   └── Supprimer
└── Paramètres rapides (icône engrenage)
```

### 📊 Récapitulatif Post-Événement

```
Post-Event Summary Screen
├── Message remerciement
├── Statistiques personnelles
│   ├── Total dépensé
│   ├── Nombre transactions
│   ├── Lieu le plus visité
│   ├── Distance parcourue
│   └── Temps passé
├── Moments clés
│   └── Timeline événements (artistes vus, etc.)
├── Comparaison anonyme (optionnel)
│   └── Vs moyenne des festivaliers
├── Boutons actions
│   ├── "Télécharger récapitulatif" (PDF)
│   ├── "Partager sur réseaux sociaux"
│   └── "Donner mon avis"
└── Proposition prochain événement SafePass
```

---

## 🗓️ Roadmap MVP

### Phase 1: MVP 1 - Launch Festival (Mois 0-6)

**Objectif:** Valider product-market fit avec 1er événement pilote (5000 participants)

**Features:**
- ✅ Paiement NFC complet
- ✅ Monitoring alcoolémie (Widmark)
- ✅ Détection médicale automatique
- ✅ Buddy System localisation
- ✅ Carte interactive
- ✅ Profil & santé
- ✅ Notifications critiques
- ✅ Historique transactions
- ✅ Écran accueil hub
- ✅ Hydration Guard 💧
- ✅ Smart Battery Management 🔋

**Metrics succès:**
- Taux adoption: >80% participants activent bracelet
- NPS (Net Promoter Score): >50
- Incidents médicaux détectés: >10 alertes valides
- Temps intervention secours: <5 min (vs 15 min baseline)
- Satisfaction organisateurs: >4/5

**Budget:** 72 000€ (5000 bracelets + infra)

---

### Phase 2: MVP 1.5 - Scaling & Refinement (Mois 6-9)

**Objectif:** Déploiement 3 festivals (15K participants cumulés)

**Nouvelles features:**
- Programme événement intégré
- Queue Intelligence
- Récapitulatif amélioré
- Export RGPD

**Optimisations:**
- Réduction coût bracelet: 8€ → 6€ (volume)
- Amélioration autonomie batterie: 2.5j → 3j
- API publique organisateurs (webhooks alertes)

**Metrics succès:**
- Taux réachat organisateurs: >60%
- Réduction temps attente bars: >30%
- Engagement app (DAU/MAU): >0.4

**Budget:** 150 000€ (15K bracelets + dev features)

---

### Phase 3: MVP 2 - Market Leadership (Mois 9-18)

**Objectif:** Devenir leader français bracelets événementiels (50K participants/an)

**Nouvelles features:**
- Squad Hub (social avancé)
- Itinéraires optimisés
- Gamification badges
- Mode offline
- Multi-événements

**Partenariats:**
- Intégration billetteries (Fnac Spectacles, Digitick)
- Partenariats assureurs (réduction primes si SafePass)
- API secours (SAMU, Croix-Rouge)

**Metrics succès:**
- Part de marché: >20% festivals >5K personnes
- ARR (Annual Recurring Revenue): >2M€
- Incidents graves évités: >100/an
- Couverture médiatique: >10 articles presse nationale

**Budget:** 500 000€ (50K bracelets + marketing + équipe)

---

## 🎨 Wireframes Prioritaires

### 3 Écrans à Designer (Exercice 4)

Basés sur analyse parcours Léa + complexité technique + valeur utilisateur:

#### 1️⃣ Home Screen (Accueil)

**Justification:**
- Écran le plus consulté (hub central)
- 1ère impression utilisateur
- Concentre actions critiques: solde, alcoolémie, amis, carte
- Bannière contextuelle dynamique (hydratation, sécurité)

**Wireframe détails:**
- Header avec statut connexion + batterie + notifications
- Card solde grand format + CTA "Recharger"
- 4 tuiles actions rapides (2x2 grid)
- Timeline transactions récentes (3-4) avec scroll horizontal
- Bannière contextuelle bottom (hydratation, alerte alcoolémie)

**Interactions clés:**
- Tap solde → Écran Rechargement
- Tap tuile "Mon alcoolémie" → Monitoring détaillé
- Tap tuile "Mes amis" → Carte avec filtre amis
- Tap notification → Écran correspondant
- Pull-to-refresh → Sync bracelet

---

#### 2️⃣ Safety Dashboard (Alcool + Hydratation combinés)

**Justification:**
- Fonctionnalité distinctive SafePass (vs concurrents)
- Core value proposition sécurité
- Complexité UI: cercle progressif animé, zones colorées, compteurs
- **Nouveau:** Intégration Hydration Guard dans même écran

**Wireframe détails:**
- Hero: Cercle progressif alcoolémie (0-100%)
    - Zones colorées: vert (0-50%) / orange (50-80%) / rouge (>80%)
    - Centre: unités consommées / capacité max
    - Animation pulse si zone orange/rouge

- Card "Dernière consommation"
    - Timestamp + type boisson + unités alcool

- Card "Estimation dégrisement"
    - Temps restant (ex: 2h30)
    - Heure estimée (ex: 23:45)

- **NOUVEAU:** Card "Hydratation" 💧
    - Compteur verres eau: 3/8
    - Barre progression objectif journée
    - Icône goutte animée si besoin hydratation
    - Bouton "Trouver fontaine proche"

- Footer:
    - Bouton "Comment ça marche?" → Modal Widmark
    - Bouton "Modifier mes infos santé"

**Interactions clés:**
- Tap cercle → Animation explicative zones
- Tap "Comment ça marche?" → Modal formule Widmark
- Tap compteur hydratation → Liste fontaines carte
- Swipe up → Historique consommations détaillé

---

#### 3️⃣ Interactive Map (Carte + Amis)

**Justification:**
- Complexité technique élevée (géolocalisation temps réel)
- UX critique: Léa perd souvent ses amis (pain point #1)
- Concentration interactions: filtres, POI, bottom sheet, beacon mode
- Data visualization: overlay chaleur affluence

**Wireframe détails:**
- Carte illustrée événement (vue satellite + overlay dessiné)
- Éléments carte:
    - Position utilisateur: point turquoise pulsant + cercle rayon précision
    - Positions amis: photos circulaires + nom + distance
    - POI (Points of Interest):
        - Scènes: 🎵 (taille selon capacité)
        - Bars: 🍺 (badge temps attente si >5min)
        - Food trucks: 🍴
        - Toilettes: 🚻
        - Secours: ➕ (toujours visible)
        - Fontaines: 💧 [NOUVEAU]
        - Zones repos: 🏕️
    - Overlay chaleur: gradient rouge (fort) → vert (faible) selon densité bracelets

- Filtres rapides (horizontal scroll top):
    - Pills: Tout | Bars | Scènes | Toilettes | Secours | Fontaines 💧 | Mes amis
    - État actif: pill violet, autres gris clair

- Boutons flottants:
    - Bottom-right: FAB "Centrer sur moi" (icône cible)
    - Top-right: FAB "Calques" (toggle overlay chaleur)
    - Bottom-left: FAB "Beacon Mode" (icône phare) [si ami perdu]

- Bottom Sheet draggable:
    - État collapsed: Nom lieu + distance + badge affluence
    - État expanded:
        - Photo lieu (si disponible)
        - Nom + type (badge)
        - Statut: Ouvert 🟢 / Fermé 🔴 + horaires
        - Affluence: Faible 🟢 / Moyenne 🟠 / Élevée 🔴 + temps attente
        - Distance depuis position
        - Actions:
            - Bouton primaire "Y aller" (itinéraire)
            - Bouton secondaire "Ajouter favoris" (⭐)
            - Bouton tertiaire "Signaler à mes amis" (📢)
        - Programme (si scène): Liste artistes + horaires

**Interactions clés:**
- Tap POI → Bottom sheet expanded
- Tap ami photo → Bottom sheet profil ami + "Le rejoindre"
- Tap "Beacon Mode" → Notification push à groupe "Léa cherche ses amis!"
- Pinch zoom → Agrandissement carte
- Long press lieu → "Point de rendez-vous" (envoi notif groupe)
- Tap filtre → Masque autres POI

---

### Design System (Rappel)

**Couleurs:**
- Primary: Purple #6B46C1 (SafePass brand)
- Secondary: Turquoise #00D4AA (accents, CTAs)
- Success: Green #10B981
- Warning: Orange #F59E0B
- Danger: Red #EF4444
- Neutral: Grays #F3F4F6 → #111827

**Typography:**
- Headings: Poppins Bold (24px, 20px, 18px)
- Body: Inter Regular (16px, 14px)
- Captions: Inter Light (12px, 10px)

**Components:**
- Buttons: Rounded 12px, height 48px
- Cards: Rounded 16px, shadow-md
- Inputs: Rounded 8px, border 1px solid gray-300
- Pills (filtres): Rounded-full, height 36px

---

## 🏆 Analyse Concurrentielle

### Alternatives Existantes

| Concurrent | Type Solution | Forces | Faiblesses | Différenciation SafePass |
|------------|---------------|--------|------------|-------------------------|
| **Weezevent Cashless** | Bracelet paiement NFC | Adoption large, fiable | Paiement uniquement, pas de sécurité | SafePass = Paiement + Sécurité + Social |
| **Festicket** | App billetterie + cashless | Intégration billetterie | Pas hardware, limité paiement | SafePass = Hardware bracelet + détection médicale |
| **Woov** | Bracelet RFID accès + paiement | Simple, low-cost | RFID (portée limitée), pas santé | SafePass = BLE (meilleure portée) + monitoring santé |
| **Apple Watch** | Smartwatch santé | Monitoring santé avancé | Cher (€400+), fragile, autonomie 1j | SafePass = Dédié festivals, robuste, 3j autonomie, €8 |
| **Life360** | App localisation famille | Localisation temps réel | Drain batterie, pas événementiel | SafePass = Bracelet autonome + contexte événement |

### Positionnement SafePass

```
                        Sécurité/Santé
                              ↑
                              |
                    SafePass ★ (Sweet Spot)
                              |
                              |
Paiement ← ─ ─ ─ ─ ─ ─ ─ ─ ─ ┼ ─ ─ ─ ─ ─ ─ ─ ─ ─ → Social
Simple                        |                    Avancé
                              |
                     Weezevent | Woov
                              |
                              ↓
                         Prix/Accessibilité
```

**Unique Value Proposition:**
> "SafePass est le seul bracelet événementiel combinant **paiement instantané**, **sécurité proactive** (alcoolémie + médical) et **coordination sociale**, le tout dans un device **autonome 3 jours** et **accessible** (€8)."

---

## 💰 Budget & Rentabilité

### Coûts Détaillés (Événement 5000 participants)

| Poste | Détail | Coût Unitaire | Quantité | Total |
|-------|--------|---------------|----------|-------|
| **Bracelets SafePass** | BLE + NFC + capteurs (PPG + accéléromètre) + batterie LiPo 300mAh | 8€ | 5000 | 40 000€ |
| **Bornes scan/activation** | Terminal NFC/BLE + écran + module paiement | 400€ | 20 | 8 000€ |
| **Bornes rechargement** | Terminal paiement CB + écran + connexion | 500€ | 10 | 5 000€ |
| **Développement app mobile** | Flutter (iOS + Android) + backend Firebase | Forfait | 1 | 20 000€ |
| **Dashboard organisateurs** | Web app React + API | Forfait | 1 | 10 000€ |
| **Infrastructure cloud** | Firebase/AWS (auth, database, storage, analytics) | 300€/mois | 3 mois | 900€ |
| **Serveurs MQTT locaux** | Raspberry Pi 4 + config réseau | 80€ | 5 | 400€ |
| **Maintenance & support** | Monitoring, hotfixes, support technique J-1 à J+1 | Forfait | 1 | 2 000€ |
| **Logistics** | Emballage, transport, installation, formation équipes | Forfait | 1 | 3 000€ |
| **Marketing** | Communication pré-événement, flyers, stands | Forfait | 1 | 2 000€ |
| **Assurance** | Responsabilité civile, assurance dispositifs médicaux | Forfait | 1 | 1 500€ |
| **TOTAL ÉVÉNEMENT** | | | | **92 800€** |

### Modèle Économique

#### Revenus

**Pour organisateurs:**
- **Location bracelets:** 3€/participant × 5000 = **15 000€**
- **Commission transactions:** 2% sur total dépenses
    - Hypothèse: Dépense moyenne 40€/participant
    - Total dépenses: 40€ × 5000 = 200 000€
    - Commission: 200 000€ × 2% = **4 000€**
- **Données analytics anonymisées:** Forfait 5 000€ (insights affluence, comportements)
- **Total revenus événement:** **24 000€**

#### Rentabilité

**Événement pilote (5000 pax):**
- Coût total: 92 800€
- Revenus: 24 000€
- **Perte:** -68 800€ (investissement initial)

**À partir du 2ème événement (bracelets + infra réutilisables):**
- Coût marginal: 10 000€ (cloud + maintenance + logistics)
- Revenus: 24 000€
- **Bénéfice:** +14 000€

**Break-even:**
- Après 5 événements de 5000 pax
- OU 2 événements de 15 000 pax

**Projection Année 1:**
- 10 événements × 5000 pax = 50 000 participants
- Revenus: 10 × 24 000€ = 240 000€
- Coûts: 92 800€ (initial) + 9 × 10 000€ (marginaux) = 182 800€
- **Bénéfice net:** +57 200€

**Projection Année 3:**
- 50 événements × 5000 pax = 250 000 participants
- Revenus: 50 × 24 000€ = 1 200 000€
- Coûts: 500 000€ (renouvellement bracelets + scaling équipe)
- **Bénéfice net:** +700 000€

### Scalabilité

**Économies d'échelle:**
- Coût bracelet: 8€ (5K unités) → 6€ (50K unités) → 4€ (500K unités)
- Négociation cloud: -30% si >100 événements/an
- Mutualisation infra: 1 serveur MQTT pour 10 événements simultanés

**Leviers monétisation additionnels:**
- **Sponsoring in-app:** 10 000€/événement (bannières partenaires)
- **Cashback partenaires:** Commission 5% sur achats stands partenaires
- **Assurance premium:** Option assurance annulation personnelle 2€/participant
- **White label organisateurs:** Licence annuelle 50 000€ pour gros festivals

---

## 👥 Équipe & Contacts

### Core Team

| Rôle | Nom | Responsabilités |
|------|-----|-----------------|
| **Product Owner** | Davy MARTHELY | Vision produit, roadmap, priorisation features |
| **Lead UX/UI Designer** | [À recruter] | Personas, parcours, wireframes, UI design |
| **Lead Dev Mobile** | [À recruter] | App Flutter iOS/Android, intégration capteurs |
| **Lead Dev Backend** | [À recruter] | API Firebase, MQTT, sécurité, RGPD |
| **Hardware Engineer** | [À recruter] | Design bracelet, sélection composants, tests |
| **Data Analyst** | [À recruter] | Analytics événements, dashboards organisateurs |
| **Business Developer** | [À recruter] | Partenariats organisateurs, déploiement festivals |

### Partenaires Stratégiques

- **Fabricant bracelets:** [À identifier] (Chine/Europe selon volumes)
- **Organisateurs pilotes:** [À négocier] (festivals 5K-10K pax région PACA)
- **Assureur:** [À négocier] (couverture dispositifs médicaux)
- **SAMU/Croix-Rouge:** Partenariat API alertes temps réel

### Contacts

- **Email:** contact@safepass-events.com
- **LinkedIn:** linkedin.com/company/safepass-events
- **GitHub:** github.com/safepass-events (repo privé)
- **Support:** support@safepass-events.com

---

## 📚 Ressources

### Documentation Technique

- **Formule Widmark:** [Cerema PDF](https://www.cerema.fr/fr/system/files/documents/2017/11/Estimation_alcoolemie_cle674a37.pdf)
- **BLE Spec:** [Silabs Bluetooth Docs](https://docs.silabs.com/bluetooth/9.0.1/bluetooth-start/)
- **NFC Security:** [NIST Certification](https://ajax.systems/fr/blog/nist-sertification/)
- **MQTT Protocol:** [Official MQTT.org](https://mqtt.org/)
- **TLS 1.3:** [Entrust TLS Guide](https://www.entrust.com/fr/resources/learn/what-is-tls)
- **RGPD Compliance:** [CNIL Guide](https://www.cnil.fr/)

### Design Assets

- **Figma Wireframes:** [À créer - Exercice 4]
- **Style Guide:** [À créer]
- **Prototype Interactive:** [À créer - Marvel/Figma]
- **Canva Presentation:** [Lien Canva](https://www.canva.com/design/DAGi6LgSGiE/63vyXcJXXQ0Src3wAof41A/edit)

### Études de Cas

- **Alcool & fréquence cardiaque:** [UMontreal Research](https://nouvelles.umontreal.ca/article/2020/12/18/le-mecanisme-du-syndrome-cardiaque-des-fetes-explique/)
- **Wearables health monitoring:** [Cochrane Review](https://www.cochrane.org/fr/CD012787/HTN_lalcool-un-effet-biphasique-sur-la-pressionarterielle-et-augmente-la-frequencecardiaque)

---

## ✅ Validation & Next Steps

### Validation Checklist

- [x] Personas définis et validés
- [x] Parcours utilisateur cartographié (13 étapes)
- [x] Arborescence complète application (5 sections)
- [x] Choix technologiques justifiés (BLE + NFC + MQTT)
- [x] Budget détaillé avec modèle rentabilité
- [x] MVP priorisé (features MUST/NICE/BONUS)
- [ ] Wireframes 3 écrans prioritaires → **Exercice 4 en cours**
- [ ] Prototype interactif haute-fidélité
- [ ] Validation utilisateurs (tests A/B)
- [ ] Partenariat 1er organisateur pilote

### Prochaines Étapes (Q1 2025)

1. **Design Sprint (Semaines 1-2):**
    - Wireframes détaillés 3 écrans (Home, Safety, Map)
    - UI Design System complet Figma
    - Prototype cliquable Marvel/Figma

2. **Développement MVP1 (Mois 1-4):**
    - Sprint 1: Backend API + Auth
    - Sprint 2: App mobile core (paiement NFC)
    - Sprint 3: Monitoring alcoolémie + santé
    - Sprint 4: Carte interactive + Buddy System
    - Sprint 5: Tests intégration hardware

3. **Pilote Terrain (Mois 5-6):**
    - Sélection festival partenaire (5K pax)
    - Formation équipes terrain
    - Déploiement J-7
    - Monitoring temps réel événement
    - Débriefing post-event

4. **Itération & Scale (Mois 6-12):**
    - Analyse feedback pilote
    - Implémentation MVP 1.5 features
    - Prospection 10 festivals Y1
    - Levée fonds Seed (500K€)

---

## 📄 Changelog

| Version | Date | Auteur | Modifications |
|---------|------|--------|---------------|
| **1.0** | 30/04/2024 | Davy MARTHELY | Création document initial (PDF étude de cas) |
| **1.1** | [Date] | Davy MARTHELY | Ajout arborescence application complète |
| **1.2** | [Date] | Davy MARTHELY | Intégration personas + parcours utilisateur |
| **1.3** | 03/02/2026 | Davy MARTHELY | Ajout fonctionnalités Hydration Guard + Smart Battery, réorganisation MVP, README complet |

---

## 📝 Licence

© 2024 SafePass Events. All rights reserved.

Ce document est confidentiel et propriétaire. Toute reproduction, distribution ou utilisation sans autorisation écrite est interdite.

---

**🚀 SafePass - Parce que chaque vie compte, chaque seconde compte.**