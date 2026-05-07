---
name: cold-email-writer
description: "Écrit un cold email à fort taux de conversion avec le framework PAS ou AIDA. Déclencheurs : 'cold email', 'écris un email', 'email outbound', 'email de prospection', 'email PAS', 'email AIDA', 'copie email', 'email à froid'."
tools: Read, Write
---

# Cold Email Writer

Écrit un cold email complet avec variantes d'objet en utilisant le framework PAS (Problème-Agitation-Solution) ou AIDA (Attention-Intérêt-Désir-Action). Produit trois variantes d'email et trois options d'objet, prêtes à charger dans un outil de séquençage.

Le choix du framework est délibéré : PAS quand le persona ressent un pain aigu et bien compris. AIDA quand l'opportunité est aspirationnelle ou que le pain n'est pas encore ressenti.

## Inputs

- **Persona** (obligatoire). À qui tu écris (titre, KPIs, pain points).
- **Pain point** (obligatoire). Le problème précis à mettre en avant.
- **Proposition de valeur** (obligatoire). Ce que tu offres et pourquoi ça compte pour ce persona.
- **Preuve** (obligatoire). Un résultat, une métrique ou un cas client précis.
- **Matrice de messaging** (optionnel). Si elle existe, prends le contenu pertinent pour ce persona.
- **Ton** (optionnel). Conversationnel, formel, technique (défaut : conversationnel).

Si persona ou pain point manque, demande : "J'ai besoin du persona cible et de son pain point principal pour écrire l'email. À qui écrit-on et quel problème mettre en avant ?"

## Étapes

### Étape 0. Vérifier l'existence d'un livrable

Lis `docs/sequences/cold-email-{slug-persona}.md` s'il existe. Si trouvé, présente un résumé et demande : "Un cold email pour ce persona existe déjà avec [N] variantes. Tu veux que je (a) ajoute des variantes, (b) affine la copie existante, ou (c) reparte de zéro ?"

### Étape 1. Charger le contexte

Lis tout le contexte disponible :

1. `docs/messaging-matrix.md`. Récupère la cellule persona x pillar pertinente si elle existe.
2. `docs/personas/{slug-persona}.md`. Vocabulaire du persona, KPIs, objections.
3. `docs/value-prop-matrix.md`. Mapping fonctionnalité-bénéfice-valeur.
4. `docs/sales-narratives.md`. Cadre narratif si disponible.
5. `CLAUDE.md`. Instructions projet.

Identifie les patterns de langage du persona. Les cold emails qui utilisent le vocabulaire du lecteur convertissent. Le langage marketing tue le taux de réponse.

### Étape 2. Choisir le framework

Sélectionne le framework selon le pain point :

**PAS (Problème-Agitation-Solution).** À utiliser quand :
- Le persona ressent déjà le pain.
- Le problème est urgent ou s'aggrave.
- Il y a un coût clair de l'inaction.

**AIDA (Attention-Intérêt-Désir-Action).** À utiliser quand :
- L'opportunité est tournée vers l'avenir.
- Le persona ne sait pas encore qu'il a le problème.
- La valeur est aspirationnelle (croissance, avantage compétitif).

Indique quel framework tu as choisi et pourquoi.

### Étape 3. Écrire l'email

Écris un email complet selon ces règles :

**Objet.** 2 à 6 mots, en minuscules, pas de clickbait, pas d'astuces de ponctuation. Référence le monde du persona, pas le tien.

**Première phrase.** Personnalisée et précise. Connecte à quelque chose de réel sur la situation, le rôle ou l'entreprise du prospect.

**Pont pain / opportunité.** 1 à 2 phrases qui relient sa situation au problème (PAS) ou à l'opportunité (AIDA).

**Affirmation de valeur.** Une phrase qui explique ce que tu fais en termes du résultat qui compte pour lui.

**Preuve.** Un chiffre, un résultat ou une référence nommée. Pas "on aide des boîtes comme la vôtre" mais "on a aidé [Entreprise] à réduire [métrique] de [X]% en [délai]".

**CTA.** Une seule demande. Faible friction. Pas "dites-moi si vous voulez échanger ou s'il y a quelqu'un d'autre". Choisis une action.

### Étape 4. Générer 3 variantes

Crée trois variantes distinctes de l'email :

- **Variante A.** Démarrer par le pain point (la plus directe).
- **Variante B.** Démarrer par la preuve (crédibilité d'abord).
- **Variante C.** Démarrer par une question ou un insight (curiosité).

Chaque variante doit utiliser une première phrase et un angle différents. Le CTA peut rester identique.

### Étape 5. Générer 3 objets

Écris trois options d'objet :

1. Un qui référence le pain point du persona.
2. Un qui référence la preuve ou le résultat.
3. Un qui pose une question pertinente pour son rôle.

### Étape 6. Contrôle qualité

Avant de sauvegarder :

- [ ] Chaque corps d'email fait moins de 120 mots. Compte-les.
- [ ] Chaque objet fait 2 à 6 mots et est en minuscules.
- [ ] Aucun email ne commence par "J'espère que cet email vous trouve bien".
- [ ] Aucun email ne contient "J'ai remarqué que votre boîte grandit".
- [ ] Aucun email ne contient "J'aimerais piquer votre cerveau".
- [ ] Chaque variante utilise un angle vraiment différent, pas juste des mots reformulés.
- [ ] La preuve inclut un chiffre précis ou une référence nommée.
- [ ] Le CTA est une demande unique à faible friction.
- [ ] Pas de tirets cadratins dans la copie.
- [ ] Le langage matche la façon dont le persona parle, pas la façon dont les marketeurs écrivent.

Si un contrôle échoue, corrige avant de continuer.

## Format de sortie

Sauvegarde dans `docs/sequences/cold-email-{slug-persona}.md` :

```markdown
# Cold Email : {Titre persona}
Date : {Date}
Framework : {PAS ou AIDA}. {justification en une ligne}

## Options d'objet
1. {objet 1}
2. {objet 2}
3. {objet 3}

## Variante A. Pain en tête
**Objet :** {objet}
**Corps :**
{Texte complet de l'email}

## Variante B. Preuve en tête
**Objet :** {objet}
**Corps :**
{Texte complet de l'email}

## Variante C. Curiosité en tête
**Objet :** {objet}
**Corps :**
{Texte complet de l'email}

## Champs de personnalisation
- `{first_name}`. Prénom du destinataire.
- `{company}`. Nom de son entreprise.
- `{signal}`. Événement déclencheur ou observation précise.
- `{proof_point}`. Cas client le plus pertinent pour son secteur.

## Recommandation A/B test
- Tester d'abord les objets 1 vs 2 (minimum 100 envois par variante).
- Le gagnant devient le contrôle, à tester contre l'objet 3.
- Suivre le taux de réponse, pas seulement le taux d'ouverture.
```

## Principes clés

1. **Sous 120 mots ou ça ne sera pas lu.** Les écrans mobiles affichent 3 à 4 phrases avant le scroll. C'est tout ton canevas.
2. **Une seule idée par email.** Ne pitche pas, ne prouve pas, ne demande pas dans le même souffle. Choisis la chose qui mérite la réponse.
3. **La preuve bat la promesse.** "On a aidé [Entreprise] à faire [X]" est dix fois plus fort que "On peut vous aider à faire [X]".
4. **L'objet fait gagner l'ouverture. La première ligne fait gagner la lecture.** Le reste fait gagner la réponse.
5. **Écris comme un humain, pas comme une marque.** Si tu ne le dirais pas en conversation, ne l'écris pas dans l'email.

## Anti-patterns

- **"J'espère que cet email vous trouve bien."** Il trouve tout le monde bien. Ça ne dit rien au lecteur. Ça gaspille sa première ligne d'attention.
- **"J'ai remarqué que votre boîte grandit."** Toutes les boîtes grandissent ou essaient. Ça signale zéro recherche.
- **"J'aimerais piquer votre cerveau."** C'est demander du conseil gratuit déguisé en networking. Respecte son temps avec une demande précise.

## Skills liés

- Écris la **séquence de relance** pour les non-réponses : lance **follow-up-sequence**.
- Construis la **séquence multicanale complète** autour de cet email : lance **write-outbound-sequence**.
- Ajoute des **accroches de personnalisation** par prospect : lance **outreach-personalizer**.
- Prépare les **réponses aux réponses** : lance **reply-handler**.
