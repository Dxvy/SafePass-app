# SafePass - Arborescence de l'Application Mobile
## Basée sur le parcours utilisateur de Léa Dubois

---

## 🏗️ STRUCTURE GLOBALE

L'arborescence est organisée en **5 sections principales** accessibles via une navigation bottom bar :
1. **Accueil** (Home)
2. **Paiement** (Wallet)
3. **Sécurité** (Safety)
4. **Carte** (Map)
5. **Profil** (Profile)

---

## 📱 ARBORESCENCE DÉTAILLÉE

```
SafePass App
│
├── 🚪 ONBOARDING (Première utilisation uniquement)
│   ├── Écran 1 : Bienvenue
│   │   └── Présentation SafePass en 3 bénéfices
│   ├── Écran 2 : Fonctionnalités principales
│   │   └── Carrousel interactif (Paiement, Sécurité, Amis, Alertes)
│   ├── Écran 3 : Permissions
│   │   └── Bluetooth, Localisation, Notifications
│   └── Écran 4 : Connexion/Inscription
│       ├── Connexion Apple/Google (rapide)
│       ├── Connexion Email
│       └── Créer un compte
│
├── 🏠 ACCUEIL (Tab 1)
│   ├── Header
│   │   ├── Logo SafePass
│   │   ├── Statut connexion bracelet (Connecté/Déconnecté)
│   │   └── Icône notifications (badge si nouvelles)
│   │
│   ├── Section Bracelet
│   │   ├── Card "Statut du bracelet"
│   │   │   ├── ID Bracelet (#SP-XXXX)
│   │   │   ├── Niveau batterie
│   │   │   └── Dernière synchro
│   │   └── Bouton "Activer mon bracelet" (si pas encore activé)
│   │
│   ├── Section Solde
│   │   ├── Card "Mon solde" (montant en grand)
│   │   └── Bouton CTA "Recharger"
│   │
│   ├── Section Actions rapides (4 tuiles)
│   │   ├── Recharger
│   │   ├── Mon alcoolémie
│   │   ├── Mes amis
│   │   └── Carte événement
│   │
│   ├── Section Historique récent
│   │   ├── Dernières transactions (3-4)
│   │   │   ├── Heure
│   │   │   ├── Lieu/Vendeur
│   │   │   ├── Montant
│   │   │   └── Icône type (bar, food, etc.)
│   │   └── Lien "Voir tout l'historique"
│   │
│   └── Section Alertes/Infos
│       └── Bannière contextuelle (hydratation, sécurité, etc.)
│
├── 💳 PAIEMENT (Tab 2)
│   ├── Écran principal "Wallet"
│   │   ├── Card Solde actuel (grand format)
│   │   ├── Graphique dépenses (par heure ou par type)
│   │   └── Bouton "Recharger maintenant"
│   │
│   ├── 📥 Écran Rechargement
│   │   ├── Solde actuel rappelé
│   │   ├── Montants suggérés (€10, €20, €50, €100)
│   │   ├── Montant personnalisé (input)
│   │   ├── Sélection moyen de paiement
│   │   │   ├── Apple Pay / Google Pay
│   │   │   ├── Carte bancaire
│   │   │   └── Borne physique (indique emplacement)
│   │   └── Bouton "Recharger"
│   │       └── → Écran Confirmation rechargement
│   │           ├── Animation succès
│   │           ├── Nouveau solde
│   │           ├── Récapitulatif transaction
│   │           └── Bouton "Retour à l'accueil"
│   │
│   ├── 📜 Écran Historique complet
│   │   ├── Filtres
│   │   │   ├── Par date
│   │   │   ├── Par type (bar, food, recharge)
│   │   │   └── Par montant
│   │   ├── Liste complète transactions
│   │   └── Export (PDF/Email)
│   │
│   └── 📊 Écran Statistiques
│       ├── Total dépensé
│       ├── Répartition par catégorie (graphique)
│       ├── Moyenne par achat
│       └── Comparaison avec autres festivaliers (anonyme)
│
├── 🛡️ SÉCURITÉ (Tab 3)
│   ├── Écran principal "Ma sécurité"
│   │   ├── Section Alcoolémie
│   │   │   ├── Indicateur circulaire (0-100%)
│   │   │   ├── Statut (Vert/Orange/Rouge)
│   │   │   ├── Message contextuel
│   │   │   └── Bouton "Voir détails"
│   │   │
│   │   ├── Section Santé
│   │   │   ├── Fréquence cardiaque actuelle
│   │   │   ├── Historique (mini graphique)
│   │   │   └── Dernière mesure
│   │   │
│   │   ├── Section Urgence
│   │   │   ├── Bouton SOS (gros, rouge)
│   │   │   └── Contact d'urgence configuré
│   │   │
│   │   └── Section Infos utiles
│   │       ├── Localisation secours les plus proches
│   │       └── Numéros d'urgence
│   │
│   ├── 🍺 Écran Monitoring Alcoolémie (détaillé)
│   │   ├── Hero : Cercle progressif animé
│   │   │   ├── Pourcentage de capacité
│   │   │   ├── Unités consommées / max
│   │   │   └── Zones colorées (vert/orange/rouge)
│   │   │
│   │   ├── Card "Dernière consommation"
│   │   │   ├── Heure
│   │   │   ├── Type de boisson
│   │   │   └── Unités d'alcool
│   │   │
│   │   ├── Card "Estimation dégrisement"
│   │   │   ├── Temps restant (~2h30)
│   │   │   └── Heure estimée (23:45)
│   │   │
│   │   ├── Conseil hydratation
│   │   │   ├── Icône goutte d'eau
│   │   │   ├── Message "Pensez à boire de l'eau"
│   │   │   └── Localisation fontaines/bars
│   │   │
│   │   ├── Bouton "Comment ça marche ?"
│   │   │   └── → Modal explicative (Formule Widmark)
│   │   │
│   │   └── Bouton "Modifier mes infos"
│   │       └── → Écran Profil (section Santé)
│   │
│   ├── ❤️ Écran Monitoring Cardiaque
│   │   ├── Fréquence actuelle (BPM gros chiffre)
│   │   ├── Graphique temps réel (1 minute)
│   │   ├── Historique journée (mini graphique)
│   │   ├── Zones (repos, normal, élevé, critique)
│   │   └── Alerte si anomalie détectée
│   │
│   └── 🚨 Écran Alerte Médicale (modal full-screen)
│       ├── Bannière rouge "⚠️ ALERTE DÉTECTÉE"
│       ├── Type d'alerte
│       │   ├── Chute détectée + impact
│       │   └── OU Rythme cardiaque anormal
│       ├── Détails
│       │   ├── Heure détection
│       │   ├── Localisation précise
│       │   └── Valeurs mesurées
│       ├── Countdown automatique (30s)
│       │   └── "Secours alertés dans XXs"
│       ├── 2 gros boutons
│       │   ├── "JE VAIS BIEN" (vert) → Annule alerte
│       │   └── "J'AI BESOIN D'AIDE" (rouge) → Alerte immédiate
│       └── Lien "Fausse alerte ?"
│
├── 🗺️ CARTE (Tab 4)
│   ├── Écran principal "Carte interactive"
│   │   ├── Header
│   │   │   └── Barre de recherche "Rechercher un lieu..."
│   │   │
│   │   ├── Carte illustrée de l'événement
│   │   │   ├── Ma position (point turquoise pulsant)
│   │   │   ├── Positions amis (photos + nom)
│   │   │   ├── Points d'intérêt
│   │   │   │   ├── Scènes (icône musique)
│   │   │   │   ├── Bars (icône verre)
│   │   │   │   ├── Food trucks (icône couverts)
│   │   │   │   ├── Toilettes (icône WC)
│   │   │   │   ├── Secours (croix rouge)
│   │   │   │   ├── Fontaines (goutte bleue)
│   │   │   │   └── Zones repos (banc vert)
│   │   │   └── Overlay chaleur (affluence en temps réel)
│   │   │
│   │   ├── Filtres rapides (horizontal scroll)
│   │   │   ├── Tout
│   │   │   ├── Bars
│   │   │   ├── Scènes
│   │   │   ├── Toilettes
│   │   │   ├── Secours
│   │   │   └── Mes amis uniquement
│   │   │
│   │   ├── Boutons flottants
│   │   │   ├── Centrer sur moi (bottom-right)
│   │   │   └── Calques (top-right)
│   │   │
│   │   └── Bottom Sheet (draggable)
│   │       └── Détails lieu sélectionné
│   │
│   ├── 📍 Bottom Sheet "Détails lieu"
│   │   ├── Nom du lieu
│   │   ├── Type + badge
│   │   ├── Statut
│   │   │   ├── Ouvert/Fermé + horaires
│   │   │   └── Temps d'attente estimé
│   │   ├── Affluence (faible/moyenne/élevée)
│   │   ├── Distance depuis ma position
│   │   ├── Boutons actions
│   │   │   ├── "Y aller" (itinéraire)
│   │   │   ├── "Ajouter aux favoris"
│   │   │   └── "Signaler à mes amis"
│   │   └── Programme (si scène)
│   │
│   └── 👥 Écran "Mes amis sur la carte"
│       ├── Liste amis connectés
│       │   ├── Photo + nom
│       │   ├── Distance
│       │   ├── Dernière position vue
│       │   └── Bouton "Localiser sur carte"
│       ├── Bouton "Activer Beacon Mode"
│       │   └── → Je deviens visible + notification au groupe
│       └── Bouton "Point de rendez-vous"
│           └── → Sélectionner un lieu sur la carte
│
├── 👤 PROFIL (Tab 5)
│   ├── Écran principal "Mon profil"
│   │   ├── Header
│   │   │   ├── Photo/Avatar
│   │   │   ├── Nom
│   │   │   ├── ID Bracelet
│   │   │   └── Badge statut connexion
│   │   │
│   │   ├── Section "Mon bracelet"
│   │   │   ├── Card Bracelet
│   │   │   │   ├── Batterie (%)
│   │   │   │   ├── Signal BLE
│   │   │   │   ├── Dernière synchro
│   │   │   │   └── Bouton "Tester connexion"
│   │   │   └── Bouton "Désactiver le bracelet"
│   │   │
│   │   ├── Section "Mes informations"
│   │   │   ├── Infos personnelles
│   │   │   │   ├── Email
│   │   │   │   ├── Téléphone
│   │   │   │   └── Bouton "Modifier"
│   │   │   └── Infos santé (collapsible)
│   │   │       ├── Poids
│   │   │       ├── Taille
│   │   │       ├── Groupe sanguin
│   │   │       ├── Allergies
│   │   │       ├── Contact d'urgence
│   │   │       └── Bouton "Modifier"
│   │   │
│   │   ├── Section "Mon groupe d'amis"
│   │   │   ├── Liste amis (photos circulaires)
│   │   │   ├── Statut connexion de chacun
│   │   │   └── Bouton "+ Ajouter un ami"
│   │   │
│   │   ├── Section "Paramètres"
│   │   │   ├── Notifications
│   │   │   │   ├── Toggle Push générales
│   │   │   │   ├── Toggle Alertes médicales
│   │   │   │   ├── Toggle Alertes alcoolémie
│   │   │   │   └── Toggle Suggestions hydratation
│   │   │   ├── Confidentialité
│   │   │   │   ├── Toggle Partage position avec groupe
│   │   │   │   ├── Toggle Historique visible par amis
│   │   │   │   └── Bouton "Gérer mes données"
│   │   │   ├── Préférences
│   │   │   │   ├── Toggle Mode économie d'énergie
│   │   │   │   ├── Toggle Mode sombre
│   │   │   │   └── Langue
│   │   │   └── Liens
│   │   │       ├── Historique complet
│   │   │       ├── Données et confidentialité
│   │   │       ├── Conditions d'utilisation
│   │   │       └── FAQ / Aide
│   │   │
│   │   └── Section Actions
│   │       ├── Bouton "Besoin d'aide ?" (support)
│   │       └── Bouton "Se déconnecter" (outlined red)
│   │
│   ├── ✏️ Écran "Modifier profil"
│   │   ├── Formulaire infos perso
│   │   ├── Validation en temps réel
│   │   └── Bouton "Enregistrer"
│   │
│   ├── 🏥 Écran "Infos santé"
│   │   ├── Formulaire détaillé
│   │   │   ├── Poids (kg)
│   │   │   ├── Taille (cm)
│   │   │   ├── Groupe sanguin (sélecteur)
│   │   │   ├── Allergies (texte libre)
│   │   │   ├── Conditions médicales
│   │   │   └── Contact d'urgence (nom + tel)
│   │   ├── Pourquoi ces infos ? (icône info)
│   │   │   └── → Modal explication (alcoolémie + secours)
│   │   └── Bouton "Enregistrer"
│   │
│   ├── 👥 Écran "Gérer mes amis"
│   │   ├── Liste amis actuels
│   │   │   ├── Photo + nom
│   │   │   ├── Statut connexion
│   │   │   └── Action "Retirer"
│   │   ├── Bouton "+ Ajouter"
│   │   │   └── → Écran Ajout ami
│   │   │       ├── Scanner QR Code ami
│   │   │       ├── Partager mon QR Code
│   │   │       └── Rechercher par ID bracelet
│   │   └── Lien "Créer un groupe"
│   │
│   ├── 🔒 Écran "Confidentialité et données"
│   │   ├── Mes données collectées
│   │   ├── Utilisation des données
│   │   ├── Partage avec tiers
│   │   ├── Bouton "Télécharger mes données" (RGPD)
│   │   ├── Bouton "Supprimer mon compte"
│   │   └── Conformité RGPD
│   │
│   └── ❓ Écran "FAQ / Aide"
│       ├── Catégories
│       │   ├── Bracelet et connexion
│       │   ├── Paiement et rechargement
│       │   ├── Sécurité et santé
│       │   ├── Amis et localisation
│       │   └── Compte et données
│       ├── Questions fréquentes (collapsibles)
│       ├── Barre de recherche
│       ├── Bouton "Contacter le support"
│       └── Chat en direct (si disponible)
│
├── 🔔 NOTIFICATIONS (Overlay accessible partout)
│   ├── Liste notifications
│   │   ├── Par catégorie
│   │   │   ├── Alertes sécurité (rouge)
│   │   │   ├── Alcoolémie (orange)
│   │   │   ├── Amis (violet)
│   │   │   ├── Paiement (vert)
│   │   │   └── Infos événement (bleu)
│   │   ├── Marquer comme lu
│   │   └── Supprimer
│   └── Paramètres rapides (icône engrenage)
│
├── 📊 RÉCAPITULATIF POST-ÉVÉNEMENT (écran spécial fin)
│   ├── Message remerciement
│   ├── Statistiques personnelles
│   │   ├── Total dépensé
│   │   ├── Nombre transactions
│   │   ├── Lieu le plus visité
│   │   ├── Distance parcourue
│   │   └── Temps passé
│   ├── Moments clés
│   │   └── Timeline événements (artistes vus, etc.)
│   ├── Comparaison anonyme
│   │   └── Vs moyenne des festivaliers
│   ├── Boutons actions
│   │   ├── "Télécharger récapitulatif" (PDF)
│   │   ├── "Partager sur réseaux sociaux"
│   │   └── "Donner mon avis"
│   └── Proposition prochain événement SafePass
│
└── ⚙️ MODALS & OVERLAYS (accessibles contextuellement)
    ├── Modal "Activation bracelet"
    │   ├── Scanner QR code bracelet
    │   ├── Saisir ID manuel
    │   └── Instructions visuelles
    │
    ├── Modal "Paiement NFC échoué"
    │   ├── Message erreur clair
    │   ├── Solutions proposées
    │   └── Bouton "Réessayer" / "Contacter support"
    │
    ├── Modal "Buddy trouvé"
    │   ├── Animation succès
    │   ├── Position ami sur mini-carte
    │   └── Bouton "J'arrive !"
    │
    ├── Modal "Refus de service (alcool)"
    │   ├── Explication pédagogique
    │   ├── Alternatives (eau, soda, food)
    │   ├── Temps avant dégrisement
    │   └── Localisation zones repos
    │
    ├── Modal "Confirmation alerte secours envoyée"
    │   ├── Message rassurant
    │   ├── Temps d'arrivée estimé
    │   ├── Qui a été alerté (secours + amis)
    │   └── Bouton "Annuler" (si fausse alerte)
    │
    └── Modal "Sortie événement"
        ├── Scan de sortie confirmation
        ├── Récapitulatif court
        └── Bouton "Voir le récapitulatif complet"
```

---

## 🎯 NAVIGATION & FLUX PRINCIPAUX

### Navigation Bottom Bar (toujours visible)
```
[Accueil] [Paiement] [Sécurité] [Carte] [Profil]
```

### Flux critique 1 : Premier usage
```
Onboarding → Inscription → Renseigner infos santé → Recharger solde → Activer bracelet → Accueil
```

### Flux critique 2 : Paiement
```
Accueil → Recharger → Choix montant → Paiement → Confirmation → Accueil (solde mis à jour)
```

### Flux critique 3 : Retrouver ses amis
```
Carte → Activer filtre "Mes amis" → Sélectionner ami → Voir position → Y aller
OU
Sécurité → Buddy System → Activer Beacon → Notification amis
```

### Flux critique 4 : Alerte alcoolémie
```
Sécurité → Monitoring alcoolémie → Alerte orange → Suggestions → Localisation fontaines
OU
Bar → Tentative achat → Refus NFC → Modal explication → Alternatives
```

### Flux critique 5 : Urgence médicale
```
[Détection automatique] → Alerte médicale full-screen → 30s countdown → Choix utilisateur
→ SI "J'ai besoin d'aide" : Alerte secours + localisation + notification amis
→ SI "Je vais bien" : Annulation + log incident
```

---

## 📐 HIÉRARCHIE DE L'INFORMATION

### Priorité 1 (toujours visible) :
- Statut connexion bracelet
- Solde disponible
- Niveau alcoolémie (indicateur visuel)
- Alertes critiques

### Priorité 2 (accessible en 1 tap) :
- Rechargement
- Localisation amis
- Carte événement
- Historique transactions

### Priorité 3 (accessible en 2+ taps) :
- Statistiques détaillées
- Paramètres fins
- FAQ / Aide
- Gestion compte

---

## 🔗 LIENS ENTRE ÉCRANS (exemples de parcours)

### Exemple 1 : De l'accueil au rechargement
```
Accueil > Card "Mon solde" > Bouton "Recharger" > Écran Rechargement > Paiement > Confirmation > Retour Accueil
```

### Exemple 2 : De la carte à la localisation d'un ami
```
Carte > Filtre "Mes amis" > Clic sur photo ami > Bottom Sheet "Détails ami" > "Y aller" > Itinéraire sur carte
```

### Exemple 3 : De l'alerte alcoolémie à la modification du profil
```
Sécurité > Alcoolémie > "Comment ça marche ?" > Modal Widmark > "Modifier mes infos" > Profil > Infos santé > Modification > Enregistrement
```

---

## ✅ VALIDATION AVEC LE PARCOURS UTILISATEUR

| Étape du parcours | Écrans correspondants | Justification |
|-------------------|----------------------|---------------|
| 1. Achète billet | (Externe) | Mention SafePass + lien téléchargement |
| 2. Télécharge app | Onboarding (4 écrans) | Installation fluide, explications claires |
| 3. Renseigne infos | Profil > Infos santé | Formulaire complet avec explications RGPD |
| 4. Recharge 50€ | Paiement > Rechargement | Montants suggérés, paiement rapide |
| 5. Active bracelet | Accueil > Modal activation | Scan QR, test connexion immédiat |
| 6. Paie une bière | Accueil > NFC au bar (externe) > Notif | Feedback instantané, historique mis à jour |
| 7. Localise amis | Carte > Mes amis > Beacon mode | Carte claire, localisation temps réel |
| 8. Alerte alcoolémie | Sécurité > Monitoring > Notif | Message bienveillant, suggestions alternatives |
| 9. Refus de service | Bar (externe) > Modal refus | Explication pédagogique, temps dégrisement |
| 10. Malaise détecté | [Auto] > Alerte médicale full-screen | Priorité absolue, interface critique claire |
| 11. Secours arrivent | Dashboard secours (externe) + App | Infos médicales accessibles, confirmation |
| 12. Reprend festival | Accueil > Vérif solde | Récap incident, suggestions prudence |
| 13. Sortie événement | [Scan sortie] > Récapitulatif | Bilan complet, téléchargement, feedback |

---

## 🎨 NOTES POUR LE DESIGN (Exercice 4 - Wireframes)

### 3 écrans prioritaires à wireframer :
1. **Accueil (Home)** → Écran le plus consulté, hub central
2. **Monitoring Alcoolémie (Sécurité)** → Fonctionnalité distinctive SafePass
3. **Carte Interactive (Map)** → Complexité technique élevée, UX critique

---

## 📊 MÉTRIQUES DE SUCCÈS DE L'ARBORESCENCE

- ✅ Toutes les étapes du parcours utilisateur couvertes
- ✅ Navigation intuitive (maximum 3 taps pour accéder à n'importe quelle fonction)
- ✅ Cohérence avec le persona Léa (simplicité, rapidité, sécurité)
- ✅ Scalabilité (ajout facile de fonctionnalités MVP 2-3)
- ✅ Accessibilité (textes clairs, boutons suffisamment grands)

---

**Cette arborescence est maintenant prête pour passer à l'Exercice 4 : Wireframes sur Figma ! 🚀**