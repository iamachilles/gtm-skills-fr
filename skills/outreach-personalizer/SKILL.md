---
name: outreach-personalizer
description: "Génère des accroches de personnalisation à partir de la recherche prospect, sur 5 angles. Déclencheurs : 'personnalise mon outbound', 'recherche ce prospect', 'accroches personnalisées', 'recherche prospect', 'première phrase sur mesure', 'personnalisation outbound'."
tools: Read, Write, WebSearch
---

# Outreach Personalizer

Génère des accroches de personnalisation à partir de données prospect, sur 5 angles de recherche. Chaque accroche est une phrase de 1 ligne prête à coller dans un cold email, un message LinkedIn ou un script vidéo. Classées par pertinence pour que l'angle le plus fort passe en premier.

## Inputs

- **Données prospect enrichies** (obligatoire). Nom de l'entreprise, nom du contact, titre, et tout contexte connu.
- **URL entreprise** (optionnel). Pour la recherche site et actualité.
- **URL LinkedIn** (optionnel). Pour la recherche d'activité et de posts.
- **Contexte de campagne** (optionnel). Sur quoi tu approches (pour pondérer la pertinence).

Si les données prospect sont manquantes, demande : "J'ai besoin au minimum du nom du prospect, de l'entreprise et du titre pour générer la personnalisation. Qu'est-ce que tu as ?"

## Étapes

### Étape 0. Vérifier l'existence d'un livrable

Lis `docs/sequences/personalization-{slug-prospect}.md` s'il existe. Si trouvé, présente un résumé et demande : "Une personnalisation pour ce prospect existe déjà. Tu veux que je (a) rafraîchisse avec une nouvelle recherche, (b) ajoute des angles, ou (c) reparte de zéro ?"

### Étape 1. Charger le contexte

Lis tout le contexte disponible :

1. `docs/personas/{slug-persona}.md`. Profil du persona pour ce type de rôle.
2. `docs/messaging-matrix.md`. Angles de messaging.
3. `CLAUDE.md`. Instructions projet.

### Étape 2. Rechercher les 5 angles de personnalisation

Recherche chaque angle et écris une accroche d'1 phrase pour chacun :

**Angle 1. Actualité récente de l'entreprise**
Cherche : "{entreprise} actualité", "{entreprise} annonce", "{entreprise} levée OU acquisition OU lancement".
Cherche : levées, lancements produits, expansions, changements de leadership, partenariats.
Écris une accroche qui cite l'actu et la relie à un défi ou une opportunité pertinente.

**Angle 2. Activité LinkedIn du prospect**
Cherche : "{nom personne} {entreprise} linkedin", "{nom personne} {titre}".
Cherche : posts récents, articles, commentaires, changements de poste, contenus partagés.
Écris une accroche qui référence quelque chose de précis qu'il a dit ou partagé.

**Angle 3. Connexions ou expériences communes**
Cherche : connexions mutuelles, même école, ancien employeur commun, mêmes conférences, groupes communs.
Écris une accroche qui référence le terrain commun.

**Angle 4. Pain point spécifique à l'entreprise**
Cherche : "{entreprise} défis", "{entreprise} {secteur} problèmes", "{entreprise} avis".
Cherche : pain points publics (offres révélant des trous, avis G2 mentionnant des soucis, rapports sectoriels).
Écris une accroche qui nomme le pain sans présumer.

**Angle 5. Événement déclencheur**
Cherche : "{entreprise} recrute {rôle}", "{entreprise} expansion", "{entreprise} {mot-clé pertinent}".
Cherche : offres (signal de priorités), ouvertures de bureaux, entrée nouveau marché, changements réglementaires.
Écris une accroche qui relie le déclencheur à la pertinence du timing.

### Étape 3. Classer par pertinence

Classe les 5 accroches du plus fort au plus faible selon :
1. À quel point c'est précis ? (précis bat générique).
2. À quel point c'est récent ? (cette semaine bat l'an dernier).
3. À quel point c'est pertinent pour le contexte de campagne ?
4. À quel point c'est vérifiable ? (info publique bat hypothèse).

### Étape 4. Contrôle anti-fabrication

Pour chaque accroche, vérifie :
- Est-ce basé sur quelque chose que tu as réellement trouvé, ou tu déduis ?
- Le prospect peut-il confirmer que c'est vrai sur lui ?
- Serait-il impressionné par la recherche, ou mal à l'aise ?

Si aucun angle fort n'est trouvé pour une catégorie, écris : "Pas d'angle solide trouvé. Recommandation : utiliser une accroche basée sur le rôle. Repli : {accroche de repli}."

Ne fabrique pas de détails personnels, d'événements récents ou d'activité LinkedIn. Un email générique mais honnête bat à chaque fois une référence personnelle inventée.

### Étape 5. Contrôle qualité

Avant de sauvegarder :

- [ ] Les 5 angles ont été recherchés (ou explicitement marqués "pas d'angle trouvé").
- [ ] Chaque accroche fait exactement 1 phrase.
- [ ] Aucune accroche ne contient d'élément fabriqué ou non vérifiable.
- [ ] Les accroches sont classées avec justification.
- [ ] Les sources sont citées pour chaque accroche.
- [ ] Aucune accroche ne mettrait le prospect mal à l'aise (trop perso, trop intrusif).
- [ ] Pas de tirets cadratins dans la copie.
- [ ] Des accroches de repli sont fournies pour les angles manquants.

Si un contrôle échoue, corrige avant de continuer.

## Format de sortie

Sauvegarde dans `docs/sequences/personalization-{slug-prospect}.md` :

```markdown
# Personnalisation : {Nom prospect} chez {Entreprise}
Date : {Date}
Date de recherche : {Date}

## Accroches classées

### 1. {Nom de l'angle} (Rang : le plus fort)
**Accroche :** {phrase d'accroche}
**Source :** {où tu as trouvé ça}
**Pertinence :** {pourquoi c'est l'angle le plus fort}

### 2. {Nom de l'angle}
**Accroche :** {phrase d'accroche}
**Source :** {où tu as trouvé ça}
**Pertinence :** {pourquoi ce rang}

### 3. {Nom de l'angle}
**Accroche :** {phrase d'accroche}
**Source :** {où tu as trouvé ça}
**Pertinence :** {pourquoi ce rang}

### 4. {Nom de l'angle}
**Accroche :** {phrase d'accroche}
**Source :** {où tu as trouvé ça}
**Pertinence :** {pourquoi ce rang}

### 5. {Nom de l'angle}
**Accroche :** {phrase d'accroche}
**Source :** {où tu as trouvé ça}
**Pertinence :** {pourquoi ce rang}

## Usage recommandé
- **Première ligne cold email :** utiliser l'accroche n°{N}
- **Demande de connexion LinkedIn :** utiliser l'accroche n°{N}
- **Hook de script vidéo :** utiliser l'accroche n°{N}

## Notes de recherche
- Dernière recherche : {date}
- Rafraîchissement recommandé : {date + 2 semaines}
- Signaux clés à surveiller : {quoi guetter}
```

## Principes clés

1. **La personnalisation est une preuve d'effort.** Le prospect doit penser "ils ont vraiment regardé chez nous" et non "ils m'ont mail-mergé un prénom dans un template".
2. **La précision passe à l'échelle. La flatterie non.** "J'ai vu votre post sur la baisse du churn via l'onboarding" est précis. "Je suis impressionné par la croissance de votre boîte" est de la flatterie.
3. **La récence compte.** Quelque chose de cette semaine bat quelque chose du trimestre dernier. Si tu ne trouves rien de récent, utilise un angle basé sur le rôle.
4. **Un manque honnête vaut mieux qu'un comblement inventé.** Si tu ne trouves pas un bon angle, dis-le. Une accroche générique vaut infiniment mieux que de référencer un post LinkedIn qu'il n'a jamais écrit.
5. **La recherche a une durée de vie.** Les accroches se périment. Marque la date et recommande une fenêtre de rafraîchissement.

## Anti-patterns

- **Fabriquer une personnalisation.** Référencer un post qu'il n'a pas écrit ou une actu qui n'a pas eu lieu détruit la crédibilité instantanément. Si tu ne peux pas vérifier, n'utilise pas.
- **Sur-rechercher jusqu'à devenir intrusif.** Mentionner l'école de ses enfants ou son post Instagram du week-end n'est pas de la personnalisation. C'est de la surveillance.
- **Réutiliser le même angle pour tout le monde dans la boîte.** En multi-thread, chaque contact a besoin de sa propre personnalisation. Ne recycle pas la même actu pour tous.

## Skills liés

- Écris le **cold email** avec la meilleure accroche : lance **cold-email-writer**.
- Construis la **séquence outbound complète** autour de cette personnalisation : lance **write-outbound-sequence**.
- Identifie les bons interlocuteurs sur le compte avant la personnalisation : lance **buying-committee-mapper**.
