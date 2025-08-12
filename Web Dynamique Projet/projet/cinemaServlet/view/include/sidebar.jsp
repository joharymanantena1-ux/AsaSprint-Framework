<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
      <a class="sidebar-brand brand-logo" href="#" style="color: aliceblue; font-family: 'Pacifico',sans-serif;font-weight: 600;">CINEMANAKA</a>
      <a class="sidebar-brand brand-logo-mini" href="index.html"><img src="view/assets/images/logo-mini.svg" alt="logo" /></a>
    </div>
    <ul class="nav">
      <li class="nav-item profile">
        <div class="profile-desc">
          <div class="profile-pic">
            <div class="count-indicator">
              <img class="img-xs rounded-circle " src="view/assets/images/faces/face15.jpg" alt="">
              <span class="count bg-success"></span>
            </div>
            <div class="profile-name">
              <!-- NOM PERSONNAGE SIDEBAR-->
              <h5 class="mb-0 font-weight-normal">Henry Klein</h5>
              <span>Client Fidele</span>
            </div>
          </div>
          <!-- <a href="#" id="profile-dropdown" data-toggle="dropdown"><i class="mdi mdi-dots-vertical"></i></a> -->
           
        </div>
      </li>
      <li class="nav-item nav-category">
        <span class="nav-link">Navigation 0</span>
      </li>
      <li class="nav-item menu-items">
        <a class="nav-link" href="#">
            <span class="menu-icon">
                <i class="mdi mdi-speedometer"></i>
            </span>
            <span class="menu-title">Home</span>
        </a>
    </li>
    
    
    
      <li class="nav-item menu-items">
        <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
          <span class="menu-icon">
            <i class="mdi mdi-laptop"></i>
          </span>
          <span class="menu-title">Gerer les CRUD</span>
          <i class="menu-arrow"></i>
        </a>
        <div class="collapse" id="ui-basic">
          <ul class="nav flex-column sub-menu">

            <li class="nav-item"> <a class="nav-link" href="clients">Client</a></li>
            <li class="nav-item"> <a class="nav-link" href="films">Film</a></li>
            <li class="nav-item"> <a class="nav-link" href="lesreservation">Reservation</a></li>
            <li class="nav-item"> <a class="nav-link" href="seances">Seance</a></li>

          </ul>
        </div>
      </li>


      <li class="nav-item menu-items">
        <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
          <span class="menu-icon">
            <i class="mdi mdi-security"></i>
          </span>
          <span class="menu-title">Formulaire</span>
          <i class="menu-arrow"></i>
        </a>

        <div class="collapse" id="auth">
          <ul class="nav flex-column sub-menu">
            <li class="nav-item"> <a class="nav-link" href="formulaireClient?action=create">+ Client</a></li>
            <li class="nav-item"> <a class="nav-link" href="formulaireFilm?action=create">+ Film</a></li>
            <li class="nav-item"> <a class="nav-link" href="formulaireRes?action=create">+ Reservation</a></li>
            <li class="nav-item"> <a class="nav-link" href="formulaireSeance?action=create">+ Seance</a></li>
          </ul>
        </div>
      </li>


      <li class="nav-item menu-items">
        <a class="nav-link" href="view/recherche.jsp">
          <span class="menu-icon">
            <i class="mdi mdi-playlist-play"></i>
          </span>
          <span class="menu-title">Recherche Multicriteria</span>
        </a>
      </li>

    </ul>
  </nav>
  <!-- partial -->
  <div class="container-fluid page-body-wrapper">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar p-0 fixed-top d-flex flex-row">
      <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="view/assets/images/logo-mini.svg" alt="logo" /></a>
      </div>
      <div class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="mdi mdi-menu"></span>
        </button>

        <ul class="navbar-nav w-75">
          <li class="nav-item w-75">
            <!-- <form class="nav-link mt-2 mt-md-0 d-none d-lg-flex search">
              <input type="text" class="form-control" placeholder="Search products">
            </form> -->
          </li>
        </ul>
        
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown d-none d-lg-block">
            <a class="nav-link btn btn-success create-new-button" id="createbuttonDropdown" data-toggle="dropdown" aria-expanded="false" href="#">+ Login</a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="createbuttonDropdown">
              
          </li> 
          <li class="nav-item nav-settings d-none d-lg-block">
            <a class="nav-link" href="#">
              <i class="mdi mdi-view-grid"></i>
            </a>
          </li>
          <li class="nav-item dropdown border-left">
            <a class="nav-link count-indicator dropdown-toggle" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
              <i class="mdi mdi-email"></i>
              <span class="count bg-success"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
              
          </li>

          <li class="nav-item dropdown border-left">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="mdi mdi-bell"></i>
              <span class="count bg-danger"></span>
            </a>
            
          </li>


          <li class="nav-item dropdown">
            <a class="nav-link" id="profileDropdown" href="#" data-toggle="dropdown">
              <!-- NOM CLIENT EN HAUT DE LA PAGE -->
              <div class="navbar-profile">
                <img class="img-xs rounded-circle" src="view/assets/images/faces/face15.jpg" alt="">
                <p class="mb-0 d-none d-sm-block navbar-profile-name">Henry Klein</p>
                <i class="mdi mdi-menu-down d-none d-sm-block"></i>
              </div>
            </a>


            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="profileDropdown">
              <h6 class="p-3 mb-0">Profile</h6>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-dark rounded-circle">
                    <i class="mdi mdi-settings text-success"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <p class="preview-subject mb-1">Settings</p>
                </div>
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                  <div class="preview-icon bg-dark rounded-circle">
                    <i class="mdi mdi-logout text-danger"></i>
                  </div>
                </div>
                <div class="preview-item-content">
                  <p class="preview-subject mb-1">Log out</p>
                </div>
              </a>
              <div class="dropdown-divider"></div>
              <p class="p-3 mb-0 text-center">Advanced settings</p>
            </div>


          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-format-line-spacing"></span>
        </button>
      </div>
    </nav>