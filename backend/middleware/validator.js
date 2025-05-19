const validate = (schema) => async (req, res, next) => {
  // const { error } = schema.validate(req.body);
  // if (error) {
  //   return res.status(400).json({ error: error.details[0].message });
  // }

  try {
    await schema.validateAsync(req.body);
  } catch (err) {
    return res.status(400).json({ error: err.details[0].message });
  }
  next();
};

module.exports = validate;
