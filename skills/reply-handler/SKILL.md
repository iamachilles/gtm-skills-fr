---
name: reply-handler
description: "Génère des modèles de réponse pour les 8 types de réponses courantes en outbound. Déclencheurs : 'modèles de réponses', 'reply handler', 'réponses aux objections', 'comment répondre', 'gestion des réponses', 'templates de réponse', 'réponses outbound'."
tools: Read, Write
---

# Reply Handler

Génère des modèles de réponse pour les 8 types de réponses les plus courants en séquences outbound. Chaque modèle fait moins de 60 mots, prêt à personnaliser, conçu pour faire avancer la conversation ou la clore proprement. L'objectif n'est jamais de gagner un débat. C'est d'avancer ou de passer à autre chose.

## Inputs

- **Contexte de campagne** (optionnel). Ce que tu vends, à qui, et le CTA utilisé.
- **Produit ou service** (optionnel). Pour la différenciation concurrentielle et le recadrage de valeur.
- **Lien de réservation** (optionnel). URL de calendrier pour les réponses liées au rendez-vous.
- **Contenu de nurture** (optionnel). Ressources à partager dans les scénarios "pas maintenant".

Aucun input obligatoire. Ce skill produit un set de modèles universels. Fournis du contexte pour des réponses plus ciblées.

## Étapes

### Étape 0. Vérifier l'existence d'un livrable

Lis `docs/sequences/reply-templates.md` s'il existe. Si trouvé, présente un résumé et demande : "Des modèles de réponse existent déjà couvrant [N] types. Tu veux que je (a) ajoute des types, (b) affine les modèles existants, ou (c) reparte de zéro ?"

### Étape 1. Charger le contexte

Lis tout le contexte disponible :

1. `docs/messaging-matrix.md`. Messaging à référencer dans les réponses.
2. `docs/objection-library.md`. Réponses détaillées aux objections si dispo.
3. `docs/sales-narratives.md`. Cadre narratif pour les recadrages.
4. `CLAUDE.md`. Instructions projet.

### Étape 2. Écrire les modèles pour les 8 types

Rédige une réponse modèle pour chaque type :

**1. Intéressé. Prendre rendez-vous**
- Reconnais l'intérêt sans en faire trop.
- Propose 2 à 3 créneaux ou un lien de réservation.
- Confirme ce que le rendez-vous couvrira (ordre du jour bref).
- Sous 60 mots.

**2. Pas maintenant. Entrée en nurture**
- Respecte son timing sans repousser.
- Demande quand serait un meilleur moment pour revenir.
- Propose d'envoyer une ressource pertinente entre-temps.
- Ajoute à la séquence de nurture avec une date de relance précise.
- Sous 60 mots.

**3. Mauvaise personne. Demander une mise en relation**
- Remercie pour l'info.
- Demande qui serait la bonne personne pour ce sujet.
- Facilite la mise en relation (propose de rédiger un message à transférer).
- Sous 60 mots.

**4. Envoyez plus d'infos. Partager une ressource + CTA**
- Partage une ressource précise (cas client, one-pager ou demo link).
- Ne balance pas tout. Un seul asset, bien choisi.
- Inclut un CTA léger : "Heureux d'en discuter en live si utile."
- Sous 60 mots.

**5. On utilise un concurrent. Reconnaître + différencier**
- Reconnais positivement le concurrent (jamais de descente en flammes).
- Différencie sur une dimension précise pertinente pour son pain.
- Pose une question qui révèle une faille possible chez le concurrent.
- Sous 60 mots.

**6. Trop cher. Recadrer la valeur**
- Ne défends pas le prix. Recadre sur le coût de ne pas résoudre le problème.
- Référence un ROI précis si dispo.
- Demande à quoi il compare (budget, concurrent, build interne).
- Sous 60 mots.

**7. Désinscription. Retirer proprement**
- Confirme le retrait immédiatement. Pas de questions, pas de "vous êtes sûr ?".
- Sois pro et bref.
- Laisse la porte ouverte sans insister.
- Sous 40 mots.

**8. Hostile. Désengager poliment**
- N'engage pas l'hostilité.
- Excuse-toi brièvement de l'intrusion.
- Confirme le retrait de la séquence.
- Sous 40 mots.
- Ne matche jamais son ton. Jamais.

### Étape 3. Contrôle qualité

Avant de sauvegarder :

- [ ] Les 8 types sont couverts.
- [ ] Chaque modèle fait moins de 60 mots (désinscription et hostile sous 40).
- [ ] Aucun modèle n'est défensif, argumentatif ou culpabilisant.
- [ ] Le modèle "intéressé" inclut une prochaine étape précise.
- [ ] Le modèle "mauvaise personne" demande une mise en relation précise.
- [ ] Le modèle concurrent ne descend pas l'autre en flammes.
- [ ] Désinscription et hostile confirment immédiatement le retrait.
- [ ] Pas de tirets cadratins dans la copie.
- [ ] Chaque modèle peut être personnalisé en moins de 30 secondes.

Si un contrôle échoue, corrige avant de continuer.

## Format de sortie

Sauvegarde dans `docs/sequences/reply-templates.md` :

```markdown
# Modèles de réponse
Date : {Date}
Campagne : {contexte de campagne si fourni}

## 1. Intéressé. Prendre rendez-vous
**Quand l'utiliser :** il exprime un intérêt à en savoir plus ou à se rencontrer.
**Modèle :**
{Texte du modèle}
Nombre de mots : {compte}/60

## 2. Pas maintenant. Entrée en nurture
**Quand l'utiliser :** il n'est pas prêt mais n'a pas dit non.
**Modèle :**
{Texte du modèle}
**Action :** ajouter au nurture, relancer le {date suggérée}.
Nombre de mots : {compte}/60

## 3. Mauvaise personne. Demander une mise en relation
**Quand l'utiliser :** il dit ne pas être le bon contact.
**Modèle :**
{Texte du modèle}
Nombre de mots : {compte}/60

## 4. Envoyez plus d'infos. Partager une ressource + CTA
**Quand l'utiliser :** il demande plus d'infos avant de s'engager.
**Modèle :**
{Texte du modèle}
**Joindre :** {ressource suggérée}
Nombre de mots : {compte}/60

## 5. On utilise un concurrent. Reconnaître + différencier
**Quand l'utiliser :** il mentionne une solution existante.
**Modèle :**
{Texte du modèle}
Nombre de mots : {compte}/60

## 6. Trop cher. Recadrer la valeur
**Quand l'utiliser :** il pousse sur le prix.
**Modèle :**
{Texte du modèle}
Nombre de mots : {compte}/60

## 7. Désinscription. Retirer proprement
**Quand l'utiliser :** il demande à ne plus recevoir de messages.
**Modèle :**
{Texte du modèle}
**Action :** retirer immédiatement de toutes les séquences.
Nombre de mots : {compte}/40

## 8. Hostile. Désengager poliment
**Quand l'utiliser :** il répond avec colère ou agressivité.
**Modèle :**
{Texte du modèle}
**Action :** retirer de toutes les séquences. Marquer dans le CRM. Ne pas recontacter.
Nombre de mots : {compte}/40

## Référence rapide
| Type de réponse | Objectif | Mots max |
|-----------------|----------|----------|
| Intéressé | Prendre rendez-vous | 60 |
| Pas maintenant | Entrée en nurture | 60 |
| Mauvaise personne | Obtenir une mise en relation | 60 |
| Envoyez plus d'infos | Partager une ressource + CTA | 60 |
| Concurrent | Différencier | 60 |
| Trop cher | Recadrer la valeur | 60 |
| Désinscription | Retirer proprement | 40 |
| Hostile | Désengager | 40 |
```

## Principes clés

1. **La vitesse gagne sur les réponses positives.** Quand quelqu'un dit "intéressé", réponds dans l'heure. Chaque heure de retard fait baisser la conversion.
2. **Chaque réponse est une donnée.** "Pas maintenant" te dit le timing. "Mauvaise personne" te donne un chemin de mise en relation. "On utilise un concurrent" te révèle le paysage. Extrais de la valeur de chaque réponse.
3. **Les réponses hostiles reçoivent zéro énergie.** Retire-les, passe à autre chose. Aucune réplique brillante ne vaut le risque.
4. **Les modèles sont des points de départ.** Personnalise chacun avec des détails précis avant d'envoyer. Un modèle qui ressemble à un modèle se retourne contre toi.

## Anti-patterns

- **Argumenter avec les objections.** "Mais notre produit est meilleur parce que..." ne marche jamais. Reconnais, recadre, pose une question.
- **Supplier sur les désinscriptions.** "Vous êtes sûr ? Laissez-moi vous envoyer une dernière chose." Respecte la limite immédiatement.
- **Matcher l'énergie hostile.** Au moment où tu engages l'agressivité, tu as perdu. Désengage avec professionnalisme et passe à autre chose.

## Skills liés

- Pour les non-répondants ouvreurs, écris une **follow-up-sequence**.
- Pour cadrer les premiers messages avant les réponses, lance **cold-email-writer**.
- Pour orchestrer la séquence complète, lance **write-outbound-sequence**.
