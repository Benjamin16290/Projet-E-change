import "dotenv/config";
import express from "express";
import path from "path";
import cors from "cors";
import session from "express-session";

import { createRequire } from "module";
const require = createRequire(import.meta.url);
const MySqlStore = require("express-mysql-session")(session);

import Router from "./router/index.routes.js";
import pool from "./config/db.js";

const app = express();
const PORT = process.env.PORT || process.env.LOCAL_PORT;
app.use(
	cors({
		origin: "http://localhost:5173",
		credentials: true,
		methods: ["GET", "POST", "PATCH", "DELETE", "OPTIONS"],
		allowedHeaders: ["Content-Type"],
	})
);
app.use(
	session({
		secret: process.env.EXPRESS_SESSION_SECRET,
		resave: false,
		saveUninitialized: false,
		cookie: {
			maxAge: 1000 * 60 * 60 * 24,
			httpOnly: true,
			secure: false,
		},
		store: new MySqlStore({
			host: process.env.DB_HOST,
			port: process.env.DB_PORT,
			user: process.env.DB_USER,
			password: process.env.DB_PASS,
			database: process.env.DB_NAME,
		}),
	})
);

app.use("/img", express.static(path.join(process.cwd(), "public/img")));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(async (req, res, next) => {
	try {
		const [[result]] = await pool.query(
			"SELECT COUNT(session_id) AS session FROM sessions"
		);
		next();
	} catch (err) {
		// Je n'affiche pas les erreurs en console
	}
});

app.use(["/api/v1", "/"], Router);

app.listen(PORT, () => console.log(`Server run at http://localhost:${PORT}`));
