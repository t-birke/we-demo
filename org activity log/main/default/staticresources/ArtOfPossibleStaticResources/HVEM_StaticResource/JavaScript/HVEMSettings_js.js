function OnTransferBtnClick1(blnFromLeft)
    {
    var LeftListBox = document.getElementById('HVEMPageId:hvemForm:hvemPageBlockId:CategoryGroups1Id');
    var RightListBox = document.getElementById('HVEMPageId:hvemForm:hvemPageBlockId:CategoryGroups2Id');
    var ListItems = new Array();
    FromList = (blnFromLeft ? LeftListBox : RightListBox); 
    ToList = (blnFromLeft ? RightListBox : LeftListBox);
    for(var i=(FromList.options.length - 1);i>=0;i--)
     if(FromList.options[i].selected)
       {
        ListItems[ListItems.length] = new Option(FromList.options[i].text,FromList.options[i].value,true,false);
        FromList.options[i] = null;
       } 
     for(var i=ListItems.length - 1;i>=0;i--)
      ToList.options[ToList.options.length]= ListItems[i];
    }

    function OnTransferBtnClick2(blnFromLeft)
    {
    var LeftListBox = document.getElementById('HVEMPageId:hvemForm:hvemPageBlockId:articleTypesFilter1Id');
    var RightListBox = document.getElementById('HVEMPageId:hvemForm:hvemPageBlockId:articleTypesFilter2Id');
    var ListItems = new Array();
    FromList = (blnFromLeft ? LeftListBox : RightListBox); 
    ToList = (blnFromLeft ? RightListBox : LeftListBox);
    for(var i=(FromList.options.length - 1);i>=0;i--)
     if(FromList.options[i].selected)
       {
        ListItems[ListItems.length] = new Option(FromList.options[i].text,FromList.options[i].value,true,false);
        FromList.options[i] = null;
       } 
     for(var i=ListItems.length - 1;i>=0;i--)
      ToList.options[ToList.options.length]= ListItems[i];
    } 
   
   function OnBtnSaveClick()
   {
    ListBox1 = document.getElementById('HVEMPageId:hvemForm:hvemPageBlockId:CategoryGroups2Id');
    ListBox2 = document.getElementById('HVEMPageId:hvemForm:hvemPageBlockId:articleTypesFilter2Id');
      var strChosenCategoryGroups = "";
      var strChosenArticleTypes = "";
      for(var i=0;i<ListBox1.options.length;i++)
        strChosenCategoryGroups = strChosenCategoryGroups + ListBox1.options[i].value + ",";
      for(var i=0;i<ListBox2.options.length;i++)
        strChosenArticleTypes = strChosenArticleTypes + ListBox2.options[i].value+ "," ;
      setFilters(strChosenCategoryGroups,strChosenArticleTypes );
   }