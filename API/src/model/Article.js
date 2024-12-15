import pool from "../config/db.js";

class Article {
    static async findAll() {
        const SELECT_ALL = `
            SELECT 
                article.id, 
                article.title, 
                article.img, 
                article.alt, 
                article.content, 
                article.publish_date, 
                article.status, 
                article.user_id, 
                article.category_id, 
                category.name AS category_name
            FROM 
                article 
            JOIN 
                category ON article.category_id = category.id;
        `;
        return await pool.execute(SELECT_ALL);
    }

    static async findId(id) {
        const SELECT_ONE = `
            SELECT 
                article.id, 
                article.title, 
                article.img, 
                article.alt, 
                article.content, 
                article.publish_date, 
                article.status, 
                article.user_id, 
                article.category_id, 
                category.name AS category_name
            FROM 
                article 
            JOIN 
                category ON article.category_id = category.id
            WHERE 
                article.id = ?;
        `;
        return await pool.execute(SELECT_ONE, [id]);
    }

    static async findIdCategorie(id) {
        const ARTICLE_CATEGORY = "SELECT * FROM article WHERE category_id = ?";
        return await pool.execute(ARTICLE_CATEGORY, [id]);
    }

    static async create(datas) {
        const INSERT = "INSERT INTO article (title, img, alt, category_id, content, user_id) VALUES (?, ?, ?, ?, ?, ?);";
        return await pool.execute(INSERT, [...Object.values(datas)]);
    }

    static async update(id, title, alt, img, category_id, content, user_id) {
        const UPDATE = "UPDATE article SET title = ?, alt = ?, img = ?, category_id = ?, content = ?, user_id = ? WHERE id = ?;";
        return await pool.execute(UPDATE, [title, alt, img, category_id, content, user_id, id]);
    }

    static async remove(id) {
        const DELETE = "DELETE FROM article WHERE id = ?";
        return await pool.execute(DELETE, [id]);
    }
}

export default Article;


