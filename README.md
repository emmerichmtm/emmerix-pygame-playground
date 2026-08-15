# emmerix-pygame-playground

Ein gemeinsames Repository für alle Pygame-Spiele.

## Struktur

```
emmerix-pygame-playground/
├── games/
│   ├── von-neumann-countdown/
│   │   ├── main.py
│   │   └── assets/
│   └── lonely-runners/
│       ├── main.py
│       └── assets/
├── scripts/
│   └── build-all.sh
├── README.md
└── .gitignore
```

## Voraussetzungen

- Python 3.10+
- [pygame](https://www.pygame.org/)

Installation der Abhängigkeiten:

```bash
pip install pygame
```

## Ein Spiel starten

```bash
python games/von-neumann-countdown/main.py
python games/lonely-runners/main.py
```

## Alle Spiele bauen

Das Skript `scripts/build-all.sh` erstellt mit [PyInstaller](https://pyinstaller.org/) für jedes Spiel unter `games/` eine eigenständige ausführbare Datei:

```bash
pip install pyinstaller
./scripts/build-all.sh
```

Die Ergebnisse landen im Ordner `dist/`.

## Neues Spiel hinzufügen

1. Neuen Ordner unter `games/<spiel-name>/` anlegen.
2. `main.py` und optional einen `assets/`-Ordner hinzufügen.
3. Das Build-Skript erkennt neue Spiele automatisch.