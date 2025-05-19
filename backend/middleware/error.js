module.exports = function (req, _res) {
  if (!req.route) {
    const error = new Error("Resource not found");
    error.status = 404;
    next(error);
  }
};
