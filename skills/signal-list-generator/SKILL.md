---
name: signal-list-generator
description: "Construit une liste de prospects à partir d'un signal d'achat précis. Déclencheurs : 'trouve des boîtes qui viennent de lever', 'qui recrute un VP Sales', 'entreprises avec un signal récent', 'liste basée sur un signal', 'liste de comptes déclenchés'."
tools: Read, Write, WebSearch
---

# Signal List Generator

Construit une liste de prospects sensible au temps, basée sur un signal d'achat précis. Contrairement aux listes statiques, les listes signal sont périssables. Une boîte qui a levé il y a 2 semaines est un lead chaud. La même boîte 3 mois plus tard n'est plus qu'un nom dans une base.

Chaque entrée inclut la preuve du signal, un score de fit ICP, et un angle d'approche sur mesure qui relie le signal à ta proposition de valeur.

## Inputs

- **Type de signal** (obligatoire). Un parmi : levée de fonds, recrutement, adoption tech, changement de dirigeant, expansion, acquisition, lancement produit, présence à un événement.
- **Filtres signal** (optionnel). Secteur, taille, géographie, fenêtre de récence.
- **Critères ICP** (optionnel). Pour le scoring. Si non fourni, vérifie `docs/icp.md`.
- **Fenêtre de récence** (optionnel). Profondeur de recherche en jours. Défaut : 30 jours. Max : 90 jours.

Si le type de signal est manquant, demande : "Quel signal d'achat dois-je rechercher ? Options : levée, recrutement, adoption tech, changement de dirigeant, expansion, acquisition, lancement produit, événement."

## Étapes

### Étape 0. Contrôle d'idempotence

Vérifie si `docs/prospects/signal-{type-signal}-{date}.md` existe déjà. Si oui, informe l'utilisateur et demande s'il faut créer une nouvelle version ou mettre à jour.

### Étape 1. Charger le contexte

Lis le contexte disponible :
- `docs/icp.md`. Critères ICP pour le scoring.
- `docs/gtm-triangle.md`. Proposition de valeur pour les angles d'approche.
- `CLAUDE.md`. Instructions projet.

### Étape 2. Définir les critères de recherche du signal

Mappe le type de signal à des requêtes précises :

**Levée de fonds :**
- `"{secteur}" série {A|B|C} levée {mois} {année}`
- `"{secteur}" startup levée {année}`
- `entreprises {secteur} récemment financées`

**Recrutement :**
- `"{intitulé poste}" recrutement {secteur} {géographie}`
- `"{type entreprise}" carrières "{intitulé poste}" {année}`
- `offres d'emploi "{intitulé poste}" {secteur}`

**Adoption tech :**
- `"{technologie}" adoption {secteur} {année}`
- `"{technologie}" migration {secteur}`
- `entreprises qui passent à "{technologie}"`

**Changement de dirigeant :**
- `nouveau {titre} nommé {secteur} {année}`
- `"{secteur}" {titre} embauché {mois} {année}`
- `changement leadership {secteur} {année}`

**Expansion :**
- `"{secteur}" expansion nouveau bureau {année}`
- `"{secteur}" entrée sur le marché {marché/géographie}`
- `"{secteur}" expansion internationale {année}`

### Étape 3. Rechercher et collecter

Exécute les recherches et collecte les entreprises avec signaux confirmés (max 25 par run) :

Pour chaque entreprise trouvée :
- Nom et site web.
- Preuve du signal (l'événement précis : "Levée de 15 M€ en série B le 3 mars 2026").
- Date du signal (date exacte ou semaine).
- Source du signal (URL où c'est rapporté).
- Secteur et estimation de taille.

### Étape 4. Enrichir avec la firmographie

Pour chaque entreprise avec un signal confirmé :
- Fourchette d'effectifs.
- Localisation du siège.
- Sous-segment sectoriel.
- Description courte de l'activité (1 phrase).
- Tout signal additionnel détecté pendant la recherche.

### Étape 5. Scorer le fit ICP

Score chaque entreprise (1 à 5) contre les critères ICP. La présence du signal seul ne garantit pas le fit. Une boîte qui vient de lever mais qui est dans le mauvais secteur reste un mauvais prospect.

### Étape 6. Définir les angles d'approche

Pour chaque entreprise, écris un angle d'approche spécifique au signal :

**L'angle doit relier :**
1. Le signal précis (ce qui s'est passé).
2. L'implication (ce que ça veut dire pour eux).
3. Ta proposition de valeur (comment tu aides sur cette implication).

Mauvais : "Bravo pour la levée ! On devrait échanger."
Bon : "Vous avez levé 15 M€ en série B la semaine dernière. La plupart des boîtes à ce stade triplent leur équipe outbound en 90 jours mais n'ont pas l'infra pour suivre. C'est exactement ce qu'on construit."

### Étape 7. Contrôle qualité

Avant de sauvegarder, vérifie :
- [ ] Chaque entrée a un signal vérifié avec date et source.
- [ ] Les dates de signal sont dans la fenêtre de récence demandée.
- [ ] Les scores ICP ont une justification au-delà de "ils ont le signal".
- [ ] Les angles d'approche relient le signal à la proposition de valeur.
- [ ] Pas de doublons d'entreprises.
- [ ] La liste est triée par récence (le plus récent d'abord).
- [ ] La date est affichée en évidence (ces listes expirent).

Si un contrôle échoue, corrige avant de continuer.

## Format de sortie

Sauvegarde dans `docs/prospects/signal-{type-signal}-{date}.md` :

```
# Liste signal : {Type de signal}
Date de génération : {date}
Fenêtre signal : {date début} à {date fin}
Avertissement d'expiration : Cette liste est sensible au temps. Une approche après {date d'expiration} perd la pertinence du signal.
Total entreprises : {nombre}
Score ICP moyen : {X.X}/5

## Résumé du signal
- Type : {type}
- Filtres appliqués : {secteur, taille, géo}
- Total signaux trouvés : {nombre}
- Qualifiés ICP : {nombre}

## Liste de prospects

| # | Entreprise | Signal | Date signal | Source | Taille | Score ICP | Angle d'approche |
|---|------------|--------|-------------|--------|--------|-----------|------------------|
| 1 | {nom} | {événement} | {date} | {url} | {taille} | {X}/5 | {angle} |

## Fiches détaillées

### 1. {Nom de l'entreprise}
- **Site web :** {url}
- **Signal :** {description détaillée}
- **Date signal :** {date}
- **Source :** {url}
- **Secteur :** {secteur}
- **Taille :** {fourchette}
- **Score ICP :** {X}/5. {justification}
- **Angle d'approche :** {2 à 3 phrases}
- **Canal recommandé :** {email / LinkedIn / téléphone}
- **Urgence :** {Forte / Moyenne}. {pourquoi}

[Répéter pour chaque entreprise]

## Actions à mener
- {Calendrier d'approche recommandé}
- {Séquence suggérée à utiliser}
- {Recommandations de suivi des signaux}
```

## Principes clés

1. **Les signaux sont périssables.** Une annonce de levée d'il y a 60 jours est déjà froide pour l'outbound. Affiche toujours les dates en évidence et alerte sur tout signal de plus de 30 jours.
2. **Signal n'est pas fit.** Une boîte avec le bon signal mais un mauvais profil reste un mauvais prospect. Score sur le fit ICP, pas sur la force du signal seul.
3. **Relie le signal à la valeur.** L'angle d'approche doit expliquer pourquoi le signal rend ta solution pertinente maintenant, pas juste féliciter sur l'événement.
4. **Cite tes sources.** Chaque signal doit avoir une URL source. Les signaux non vérifiables sont exclus.
5. **Tri par récence.** Les signaux les plus récents d'abord. Les signaux frais ont les meilleurs taux de réponse.

## Anti-patterns

- **Le congratulateur :** écrire des angles qui démarrent par "Bravo pour..." sans relier à la valeur. Féliciter sans pertinence est du bruit.
- **Le compilateur de signaux périmés :** inclure des signaux de 4 mois et plus dans une liste "récents". Si c'est vieux, ce n'est plus un signal.
- **Le scoreur signal-only :** donner 5/5 à une boîte juste parce qu'elle a le signal, en ignorant qu'elle est dans le mauvais secteur ou trop petite.

## Skills liés

- Liste signal prête ? Lance **write-outbound-sequence** avec un messaging spécifique au signal.
- Besoin de contacts ? Lance **buying-committee-mapper** pour identifier les bons interlocuteurs sur les comptes prioritaires.
- Besoin de personnaliser au compte ? Enchaîne avec **outreach-personalizer** sur les top scores ICP.
