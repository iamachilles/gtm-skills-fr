#!/usr/bin/env bash
# Installation des 9 skills GTM FR pour Claude Code.
# Idempotent : relancer le script écrase la version installée.

set -euo pipefail

SKILLS_SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
SKILLS_DEST_DIR="${HOME}/.claude/skills"

SKILLS=(
  "icp-model-creator"
  "signal-list-generator"
  "buying-committee-mapper"
  "tech-stack-analyzer"
  "outreach-personalizer"
  "cold-email-writer"
  "write-outbound-sequence"
  "reply-handler"
  "follow-up-sequence"
)

if [ ! -d "${SKILLS_SRC_DIR}" ]; then
  echo "Erreur : dossier skills/ introuvable. Lance le script depuis la racine du repo gtm-skills-fr."
  exit 1
fi

mkdir -p "${SKILLS_DEST_DIR}"

echo "Installation des 9 skills GTM FR dans ${SKILLS_DEST_DIR}"
echo ""

for skill in "${SKILLS[@]}"; do
  src="${SKILLS_SRC_DIR}/${skill}"
  dest="${SKILLS_DEST_DIR}/${skill}"

  if [ ! -d "${src}" ]; then
    echo "  Skill manquant dans le repo : ${skill}. On passe."
    continue
  fi

  echo "  Installation du skill ${skill}..."
  rm -rf "${dest}"
  cp -R "${src}" "${dest}"
done

echo ""
echo "Installation terminée. Tu peux maintenant utiliser /icp-model-creator dans Claude Code."
echo "Liste complète des skills installés :"
for skill in "${SKILLS[@]}"; do
  echo "  /${skill}"
done
