const dotenv = require("dotenv");
const fs = require("fs");
const axios = require("axios");
const Game = require("./game");

dotenv.config({ path: "./config.env" });

const headers = {
  "x-rapidapi-host": process.env.HEADER_HOST,
  "x-rapidapi-key": process.env.HEADER_KEY,
};

const url = process.env.METACRITIC_URL;

exports.readFile = async (path) => {
  let array = await fs.readFileSync(path);
  return array.toString().split("\n");
};

exports.getData = (game, platform) => {
  return axios
    .get(`${url}${game}`, {
      headers: headers,
      params: {
        platform: platform,
      },
    })
    .then((res) => res.data);
};

exports.writeDB = async (game) => {
  try {
    Game.create({
      title: game.title,
      releaseDate: game.releaseDate,
      description: game.description,
      genre: game.genre,
      image: game.image,
      score: game.score,
      developer: game.developer,
      publisher: game.publisher,
      rating: game.rating,
      alsoAvailable: game.alsoAvailableOn,
    });
  } catch (err) {
    console.log(err);
  }
};
