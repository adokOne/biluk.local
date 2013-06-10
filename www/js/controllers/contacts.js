$.Controller("ContactsController","FormController",{

  init:function(){
    this.super_call("init")
  },

  success_call_back:function(resp){
    alert(resp.msg)
    window.location.href = "/"
  },

  failure_call_back:function(resp){
    alert(resp.msg)
    this.element.find("input, textarea").val("");
  },
  
});
