$(document).on('page:change', function() {
  $("#roles").select2({
    placeholder: "pesquisa...",
    minimumInputLength: 2,
    multiple: true,
    width: "300px",
    //data:[],
    initSelection : function (element, callback) {
      var id=$(element).val();
      alert(id);
      if (id !== 0) {
        $.ajax("/user_roles_search.json").done(function(data) {
          //var data = [{id:1,text:'bug'},{id:2,text:'duplicate'}];
          //var results = [];
          //$.each(data, function( key, val ) {
          //  results.push({text: val});
          //  console.log(val);
          //});
          //console.log(results);
          //callback(results);
          console.log(data);
          callback(data);
        })
      }
    },
    ajax: {
      url: "/role_name_search.json",
      dataType: "json",
      data: function (term) {
        return {
          term: term
        };
      },
      results: function (data) {
        return {
          results: $.map(data, function (item) {
            return {
              text: item.name,
              id: item.id
            }
          })
        };
      }
    }
  });
});
