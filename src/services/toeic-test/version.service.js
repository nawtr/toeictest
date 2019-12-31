'use strict';

const versionModel = require('../../models/version.model.js');

module.exports = {
  name: 'version',
  settings: {},
  dependencies: {},
  actions: {
    async handleGetVersion () {
      const version = await this.getVersion();
      return {
        success: true,
        version
      };
    }
  },
  methods: {
    async getVersion () {
      const results = versionModel.getVersion();
      console.log(results);
      if (!results.length) {
        return 'NO RECORDS';
      }
      return results[0];
    }
  },
  events: {},
  created () {},
  started () {},
  stopped () {}
};
