        cm:new Ext.grid.ColumnModel([
            new Ext.grid.CheckboxSelectionModel(),
        {
	    header:'Логiн',
	    dataIndex:'username',
	    width:205,
	    sortable: true,
            renderer:renderSearch,
            editor:new Ext.form.TextField({
                allowBlank:false
            })
	},{
	    header:'ПІБ',
	    dataIndex:'name',
	    width:205,
	    sortable: true,
            renderer:renderSearch,
            editor:new Ext.form.TextField({
                allowBlank:false
            })
	},{
            header:'Телефон',
            dataIndex:'phone',
            width:200,
            sortable: true,
            renderer:renderSearch,
            editor:new Ext.form.TextField({
                allowBlank:true
            })
        },{
            header:'E-mail',
            dataIndex:'email',
            width:100,
            sortable: true,
            renderer:renderSearch,
            editor:new Ext.form.TextField({
                allowBlank:false,
                vtype:'email'
            })
        },{
	    header:'Дата реєістрації',
	    dataIndex:'created_at',
	    width:100,
	    sortable: true,
            renderer:Ext.util.Format.dateRenderer('d.m.Y'),
            editor:new Ext.form.DateField({
                format:'d.m.Y'
            })
	},{
            header:'Відображати на сайті?',
            dataIndex:'show_on_main',
            width:100,
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
        }]),
        plugins:[new Ext.ux.grid.Search({
                position:'top',
                width: 180,
                autoFocus:true,
                listeners:{
                    'search':function(){
                        itemsStore.reload();
                    }                
                }
        })],
