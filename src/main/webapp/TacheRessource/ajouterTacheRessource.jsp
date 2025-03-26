<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une Ressource à une Tâche</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --border-radius: 8px;
        }

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: var(--dark-color);
        }

        .navbar {
            background: white;
            padding: 15px 30px;
            box-shadow: var(--shadow);
            position: sticky;
            top: 0;
            z-index: 1000;
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
        }

        .logo a {
            color: var(--primary-color);
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .logo a:before {
            content: "🏗️";
            margin-right: 10px;
        }

        /* Navigation Menu Styles */
        .menu {
            display: flex;
            list-style: none;
            gap: 20px;
            align-items: center;
        }

        .menu > li {
            position: relative;
        }

        .menu a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            padding: 10px 15px;
            border-radius: var(--border-radius);
            transition: all 0.3s;
        }

        .menu a:hover {
            background-color: var(--light-color);
            color: var(--secondary-color);
        }

        .submenu {
            position: absolute;
            top: 100%;
            left: 0;
            background: white;
            list-style: none;
            width: 200px;
            box-shadow: var(--shadow);
            border-radius: var(--border-radius);
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s;
            z-index: 100;
        }

        .menu li:hover .submenu {
            opacity: 1;
            visibility: visible;
        }

        .submenu li a {
            display: block;
            padding: 10px 15px;
            border-bottom: 1px solid #eee;
        }

        .submenu li:last-child a {
            border-bottom: none;
        }

        .logout-btn {
            background-color: var(--accent-color);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
        }

        .logout-btn:hover {
            background-color: #c0392b;
        }

        .logout-btn a {
            color: white !important;
            background-color: transparent !important;
        }

        main {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            padding: 30px;
            margin-bottom: 30px;
        }

        h1 {
            color: var(--primary-color);
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--primary-color);
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 16px;
            transition: all 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        select:focus,
        textarea:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        .form-control[readonly] {
            background-color: #f8f9fa;
            color: #6c757d;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn-primary {
            background-color: var(--success-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: #219653;
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        .btn-secondary {
            background-color: var(--warning-color);
            color: white;
        }

        .btn-secondary:hover {
            background-color: #e67e22;
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .task-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: var(--border-radius);
            margin-top: 10px;
            border-left: 4px solid var(--secondary-color);
        }

        /* Mobile Menu Toggle */
        .menu-toggle {
            display: none;
            cursor: pointer;
            font-size: 24px;
            color: var(--primary-color);
        }

        /* Responsive Styles */
        @media (max-width: 992px) {
            .menu {
                position: fixed;
                top: 80px;
                left: -100%;
                width: 80%;
                height: calc(100vh - 80px);
                background: white;
                flex-direction: column;
                align-items: flex-start;
                padding: 20px;
                box-shadow: var(--shadow);
                transition: all 0.3s;
                gap: 10px;
            }

            .menu.active {
                left: 0;
            }

            .menu > li {
                width: 100%;
            }

            .submenu {
                position: static;
                width: 100%;
                box-shadow: none;
                opacity: 1;
                visibility: visible;
                display: none;
                margin-top: 10px;
                padding-left: 15px;
            }

            .menu li:hover .submenu {
                display: block;
            }

            .menu-toggle {
                display: block;
            }

            .logout-btn {
                width: 100%;
                text-align: left;
                padding: 10px 15px;
            }
        }

        @media (max-width: 768px) {
            .navbar {
                padding: 15px 20px;
            }

            .logo {
                font-size: 24px;
            }

            .button-group {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            .card {
                padding: 20px;
            }

            h1 {
                font-size: 24px;
            }
        }

        @media (max-width: 576px) {
            .navdiv {
                flex-direction: column;
                align-items: flex-start;
            }

            .logo {
                margin-bottom: 15px;
            }

            .menu {
                top: 120px;
                height: calc(100vh - 120px);
            }

            main {
                margin: 20px auto;
                padding: 0 15px;
            }
        }
    </style>
</head>
<body>
<nav class="navbar">
    <div class="navdiv">
        <div class="logo"><a href="index.jsp">ConstructionXpert</a></div>
        <div class="menu-toggle">☰</div>
        <ul class="menu">
            <li>
                <a class="link" href="index.jsp">Home</a>
            </li>
            <li>
                <a class="link" href="projet?action=new">Projet</a>
                <ul class="submenu">
                    <li><a class="link" href="projet?action=new">Ajouter</a></li>
                    <li><a class="link" href="projet?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <a class="link" href="tache?action=new">Tache</a>
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
                <button class="logout-btn"><a href="logout">Logout</a></button>
            </li>
        </ul>
    </div>
</nav>

<main>
    <div class="card">
        <h1>Ajouter une Ressource à une Tâche</h1>

        <form action="tacheRessource?action=ajouterTacheRessource" method="post">
            <div class="form-group">
                <label for="id_tache">Tâche :</label>
                <input type="text" class="form-control" id="id_tache" name="id_tache" value="${tache.id_TA}" readonly>
                <input type="hidden" name="id_tache" value="${tache.id_TA}">
                <div class="task-info">
                    <p>${tache.description}</p>
                </div>
            </div>

            <div class="form-group">
                <label for="id_ressource">Ressource :</label>
                <select class="form-control" id="id_ressource" name="id_ressource" required>
                    <option value="">Sélectionnez une ressource</option>
                    <c:forEach items="${ressources}" var="ressource">
                        <option value="${ressource.id_RESS}">${ressource.nom} - ${ressource.types}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="button-group">
                <button type="submit" class="btn btn-primary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                    </svg>
                    Ajouter
                </button>
                <a href="tacheRessource?action=listeTacheRessource" class="btn btn-secondary">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                    Annuler
                </a>
            </div>
        </form>
    </div>
</main>

<script>
    // Toggle mobile menu
    document.querySelector('.menu-toggle').addEventListener('click', function() {
        document.querySelector('.menu').classList.toggle('active');
    });

    // Close menu when clicking on a link
    document.querySelectorAll('.menu a').forEach(link => {
        link.addEventListener('click', function() {
            document.querySelector('.menu').classList.remove('active');
        });
    });
</script>
</body>
</html>