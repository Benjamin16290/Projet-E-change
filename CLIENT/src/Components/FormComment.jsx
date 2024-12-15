import { useState } from "react";

function FormComment({ articleId, onCommentAdded }) {
  const [comment, setComment] = useState("");
  const [msg, setMsg] = useState("");

  const onSubmitHandler = async (e) => {
    e.preventDefault();
    if (comment.trim().length === 0) {
      setMsg("Il n'est pas possible d'envoyer un commentaire vide.");
      return;
    }

    try {
      const response = await fetch(
        `http://localhost:9000/api/v1/comment/create/${articleId}`,
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          credentials: "include",
          body: JSON.stringify({ content: comment }),
        }
      );

      if (response.ok) {
        const data = await response.json();
        setComment("");
        setMsg("Votre commentaire a été envoyé avec succès !");
        if (onCommentAdded) onCommentAdded(data.comment);
      } else {
        setMsg("Erreur lors de l'envoi du commentaire.");
      }
    } catch (error) {
      setMsg("Erreur réseau. Veuillez réessayer.");
    }
  };

  return (
    <form
      className="form-comment"
      onSubmit={onSubmitHandler}
      aria-label="Formulaire de commentaire"
    >
      <textarea
        id="comment"
        value={comment}
        onChange={(e) => setComment(e.target.value)}
        placeholder="Écrivez votre commentaire ici..."
        aria-label="Zone de texte pour le commentaire"
      ></textarea>
      {msg && <p aria-live="polite">{msg}</p>}
      <button type="submit" aria-label="Envoyer le commentaire">
        Envoyer
      </button>
    </form>
  );
}

export default FormComment;
