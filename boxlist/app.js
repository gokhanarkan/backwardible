const path = require("path");
const { readFile, getData, writeDB } = require("./controller");

const gamesPath = path.resolve("./gamelist.txt");
const platforms = ["xbox-360", "xbox"];

const db = require("./database");
const Game = require("./game");


async function main() {
  await readFile(gamesPath)
    .then(async (games) => {
      games.forEach(async (game) => {
        try {
          let gameObj = await getData(game, platforms[0]);
          if (gameObj.data.result === "No result") {
            let xboxGame = await getData(game, platforms[1]);
            if (xboxGame.data.result === "No result") {
              console.log(false);
            } else {
              writeDB(xboxGame.data.result);
            }
          } else {
            writeDB(gameObj.data.result);
          }
        } catch (err) {
          console.log(err);
        }
      });
    })
    .catch((err) => console.log(err));
}

async function resetDB() {
  await Game.drop();
  await Game.sync();
}

main();
// resetDB();
