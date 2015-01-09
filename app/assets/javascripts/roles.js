$(document).on('page:change', function() {
  $("#roles").select2({
    placeholder: "pesquisa...",
    minimumInputLength: 2,
    multiple: true,
    width: "300px",
    //data:[],
    initSelection : function (element, callback) {
      var id=$(element).val();
      if (id !== "") {
        $.ajax("/user_roles_search/" + id).done(function(data) {
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
