const Joi = require("joi");

const userSchema = Joi.object({
  phoneNumber: Joi.string().min(11).required(),
  password: Joi.string().min(11).max(100).required(),
});

module.exports = userSchema;
