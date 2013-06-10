        cm:new Ext.grid.ColumnModel([
            new Ext.grid.CheckboxSelectionModel(),
        {
	         hidden:true,
	         dataIndex:'id',
        },{
		    header:"Ім'я",
		    dataIndex:'name',
		    width:200,
		    sortable: true,
	        renderer:renderSearch,
		},{
		    header:'Телефон',
		    dataIndex:'phone',
		    width:200,
		    sortable: true,
	        renderer:renderSearch,
		},{
            header:'Email',
            dataIndex:'email',
            width:200,
            sortable: true,
            renderer:renderSearch,
        },{
            header:'Дата звернення',
            dataIndex:'created_at',
            width:200,
            sortable: true,
            renderer:renderSearch,
        },{
            header:'Розглянуто?',
            dataIndex:'status',
            width:80,
            align:'center',
            sortable:true,
           
            renderer:function(val){
                if (val*1 == 0)
                    return '<span style="color:red">Ні</span>';
                else
                    return '<span style="color:green">Так</span>';
            }


        }]),
