$(document).ready(function() {
    console.log('Doing stuff');
    var source = new EventSource('/quicksort_viewer');
    source.addEventListener('visual', function(e) {
      console.log('got message: ' + e.data.toString());
      vis = JSON.parse(e.data);
//      $("#visualization").append('<li>' + vis.list.toString() + '</li>');
      $("#sort_graph").empty()
      for (var i in vis.list) {
        $("#sort_graph").append('<li style="height: ' + vis.list[i]*2 + 'px; left: ' + i * 30 + 'px;">' + vis.list[i] + '</li>');
      }
    }, false);
});
