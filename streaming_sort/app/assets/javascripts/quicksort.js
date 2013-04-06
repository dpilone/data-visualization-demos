$(document).ready(function() {
    console.log('Doing stuff');
    var source = new EventSource('/quicksort_viewer');
    source.addEventListener('visual', function(e) {
      console.log('got message: ' + e.data.toString());
      $("#visualization").append('<li><code>' + e.data.toString() + '</code></li>');
    }, false);
});
