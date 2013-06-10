        cm:new Ext.grid.ColumnModel([
            new Ext.grid.CheckboxSelectionModel(),
        {
        	header:"ID",
         	dataIndex:'id',
        },
        {
		    header:'назва',
		    dataIndex:'name',
		    width:200,
		    sortable: true,
	        renderer:renderSearch,
	        editor:new Ext.form.TextField({
                allowBlank: false
            })
		},
        /*{
            header:'Широта центру',
            dataIndex:'longitude',
            width:200,
            sortable: true,
            renderer:renderSearch,
            editor:new Ext.form.TextField({
                allowBlank: false
            })
        },
        {
            header:'Довгота центру',
            dataIndex:'latitude',
            width:200,
            sortable: true,
            renderer:renderSearch,
            editor:new Ext.form.TextField({
                allowBlank: false
            })
        }*/
        ]),
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
