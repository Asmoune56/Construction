<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ressources de la Tâche</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --info-color: #2980b9;
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

        main {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }

        h1, h2 {
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        h1 {
            font-size: 28px;
            font-weight: 700;
        }

        h2 {
            font-size: 22px;
            font-weight: 600;
            margin-top: 30px;
        }

        .card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            margin-bottom: 30px;
            border: none;
        }

        .card-header {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            padding: 15px 20px;
            border-radius: var(--border-radius) var(--border-radius) 0 0 !important;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            color: var(--primary-color);
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .card-text {
            margin-bottom: 10px;
        }

        .card-text strong {
            color: var(--primary-color);
        }

        .alert {
            padding: 15px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
        }

        .alert-info {
            background-color: #d1ecf1;
            color: #0c5460;
            border-left: 4px solid var(--info-color);
        }

        .table-responsive {
            overflow-x: auto;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            margin-bottom: 30px;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th {
            background-color: var(--primary-color);
            color: white;
            text-align: left;
            padding: 15px;
            font-weight: 600;
        }

        .data-table td {
            padding: 15px;
            border-bottom: 1px solid #e0e0e0;
            color: var(--dark-color);
        }

        .data-table tr:last-child td {
            border-bottom: none;
        }

        .data-table tr:hover {
            background-color: #f8f9fa;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
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

        .btn-danger {
            background-color: var(--accent-color);
            color: white;
        }

        .btn-danger:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        @media (max-width: 768px) {
            .button-group {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<nav class="navbar">
    <div class="navdiv">
        <div class="logo"><a href="index.jsp">ConstructionXpert</a></div>
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
    <h1>Ressources de la Tâche: ${tache.nom}</h1>

    <div class="card">
        <div class="card-header">
            Détails de la Tâche
        </div>
        <div class="card-body">
            <h5 class="card-title">${tache.nom}</h5>
            <p class="card-text"><strong>Description:</strong> ${tache.description}</p>
            <p class="card-text"><strong>Date de début:</strong> ${tache.dateDebut}</p>
            <p class="card-text"><strong>Date de fin:</strong> ${tache.dateFin}</p>
        </div>
    </div>

    <h2>Ressources Attachées</h2>

    <c:if test="${empty tacheRessource}">
        <div class="alert alert-info">
            Aucune ressource n'est attachée à cette tâche.
        </div>
    </c:if>

    <c:if test="${not empty tacheRessource}">
        <div class="table-responsive">
            <table class="data-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Type</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${tacheRessource}" var="ressource">
                    <tr>
                        <td>${ressource.id}</td>
                        <td>${ressource.nom}</td>
                        <td>${ressource.type}</td>
                        <td>
                            <a href="tacheRessource?action=supprimerTacheRessource&id_ressource=${ressource.id}&id_tache=${tache.id}"
                               class="btn btn-danger"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource de la tâche?')">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                </svg>
                                Détacher
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <div class="button-group">
        <a href="tacheRessource?action=afficherAttachForm" class="btn btn-primary">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
            </svg>
            Ajouter une Ressource
        </a>
        <a href="tacheRessource?action=listeTacheRessource" class="btn btn-secondary">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
            </svg>
            Retour à la Liste
        </a>
    </div>
</main>

<script>
    // Confirmation for delete action
    function confirmDetach(event) {
        if (!confirm('Êtes-vous sûr de vouloir détacher cette ressource de la tâche?')) {
            event.preventDefault();
        }
    }

    // Add event listeners to all detach buttons
    document.querySelectorAll('.btn-danger').forEach(button => {
        button.addEventListener('click', confirmDetach);
    });
</script>
</body>
</html>