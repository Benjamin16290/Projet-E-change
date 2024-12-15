import { Router } from "express";
import { getAll, create, login, logout, updateUser, remove, check_auth} from "../controllers/user.js";
import WithAuth from "../middlwares/WithAuth.js";
import Admin from "../middlwares/Admin.js";
import User from "../middlwares/User.js";


const router = Router ();

router.get("/list", Admin, getAll);

router.post("/register", create);
router.post("/login", login);
router.post("/logout", WithAuth, logout);
router.patch("/update/:id", Admin, updateUser);
router.delete ("/delete/:id", remove);

router.get("/check_auth", WithAuth, check_auth);

export default router;
