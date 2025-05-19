// const userRepository = require("../repositories/userRepository");

module.exports.createUser = async (req, res) => {
  try {
    const { phoneNumber, password } = req.body;
    // const newUser = await userRepository.createUser(name, email);
    // res.status(201).json(newUser);
    res.status(201).json({ message: "User created successfully" });
  } catch (error) {
    res.status(422).json({ error: "Please provide a request body" });
  }
};
