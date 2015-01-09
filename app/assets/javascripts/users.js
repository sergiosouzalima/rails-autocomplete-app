/*$(document).on('page:change', function() {
  $("#e11").select2({
    placeholder: "pesquisa...",
    minimumInputLength: 2,
    multiple: true,
    width: "300px",
    ajax: {
      url: "/user_name_search.json",
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
*/
