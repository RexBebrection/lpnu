const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB({
  region: "eu-central-1",
  apiVersion: "2012-08-10"
});

exports.handler = (event, context, callback) => {
  const params = {
    Key: {
      id: {
        S: event.id
      }
    },
    ExpressionAttributeNames: {
      "#title": "title",
      "#authorId": "authorId",
      "#length": "length",
      "#category": "category",
      "#watchHref": "watchHref"
    },
    ExpressionAttributeValues: {
      ":title": {
        S: event.title
      },
      ":authorId": {
        S: event.authorId
      },
      ":length": {
        S: event.length
      },
      ":category": {
        S: event.category
      },
      ":watchHref": {
        S: event.watchHref
      }
    },
    UpdateExpression: "SET #title = :title, #watchHref = :watchHref, #authorId = :authorId, #length = :length, #category = :category",
    TableName: process.env.TABLE_NAME,
    ReturnValues: "ALL_NEW",
    ConditionExpression: "attribute_exists(id)"
  };
  
  dynamodb.updateItem(params, (err, data) => {
    if (err) {
      console.log(err);
      callback(err);
    } else {
      callback(null, data.Attributes);
    }
  });
};