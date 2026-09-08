#!/bin/sh
# Inlines tokens.css + components.css + page-shell.css into index.html.
# Run after editing any of those or page-body.html.
set -e
cd "$(dirname "$0")"
{
  cat <<'HEAD'
<title>Persona 5 Design System</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo:wght@400;600;700&family=Rock+Salt&display=swap">
<style>
HEAD
  cat tokens.css components.css page-shell.css
  echo '</style>'
  cat page-body.html
} > index.html
echo "built index.html ($(wc -c < index.html) bytes)"
