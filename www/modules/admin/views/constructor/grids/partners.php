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
            width:200,
            sortable: true,
            renderer:renderSearch,
            editor:new Ext.form.TextField({
                allowBlank:false,
                vtype:'email'
            })
        },{
            header:'К-ть вирішених питань',
            dataIndex:'p_count',
            width:200,
            sortable: true,
            renderer:renderSearch,
        },{
        header:'Дата реєістрації',
        dataIndex:'created_at',
        width:200,
        sortable: true,
            renderer:Ext.util.Format.dateRenderer('d.m.Y'),
            editor:new Ext.form.DateField({
                format:'d.m.Y'
            })
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
