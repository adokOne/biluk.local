        cm:new Ext.grid.ColumnModel([
            new Ext.grid.CheckboxSelectionModel(),
        {
            header:'Місто',
            dataIndex:'city_id',
            width:60,
            sortable:true,


            renderer:function(val){
                if (!val)
                    return '';
                val = citiesStore.getById(val);
                if (!val)
                    return '';

                return val.data.name;
            },
            editor: new Ext.form.ComboBox({
                store: citiesStore,
                displayField:'name',
                valueField:'id',
                typeAhead: true,
                mode: 'local',
                forceSelection: true,
                allowBlank: false,
                triggerAction: 'all',
                selectOnFocus:true,
            listeners: {
                    select:
                    function(e,a) {

                              districtsStore.removeAll();
                               streetsStore.removeAll();
                              districtsStore.reload({params: {city_id:a.data.id}});
                    }
            }


            })
        }, {
            header:'Район',
            dataIndex:'district_id',
            width:100,
            sortable:true,
            renderer:function(val){
                if (!val)
                    return '';
                val = districtsStore.getById(val);
                if (!val)
                    return '';

                return val.data.name;
            },
            editor: new Ext.form.ComboBox({
                store: districtsStore,
                displayField:'name',
                valueField:'id',
                typeAhead: true,
                allowBlank: false,
                mode: 'local',
                forceSelection: true,
                triggerAction: 'all',
                selectOnFocus:true,
            listeners: {
                    select:
                    function(e,a) {

                              streetsStore.removeAll();
                              streetsStore.reload({params: {district_id:a.data.id}});
                    }
            }



            })
        }, {
            header:'Вулиця',
            dataIndex:'street_id',
            width:160,
            sortable:true,
            renderer:function(val){
                if (!val)
                    return '';
                val = streetsStore.getById(val);
                if (!val)
                    return '';

                return val.data.name;
            },
            editor: new Ext.form.ComboBox({
                store: streetsStore,
                displayField:'name',
                valueField:'id',
                typeAhead: true,
                allowBlank: false,
                mode: 'local',
                forceSelection: true,
                triggerAction: 'all',
                selectOnFocus:true,
                listeners:{
                    'select': function(combo, record){
                        var row = itemsGrid.getSelectionModel().getSelections();row = row[0];
                        var lat = row.get('latitude') * 1;
                        var lon = row.get('longitude') * 1;                    
                        var map = document.getElementById('nadoloni');
                        if ((lat == 0)&&(lon == 0)) {
                            if (map.getAttribute('type') == 'application/x-shockwave-flash') {
                                //map.moveTo(record.json.latitude, record.json.longitude);
                                map.putMarker(record.json.latitude, record.json.longitude, 36, 'test');
                                map.showMarker(0);
                            }
                        }
                    }
                }                
            })
        }, {
            header:'Будинок',
            dataIndex:'building',
            width:60,
            sortable:true,
            align:'center',
            renderer:renderSearch,
            editor:new Ext.form.TextField({
                allowBlank: false,
            })
        }, {
            header:'Користувач',
            dataIndex:'user_id',
            width:60,
            sortable:true,
            align:'center',
            renderer:function(val){
                if (!val)
                    return '';
                val = usersStore.getById(val);
                if (!val)
                    return '';

                return val.data.name;
            },
            editor: new Ext.form.ComboBox({
                store: usersStore,
                displayField:'name',
                valueField:'id',
                typeAhead: true,
                allowBlank: false,
                mode: 'local',
                forceSelection: true,
                triggerAction: 'all',
                selectOnFocus:true
            })
        }, {
            header:'Хто вирішуе',
            dataIndex:'partner_id',
            width:60,
            sortable:true,
            align:'center',
            renderer:function(val){

                if (!val)
                    return '';
                val = partnersStore.getById(val);
                if (!val)
                    return '';

                return val.data.name;
            },
            editor: new Ext.form.ComboBox({
                store: partnersStore,
                displayField:'name',
                valueField:'id',
                typeAhead: true,
                mode: 'local',
                forceSelection: true,
                triggerAction: 'all',
                selectOnFocus:true
            })
        },{
            header:'Фото',
            dataIndex:'has_logo',
            width:80,
            align:'center',
            sortable:true,
            editor: new Ext.form.ComboBox({
                store:new Ext.data.JsonStore({
                    id: 'id',
                    fields: ['id', 'text'],
                    data : [
                        {id: '1', text:'Так'},
                        {id: '0', text:'Ні'}
                    ]
                }),
                displayField:'text',
                valueField:'id',
                typeAhead: true,
                mode: 'local',
                forceSelection: true,
                triggerAction: 'all',
                selectOnFocus:false
            }),


            renderer:function(val){
                if (val*1 == 0)
                    return '<span style="color:red">Ні</span>';
                else
                    return '<span style="color:green">Так</span>';
            }
        },{
            header:'Статус',
            dataIndex:'status',
            width:80,
            align:'center',
            sortable:true,
            editor: new Ext.form.ComboBox({
                store:new Ext.data.JsonStore({
                    id: 'id',
                    fields: ['id', 'text'],
                    data : [
                        {id: '3', text:'Вирішена'},
                        {id: '2', text:'Закрита'},
                        {id: '1', text:'На стадії вирішення'},
                        {id: '0', text:'Створена'}
                    ]
                }),
                displayField:'text',
                valueField:'id',
                typeAhead: true,
                allowBlank: false,
                mode: 'local',
                forceSelection: true,
                triggerAction: 'all',
                selectOnFocus:false
            }),            
            renderer:function(val){
                if (val*1 == 0)
                    return '<span style="color:red">Створена</span>';
                else if(val*1 == 1)
                    return '<span style="color:blue">На стадії вирішення</span>';
                else if(val*1 == 2)
                    return '<span style="color:yellow">Закрита</span>';
                else
                    return '<span style="color:green">Вирішена</span>';

            }
        },{
            header:'Дата створення',
            dataIndex:'created_at',
            sortable:true,
            renderer:renderSearch,
            align:'center',
            type:'text'
            
        },{
            header:'Дата вирішення',
            dataIndex:'resolved_at',
            width:100,
            align:'center',
            sortable:true,
            renderer:renderSearch
        }, {
            dataIndex:'latitude',
            hidden:true
            
        }, {
            dataIndex:'longitude',
            hidden:true
        }]),
        plugins:[new Ext.ux.grid.Search({
                disableIndexes:['active','latitude','longitude'],
                position:'top',
                width: 180,
                autoFocus:true,
                listeners:{
                    'search':function(){
                        itemsStore.reload();
                    }                
                }
        })],
