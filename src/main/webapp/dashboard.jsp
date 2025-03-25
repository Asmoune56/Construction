<%@ page import="com.gestion.gestionprojets_de_construction.models.Projet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord - ConstructionXpert Services</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }
        .navbar { background-color: #333; color: white; padding: 15px; display: flex; justify-content: space-between; }
        .navbar a { color: white; text-decoration: none; font-size: 20px; }
        .sidebar { width: 250px; background-color: #444; padding: 15px; height: 100vh; color: white; }
        .sidebar a { display: block; color: white; text-decoration: none; padding: 10px; margin: 5px 0; background-color: #555; text-align: center; }
        .sidebar a:hover { background-color: #777; }
        .main-content { flex: 1; padding: 20px; background-color: white; border-radius: 5px; }
        .stats { display: flex; justify-content: space-between; }
        .stat-box { width: 30%; padding: 20px; background-color: #008CBA; color: white; text-align: center; border-radius: 5px; margin: 5px; }
        .stat-box.success { background-color: #4CAF50; }
        .stat-box.warning { background-color: #f0ad4e; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background-color: white; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #333; color: white; }
        .btn { padding: 8px 12px; background-color: #008CBA; color: white; border: none; cursor: pointer; border-radius: 3px; }
        .btn:hover { background-color: #005f73; }
        .logout-btn { background-color: red; }
        .logout-btn:hover { background-color: darkred; }
    </style>
</head>
<body>

<nav class="navbar">
    <a href="#">ConstructionXpert Services</a>
    <form action="UserServlet" method="get">
        <input type="hidden" name="action" value="logout">
        <button type="submit" class="btn logout-btn">Déconnexion</button>
    </form>
</nav>

<div class="container d-flex">
    <div class="sidebar">
        <a href="#">🏠 Tableau de Bord</a>
        <a href="projects/list">📁 Projets</a>
        <a href="tache/list">✅ Tâches</a>
        <a href="resources/list">🛠️ Ressources</a>
        <a href="fournisseur/list">🚚 Fournisseurs</a>
    </div>

    <div class="main-content">
        <h2>Bienvenue sur le Tableau de Bord</h2>

        <div class="stats">
            <div class="stat-box">📁 <br> 10 Projets en cours</div>
            <div class="stat-box success">✅ <br> 25 Tâches actives</div>
            <div class="stat-box warning">🛠️ <br> 50 Ressources disponibles</div>
        </div>

        <%-- Affichage des erreurs/succès --%>
        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-danger">${sessionScope.error}</div>
            <c:remove var="error" scope="session"/>
        </c:if>
        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-success">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>

        <h3>📋 Derniers Projets</h3>
        <table>
            <thead>
            <tr>
                <th>Nom</th>
                <th>Date de Début</th>
                <th>Budget</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty derniersProjets}">
                    <c:forEach var="projet" items="${derniersProjets}">
                        <tr>
                            <td>${projet.nom}</td>
                            <td><fmt:formatDate value="${projet.dateDebut}" pattern="dd/MM/yyyy"/></td>
                            <td>${projet.budget} €</td>
                            <td>
                                <a href="projet/details?id=${projet.id}" class="btn">Détails</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4" style="text-align: center;">Aucun projet récent</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>

    </div>
</div>

</body>
</html>
