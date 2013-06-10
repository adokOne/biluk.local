$.Controller("AboutController",{

  init:function(){
    if(this.element.find(".carousel li").length > 4)
      this.element.find('.carousel').uCarousel({show:4,pageStep:1,buttonClass:'car-button'});
    else
      this.element.find(".car-button").remove()
  }
  
});
