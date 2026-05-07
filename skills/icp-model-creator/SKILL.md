---
name: icp-model-creator
description: Construit un document ICP complet en 10 sections à partir de matériaux sources et de recherche. Déclencheurs : "construis mon ICP", "définis mon profil client idéal", "qui sont mes meilleurs clients", "modèle ICP", "ICP pour ma boîte".
tools: Read, Write, WebFetch, WebSearch
---

# ICP Model Creator

Construit un Profil Client Idéal complet à partir de matériaux sources, de recherche et d'analyse. Le livrable est un document en 10 sections qui sert de référence unique pour toutes les décisions de ciblage, de messaging et de qualification.

Un bon ICP est suffisamment précis pour dire "non" à de mauvais prospects. Si l'ICP pourrait décrire n'importe quelle entreprise B2B, il est trop générique. Chaque section doit contenir des éléments uniques à ce marché et à ce produit.

## Inputs

- **Matériaux sources** (obligatoire). Toute combinaison parmi : données clients existants, transcripts d'appels commerciaux, exports CRM, contenu site web, notes du fondateur, ou un brief de l'activité.
- **Site web de l'entreprise** (optionnel). Pour contexte additionnel.
- **ICP existant** (optionnel). ICP actuel à affiner ou refondre.
- **Questions à trancher** (optionnel). Trous précis que l'utilisateur veut combler.

## Étapes

### Étape 1. Analyser les matériaux sources

Lis tous les matériaux fournis en profondeur. Extrais :
- Les patterns chez les clients existants (secteurs, tailles, stades).
- La langue utilisée par les acheteurs pour décrire leurs problèmes.
- Les déclencheurs d'achat récurrents mentionnés en appel ou dans les notes.
- Les caractéristiques des deals (taille, durée du cycle, raisons de gain ou de perte).
- Toute segmentation explicite ou implicite.

Construis une hypothèse de travail pour l'ICP basée sur ce que les données montrent.

### Étape 2. Rechercher en ligne pour combler les trous

Utilise WebSearch et WebFetch pour compléter les matériaux sources :
- Recherche le marché de l'entreprise et ses acheteurs typiques.
- Regarde le positionnement des concurrents pour comprendre le paysage.
- Vérifie les benchmarks sectoriels en taille d'entreprise, structure d'équipe, maturité.
- Identifie les pain points fréquents discutés sur forums, LinkedIn, sites d'avis.

Concentre la recherche sur les trous précis des matériaux sources, pas sur de la veille générale.

### Étape 3. Poser des questions ciblées (en dernier recours)

Si une info critique reste introuvable via les sources ou la recherche, présente une liste courte de questions. Maximum 5. Chaque question doit être :
- Précise (pas "parle-moi de tes clients").
- Liée à un trou qui bloque une section ICP précise.
- Formulée avec une hypothèse par défaut ("Je pars du principe que X parce que Y. C'est correct, ou je dois ajuster ?").

Ne pose pas de questions si l'info peut être raisonnablement déduite.

### Étape 4. Générer le document ICP en 10 sections

Construis chaque section selon ces exigences :

**Section 1. Firmographie**
- Secteur ou vertical (sois précis : "SaaS B2B dans la fintech" et non "entreprises tech").
- Fourchette de revenus ou d'effectifs.
- Géographie.
- Stade de l'entreprise ou indicateurs de maturité.
- Stade de financement (si pertinent).
- Minimum 3 critères firmographiques, maximum 7.

**Section 2. Personas acheteurs**
- 3 à 5 personas avec titres, ligne hiérarchique, KPIs.
- Pour chaque persona : ce qui leur tient à cœur, comment ils sont mesurés, ce qui les empêche de dormir.
- Identifie quel persona est le point d'entrée et lequel est l'acheteur économique.

**Section 3. Pain points (dans la langue de l'acheteur)**
- 5 à 8 pain points écrits comme l'acheteur les formulerait.
- Pas du jargon de consultant ("désalignement go-to-market") mais la langue de l'acheteur ("on dépense du budget sur des leads que les commerciaux jugent pourris").
- Regroupe par persona si les pain points diffèrent selon les rôles.

**Section 4. Objectifs et résultats attendus**
- Que veut atteindre l'acheteur ? Sois précis sur les métriques.
- "Réduire le CAC de 30%" et non "améliorer l'efficacité".
- "Construire un pipeline outbound répétable générant 20 rendez-vous qualifiés par mois" et non "faire grossir le revenu".

**Section 5. Déclencheurs d'achat**
- Événements précis qui créent de l'urgence : nouveau dirigeant, objectifs ratés, levée de fonds, perte face à un concurrent, changement réglementaire, croissance d'équipe.
- Pour chaque déclencheur : pourquoi il crée de l'urgence et ce que l'acheteur fait ensuite.

**Section 6. Anti-ICP et critères d'exclusion**
- Tests binaires qui disqualifient un prospect. Chacun doit pouvoir se répondre par oui ou non.
- Exemples : "Pas d'équipe commerciale dédiée" = exclusion. "Revenu sous 1 M€" = exclusion. "Sous contrat avec un concurrent pour 2+ années restantes" = exclusion.
- Minimum 5 critères d'exclusion. Cette section fait gagner plus de temps que toutes les autres.

**Section 7. Snapshot de positionnement**
- Tableau Fonctionnalité / Bénéfice / Valeur avec 5 lignes minimum.
- Chaque ligne relie une capacité produit à un résultat business qui compte pour l'acheteur.
- La colonne valeur doit référencer une métrique ou un KPI mentionné dans la section personas.

**Section 8. Cartographie du comité d'achat**
- 4 à 6 rôles dans le processus de décision.
- Pour chacun : titre, rôle dans la décision (champion, évaluateur, approbateur, bloqueur), ce dont il a besoin pour dire oui, objections probables.
- Définit le mode de décision typique (top-down, bottom-up, comité).

**Section 9. Paysage concurrentiel**
- Top 3 à 5 alternatives considérées par l'acheteur (y compris "ne rien faire" et "build interne").
- Pour chacune : ce qu'elle propose, ses points forts, ses points faibles.
- Ton angle de différenciation contre chacune.

**Section 10. Signaux d'intention à surveiller**
- 5 à 8 signaux observables qui indiquent qu'une entreprise correspondant à cet ICP entre dans un cycle d'achat.
- Pour chacun : ce qu'est le signal, où le trouver, ce qu'il implique.
- Priorise par force du signal (corrélation forte vs corrélation faible).

### Étape 5. Lancer le contrôle qualité

Passe le document complet contre ces critères avant de le livrer :
- Chaque critère firmographique est-il assez précis pour filtrer une liste de prospects ?
- Les pain points sont-ils écrits à la première personne dans la langue de l'acheteur, pas en jargon analyste ?
- Les critères d'exclusion sont-ils vraiment binaires (oui/non), pas subjectifs ?
- La cartographie du comité d'achat identifie-t-elle clairement le persona point d'entrée ?
- Les signaux d'intention sont-ils observables et capturables, pas théoriques ?

## Format de sortie

```
# Profil Client Idéal : [Nom du produit / de l'entreprise]
Date : [Date]
Version : 1.0

## 1. Firmographie
## 2. Personas acheteurs
## 3. Pain points
## 4. Objectifs et résultats attendus
## 5. Déclencheurs d'achat
## 6. Anti-ICP et critères d'exclusion
## 7. Snapshot de positionnement
## 8. Cartographie du comité d'achat
## 9. Paysage concurrentiel
## 10. Signaux d'intention

## Annexe : sources et niveaux de confiance
[Liste ce qui est basé sur des données dures vs déduction vs hypothèse]
```

## Contrôles qualité

- Les 10 sections sont complètes. Aucune n'est sautée ou ne contient du texte placeholder.
- Les pain points utilisent la langue de l'acheteur, pas du jargon de consultant. Lis-les à voix haute. Une VP les dirait-elle en réunion ?
- Les critères d'exclusion sont des tests binaires. Si tu ne peux pas répondre oui/non, réécris jusqu'à ce que tu le puisses.
- La cartographie du comité d'achat inclut 4 à 6 rôles avec le point d'entrée clairement marqué.
- La firmographie est assez précise pour construire une liste de prospects directement. "Entreprises tech" échoue ce test.
- L'annexe distingue honnêtement les conclusions appuyées par des données et les déductions.
- L'ICP est assez précis pour exclure au moins 80% du marché total adressable.

## Skills liés

- Une fois l'ICP construit, lance **buying-committee-mapper** pour détailler les 6 rôles du comité d'achat.
- Pour identifier les comptes qui matchent l'ICP en ce moment, lance **signal-list-generator**.
- Pour préparer la prospection, enchaîne avec **tech-stack-analyzer** sur les comptes prioritaires.
