var mongoose = require("mongoose");
var bcrypt = require("bcryptjs");

Schema = mongoose.Schema;

var UserSchema = new Schema({
  username: {
    type: String,
    trim: true,
    required: true,
    unique: true,
  },
  email: {
    trim: true,
    required: true,
    unique: true,
    lowerCase: true,
    type: String,
  },
  password: {
    type: String,
    required: true,
  },
});

UserSchema.methods.comparePassword = function (userPassword) {
  return bcrypt.compareSync(userPassword, this.password);
};

const User = mongoose.model("user", UserSchema);

module.exports = User;
