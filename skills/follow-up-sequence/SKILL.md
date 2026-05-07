---
name: follow-up-sequence
description: "Écrit une séquence de relance pour les prospects qui ont ouvert mais pas répondu. Déclencheurs : 'relance', 'séquence de relance', 'pas de réponse', 'ouvre sans répondre', 're-engagement', 'emails de relance', 'nurture des non-répondants'."
tools: Read, Write
---

# Follow-Up Sequence

Écrit une séquence de relance en 4 touches pour les prospects qui ont ouvert ton message initial mais n'ont pas répondu. Chaque touche apporte une nouvelle valeur et utilise un angle différent. Pas de "je reviens vers vous". Pas de "petit rappel". Chaque message gagne sa place dans la boîte de réception.

## Inputs

- **Message initial** (obligatoire). L'email ou le message envoyé en premier.
- **Persona** (obligatoire). À qui tu relances (titre, KPIs, pain points).
- **Preuves** (optionnel). Cas clients, métriques ou ressources additionnelles à partager.
- **Assets de contenu** (optionnel). Articles, benchmarks ou outils que tu peux référencer.

Si le message initial ou le persona manque, demande : "J'ai besoin du message initial envoyé et du persona cible pour rédiger les relances. Tu peux me partager les deux ?"

## Étapes

### Étape 0. Vérifier l'existence d'un livrable

Lis `docs/sequences/follow-up-{slug-persona}.md` s'il existe. Si trouvé, présente un résumé et demande : "Une séquence de relance pour ce persona existe déjà. Tu veux que je (a) ajoute des touches, (b) affine la copie existante, ou (c) reparte de zéro ?"

### Étape 1. Charger le contexte

Lis tout le contexte disponible :

1. `docs/sequences/cold-email-{slug-persona}.md`. Email d'origine pour référence.
2. `docs/personas/{slug-persona}.md`. Profil persona.
3. `docs/messaging-matrix.md`. Angles de messaging alternatifs.
4. `docs/sales-narratives.md`. Cadre narratif si dispo.
5. `CLAUDE.md`. Instructions projet.

Identifie quels angles le message initial a utilisés pour que les relances en introduisent de nouveaux.

### Étape 2. Mapper les angles de relance

Chaque relance doit utiliser un angle différent de l'original et des autres relances :

- **Touche 2 (Jour 3).** Nouvel angle. Quelque chose que l'original n'a pas couvert.
- **Touche 3 (Jour 7).** Apport de valeur. Partage un insight, une ressource, un benchmark.
- **Touche 4 (Jour 14).** Preuve sociale. "Une boîte comme la vôtre a fait X."
- **Touche 5 (Jour 21).** Rupture. Aversion à la perte. Laisser la porte ouverte.

Définis l'angle précis de chaque touche avant d'écrire.

### Étape 3. Écrire la touche 2 (Jour 3). Nouvel angle

Règles :
- Démarrer par un pain point ou une opportunité différents de l'original.
- Ne pas référencer l'email d'origine ("je vous ai écrit la semaine dernière").
- Sous 80 mots.
- Un CTA clair, identique ou différent de l'original.
- Doit tenir debout seul. S'il n'a pas lu le premier email, ça doit quand même avoir du sens.

### Étape 4. Écrire la touche 3 (Jour 7). Apport de valeur

Règles :
- Démarrer par quelque chose d'utile : un benchmark, un article, un framework, une donnée.
- La valeur doit être pertinente pour son rôle indépendamment d'un achat.
- Bref contexte sur pourquoi tu partages (1 phrase).
- CTA léger : "J'ai pensé que ça pouvait être utile. Heureux d'en discuter si pertinent."
- Sous 80 mots.

### Étape 5. Écrire la touche 4 (Jour 14). Preuve sociale

Règles :
- Référencer une entreprise précise ou un résultat (avec accord ou anonymisé si nécessaire).
- Connecter la preuve à sa situation : "Ils étaient confrontés à [le même problème que vous avez probablement]".
- Sous 80 mots.
- CTA : "Ça vaudrait une conversation pour voir si ça s'applique chez vous ?"

### Étape 6. Écrire la touche 5 (Jour 21). Rupture

Règles :
- Reconnaître que c'est le dernier message (pour le moment).
- Utiliser une aversion à la perte subtile : référencer ce qu'il pourrait manquer, pas ce que tu retires.
- Laisser la porte ouverte avec un moyen clair, sans pression, de revenir.
- Sous 60 mots.
- Pas de culpabilisation. Pas d'agressivité passive. Pas de "j'imagine que vous n'êtes pas intéressé".

### Étape 7. Contrôle qualité

Avant de sauvegarder :

- [ ] Aucune relance ne dit "je reviens vers vous" ou "petit rappel".
- [ ] Chaque touche utilise un angle vraiment différent.
- [ ] Touche 2 sous 80 mots.
- [ ] Touche 3 sous 80 mots et apporte une vraie valeur.
- [ ] Touche 4 sous 80 mots avec une preuve précise.
- [ ] Touche 5 sous 60 mots sans culpabilisation ni agressivité passive.
- [ ] Chaque touche tient debout sans les précédentes.
- [ ] Le timing suit la cadence Jour 3, 7, 14, 21.
- [ ] Pas de tirets cadratins dans la copie.
- [ ] Le langage matche le vocabulaire du persona.

Si un contrôle échoue, corrige avant de continuer.

## Format de sortie

Sauvegarde dans `docs/sequences/follow-up-{slug-persona}.md` :

```markdown
# Séquence de relance : {Titre persona}
Date : {Date}
Référence du message initial : {chemin du fichier ou résumé}

## Cadence
| Touche | Jour | Angle | Objectif |
|--------|------|-------|----------|
| 2 | Jour 3 | Nouvel angle | Re-engager avec un pain différent |
| 3 | Jour 7 | Apport de valeur | Bâtir de la crédibilité avec du contenu utile |
| 4 | Jour 14 | Preuve sociale | Montrer un résultat pertinent |
| 5 | Jour 21 | Rupture | Clore la boucle, laisser la porte ouverte |

## Touche 2. Nouvel angle (Jour 3)
**Objet :** {objet}
**Corps :**
{Texte complet de l'email}
Nombre de mots : {compte}/80

## Touche 3. Apport de valeur (Jour 7)
**Objet :** {objet}
**Corps :**
{Texte complet de l'email}
Nombre de mots : {compte}/80

## Touche 4. Preuve sociale (Jour 14)
**Objet :** {objet}
**Corps :**
{Texte complet de l'email}
Nombre de mots : {compte}/80

## Touche 5. Rupture (Jour 21)
**Objet :** {objet}
**Corps :**
{Texte complet de l'email}
Nombre de mots : {compte}/60
```

## Principes clés

1. **Chaque touche doit ajouter une NOUVELLE valeur.** Si tu ne peux pas articuler ce qu'il y a de neuf dans cette relance, ne l'envoie pas. La répétition n'est pas de la persistance.
2. **Les messages autonomes gagnent.** Chaque relance doit avoir du sens même s'il n'a jamais lu les précédentes. Ne construis pas sur des fondations qui n'existent peut-être pas.
3. **L'email de rupture est le plus important.** Il a souvent le meilleur taux de réponse. Écris-le avec soin, pas avec frustration.
4. **Le timing crée du rythme, pas de la pression.** L'espacement (3, 7, 14, 21) laisse respirer tout en maintenant la présence. Un espacement plus serré sent le désespoir.

## Anti-patterns

- **"Je reviens vers vous."** Cette phrase communique "je n'ai rien de neuf à dire mais je vous écris quand même". Chaque touche doit gagner sa place.
- **"Petit rappel sur mon dernier email."** Même problème. Le lecteur sait que tu as envoyé un dernier email. Dis-lui quelque chose de neuf.
- **Ruptures culpabilisantes.** "J'imagine que ce n'est pas le bon moment" ou "je vais considérer que vous n'êtes pas intéressé" sont passives-agressives. Clos avec élégance.

## Skills liés

- Pour gérer les réponses à ces relances, lance **reply-handler**.
- Pour bâtir le cold email d'origine, lance **cold-email-writer**.
- Pour orchestrer toute la séquence multicanale, lance **write-outbound-sequence**.
