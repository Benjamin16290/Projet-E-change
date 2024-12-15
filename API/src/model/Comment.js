import pool from "../config/db.js";


class Comment {

    static async findAll() {
        const SELECT_All_COMMENTS = `
        SELECT 
        comment.id,
        comment.content,
        comment.publish_date,
        comment.user_id,
        comment.status,
        user.username
        FROM comment
        JOIN user
        ON comment.user_id = user.id
        WHERE comment.status = 1
        ORDER BY publish_date DESC`;
        return await pool.execute(SELECT_All_COMMENTS);
    }

        static async findAllByArticleId(id) {
            const SELECT_ALL = `
                SELECT 
                    comment.id, 
                    comment.content, 
                    comment.publish_date, 
                    comment.user_id, 
                    comment.article_id, 
                    comment.status, 
                    user.username 
                FROM comment
                JOIN user ON comment.user_id = user.id
                WHERE comment.article_id = ?
                ORDER BY comment.publish_date DESC`;
                
            return await pool.execute(SELECT_ALL, [id]);
        }
        

    static async findById(id) {
         const SELECT_ONE = "SELECT * FROM comment WHERE id = ?";
         return await pool.execute(SELECT_ONE, [id]);
    }

        static async create(datas) {
            const INSERT = "INSERT INTO comment(content,user_id,article_id) VALUES (?,?,?)";
            return await pool.execute(INSERT, [...Object.values(datas)]);
      }

    static async update(content,id) {
          const UPDATE = "UPDATE comment SET content = ? WHERE id = ?";
          return await pool.execute(UPDATE, [content,id]);
    }

    static async remove(id) {
        const DELETE = "DELETE FROM comment WHERE id= ?";
        return await pool.execute(DELETE, [id]);
    }
}

export default Comment;