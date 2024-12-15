import { useSelector } from "react-redux";
import { useState } from "react";
import { NavLink } from "react-router-dom";
import FormComment from "./FormComment";

function AddComment({
  articleId,
  comments,
  onCommentAdded,
  toggleCommentsVisibility,
  isLoading,
}) {
  const [isFormVisible, setIsFormVisible] = useState(false);
  const [isCommentsVisible, setIsCommentsVisible] = useState(false);

  const user = useSelector((state) => state.user);
  const { isLogged } = user;

  function toggleComments() {
    setIsCommentsVisible(!isCommentsVisible);
    toggleCommentsVisibility(articleId);
  }

  function toggleAddCommentVisibility() {
    setIsFormVisible(!isFormVisible);
  }

  return (
    <aside>
      <button
        id="btn-display-comment"
        onClick={toggleComments}
        aria-label={
          isCommentsVisible
            ? "Masquer les commentaires"
            : "Afficher les commentaires"
        }
      >
        {isCommentsVisible ? "Fermer" : "Commentaires"}
      </button>

      {isCommentsVisible && comments && comments.length > 0 && (
        <div className="comment" aria-label="Liste des commentaires">
          {comments.map((comment) => (
            <p
              key={comment.id}
              className="border-comment"
              aria-label={`Commentaire de ${comment.username}`}
            >
              <strong>{comment.username}</strong>: {comment.content}
            </p>
          ))}
        </div>
      )}

      <button
        id="btn-add-com"
        onClick={toggleAddCommentVisibility}
        aria-label={
          isFormVisible
            ? "Fermer le formulaire de commentaire"
            : "Ouvrir le formulaire de commentaire"
        }
      >
        {isFormVisible ? "Fermer" : "Commenter"}
      </button>

      {isFormVisible && isLogged && (
        <FormComment articleId={articleId} onCommentAdded={onCommentAdded} />
      )}

      {!isLoading && !isLogged && (
        <p aria-label="Message pour les utilisateurs non connectés">
          Vous devez être connecté pour publier un commentaire{" "}
          <NavLink to="/Login" aria-label="Lien vers la page de connexion">
            Connexion
          </NavLink>{" "}
          <span>ou</span>{" "}
          <NavLink to="/Register" aria-label="Lien vers la page d'inscription">
            Créer un compte
          </NavLink>
        </p>
      )}
    </aside>
  );
}

export default AddComment;
