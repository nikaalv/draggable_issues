function onSuccess(event, xhr) {
  console.log(arguments);
}

function sendRemoteData(data) {
  $.ajax({
      url: '/order_indexing',
      type: 'PUT',
      success: onSuccess,
      data: JSON.stringify(data),
      contentType: 'application/json'
    });
}

$("#ui_dynamic_shortable").customSortable({
  containerSelector: 'table',
  itemPath: "> tbody",
  itemSelector: "tr",
  handle: ".draggable-item",
  placeholder: '<tr> <td>&nbsp;</td></tr>',
  onDrop: function ($item, container, _super) {
    table = container.el.context;
    order = $.map($(table).find("tbody > tr").toArray(), function(el) { return el.id });
    sendRemoteData({ordering: order});
    _super($item, container);
  },
});

