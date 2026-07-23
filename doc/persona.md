# SafePass - Personas et Parcours Utilisateur
## Projet UX/UI - Application Mobile Événementielle

---

## PARTIE 1 : CRÉATION DES PERSONAS

### 🎯 PERSONA PRIMAIRE

**Nom :** Léa Dubois  
**Âge :** 24 ans  
**Profession :** Étudiante en communication & serveuse à temps partiel

#### Contexte d'utilisation
Léa adore les festivals et concerts. Elle y va avec ses amis 3-4 fois par an (festivals d'été, concerts en salle). Elle utilise son smartphone pour tout : paiements, photos, coordination avec ses amis. Elle a déjà vécu des situations stressantes en festival (téléphone volé, séparation du groupe, file d'attente interminable aux bars).

#### Objectifs principaux
- Profiter pleinement de l'événement sans stress logistique
- Garder contact avec ses amis facilement dans la foule
- Payer rapidement pour éviter les files d'attente
- Être en sécurité sans limiter son plaisir

#### Frustrations / Problèmes
- Perd souvent ses amis dans la foule et galère à les retrouver
- Déteste sortir sa CB/espèces dans la foule (peur du vol)
- A déjà eu un malaise à un festival (déshydratation) et personne ne l'a aidée rapidement
- Trouve que les organisateurs ne font pas assez pour la sécurité des festivaliers

#### Citation représentative
*"Je veux juste m'amuser sans flipper pour mon téléphone, mon argent ou perdre mes potes."*

#### Technologie
- Smartphone iOS, toujours chargé
- Utilise Apple Pay, Instagram, WhatsApp
- À l'aise avec les nouvelles technologies

---

### 🎯 PERSONA SECONDAIRE

**Nom :** Marc Lefevre  
**Âge :** 42 ans  
**Profession :** Chef de la sécurité événementielle

#### Contexte d'utilisation
Marc gère la sécurité de festivals de 5000 à 20000 personnes. Il coordonne les équipes de secours, la sécurité privée et les services d'urgence. Il utilise des talkie-walkies, tablettes et systèmes de vidéosurveillance. Il cherche constamment à améliorer la réactivité de ses équipes face aux incidents.

#### Objectifs principaux
- Détecter les incidents le plus tôt possible
- Localiser rapidement les personnes en détresse
- Avoir une vue d'ensemble des zones à risque en temps réel
- Réduire le temps d'intervention des secours
- Limiter la responsabilité juridique des organisateurs

#### Frustrations / Problèmes
- Les alertes arrivent souvent trop tard (quand quelqu'un signale déjà un problème grave)
- Difficile de localiser précisément une personne dans la foule
- Manque de données en temps réel sur l'affluence et les comportements à risque
- Les systèmes actuels (vidéo, patrouilles) ne couvrent pas tout

#### Citation représentative
*"Chaque seconde compte. Si je peux sauver une vie grâce à une alerte automatique, j'ai fait mon job."*

#### Technologie
- Utilise tablette professionnelle robuste
- Systèmes de géolocalisation et communication radio
- Besoin d'interfaces claires et rapides à lire en situation de crise

---

### 🎯 PERSONA EXCLU

**Nom :** Gérard Moreau  
**Âge :** 68 ans  
**Profession :** Retraité, ancien cadre bancaire

#### Contexte d'utilisation
Gérard ne va jamais en festivals ou concerts. Il préfère les spectacles de théâtre ou l'opéra dans des salles assises. Il utilise peu son smartphone (appels et SMS uniquement, pas d'applications bancaires). Il paie toujours en espèces ou par chèque. Il se méfie des technologies de tracking et des objets connectés qu'il considère comme intrusifs.

#### Pourquoi ce persona est exclu
- **Ne correspond pas au public cible** : SafePass est conçu pour les événements festifs debout avec forte affluence
- **Rejet technologique** : Refuse les paiements sans contact et le tracking en temps réel
- **Pas de smartphone moderne** : Possède un téléphone basique sans NFC ni Bluetooth
- **Contexte inadapté** : Fréquente des événements calmes, assis, sans risque de foule ou de surconsommation d'alcool

#### Citation représentative
*"Je n'ai pas besoin qu'un bracelet surveille tout ce que je fais. J'ai vécu 68 ans sans ça."*

---

---

## PARTIE 2 : PARCOURS UTILISATEUR DÉTAILLÉ

### Persona sélectionné : **Léa Dubois** (Persona Primaire)

### Objectif du parcours
**Léa veut participer à un festival de musique électronique (2 jours), payer ses consommations facilement, rester connectée avec ses amis, et être protégée en cas de problème, le tout via son bracelet SafePass.**

---

## 📊 PARCOURS COMPLET - 9 ÉTAPES

| **Étape** | **Action de Léa** | **Point de contact / Écran** | **Émotion / Friction** | **Opportunité UX** |
|-----------|-------------------|------------------------------|------------------------|-------------------|
| **1** | Achète son billet de festival en ligne | Site web organisateur | Excitation / Impatience | Mentionner SafePass inclus dans le billet, lien vers l'app |
| **2** | Télécharge l'app SafePass et crée son compte | Écran onboarding + création compte | Curiosité / Légère appréhension si trop d'infos demandées | Onboarding fluide en 3 écrans max, expliquer les bénéfices clairement, connexion rapide (Apple/Google Sign-in) |
| **3** | Renseigne ses infos (poids, taille, groupe sanguin, contact d'urgence) | Formulaire profil | Hésitation sur données personnelles / Inquiétude confidentialité | Expliquer pourquoi ces données sont nécessaires (alcoolémie, urgence), rassurer sur RGPD, permettre de passer cette étape temporairement |
| **4** | Recharge son bracelet avec 50€ avant le festival | Écran de rechargement | Confiance si interface claire / Stress si paiement compliqué | Montants suggérés (20/50/100€), paiement Apple Pay/CB en 2 clics, confirmation visuelle immédiate |
| **5** | Arrive au festival, récupère son bracelet SafePass à l'accueil | Borne d'activation physique + scan QR code dans l'app | Excitation / Impatience dans la file | Activation rapide (<30s), confirmation visuelle dans l'app avec animation, test de connexion Bluetooth immédiat |
| **6** | Utilise le bracelet pour payer une bière au bar | Terminal NFC au bar + notification app | Satisfaction si rapide / Frustration si le scan ne marche pas | Feedback instantané (vibration + son + notif), affichage du solde restant, historique temps réel |
| **7** | Perd ses amis dans la foule, utilise la fonction "Buddy System" | Écran carte interactive + localisation amis | Stress / Soulagement si fonctionnalité marche bien | Carte simple avec position des amis en temps réel, bouton "Je les ai retrouvés" pour désactiver, beacon mode pour se signaler |
| **8** | Consomme 3-4 boissons, reçoit une alerte alcoolémie en zone orange | Notification push + écran monitoring alcoolémie | Gêne / Responsabilisation / Potentielle rébellion si trop moralisateur | Message bienveillant (pas culpabilisant), suggestion eau gratuite, compteur visuel clair, option "Rappelle-moi dans 30min" |
| **9** | Commande une dernière bière, le barman refuse (limite atteinte) | Terminal du bar affiche refus + écran app | Frustration / Compréhension selon le contexte | Expliquer clairement pourquoi (santé + légal), proposer alternatives (eau, soda), afficher temps estimé avant dégrisement |
| **10** | Danse près de la scène, fait un malaise (déshydratation + chaleur) | Détection automatique chute + alerte médicale | Inconscience / Vulnérabilité | Alerte automatique aux secours avec localisation GPS précise, notification aux amis du groupe, délai 30s pour annuler si faux positif |
| **11** | Les secours arrivent en 3 minutes grâce à l'alerte | Dashboard secours (Marc) + bracelet Léa | Soulagement pour Léa / Efficacité pour Marc | Infos médicales accessibles aux secours (groupe sanguin, allergies), historique consommation visible, confirmation intervention dans l'app |
| **12** | Après repos, reprend le festival, vérifie son solde | Écran d'accueil app | Récupération / Prudence | Afficher clairement l'incident passé, suggestion de rester hydratée, solde restant bien visible, accès rapide rechargement |
| **13** | Fin du festival, scanne le bracelet à la sortie | Borne de sortie + écran récapitulatif | Fatigue / Satisfaction globale | Récap de l'événement (dépenses, moments clés), option de télécharger facture, message de remerciement, proposition feedback |

---

## 📈 ANALYSE DES ÉMOTIONS

### Points de friction identifiés :
1. **Étape 3** : Hésitation sur les données personnelles
2. **Étape 6** : Frustration si le paiement NFC ne fonctionne pas du premier coup
3. **Étape 7** : Stress de perdre ses amis
4. **Étape 9** : Frustration du refus de service
5. **Étape 10** : Vulnérabilité du malaise

### Points de satisfaction :
1. **Étape 5** : Excitation de recevoir le bracelet
2. **Étape 6** : Plaisir de payer rapidement sans sortir son téléphone
3. **Étape 7** : Soulagement de retrouver ses amis facilement
4. **Étape 11** : Sécurité d'avoir été secourue rapidement
5. **Étape 13** : Satisfaction d'avoir vécu un festival sécurisé

---

## 🎯 OPPORTUNITÉS UX PRIORITAIRES

### 🔴 Critiques (impactent la sécurité) :
1. **Détection médicale ultra-fiable** : Minimiser les faux positifs tout en garantissant 0 faux négatifs
2. **Localisation précise** : GPS + triangulation BLE pour guider les secours au mètre près
3. **Délai d'intervention** : Dashboard secours avec alertes hiérarchisées (critique > urgent > info)

### 🟠 Importantes (impactent l'expérience) :
1. **Paiement NFC infaillible** : Terminal réactif, feedback immédiat, fallback si échec
2. **Buddy System simple** : Activation en 2 clics, carte claire, notifications discrètes
3. **Gestion alcoolémie pédagogique** : Pas moralisateur, explications scientifiques, alternatives proposées

### 🟢 Secondaires (impactent le confort) :
1. **Rechargement anticipé** : Suggérer montant optimal selon durée événement
2. **Historique détaillé** : Timeline des achats, statistiques post-événement
3. **Gamification** : Points fidélité, badges (hydratation, sécurité)

---

## 🔄 BOUCLE D'AMÉLIORATION CONTINUE

### Avant l'événement :
- Notifications push pour préparer le rechargement
- Tutoriel interactif des fonctionnalités
- Connexion du groupe d'amis en amont

### Pendant l'événement :
- Monitoring discret mais efficace
- Interventions préventives (hydratation, repos)
- Support technique accessible (borne aide physique)

### Après l'événement :
- Enquête de satisfaction courte (3 questions)
- Récapitulatif personnalisé avec statistiques
- Incitation à réutiliser SafePass au prochain événement

---

## 📝 JUSTIFICATIONS DES CHOIX UX

### Pourquoi Léa est le persona idéal pour ce parcours ?
- **Représente le cœur de cible** : jeune adulte, festivalière régulière
- **Besoin de sécurité ET de liberté** : veut s'amuser sans contrainte tout en étant protégée
- **Technophile** : adoption naturelle de l'app et du bracelet connecté
- **Cas d'usage complet** : utilise TOUTES les fonctionnalités (paiement, localisation, alcoolémie, urgence)

### Pourquoi ce parcours couvre l'essentiel du MVP ?
- ✅ Onboarding et configuration initiale
- ✅ Rechargement et paiement NFC
- ✅ Buddy System et localisation
- ✅ Monitoring alcoolémie avec alertes
- ✅ Détection médicale et intervention secours
- ✅ Sortie et récapitulatif

---

**Ce parcours servira de base pour :**
1. Créer l'arborescence de l'application (Exercice 3)
2. Sélectionner les 3 écrans prioritaires pour les wireframes (Exercice 4)
3. Justifier chaque décision de design par les besoins de Léa