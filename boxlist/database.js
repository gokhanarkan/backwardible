const dotenv = require('dotenv');
const { Sequelize } = require('sequelize');

dotenv.config({ path: './config.env' });

module.exports = new Sequelize(process.env.DATABASE, process.env.DATABASE_USERNAME, process.env.DATABASE_PASSWORD, {
  host: process.env.DATABASE_HOST,
  port: process.env.DATABASE_PORT,
  dialect: 'postgres',
  protocol: 'postgres',
  dialectOptions: {
    ssl: {
    	require: true,
    	rejectUnauthorized: false
    }
},
});

// db.authenticate().then(() => console.log('database connected')).catch(err => console.log(err));

// Sync all models that are not 
// already in the database
// !
// db.sync()
  
// Force sync all models 
// It will drop the table first  
// and re-create it afterwards 
// !
// sequelize.sync({force:true)