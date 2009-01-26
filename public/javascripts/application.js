$( function() {
  $('#tweets').scrollbox();
  setInterval( fetchTweets, 30000 );
  setInterval( moveLastTweet, 4000 );

  function fetchTweets() {
    var since = $('#queue .tweet, #tweets .tweet').filter(':first').attr('id');
    $.get('/updated', {since: since}, function(data) {
      $('#queue ul').prepend(data);
    });
  }

  function moveLastTweet() {
    var tweet = $('#queue .tweet:last');
    $('#tweets').scrollbox.push(tweet);
  }
});
