---
name: tech-stack-analyzer
description: Recherche le stack technique d'un prospect pour intelligence commerciale et personnalisation outbound. Déclencheurs : "analyse leur stack tech", "quels outils utilisent-ils", "stack technique", "technos du prospect", "recherche tech".
tools: Read, Write, WebFetch, WebSearch
---

# Tech Stack Analyzer

Recherche le stack technologique d'un prospect pour identifier les opportunités d'intégration, les angles de remplacement concurrentiel, et les accroches de personnalisation pour l'outbound. Le livrable est une fiche d'intelligence par entreprise que les commerciaux peuvent utiliser pour ajuster leurs conversations.

Une bonne recherche tech va plus loin que lister des outils. Elle identifie ce que le stack révèle sur la maturité, les priorités et les pain points potentiels de l'entreprise.

## Inputs

- **Nom de l'entreprise** (obligatoire). L'entreprise à rechercher.
- **Domaine de l'entreprise** (obligatoire). URL du site web pour le scraping et la recherche.
- **Contexte produit ou service** (optionnel). Ce que tu vends, pour que les angles de remplacement soient pertinents. Vérifie `CLAUDE.md`.
- **Document ICP** (optionnel). Si `docs/icp.md` existe, charge-le pour évaluer les signaux de fit tech.
- **Outils précis à vérifier** (optionnel). Technos spécifiques à rechercher (par ex. "utilisent-ils Salesforce ou HubSpot ?").

Si nom et domaine sont tous deux manquants, demande avant de continuer. Tu as besoin d'au moins l'un des deux pour démarrer.

## Étapes

### Étape 1. Charger le contexte

Lis les documents projet existants :
- `CLAUDE.md`. Charge le contexte produit et le positionnement.
- `docs/icp.md`. Charge les signaux ICP liés à la tech (critères de stack, exigences d'intégration).
- `docs/competitors/competitive-analysis.md`. Charge les outils concurrents pour identifier des opportunités de remplacement.

Identifie les catégories techno qui comptent le plus pour cette combinaison produit/prospect.

### Étape 2. Scraper le site de l'entreprise

Utilise WebFetch pour récupérer les pages clés du site :

**Pages à vérifier :**
- Homepage. Positionnement global et signaux de maturité.
- `/integrations` ou `/partners`. Partenariats technos explicitement listés.
- `/about` ou `/team`. Indices sur la taille et la structure d'équipe.
- `/careers` ou `/jobs`. Les offres d'emploi révèlent le stack dans les exigences.
- `/blog` ou `/engineering`. Les articles tech mentionnent outils et architecture.
- `/security` ou `/compliance`. Outils d'infra et de conformité.
- Footer. Badges, certifications, mentions "powered by".

Sur chaque page, extrais :
- Technologies, plateformes et outils nommés.
- Partenariats d'intégration.
- Indices d'infrastructure (cloud, hébergement).
- Indicateurs de maturité (SOC2, RGPD, fonctionnalités enterprise).

### Étape 3. Rechercher les offres d'emploi

Les offres d'emploi sont la source la plus fiable pour le stack. Utilise WebSearch :

- "{nom entreprise} jobs engineering"
- "{nom entreprise} careers developer"
- "{nom entreprise} jobs site:linkedin.com"
- "{nom entreprise} jobs site:greenhouse.io OR site:lever.co OR site:ashbyhq.com"
- "{nom entreprise} data engineer OR analytics engineer jobs"
- "{nom entreprise} sales operations jobs" (révèle CRM et outils sales)
- "{nom entreprise} marketing manager jobs" (révèle stack marketing)

Dans chaque offre, extrais toutes les technos mentionnées dans :
- Compétences requises et exigences techniques.
- "Nice to have" et qualifications préférées.
- Corps de l'offre (outils utilisés au quotidien).

### Étape 4. Sources d'intelligence techno

Utilise WebSearch pour les données d'agrégateurs :

- "{nom entreprise} tech stack"
- "{nom entreprise} site:stackshare.io"
- "{nom entreprise} site:builtwith.com"
- "{nom entreprise} technologies used"
- "{nom entreprise} engineering blog tools"
- "site:{domaine} powered by OR built with OR integrates with"
- "{nom entreprise} case study" (les vendeurs publient des cas clients citant leurs clients).

Vérifie aussi :
- "{nom entreprise} {outil précis}" pour chaque outil à valider.
- "{nom entreprise} migrated from OR switched from" pour les changements de techno.

Si WebSearch ne retourne rien sur une requête, note "Non trouvé". Ne devine pas les outils utilisés.

### Étape 5. Catégoriser le stack

Organise toutes les technos découvertes par catégorie :

| Catégorie | Quoi chercher |
|-----------|---------------|
| CRM | Salesforce, HubSpot, Pipedrive, Close, Freshsales |
| Marketing automation | HubSpot, Marketo, Pardot, ActiveCampaign, Mailchimp |
| Sales engagement | Outreach, Salesloft, Apollo, Lemlist |
| Analytics et BI | Tableau, Looker, Amplitude, Mixpanel, GA4 |
| Data / CDP | Segment, mParticle, Snowflake, BigQuery |
| Produit / Engineering | React, Python, AWS, GCP, Azure, Kubernetes |
| Support | Zendesk, Intercom, Freshdesk, Help Scout |
| RH / People | Workday, BambooHR, Gusto, Rippling |
| Communication | Slack, Teams, Zoom |
| Gestion de projet | Jira, Asana, Linear, Monday |
| Finance | Stripe, Chargebee, Zuora, NetSuite |

Pour chaque outil identifié, note :
- Niveau de confiance : Confirmé (vu sur le site ou dans une offre) / Probable (mentionné dans une source liée) / Possible (déduit du contexte).
- Source où il a été trouvé.

### Étape 6. Identifier les opportunités d'intégration

À partir du produit vendu et du stack du prospect :
- Quels outils du stack ton produit intègre-t-il ?
- Quels outils ton produit pourrait-il remplacer ?
- Quels outils créent des dépendances de workflow dans lesquelles ton produit doit s'insérer ?
- Y a-t-il des trous dans le stack que ton produit comble ?

Mappe chaque opportunité :
- Outil dans leur stack + comment ton produit s'y connecte.
- La proposition de valeur de cette connexion.
- Friction potentielle (coût de migration, risque de bascule).

### Étape 7. Identifier les angles de remplacement

Pour chaque outil concurrent trouvé dans leur stack :
- Quelles sont les faiblesses connues de cet outil ?
- Quels déclencheurs de bascule existent (changements de prix, manques fonctionnels, renouvellements) ?
- À quoi ressemble le chemin de migration ?
- Que gagnerait le prospect en basculant ?

Cherche : "{outil concurrent} complaints", "{outil concurrent} alternatives", "switching from {outil concurrent}".

### Étape 8. Évaluer la maturité tech

À partir de la photo complète du stack, évalue :
- **Maturité globale.** Early-stage (outils basiques, beaucoup de manuel) / Croissance (outils spécialisés, automatisation partielle) / Mature (stack enterprise, intégrations lourdes).
- **Priorité d'investissement.** Où dépensent-ils ? (engineering vs sales vs marketing).
- **Signaux de modernisation.** Migrent-ils vers des outils modernes ? (legacy vers cloud, tableurs vers plateformes).
- **Sophistication d'intégration.** Utilisent-ils un iPaaS (Zapier, Make, Workato) ? Intégrations custom ?

### Étape 9. Lancer le contrôle qualité

Avant de sauvegarder, vérifie :
- [ ] Au moins 5 catégories techno ont des éléments (même si "aucun outil identifié").
- [ ] Chaque outil listé a un niveau de confiance et une source.
- [ ] Aucun outil n'est listé sans preuve (pas de "ils utilisent probablement Slack" sans source).
- [ ] Les opportunités d'intégration sont spécifiques au produit vendu.
- [ ] Les angles de remplacement référencent des faiblesses réelles, pas des affirmations génériques.
- [ ] L'évaluation de maturité est cohérente avec les outils trouvés.

## Format de sortie

Sauvegarde dans `docs/prospects/{slug-entreprise}-tech-stack.md` :

```markdown
# Analyse du stack technique : [Nom entreprise]
Date : [Date]
Domaine : [URL]
Confiance recherche : [Forte / Moyenne / Faible. Selon disponibilité des données]

## Résumé
[3 à 4 phrases : caractéristiques clés du stack, niveau de maturité, éléments les plus pertinents pour l'outbound]

## Stack technologique

| Catégorie | Outil(s) | Confiance | Source |
|-----------|----------|-----------|--------|
| CRM | [Outil] | Confirmé | [Offre / site / etc.] |
| Marketing automation | [Outil] | Probable | [Source] |
| Sales engagement | Non identifié | (vide) | (vide) |
| Analytics | [Outil] | Confirmé | [Source] |
| [etc.] | | | |

## Opportunités d'intégration

| Leur outil | Point d'intégration | Proposition de valeur |
|------------|---------------------|------------------------|
| [Outil] | [Comment ça se connecte] | [Pourquoi ça compte pour eux] |
| [Outil] | [Comment ça se connecte] | [Pourquoi ça compte pour eux] |

## Angles de remplacement concurrentiel

| Outil concurrent | Faiblesse connue | Déclencheur de bascule | Chemin de migration |
|------------------|------------------|------------------------|---------------------|
| [Outil] | [Faiblesse] | [Déclencheur] | [Complexité : Facile / Moyen / Difficile] |

## Évaluation de maturité tech
- **Globale :** [Early / Croissance / Mature]
- **Priorité d'investissement :** [Où ils dépensent]
- **Signaux de modernisation :** [Patterns de migration éventuels]

## Hooks de personnalisation outbound
- [Hook 1 : sujet précis lié à la tech à utiliser en outbound]
- [Hook 2 : sujet précis lié à la tech]
- [Hook 3 : sujet précis lié à la tech]

## Sources de données
1. [Source et ce qu'elle a révélé]
2. [Source et ce qu'elle a révélé]
```

## Principes clés

1. **Les niveaux de confiance sont obligatoires.** Ne déclare jamais qu'un outil fait partie de leur stack sans préciser s'il est confirmé, probable ou possible. Mal identifier un outil détruit la crédibilité dans l'outbound.
2. **Les offres d'emploi sont la source la plus riche.** Une seule offre ingénieur révèle plus qu'une dizaine de recherches web. Vérifie toujours les offres en premier.
3. **Le stack raconte une histoire.** Une boîte avec Salesforce + Marketo + Outreach n'a pas la même maturité qu'une avec HubSpot Free + Mailchimp. Lis le récit, pas juste la liste.
4. **Les accroches outbound sont la finalité.** Le tableau du stack, c'est la recherche. Les accroches de personnalisation, c'est ce qui rend tout ça utile pour le sales. Chaque analyse doit se terminer par des choses précises à dire en outbound.

## Anti-patterns

- **Ne liste pas d'outils sans preuve.** "La plupart des boîtes de cette taille utilisent Slack" n'est pas une preuve qu'elle utilise Slack. Liste seulement ce que tu as trouvé.
- **Ne scrape pas et n'accède pas à des outils qui requièrent une authentification.** Utilise uniquement de l'info publique via recherches web et pages publiques.
- **Ne sur-recherche pas.** Si après les étapes 2 à 4 tu as une photo solide, passe à l'analyse. Le rendement décroissant arrive vite. Plafonne le total des requêtes à 20.

## Skills liés

- Stack analysé ? Lance **outreach-personalizer** pour transformer les éléments en accroches d'outbound.
- Pour intégrer ces accroches à un email, lance **cold-email-writer** avec le contexte tech.
- Pour orchestrer la séquence multicanale autour de ces angles, lance **write-outbound-sequence**.
