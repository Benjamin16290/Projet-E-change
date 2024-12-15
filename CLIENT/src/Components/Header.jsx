import { NavLink } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBars, faXmark, faPowerOff } from "@fortawesome/free-solid-svg-icons";
import { useDispatch, useSelector } from "react-redux";
import { toggleMenu } from "../Store/Slices/menu";
import { logout } from "../Store/Slices/user";
import { useNavigate } from "react-router-dom";

function Header() {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const menu = useSelector((state) => state.menu.isOpen);
  const isLogged = useSelector((state) => state.user.isLogged);

  async function onClickLogout() {
    const confirmLogout = window.confirm(
      "Êtes-vous sûr de vouloir vous déconnecter ?"
    );
    if (confirmLogout) {
      try {
        const response = await fetch(
          "http://localhost:9000/api/v1/user/logout",
          {
            method: "POST",
            credentials: "include",
          }
        );

        if (response.ok) {
          const data = await response.json();
          dispatch(logout(data.isLogged));
          dispatch(toggleMenu());
          navigate("/");
        }
      } catch {}
    }
  }

  return (
    <header>
      <nav>
        <img
          src="/img/logo.webp"
          alt="Logo du site E-change, rond avec un fond vert où il y a écrit : E-change et astuces"
          aria-hidden="true"
        />

        <button
          onClick={() => dispatch(toggleMenu())}
          aria-label={"Bouton ouverture du menu"}
          tabIndex="0"
        >
          <FontAwesomeIcon icon={faBars} />
        </button>

        <div className="nav-menu">
          {menu && (
            <>
              <NavLink
                to="/"
                aria-label="Aller à la page d'accueil"
                tabIndex="0"
              >
                Home
              </NavLink>
              <NavLink
                to="/Category"
                aria-label="Voir les catégories"
                tabIndex="0"
              >
                Catégories
              </NavLink>
              <NavLink to="/Contact" aria-label="Nous contacter" tabIndex="0">
                Nous contacter
              </NavLink>

              {isLogged ? (
                <>
                  <NavLink
                    to="/Dashboard"
                    aria-label="Accéder au tableau de bord"
                    tabIndex="0"
                  >
                    Dashboard
                  </NavLink>
                  <NavLink
                    to="/Login"
                    aria-label="Se connecter ou supprimer un compte"
                    tabIndex="0"
                  >
                    Connexion-Supression
                  </NavLink>
                  <button
                    className="btn-logout"
                    onClick={onClickLogout}
                    aria-label="Se déconnecter"
                    tabIndex="0"
                  >
                    <FontAwesomeIcon icon={faPowerOff} />
                  </button>

                  <button
                    className="btn-close-menu"
                    onClick={() => dispatch(toggleMenu())}
                    aria-label="Bouton fermeture du menu"
                    tabIndex="0"
                  >
                    Fermer
                    <FontAwesomeIcon icon={faXmark} />
                  </button>
                </>
              ) : (
                <>
                  <NavLink
                    to="/Login"
                    aria-label="Se connecter ou supprimer un compte"
                    tabIndex="0"
                  >
                    Connexion-Supression
                  </NavLink>
                  <NavLink
                    to="/Register"
                    aria-label="Créer un compte"
                    tabIndex="0"
                  >
                    Créer un compte
                  </NavLink>

                  <button
                    className="btn-close-menu"
                    onClick={() => dispatch(toggleMenu())}
                    aria-label="Fermer le menu"
                    tabIndex="0"
                  >
                    Fermer
                    <FontAwesomeIcon icon={faXmark} />
                  </button>
                </>
              )}
            </>
          )}
        </div>
      </nav>
    </header>
  );
}

export default Header;
