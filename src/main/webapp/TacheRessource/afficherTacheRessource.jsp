<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Tâches et Ressources</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
            --success-color: #27ae60;
            --info-color: #2980b9;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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

        .menu {
            list-style: none;
            display: flex;
            gap: 15px;
        }

        .menu li {
            position: relative;
        }

        .menu li .link {
            color: var(--dark-color);
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .menu li .link:hover {
            background-color: var(--light-color);
            color: var(--secondary-color);
        }

        .menu li:hover .submenu {
            display: block;
        }

        .submenu {
            display: none;
            position: absolute;
            background: white;
            list-style: none;
            min-width: 200px;
            border-radius: 5px;
            padding: 10px 0;
            box-shadow: var(--shadow);
            z-index: 100;
            top: 100%;
            left: 0;
        }

        .submenu li {
            padding: 0;
        }

        .submenu li a {
            padding: 10px 20px;
            display: block;
            color: var(--dark-color);
            transition: all 0.2s;
        }

        .submenu li a:hover {
            background-color: var(--light-color);
            color: var(--secondary-color);
            padding-left: 25px;
        }

        .logout-btn {
            background-color: var(--accent-color);
            border-radius: 5px;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
        }

        .logout-btn a {
            text-decoration: none;
            color: white;
            font-weight: 600;
            font-size: 15px;
        }

        .logout-btn:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }

        main {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 15px;
        }

        h1 {
            color: var(--primary-color);
            font-size: 28px;
            font-weight: 700;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
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

        .btn-primary:before {
            content: "+";
            font-size: 18px;
        }

        .btn-info {
            background-color: var(--info-color);
            color: white;
        }

        .btn-info:hover {
            background-color: #2472a4;
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        .card {
            background: white;
            border-radius: 10px;
            box-shadow: var(--shadow);
            padding: 25px;
            margin-bottom: 30px;
        }

        .table-responsive {
            overflow-x: auto;
            border-radius: 8px;
            box-shadow: var(--shadow);
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

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        @media (max-width: 768px) {
            .navdiv {
                flex-direction: column;
                gap: 15px;
            }

            .menu {
                flex-wrap: wrap;
                justify-content: center;
            }

            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .action-buttons {
                flex-direction: column;
                gap: 8px;
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
    <div class="card">
        <div class="page-header">
            <h1>Liste des Tâches et leurs Ressources</h1>
            <a href="tacheRessource?action=afficherAttachForm" class="btn btn-primary">Ajouter une Ressource à une Tâche</a>
        </div>

        <div class="table-responsive">
            <table class="data-table">
                <thead>
                <tr>
                    <th>ID Tâche</th>
                    <th>Nom de la Tâche</th>
                    <th>Description</th>
                    <th>Date de Début</th>
                    <th>Date de Fin</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${taches}" var="tache">
                <tr>
                    <td>${tache.id}</td>
                    <td>${tache.nom}</td>
                    <td>${tache.description}</td>
                    <td>${tache.dateDebut}</td>
                    <td>${tache.dateFin}</td>
                    <td>
                        <div class="action-buttons">
                            <a href="tacheRessource