const { DataTypes } = require("sequelize");
const db = require("./database");

const Game = db.define("game", {
  title: {
    type: DataTypes.STRING,
  },
  releaseDate: {
    type: DataTypes.STRING,
  },
  description: {
    type: DataTypes.STRING,
  },
  genre: {
    type: DataTypes.ARRAY(DataTypes.STRING),
  },
  image: {
    type: DataTypes.STRING,
  },
  score: {
    type: DataTypes.INTEGER,
  },
  developer: {
    type: DataTypes.STRING,
  },
  publisher: {
    type: DataTypes.ARRAY(DataTypes.STRING),
  },
  rating: {
    type: DataTypes.STRING,
  },
  alsoAvailable: {
    type: DataTypes.ARRAY(DataTypes.STRING),
    allowNull: true,
  },
});

module.exports = Game;
