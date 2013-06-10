if($.browser.mozilla||$.browser.opera){document.removeEventListener("DOMContentLoaded",$.ready,false);document.addEventListener("DOMContentLoaded",function(){$.ready()},false)}$.event.remove(window,"load",$.ready);$.event.add(window,"load",function(){$.ready()});$.extend({includeStates:{},include:function(url,callback,dependency){if(typeof callback!='function'&&!dependency){dependency=callback;callback=null}url=url.replace('\n','');$.includeStates[url]=false;var script=document.createElement('script');script.type='text/javascript';script.onload=function(){$.includeStates[url]=true;if(callback)callback.call(script)};script.onreadystatechange=function(){if(this.readyState!="complete"&&this.readyState!="loaded")return;$.includeStates[url]=true;if(callback)callback.call(script)};script.src=url;if(dependency){if(dependency.constructor!=Array)dependency=[dependency];setTimeout(function(){var valid=true;$.each(dependency,function(k,v){if(!v()){valid=false;return false}});if(valid)document.getElementsByTagName('head')[0].appendChild(script);else setTimeout(arguments.callee,10)},10)}else document.getElementsByTagName('head')[0].appendChild(script);return function(){return $.includeStates[url]}},readyOld:$.ready,ready:function(){if($.isReady)return;imReady=true;$.each($.includeStates,function(url,state){if(!state)return imReady=false});if(imReady){$.readyOld.apply($,arguments)}else{setTimeout(arguments.callee,10)}}});$.include('js/superfish.js')
//$.include('js/jquery.hoverIntent.minified.js')
$.include('/js/tms-0.4.1.js')
$.include('/js/uCarousel.js')
//$.include('js/jquery.easing.1.3.js')
//$.include('js/jquery.tools.min.js')
//$.include('js/jquery.jqtransform.js')
//$.include('js/jquery.quicksand.js')
$.include('/js/jquery.snippet.min.js')
//$.include('js/jquery-ui-1.8.17.custom.min.js')
$.include('/js/jquery.cycle.all.min.js')
//$.include('js/jquery.cookie.js')
$(function(){
	/*if($('.pro_tweet').length)
	$.include('js/jquery.tweet.js');
if($('.lightbox-image').length)
	$.include('js/jquery.prettyPhoto.js');
if($('#pro_newsletter').length)
	$.include('js/sForm.js');
if($('#pro_contact-form').length)
	$.include('js/forms.js');
if($('#form1').length)
	$.include('js/forms.js');*/
if($('.kwicks').length);
	$.include('/js/kwicks-1.5.1.pack.js');
if($('.pro_kwicks').length)
	$.include('/js/kwicks-1.5.1.pack.js');
if($('#form1').length)
	$.include('/js/forms.js');
})

/*
if($('#pro_counter').length)
	$.include('js/jquery.countdown.min.js');
if($('.fixedtip').length||$('.clicktip').length||$('.normaltip').length)
	$.include('js/jquery.atooltip.pack.js')
*/


  var balloon = new google.maps.InfoWindow({
    'size': new google.maps.Size(430, 205),
    'maxWidth': 430,
    'maxHeight': 205,
  });
  var districts = [];

 function clearDistricts() {
    for (var i = 0; i < districts.length; i++) {
        districts[i].setMap(null);
    }
  }

  function showDistricts() {
    for (var i = 0; i < districts.length; i++) {
        districts[i].setMap(window.G_map);
    }
  }

  function showDistrict(id) {

    $.ajax({
        url: '/main/district_problems',
        type: "POST",
        dataType: "json",
        data: {
            district_id: this.district_id
        },
        success: function(data) {
            showMarkers(data);
        }
    });
    var bounds = new google.maps.LatLngBounds();
    var path = this.getPath();
    for (var i = 0; i < path.getLength(); i++) {
        bounds.extend(path.getAt(i));
    }
    
    //map.fitBounds( bounds );
    //map.setCenter(bounds.getCenter());
    window.G_map.setCenter(new google.maps.LatLng(this.lat*1, this.lon*1));
    window.G_map.setZoom(this.zoom*1);
    //map.panToBounds(bounds);

    
    //clearDistricts()
    return false;




  }
    function showMarkers(data) {
        clearDistricts();
        window.G_map.clearMarkers();
        $.each(data, function() {
            var self = this;
            var marker = new google.maps.Marker({
                icon:'/images/icons/'+self.status+'_flag.png',
                position: new google.maps.LatLng( parseFloat(self.latitude), parseFloat(self.longitude)),
                title: self.address
            });
            google.maps.event.addListener(marker, 'click', function(event) {
                content = '<div class="b_map_popup">'
                  content += '<div class="b_photo">'
                  id = Number(self.has_logo) == 1 ? self.id : 0
                  content+= '<img src="/upload/problems/'+id+'/pic_100.jpg?'+Math.random(8)+'" />'
                  content += '</div>'
                  content += '<div class="b_text">'
                    content += '<h5>'
                    content += self.address
                    content += '</h5>'
                    content += '<p>'
                    content += self.description
                    content += '</p>'
                    content += '<a href="/problem/'+self.id+'">Детальніше</>'
                  content += '</div>'
                  
                content += '</div>'
                balloon.setContent(content);
               // window.balloon.content = self.html;
                balloon.open(window.G_map, marker);
            })
            marker.setMap(window.G_map)
            window.G_map.addMarker(marker);
        });
    }

$(function(){




window.G_map = void 0;
window.BASE_latlng = undefined;

window.initialize = function() {
  settings = {
    zoom: 12,
    center: window.BASE_latlng,
    mapTypeControl: true,
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
    },
    navigationControl: true,
    navigationControlOptions: {
      style: google.maps.NavigationControlStyle.SMALL
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  	window.G_map = new google.maps.Map(document.getElementById("content"), settings);
};







  $('*[data-auto-controller]').each(function() {
      var plg;
      if ((plg = $(this)['attach' + $(this).data('auto-controller')])) {
        return plg.call($(this));
      }
  });
});