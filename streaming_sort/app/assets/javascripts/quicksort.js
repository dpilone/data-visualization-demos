$(document).ready(function() {
    console.log('Doing stuff');
    var source = new EventSource('/quicksort_viewer');
    source.addEventListener('visual', function(e) {
      console.log('got message: ' + e.data.toString());
      vis = JSON.parse(e.data);
      $("#visualization").append('<li>' + vis.list.toString() + '</li>');
    }, false);
});
