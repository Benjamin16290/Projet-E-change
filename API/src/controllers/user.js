import User from "../model/User.js";
import bcrypt from "bcrypt";

const SALT = 10;

const getAll = async (req, res) => {
	try {
		const [user] = await User.findAll();
		res.json(user);
	} catch (error) {
		res.status(500).json({ msg: "Erreur interne du serveur" });
	}
};

const create = async (req, res) => {
	try {
		const { username, password, email } = req.body;
		const [[user]] = await User.findOneByUsername(username);

		if (!user) {
			const hash = await bcrypt.hash(password, SALT);
			const [response] = await User.create({ username, hash, email });

			if (response.affectedRows === 1) {
				res.status(201).json({ msg: "Utilisateur créé" });
			} else {
				res.status(500).json({ msg: "Utilisateur non créé" });
			}
		}
		if (user) {
			res.status(400).json({ msg: "L'utilisateur existe déjà" });
		}
	} catch (error) {
		res.status(500).json({ msg: "Erreur interne du serveur" });
	}
};

const login = async (req, res) => {
	try {
		const { username, password } = req.body;
		const [[user]] = await User.findOneByUsername(username);

		if (!user) {
			return res.status(400).json({ msg: "Utilisateur non trouvé" });
		}

		const match = await bcrypt.compare(password, user.password);
		if (!match) {
			return res.status(400).json({ msg: "Identifiants invalides" });
		}

		const [[userByID]] = await User.findUserInfoById(user.id);

		req.session.user = { id: user.id, ...userByID };

		return res.status(200).json({
			msg: "Utilisateur connecté",
			isLogged: true,
			user: {
				id: user.id,
				...userByID,
			},
		});
	} catch (err) {
		return res.status(500).json({ msg: "Erreur interne du serveur" });
	}
};

const remove = async (req, res) => {
	try {
		const [response] = await User.remove(req.params.id);
		if (!response.affectedRows) {
			res.status(404).json({ msg: "Utilisateur non trouvé" });
			return;
		}
		res.json({ msg: "Utilisateur supprimé", id: req.params.id });
	} catch (err) {
		res.status(500).json({ msg: "Erreur interne du serveur" });
	}
};



const updateUser = async (req, res) => {
	try {
		const { id } = req.params;
		const { username, email } = req.body;

		if (!id || (!username && !email)) {
			return res.status(400).json({ msg: "ID utilisateur invalide ou aucun champ à mettre à jour" });
		}

		const [response] = await User.updateUser(username, id, email);
		
		if (response.affectedRows === 1) {
			return res.json({ msg: "Utilisateur mis à jour avec succès", username, email });
		} else {
			return res.status(500).json({ msg: "Utilisateur non mis à jour" });
		}
	} catch (error) {
		return res.status(500).json({ msg: "Erreur lors de la mise à jour de l'utilisateur" });
	}
};

const logout = async (req, res) => {
	try {
		req.session.destroy();
		res.clearCookie("connect.sid");
		res.json({ msg: "Utilisateur déconnecté", isLogged: false });
	} catch (err) {
		res.status(500).json({ msg: "Erreur interne du serveur" });
	}
};

const check_auth = async (req, res) => {
	const { user } = req.session;
	res.json({ isLogged: true, user });
};

export { getAll, create, login, logout, updateUser, remove, check_auth };

