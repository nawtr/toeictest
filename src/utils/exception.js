const httpStatus = require('http-status');

/**
 * @extends Error
 */
class ExtendableError extends Error {
  constructor (message, status, isPublic) {
    super(message);
    this.name = this.constructor.name;
    this.message = message;
    this.status = status;
    this.isPublic = isPublic;
    this.isOperational = true; // This is required since bluebird 4 doesn't append it anymore.
    Error.captureStackTrace(this, this.constructor.name);
  }
}

class BadRequestError extends ExtendableError {
  constructor (message, status = httpStatus.BAD_REQUEST, isPublic = true) {
    super(message, status, isPublic);
  }
}

module.exports = {
  BadRequestError
};
