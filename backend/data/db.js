// const { Pool } = require("pg");
// const env = require("../config/env");

// const pool = new Pool({
//   ssl: env.NODE_ENV === "production" ? { rejectUnauthorized: false } : false,
//   connectionString: env.DATABASE_URL,
//   host: env.PG.host,
//   port: env.PG.port,
//   user: env.PG.user,
//   password: env.PG.password,
//   database: env.PG.database,
//   pool: {
//     max: 10,
//     min: 0,
//     acquire: 30000,
//     idle: 10000,
//   },
// });

// pool.on("connect", (_client) => {
//   console.log("New client connected to the database");
// });

// pool.on("acquire", (_client) => {
//   console.log("Client checked out from the pool");
// });

// pool.on("release", (_client) => {
//   console.log("Client released back to the pool");
// });

// pool.on("error", (err, _client) => {
//   console.error("Unexpected error on idle client", err);
//   //   process.exit(-1);
// });

// module.exports = pool;
