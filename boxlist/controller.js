const dotenv = require('dotenv');
const fs = require("fs");
const axios = require("axios");
const db = require("./database");
const Game = require("./game");

dotenv.config({ path: './config.env' });

const headers = {
  "x-rapidapi-host": process.env.HEADER_HOST,
  "x-rapidapi-key": process.env.HEADER_KEY,
};

const url = process.env.METACRITIC_URL;

exports.readFile = async (path) => {
  let array = await fs.readFileSync(path);
  return array.toString().split("\n");
};

exports.getData = async (game, platform) => {
  try {
    const response = await axios.get(`${url}${game}`, {
      headers: headers,
      params: platform,
    });
    return response;
  } catch (err) {
    return err;
  }
};

exports.writeDB = async (game) => {
  try {
    Game.create({
      title: game.title,
      description: game.description,
      genre: game.genre,
      image: game.image,
      score: game.score,
      developer: game.developer,
      publisher: game.publisher,
      // alsoAvailable: game.alsoAvailableOn
    });
  } catch (err) {
    console.log(err);
  }
};

// Game.create({
// 	title: 'Test',
// 	description: 'Test2',
// 	genre: ['test1', 'test2'],
// 	image: 'test3',
// 	score: 99,
// 	developer: 'HelloWorld Designs',
// 	publisher: ['test3', 'test4'],
// })
