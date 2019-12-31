const { runQuery } = require('../utils/mysql.js');
const { VERSION } = require('../utils/mysql.js').TABLE_NAME;

module.exports = {
  getVersion: () => {
    const query = `
      SELECT * FROM ${VERSION}
    `;
    return runQuery(query, []);
  }
};
