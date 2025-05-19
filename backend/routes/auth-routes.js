const express = require("express");
const router = express.Router();
const validate = require("../middleware/validator");
const userSchema = require("../validators/user-schema");
const { createUser } = require("../controllers/auth-controller");

// router.get("/", productController.getAllProducts);
// router.get("/:id", productController.getProductById);
router.post("/signup", validate(userSchema), createUser);
// router.put("/:id", productController.updateProduct);
// router.delete("/:id", productController.deleteProduct);

module.exports = router;
