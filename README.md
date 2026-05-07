# GTM Skills FR. 9 skills Claude Code pour la prospection B2B

9 skills production-grade pour Claude Code, conçus pour la prospection B2B francophone.
Pensés pour les dirigeants de PME B2B qui veulent un système d'acquisition cohérent sans empiler les outils.
Couvre tout le cycle, de l'ICP à la relance.

## Installation en 30 secondes

```bash
git clone https://github.com/iamachilles/gtm-skills-fr.git
cd gtm-skills-fr
./install.sh
```

Une seule commande. Les 9 skills sont copiés dans `~/.claude/skills/` et immédiatement disponibles dans Claude Code.

## Les 9 skills

| Chaîne | Skill | Ce que ça fait |
|--------|-------|-----------------|
| Cibler les bons comptes | `icp-model-creator` | Construit un ICP en 10 sections à partir de tes matériaux et de la recherche |
| Cibler les bons comptes | `signal-list-generator` | Génère une liste de comptes déclenchés par un signal d'achat précis |
| Cibler les bons comptes | `buying-committee-mapper` | Cartographie les 6 rôles du comité d'achat avec accroches par rôle |
| Préparer l'approche | `tech-stack-analyzer` | Identifie le stack technique d'un prospect et les angles d'approche |
| Préparer l'approche | `outreach-personalizer` | Génère 5 accroches de personnalisation classées par pertinence |
| Préparer l'approche | `cold-email-writer` | Rédige un cold email PAS ou AIDA avec 3 variantes et 3 objets |
| Préparer l'approche | `write-outbound-sequence` | Construit une séquence multicanale 8 à 12 touches sur 3 à 4 semaines |
| Tenir la cadence | `reply-handler` | 8 modèles de réponse pour les replies courantes en outbound |
| Tenir la cadence | `follow-up-sequence` | Séquence de relance 4 touches pour les ouvreurs sans réponse |

## Comment les utiliser

Une fois installés, Claude Code reconnaît les phrases déclencheurs automatiquement. Pas besoin de mémoriser les noms exacts.

Exemples de prompts qui marchent :

- "Construis-moi un ICP pour ma boîte, voici un brief de l'activité : ..."
- "Trouve les boîtes SaaS françaises qui ont levé en série A ces 30 derniers jours."
- "Écris une séquence outbound 3 semaines pour un VP Sales en SaaS B2B, pain principal : pipeline qui ne suit pas la croissance."

Tu peux aussi invoquer un skill explicitement avec sa commande, par exemple `/icp-model-creator`.

## Comment les chaîner

Les skills produisent des livrables structurés que le skill suivant peut lire automatiquement.

Le parcours type :

1. `icp-model-creator` génère ton ICP de référence.
2. `buying-committee-mapper` détaille les 6 rôles à viser dans le comité d'achat.
3. `signal-list-generator` construit la liste de comptes déclenchés.
4. `tech-stack-analyzer` puis `outreach-personalizer` enrichissent les comptes prioritaires.
5. `cold-email-writer` rédige le premier email, `write-outbound-sequence` orchestre la cadence complète.
6. `reply-handler` et `follow-up-sequence` gèrent ce qui revient et ce qui n'arrive pas.

ICP, cartographie, séquence, relance. Le système tient debout d'un bout à l'autre.

## À propos

Construit par Achille Morin-Lemoine, consultant GTM solo basé à Paris. J'aide les boîtes B2B à monter leur système d'acquisition sortant.

LinkedIn : [linkedin.com/in/achille-morin-lemoine](https://linkedin.com/in/achille-morin-lemoine)

Si tu utilises ces skills pour ta boîte ou tes clients, écris-moi en DM. Curieux de voir ce que tu en fais.

## Licence

MIT. Voir [LICENSE](LICENSE).
