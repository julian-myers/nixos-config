#!/usr/bin/env bash

set -euo pipefail

NAME="${1:-paper}"

mkdir -p "$NAME"/{sections,figs,bib,build}

cat > "$NAME/main.tex" <<'EOF'
\documentclass[12pt, a4paper]{article}
\input{preamble}

\title{Title}
\author{Julian Myers}
\date{\today}

\begin{document}
\maketitle

\end{document}
EOF

cat > "$NAME/preamble.tex" <<'EOF'
% ---- Packages & formatting ----
\usepackage{geometry}
\usepackage{microtype}
\usepackage{amsmath,amssymb,mathtools}
\mathtoolsset{showonlyrefs}
\usepackage{graphicx}
\graphicspath{{figs/}}
\usepackage{booktabs}
\usepackage{csquotes}
\usepackage[hidelinks]{hyperref}
EOF


echo "✅ LaTeX project created at: $NAME
	 Build with:  latexmk -pdf -outdir=build -auxdir=build main.tex
	 (or just 'latexmk -pdf main.tex' since .latexmkrc sets the dirs)"

