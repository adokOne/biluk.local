$.Controller("MapController",{

  init:function(){
    window.BASE_latlng = new google.maps.LatLng(Number(this.element.data("lat")), Number(this.element.data("lng"))); 
    
  },

});
