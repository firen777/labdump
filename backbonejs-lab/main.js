let TestModel = Backbone.Model.extend({
  url: 'http://localhost:3003/user',
  default:{
    "id": "0",
    "username": "user0",
    "password": "password0",
    "greeting": "helloworld0",
    "gender": "male",
  },
  initialize: function() {
      console.log('backbone model works')
  },
});


let testModel1;
let testModel2;

$(document).ready(()=>{
    console.log('jquery works');

    testModel1 = new TestModel({
      "id": "1",
      "username": "user1",
      "password": "password1",
      "greeting": "helloworld1",
      "gender": "male",
    });
    testModel2 = new TestModel({
      "id": "2",
      "username": "user2",
      "password": "password2",
      "greeting": "helloworld2",
      "gender": "female",
    });
});

