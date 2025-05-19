// const pool = require("../data/db");

// const getAllUsers = async () => {
//   const { rows } = await pool.query("SELECT * FROM users");
//   return rows;
// };

// const getUserById = async (id) => {
//   const { rows } = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
//   return rows;
// };

const createUser = async (name, email) => {
  // const { rows } = await pool.query(
  //   "INSERT INTO users (name, email) VALUES ($1, $2) RETURNING *",
  //   [name, email]
  // );
  // return rows;
};

// const deleteUser = async (id) => {
//   const { rows } = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]);
//   console.log(rows);
//   return { message: "User deleted successfully" };
// };

module.exports = { createUser };
