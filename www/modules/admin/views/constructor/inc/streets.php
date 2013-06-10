var additemStreet =function() {
    	streetWin.show();
    	city_store.load();
    }
/* Begin streetstore*/

 city_store = new Ext.data.Store({
        reader: new Ext.data.JsonReader({
        		fields : ['id','name'],
          		root: 'items'
        						}),
  		proxy: new Ext.data.HttpProxy({
            url: 'admin/streets/get_city'
        }),
        remoteSort: true,
    });

district_store = new Ext.data.Store({
        reader: new Ext.data.JsonReader({
        		fields : ['id','name'],
          		root: 'items'
        						}),
  		proxy: new Ext.data.HttpProxy({
            url: 'admin/streets/get_districts'
        }),
        remoteSort: true
    });
var cities = new Ext.form.ComboBox({store: city_store,
			            fieldLabel: 'Вибиріть місто',
			            name: 'city_id',
			            id:'city_id',
			            hiddenName:'city_id',
			            dataIndex: 'city_id',
			            valueField:'id',
			            displayField:'name',
			            width: 200,
			            typeAhead: true,
			            mode: 'local',
			            forceSelection: true,
			            triggerAction: 'all',
			            selectOnFocus:true,
			            allowBlank: false,
			            listeners: {
									select:
						//
									function(e) {
									var city_id = Ext.getCmp('city_id').getValue();

									var district_id = Ext.getCmp('district_id');
									district_store.removeAll();	

									district_store.reload({params: {city_id:city_id}});

									}
			            }
	})

	 districts = new Ext.form.ComboBox({store: district_store,
		            id:'district_id',
		            fieldLabel: 'Вибиріть район',
		            hiddenName:'district_id',
		            valueField:'id',
		            displayField:'name',
		            width: 200,
		            typeAhead: true,
		            mode: 'local',
		            forceSelection: true,
		            triggerAction: 'all',
		            lastQuery: '',
		            selectOnFocus:true,
		            allowBlank: false,
		            })  

	street = new Ext.form.TextField({
				fieldLabel: 'Навза (Рус)',
	            id:'name',
	            width: 200,
	            allowBlank: false,
       });	 
       	streetua = new Ext.form.TextField({
				fieldLabel: 'Назва (Укр)',
	            id:'name_ua',
	            width: 200,
	            allowBlank: false,
       });
       lat=  new Ext.form.TextField({
				fieldLabel: 'Широта',
	            id:'latitude',
	            width: 200,
	            allowBlank: true,
       });
       lon= new Ext.form.TextField({
				fieldLabel: 'Довгота',
	            id:'longitude',
	            width: 200,
	            allowBlank: true,
       });        

sampleform = new Ext.FormPanel({
        frame:true,
	items:[cities, districts,street,streetua,lat,lon] 

           });

/* end of file worldapp.js */

/* End streetstore*/
    
    var  streetWin = new Ext.Window({
        shim:false,
        modal:true,
        maximizable:true,
        title:'Додавання вулиці',
        width:400,
        height:250,
        autoHeight:false,
        closeAction:'hide',
        layout:'fit',
        items:sampleform,
        bodyStyle:'overflow-y:auto;padding:10px 16px;',
        buttonAlign:'center',
        buttons:[{
            text:'Зберігти',
            iconCls:'save',
            handler:function(){
            sampleform.getForm().submit({ 
             url: 'admin/streets/addStreet',
             success: function(form, action){
              	 Ext.Msg.alert('Повідомлення', 'Вулиця додана');
              	 streetWin.hide();
              	 itemsStore.reload();
              },
              failure: function(form, action){
                 Ext.Msg.alert('Повідомлення', 'Вулиця додана');
              }
            
            })
        }}, {
            text:'Закрити',
            iconCls:'cancel',
            handler:function(){
                streetWin.hide();
            }
        }]
        ,listeners:{
            
            }
        });