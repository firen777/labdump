
TestModel = Backbone.Model.extend({
  initialize: function() {
      console.log('backbone model works')
  },
});


// let testModel1 = new TestModel();


$(document).ready(()=>{
    console.log('jquery works');

    let testModel1 = new TestModel();
});

