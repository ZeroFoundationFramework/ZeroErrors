//
//  RenderingError.swift
//  ZeroErrors
//
//  Created by Philipp Kotte on 03.07.25.
//

public let renderingError = """
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Template Error</title>
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
            background: rgba(0, 0, 0, 0.6);
        }

        /* Titel-Styling */
        .title {
            font-size: 5rem;
            font-weight: 700;
            color: #fff;
            text-transform: uppercase;
            /* ÄNDERUNG: text-shadow auf Gelb/Amber umgestellt */
            text-shadow: 0 0 10px rgba(255, 191, 0, 0.7);
        }

        /* Untertitel-Styling */
        .subtitle {
            font-size: 1.25rem;
            /* ÄNDERUNG: Farbe auf Gelb/Amber umgestellt */
            color: #ffbf00;
            margin-top: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.1em;
        }
        
        /* Code-Block für den Dateinamen */
        .code-block {
            background-color: #1a1a1a;
            border: 1px solid #ffbf00;
            color: #ffbf00;
            padding: 1rem 1.5rem;
            margin-top: 2rem;
            font-size: 1.1rem;
            max-width: 80%;
            word-wrap: break-word;
        }
        
        @media (min-width: 768px) {
             .title {
                font-size: 8rem;
            }
            .subtitle {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>

    <canvas id="matrix-canvas"></canvas>

    <main class="main-container">
        <h1 class="title">Template Error</h1>
        <p class="subtitle">
            Datei nicht gefunden
        </p>
        <div class="code-block">
            <!-- Dieser Platzhalter wird von deiner Template-Engine ersetzt -->
            {{ error.filename }}
        </div>
    </main>

    <script>
        const canvas = document.getElementById('matrix-canvas');
        const ctx = canvas.getContext('2d');

        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;

        const characters = '01'; // Binärer Regen passt gut zu einem Fehler
        const matrixChars = characters.split('');

        const fontSize = 16;
        const columns = Math.floor(canvas.width / fontSize);

        const drops = [];
        for (let x = 0; x < columns; x++) {
            drops[x] = 1;
        }

        function draw() {
            ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            /* ÄNDERUNG: Farbe auf Gelb/Amber umgestellt */
            ctx.fillStyle = '#ffbf00'; 
            ctx.font = fontSize + 'px Roboto Mono';

            for (let i = 0; i < drops.length; i++) {
                const text = matrixChars[Math.floor(Math.random() * matrixChars.length)];
                ctx.fillText(text, i * fontSize, drops[i] * fontSize);

                if (drops[i] * fontSize > canvas.height && Math.random() > 0.975) {
                    drops[i] = 0;
                }
                drops[i]++;
            }
        }

        setInterval(draw, 40);

        window.addEventListener('resize', () => {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
            const newColumns = Math.floor(canvas.width / fontSize);
            for (let x = 0; x < newColumns; x++) {
                drops[x] = 1;
            }
        });
    </script>
</body>
</html>

"""
