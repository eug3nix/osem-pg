function update_price($this){
    var id = $this.data('id');

    // Calculate price for row
    var value = $this.val();
    var price = $('#price_' + id).text();
    var row_total = accounting.formatMoney(value * price);
    $('#total_row_' + id).text(row_total);

    // Calculate total price
    var total = 0;
    $('.total_row').each(function( index ) {
        var row_val = accounting.unformat($(this).text());
        total += parseFloat(row_val);
    });
    total = accounting.formatMoney(total);
    $('#total_price').text(total);
}

$( document ).ready(function() {
    $('.quantity').each(function() {
        update_price($(this));
    });

    $('.quantity').change(function() {
        update_price($(this));
    });
    $(function () {
      $('[data-toggle="tooltip"]').tooltip()
    });
});
