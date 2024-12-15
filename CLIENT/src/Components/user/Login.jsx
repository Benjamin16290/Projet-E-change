import closeMenu from "../../hook/closeMenu";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import {
  login,
  loginFailed,
  setMsg,
  deleteUser,
} from "../../Store/Slices/user";

const Login = () => {
  closeMenu();
  const navigate = useNavigate();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [alert, setAlert] = useState("");
  const [loginError, setLoginError] = useState("");
  const dispatch = useDispatch();
  const id = useSelector((state) => state.user.id);

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch("http://localhost:9000/api/v1/user/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username, password }),
        credentials: "include",
      });

      if (response.ok) {
        const data = await response.json();
        dispatch(login(data));
        navigate("/");
      } else {
        const errorData = await response.json();
        dispatch(loginFailed({ error: errorData.msg }));
        setLoginError("Les informations saisies sont incorrectes");
        setTimeout(() => {
          setLoginError("");
        }, 4000);
      }
    } catch (error) {
      dispatch(setMsg("Erreur lors de la connexion. Veuillez réessayer."));
    }
  };

  async function onClickDeleteUser() {
    if (!id) {
      setAlert("Vous devez être connecté pour supprimer votre compte.");
      setTimeout(() => {
        setAlert("");
      }, 4000);
      return;
    }

    try {
      const response = await fetch(
        "http://localhost:9000/api/v1/user/delete/" + id,
        {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
          },
          credentials: "include",
        }
      );

      if (response.ok) {
        dispatch(deleteUser("Utilisateur supprimé"));
        navigate("/");
      } else {
        const errorData = await response.json();
        dispatch(setMsg("Erreur lors de la suppression : " + errorData.msg));
      }
    } catch (error) {
      dispatch(setMsg("Erreur lors de la suppression. Veuillez réessayer."));
    }
  }

  return (
    <main>
      <section className="section-form">
        <form id="form-login" onSubmit={handleLogin}>
          <label htmlFor="username">Nom d&apos;utilisateur</label>
          <input
            id="username"
            type="text"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
            required
            aria-label="Nom d'utilisateur"
          />
          <label htmlFor="password">Mot de passe</label>
          <input
            id="password"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
            aria-label="Mot de passe"
          />
          <div className="contain-btn">
            <button type="submit" aria-label="Bouton de Connexion">
              Connexion
            </button>
            <button
              onClick={() => navigate("/register")}
              aria-label="Bouton d'inscription"
            >
              Inscription
            </button>
          </div>
          <button
            className="btn-delete"
            type="button"
            onClick={() => onClickDeleteUser(id)}
            aria-label="Bouton de supression de compte"
          >
            Supprimer mon compte
          </button>
        </form>
        {alert && (
          <p className="error-msg" aria-live="polite">
            {alert}
          </p>
        )}
        {loginError && (
          <p className="error-msg" aria-live="polite">
            {loginError}
          </p>
        )}
      </section>
    </main>
  );
};

export default Login;
