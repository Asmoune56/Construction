<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Liste des Ressources</title>
  <style>
    :root {
      --primary-color: #2c3e50;
      --secondary-color: #3498db;
      --accent-color: #e74c3c;
      --light-color: #ecf0f1;
      --dark-color: #2c3e50;
      --success-color: #27ae60;
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
    }

    h1 {
      color: var(--primary-color);
      font-size: 28px;
      font-weight: 700;
    }

    .add-btn {
      text-decoration: none;
      background-color: var(--success-color);
      color: white;
      padding: 12px 20px;
      border-radius: 5px;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 8px;
      transition: all 0.3s;
    }

    .add-btn:hover {
      background-color: #219653;
      transform: translateY(-2px);
      box-shadow: var(--shadow);
    }

    .add-btn:before {
      content: "+";
      font-size: 20px;
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
    }

    .data-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
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

    .data-table tr:hover {
      background-color: #f8f9fa;
    }

    .btn {
      padding: 8px 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: 600;
      font-size: 14px;
      transition: all 0.3s;
      display: inline-flex;
      align-items: center;
      gap: 5px;
    }

    .btn-primary {
      background-color: var(--secondary-color);
      color: white;
      text-decoration: none;
    }

    .btn-danger {
      background-color: var(--accent-color);
      color: white;
      text-decoration: none;
    }

    .btn-primary:hover {
      background-color: #2980b9;
      transform: translateY(-2px);
      box-shadow: var(--shadow);
    }

    .btn-danger:hover {
      background-color: #c0392b;
      transform: translateY(-2px);
      box-shadow: var(--shadow);
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
        gap: 15px;
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
      <h1>Liste des Ressources</h1>
      <a href="ressource?action=new" class="add-btn">Ajouter une nouvelle ressource</a>
    </div>

    <div class="table-responsive">
      <table class="data-table">
        <thead>
        <tr>
          <th>ID</th>
          <th>Nom</th>
          <th>Type</th>
          <th>Quantité</th>
          <th>Fournisseur</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ressource" items="${ressourceList}">
          <tr>
            <td>${ressource.id_RESS}</td>
            <td>${ressource.nom}</td>
            <td>${ressource.types}</td>
            <td>${ressource.quantite}</td>
            <td>${ressource.fournisseur}</td>
            <td>
              <div class="action-buttons">
                <a href="ressource?action=TrouverRessourceParid&id_RESS=${ressource.id_RESS}" class="btn btn-primary">Modifier</a>
                <a href="ressource?action=supprimer&id_RESS=${ressource.id_RESS}" class="btn btn-danger">Supprimer</a>
              </div>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</main>
</body>
</html>