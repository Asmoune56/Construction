<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Gestion de Projets</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3a0ca3;
            --accent-color: #f72585;
            --dark-color: #1a1a2e;
            --light-color: #f8f9fa;
            --glass-color: rgba(255, 255, 255, 0.15);
            --glass-border: rgba(255, 255, 255, 0.2);
        }

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)),
            url('https://png.pngtree.com/thumb_back/fh260/background/20231221/pngtree-silhouettes-of-engineers-and-construction-team-working-on-site-on-blurred-photo-image_15555438.png') no-repeat center center/cover;
            min-height: 100vh;
            color: var(--dark-color);
        }

        /* Navbar Styles */
        .navbar {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 15px 30px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            z-index: 1000;
            border-bottom: 1px solid var(--glass-border);
        }

        .navdiv {
            display: flex;
            align-items: center;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            font-size: 28px;
            font-weight: 700;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .logo a {
            text-decoration: none;
        }

        .menu {
            list-style: none;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .menu li {
            position: relative;
        }

        .menu li .link {
            color: var(--dark-color);
            font-size: 15px;
            font-weight: 500;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .menu li .link:hover {
            background: var(--glass-color);
            color: var(--primary-color);
        }

        .menu li:hover .submenu {
            display: block;
        }

        .submenu {
            display: none;
            position: absolute;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            list-style: none;
            padding: 10px 0;
            border-radius: 8px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            min-width: 180px;
            z-index: 100;
            border: 1px solid var(--glass-border);
        }

        .submenu li {
            padding: 0;
        }

        .submenu li a {
            display: block;
            padding: 8px 20px;
            color: var(--dark-color);
            transition: all 0.2s ease;
            font-size: 14px;
        }

        .submenu li a:hover {
            background: rgba(67, 97, 238, 0.1);
            color: var(--primary-color);
            padding-left: 25px;
        }

        .logout-btn {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            margin-left: 20px;
            border-radius: 8px;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(67, 97, 238, 0.4);
        }

        .logout-btn a {
            text-decoration: none;
            color: white;
            font-weight: 500;
            font-size: 15px;
        }

        /* Hero Section */
        header {
            width: 100%;
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('construction-bg.jpg') no-repeat center center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: var(--light-color);
        }

        .text {
            max-width: 800px;
            padding: 0 20px;
        }

        .text span {
            letter-spacing: 3px;
            font-size: 18px;
            font-weight: 300;
            text-transform: uppercase;
            margin-bottom: 20px;
            display: block;
            color: rgba(255, 255, 255, 0.8);
        }

        .text h1 {
            font-size: 3.5rem;
            margin-bottom: 30px;
            font-weight: 700;
            line-height: 1.2;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
            flex-wrap: wrap;
        }

        .action-btn {
            text-decoration: none;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(5px);
            padding: 12px 30px;
            border-radius: 50px;
            color: white;
            font-weight: 500;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
            min-width: 160px;
        }

        .action-btn:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .action-btn:nth-child(1) {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
        }

        .action-btn:nth-child(1):hover {
            background: linear-gradient(135deg, #3a56e8, #2f0b9e);
        }

        /* Glassmorphism Effect */
        .glass-card {
            background: var(--glass-color);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 15px;
            border: 1px solid var(--glass-border);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.1);
            padding: 40px;
            margin: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar">
    <div class="navdiv">
        <div class="logo"><a href="index.jsp">ConstructionXpert</a></div>
        <ul class="menu">
            <li>
                <a class="link" href="index.jsp">Accueil</a>
            </li>
            <li>
                <a class="link" href="projet?action=new">Projet</a>
                <ul class="submenu">
                    <li><a class="link" href="projet?action=new">Ajouter</a></li>
                    <li><a class="link" href="projet?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <a class="link" href="tache?action=new">Tâche</a>
                <ul class="submenu">
                    <li><a class="link" href="tache?action=new">Ajouter</a></li>
                    <li><a class="link" href="tache?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <a class="link" href="ressource?action=new">Ressource</a>
                <ul class="submenu">
                    <li><a class="link" href="ressource?action=new">Ajouter</a></li>
                    <li><a class="link" href="ressource?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <button class="logout-btn"><a href="logout">Déconnexion</a></button>
            </li>
        </ul>
    </div>
</nav>

<header>
    <section class="text glass-card">
        <span>Bienvenue sur</span>
        <h1>Votre plateforme de gestion de construction</h1>
        <div class="action-buttons">
            <a href="projet?action=afficher" class="action-btn">Projets</a>
            <a href="tache?action=afficher" class="action-btn">Tâches</a>
            <a href="ressource?action=afficher" class="action-btn">Ressources</a>
        </div>
    </section>
</header>

</body>
</html>