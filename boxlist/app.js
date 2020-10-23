const path = require("path");
const { readFile, getData, writeDB } = require("./controller");

const gamesPath = path.resolve("./gamelist.txt");
const platforms = ["xbox-360", "xbox"];

const Game = require("./game");

async function resetDB() {
  await Game.drop();
  await Game.sync();
}

async function main() {
  const file = await readFile(gamesPath);
  for (let i = 0; i < file.length; i++) {
    console.log(file[i]);
    const game = encodeURI(file[i]);
    let data = await getData(game, platforms[0]);

    // If the content is not available for xbox 360
    if (data.result === "No result") {
      data = await getData(game, platforms[1]);
    }
    // If it is still not available
    if (data.result !== "No result") {
      await writeDB(data.result);
    }
  }
}

async function test() {
  const name = encodeURI("ACE COMBAT™ 6: Fires of Liberation™");
  let data = await getData(name, platforms[0]);
  console.log(data);
}

main();
// test();
// resetDB();
