        cm:new Ext.grid.ColumnModel([
            new Ext.grid.CheckboxSelectionModel(),
        {
            header:'Місто',
            dataIndex:'city_id',
            width:80,
            sortable:true,
            renderer:function(val){

                if (!val)
                    return '';
                val = citiesStore.getById(val);

                if (!val)
                    return '';

                return val.json.text;
            },
            editor: new Ext.form.ComboBox({
                store: citiesStore,
                displayField:'text',
                valueField:'id',
                typeAhead: true,
                mode: 'local',
                forceSelection: true,
                triggerAction: 'all',
                selectOnFocus:true
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
                return val.json.text;
            },
            editor: new Ext.form.ComboBox({
                store: districtsStore,
                displayField:'text',
                valueField:'id',
                typeAhead: true,
                mode: 'local',
                forceSelection: true,
                triggerAction: 'all',
                selectOnFocus:true
            })
        }, {
            header:'Назва',
            dataIndex:'name_ua',
            width:160,
            sortable:true,
            renderer:renderSearch,
            editor:new Ext.form.TextField()
        }, {
            header:'Широта',
            dataIndex:'latitude',
            width:80,
            sortable:true,
            editor:new Ext.form.NumberField({
                allowNegative: false,
                decimalPrecision: 6
            }),
            hidden:true
        }, {
            header:'Долгота',
            dataIndex:'longitude',
            width:80,
            sortable:true,
            editor:new Ext.form.NumberField({
                allowNegative: false,
                decimalPrecision: 6
            }),
            hidden:true
        }]),
        plugins:[new Ext.ux.grid.Search({
                disableIndexes:['latitude','longitude','city_id'],
                position:'top',
                width: 180,
                autoFocus:true,
                listeners:{
                    'search':function(){
                        itemsStore.reload();
                    }                
                }
        })],
