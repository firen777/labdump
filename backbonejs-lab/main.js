let TestModel = Backbone.Model.extend({
  urlRoot: 'http://localhost:3003/user',
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


let testModel1 = new TestModel({
  "id": "1",
  "username": "user1",
  "password": "password1",
  "greeting": "helloworld1",
  "gender": "male",
});
let testModel2 = new TestModel({
  "id": "2",
  "username": "user2",
  "password": "password2",
  "greeting": "helloworld2",
  "gender": "female",
});

testModel1.save({
  "id": "1",
  "username": "user1",
  "password": "password1",
  "greeting": "helloworld1",
  "gender": "male",
}, {
  success: function (user) {
    alert(JSON.stringify(user));
}})


// $(document).ready(()=>{
//     console.log('jquery works');

//     let testModel1 = new TestModel({
//       "id": "1",
//       "username": "user1",
//       "password": "password1",
//       "greeting": "helloworld1",
//       "gender": "male",
//     });
//     let testModel2 = new TestModel({
//       "id": "2",
//       "username": "user2",
//       "password": "password2",
//       "greeting": "helloworld2",
//       "gender": "female",
//     });

//     testModel1.save({
//       "id": "1",
//       "username": "user1",
//       "password": "password1",
//       "greeting": "helloworld1",
//       "gender": "male",
//     }, {
//       success: function (user) {
//         alert(JSON.stringify(user));
//     }})
// });

