//
//  AuthorizationRequired.swift
//  ZeroErrors
//
//  Created by Philipp Kotte on 03.07.25.
//

public let authorizationRequired = """
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>401 - Nicht autorisiert</title>
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
            background: rgba(0, 0, 0, 0.5);
        }

        /* Titel-Styling mit Neonröhren-Effekt */
        .title {
            font-size: 8rem;
            font-weight: 700;
            /* Der Text selbst wird durchsichtig, nur der Schatten ist sichtbar */
            color: transparent;
            animation: flicker 2s infinite linear;
        }

        /* Untertitel-Styling */
        .subtitle {
            font-size: 1.5rem;
            color: #f00;
            margin-top: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.2em;
        }
        
        /* Link zum Zurückkehren */
        .back-link {
            margin-top: 3rem;
            padding: 0.75rem 1.5rem;
            border: 2px solid #f00;
            color: #f00;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            transition: all 0.2s ease-in-out;
        }

        .back-link:hover {
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
        
        /* Überarbeitete Keyframes für den Neon-Flicker-Effekt */
        @keyframes flicker {
            0%, 19.9%, 22.1%, 62.9%, 64.1%, 100% {
                text-shadow:
                    /* Innerer heller Kern der Röhre */
                    0 0 1px #fff,
                    0 0 2px #fff,
                    /* Äußeres rotes Leuchten */
                    0 0 5px #f00,
                    0 0 12px #f00,
                    0 0 25px #f00,
                    0 0 40px #f00,
                    0 0 70px #f00;
                opacity: 1;
            }
            20%, 22%, 63%, 64% {
                /* Simuliert das kurze "Ausgehen" der Röhre */
                text-shadow: none;
                opacity: 0.5;
            }
        }
    </style>
</head>
<body>

    <canvas id="matrix-canvas"></canvas>

    <main class="main-container">
        <h1 class="title">401</h1>
        <p class="subtitle">
            Zugriff verweigert
        </p>
        <a href="/" class="back-link">
            Identität bestätigen
        </a>
    </main>

    <script>
        const canvas = document.getElementById('matrix-canvas');
        const ctx = canvas.getContext('2d');

        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;

        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        const katakana = 'アァカサタナハマヤャラワガザダバパイィキシチニヒミリヰギジヂビピウゥクスツヌフムユュルグズブヅプエェケセテネヘメレヱゲゼデベペオォコソトノホモヨョロヲゴゾドボポヴッン';
        const matrixChars = (characters + katakana).split('');

        const fontSize = 16;
        const columns = Math.floor(canvas.width / fontSize);

        const drops = [];
        for (let x = 0; x < columns; x++) {
            drops[x] = 1;
        }

        function draw() {
            ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            ctx.fillStyle = '#f00'; 
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

        setInterval(draw, 33);

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
