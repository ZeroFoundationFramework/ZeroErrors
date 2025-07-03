//
//  InternalServerError.swift
//  ZeroErrors
//
//  Created by Philipp Kotte on 03.07.25.
//
public let internalServerError = """
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 - Interner Serverfehler</title>
    <!-- Google Font für einen technischen Look -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Grundlegende Styles und Resets */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto Mono', monospace;
            background-color: #000;
            color: #ccc;
            overflow: hidden;
            user-select: none;
        }

        /* Canvas für den animierten Hintergrund */
        #matrix-canvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        /* Haupt-Container, der den Inhalt zentriert */
        .main-container {
            position: relative;
            z-index: 1;
            width: 100%;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 1rem;
            /* Leichter dunkler Schleier, um den Text besser lesbar zu machen */
            background: rgba(0, 0, 0, 0.5);
        }

        /* Titel-Styling */
        .title {
            font-size: 8rem;
            font-weight: 700;
            color: #fff;
            /* ÄNDERUNG: text-shadow auf Rottöne umgestellt */
            text-shadow: 0 0 15px rgba(255, 0, 0, 0.7);
        }

        /* Untertitel-Styling */
        .subtitle {
            font-size: 1.5rem;
            /* ÄNDERUNG: Farbe auf Rot umgestellt */
            color: #f00;
            margin-top: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.2em;
        }
        
        /* Link zum Zurückkehren */
        .back-link {
            margin-top: 3rem;
            padding: 0.75rem 1.5rem;
            /* ÄNDERUNG: Farbe auf Rot umgestellt */
            border: 2px solid #f00;
            color: #f00;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            transition: all 0.2s ease-in-out;
        }

        .back-link:hover {
            /* ÄNDERUNG: Farbe auf Rot umgestellt */
            background-color: #f00;
            color: #000;
            box-shadow: 0 0 25px #f00;
        }
        
        @media (min-width: 768px) {
             .title {
                font-size: 12rem;
            }
            .subtitle {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>

    <canvas id="matrix-canvas"></canvas>

    <main class="main-container">
        <h1 class="title">500</h1>
        <p class="subtitle">
            Interner Serverfehler
        </p>
        <a href="/" class="back-link">
            Zurück zum Systemkern
        </a>
    </main>

    <script>
        const canvas = document.getElementById('matrix-canvas');
        const ctx = canvas.getContext('2d');

        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;

        // Zeichen für den "digitalen Regen"
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        const katakana = 'アァカサタナハマヤャラワガザダバパイィキシチニヒミリヰギジヂビピウゥクスツヌフムユュルグズブヅプエェケセテネヘメレヱゲゼデベペオォコソトノホモヨョロヲゴゾドボポヴッン';
        const matrixChars = (characters + katakana).split('');

        const fontSize = 16;
        const columns = Math.floor(canvas.width / fontSize);

        // Ein Array, um die y-Position jedes "Regentropfens" zu speichern
        const drops = [];
        for (let x = 0; x < columns; x++) {
            drops[x] = 1;
        }

        function draw() {
            // Zeichne ein halbtransparentes Rechteck über den Canvas,
            // um den "Fading"-Effekt der Spuren zu erzeugen.
            ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            /* ÄNDERUNG: Farbe auf Rot umgestellt */
            ctx.fillStyle = '#f00'; 
            ctx.font = fontSize + 'px Roboto Mono';

            // Gehe durch jede Spalte
            for (let i = 0; i < drops.length; i++) {
                // Wähle ein zufälliges Zeichen aus
                const text = matrixChars[Math.floor(Math.random() * matrixChars.length)];
                
                // Zeichne das Zeichen an der aktuellen Position
                ctx.fillText(text, i * fontSize, drops[i] * fontSize);

                // Setze den Tropfen zufällig an den Anfang zurück, wenn er den Bildschirm verlässt.
                if (drops[i] * fontSize > canvas.height && Math.random() > 0.975) {
                    drops[i] = 0;
                }

                // Bewege den Tropfen nach unten
                drops[i]++;
            }
        }

        // Starte die Animation
        setInterval(draw, 33);

        // Passe die Canvas-Größe an, wenn das Fenster verändert wird
        window.addEventListener('resize', () => {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
            // Passe die Anzahl der Spalten an die neue Breite an
            const newColumns = Math.floor(canvas.width / fontSize);
            for (let x = 0; x < newColumns; x++) {
                drops[x] = 1;
            }
        });
    </script>
</body>
</html>

"""
