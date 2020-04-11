// var layer = new ol.layer.Tile({
//   source: new ol.source.OSM(),
//   noWrap: true,
//   wrapX: false
// });
// var london = ol.proj.transform(
//   [-0.12755, 51.507222],
//   'EPSG:4326',
//   'EPSG:3857'
// );
// var delhi = ol.proj.transform(
//   [77.209, 28.6139],
//   'EPSG:4326',
//   'EPSG:3857'
// );
// var view = new ol.View({
//   center: delhi,
//   zoom: 12
// });
// var map = new ol.Map({
//   renderer: 'canvas',
//   target: 'map',
//   layers: [layer],
//   view: view
// });
// -----------------------------------------------------------------------------
// var map = new ol.Map({
//   target: 'map',
//   layers: [
//     new ol.layer.Tile({
//       source: new ol.source.OSM()
//     })
//   ],
//   view: new ol.View({
//     center: ol.proj.fromLonLat([<%= @place.latitude %>,<%= @place.longitude %>]), // Coordinates of New York
//     zoom: 7 //Initial Zoom Level
//   })
// });
