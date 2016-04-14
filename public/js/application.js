$(document).ready(function() {
  

  $(window).bind("pageshow", function(event) {
    if(event.originalEvent.persisted) { window.location.reload() }

    // Stock look up
    $('div#testing-field').on('submit', 'form#lookup',symbolLookUp);

    // Create Portfolio
    $('div#Personal-stock-list').on('click', 'a#createPortfolio', displayCreatePortfolioForm);

    // Add Position to a Portfolio
    $('div#Personal-stock-list').on('click', 'a#addPosition', displayAddPositionForm);

    // Choose Portfolio and show
    $('div#Personal-stock-list').on('submit', 'form#pickPortfolio', displayPortfolio);

    // Delete selected position
    $('div#Personal-stock-list').on('click', 'a.removePosition', removePosition);

    // Update selected position
    $('div#Personal-stock-list').on('click', 'a.editPosition', editPosition);

    
  });

  var symbolLookUp = function(event) {
    event.preventDefault();
    $form = $(event.target);
    var route = $form.attr('action');
    var data = $form.serialize();

    var request = $.ajax({
      url: route,
      method: 'get',
      data: data,
      dataType: 'json'
    })

    request.done(function(response){
        // Clear the input box after submit
        $form.trigger("reset");
        $('h3#error').addClass('hidden');
        
      if ( response.status.code === 200 ) {
        $('span#companyName').html(response.results[0].name);
        $('span#lastPrice').html(response.results[0].lastPrice);
        $('span#open').html(response.results[0].open);
        $('span#high').html(response.results[0].high);
        $('span#low').html(response.results[0].low);
      } else {
        $('h3#error').html("Symbol not found!").css('color','red').removeClass('hidden');
      }
    })
    request.fail(function(response){
      console.log("AJAX FAILED");
    })
  }


  var displayCreatePortfolioForm = function(event) {
    event.preventDefault();
    var $createLink = $(this);
    var route = $createLink.attr('href');

    var request = $.ajax({ url: route, method: 'get' })

    request.done(function(response){
      console.log(response);
      $createLink.hide();
      var $form = $(response).removeClass('hidden');
      $createLink.after($form);
    })
    request.fail(function(){ console.log("AJAX FAILED!")})

  }



  var displayAddPositionForm = function(event) {
    event.preventDefault();
    var $addLink = $(this);
    var route = $addLink.attr('href');

    var request = $.ajax({ url: route, method: 'get' })

    request.done(function(response){
      console.log(response);
      $addLink.hide();
      var $form = $(response).removeClass('hidden');
      $addLink.after($form);
    })
    request.fail(function(){ console.log("AJAX FAILED!")})

  }

  var displayPortfolio = function(event) {
    event.preventDefault();
    var $form = $(this);
    var route = $form.attr('action');
    // get select tag value and pass it into the erb by AJAX
    var data = $form.serialize();
    console.log(data);

    var request = $.ajax({ url: route, method: 'get', data: data })

    request.done(function(response){
      console.log(response);
      if ($form.parent().find('table#showPortfolio')) {
        $('table#showPortfolio').remove();
      }
      $form.parent().append(response);
    })
    request.fail(function(){ console.log("AJAX FAILED!")})

  }

    var removePosition = function(event) {
    event.preventDefault();
    var $deleteLink = $(this);
    var route = $deleteLink.attr('href');
    console.log(route);

    var request = $.ajax({ url: route, method: 'delete' })

    request.done(function(response){
      console.log(response)
      $deleteLink.parent().parent().remove()
    })
    request.fail(function(){ console.log("AJAX FAILED!")})

  }

  var editPosition = function(event) {
    event.preventDefault();
    var $editLink = $(this);
    var route = $editLink.attr('href');
    console.log(route);

    var request = $.ajax({ url: route, method: 'put' })

    request.done(function(response){
      console.log(response)
    })
    request.fail(function(){ console.log("AJAX FAILED!")})

  }

});



