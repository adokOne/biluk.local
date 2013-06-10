        cm:new Ext.grid.ColumnModel([
            new Ext.grid.CheckboxSelectionModel(),
		{
		    header:'Заголовок',
		    dataIndex:'title',
		    width:200,
		    sortable: true,
	        renderer:renderSearch,
		},{
				    header:'Дата створення',
				    dataIndex:'created_at',
				    width:157,
				    maxWidth:157,
				    renderer:renderSearch
           
		},{
			    header:'К-ть переглядів',
			    dataIndex:'views_count',
			    width:200,
			    sortable: true,
		        renderer:renderSearch,
		},on_main,imp]),
        plugins:[new Ext.ux.grid.Search({
                position:'top',
                width: 180,
                autoFocus:true,
                listeners:{
                    'search':function(){
                        itemsStore.reload();
                    }                
                }
        }),on_main,imp],
