
 /**
  检验空项
  Names为输入框对应的输入项名称+"|"的列表，IDs为输入框ID+"|"的列表
  如:Names="用户名|密码",IDs="tbUserName|tbPwd"
  而且函数的检查顺序也与您的输入框ID排列顺序一致
  **/
  function CheckNull(Names,IDs)
  {
    if(Names.replace(/\s+/g,"").length>0)
    {
      var NameList=Names.split('|');
      var IDList=IDs.split('|');
      var NullList="";
      for(var i=0;i<IDList.length;i++)
	  {
          var obj=document.getElementById(IDList[i]);
		  if((obj.type=="textarea"&&obj.innerText.replace(/\s+/g,"")=="")
                ||(obj.type=="text"&&obj.value.replace(/\s+/g,"")==""))
          {
            alert(NameList[i]);
            document.getElementById(IDList[i]).focus();
            return false;
          }
      }
    }
    return true;
  }
  
  
/**
批量验证选择控件是否被选择了
**/
function IsSelected(Names,IDs)
{
	if(Names.replace(/\s+/g,"").length>0)
	{
		var NameList=Names.split('|');
		var IDList=IDs.split('|');
		for(var i=0;i<IDList.length;i++)
		{
			if(document.getElementById(IDList[i]).selectedIndex==0)
			{
				alert(NameList[i]);
				return false;
			}
		}
	}
	return true;
}

/**
  批量清空输入控件，IDs="tbUserName|tbPwd|..."
  **/
  function ClearControls(IDs)
  {
  if(IDs.replace(/\s+/g,"").length>0)
  {
  var IDList=IDs.split('|');
  for(var i=0;i<IDList.length;i++)
		{
			document.getElementById(IDList[i]).value="";
		}
	}
}

/**
  批量使按钮清空
  **/
  function AfterSubmit(IDs)
  {
  if(IDs.replace(/\s+/g,"").length>0)
  {
  var IDList=IDs.split('|');
  for(var i=0;i<IDList.length;i++)
		{
			document.getElementById(IDList[i]).style.display="none";
		}
	}
	document.getElementById("ProcessPrompt").style.display="";
}

/**
比较日期大小
**/
function CompareDate(DateOne,DateTwo)
{ 
	var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ("-"));
	var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ("-")+1);
	var OneYear = DateOne.substring(0,DateOne.indexOf ("-"));

	var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ("-"));
	var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ("-")+1);
	var TwoYear = DateTwo.substring(0,DateTwo.indexOf ("-"));

	if (Date.parse(OneMonth+"/"+OneDay+"/"+OneYear) >	Date.parse(TwoMonth+"/"+TwoDay+"/"+TwoYear))
		return 1;
	return -1;
}

/**
验证是否为数字
**/
function CheckIsNaN(Names,IDs)
{

      if(Names.replace(/\s+/g,"").length>0)
      {
          var NameList=Names.split('|');
          var IDList=IDs.split('|');
          var NullList="";
          for(var i=0;i<IDList.length;i++)
          {			                                
              if(isNaN(document.getElementById(IDList[i]).value))
              {
                  alert(NameList[i]);
                  document.getElementById(IDList[i]).focus();
                  return false;
              }
          }
      }
      return true;
}

/**
全选/取消GridView中的checkbox，obj=this
**/
function selectAll(obj)
{
	var theTable = obj.parentNode.parentNode.parentNode;
	var i;
	var j = obj.parentNode.cellIndex;
	for(i=0;i<theTable.rows.length;i++)
	{
		var objCheckBox = theTable.rows[i].cells[j].getElementsByTagName("input")[0];//alert(theTable.rows[i].cells[j].childNodes.length);
		if(objCheckBox.type=="checkbox")
		    objCheckBox.checked = obj.checked;
	}
}

/**
验证日期格式是否正确
**/
function CheckIsDate(names,ids)
{
    patrn=/^(\d{4})\-(\d{1,2})\-(\d{1,2})$/;
    lpatrn=/^(\d{4})\-(\d{1,2})\-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
    
    var IDs=ids.split('|');
    var Names=names.split('|');
    for(var i=0;i<IDs.length;i++)
    {
        var obj=document.getElementById(IDs[i]);
        if((!patrn.exec(obj.value))&&(!lpatrn.exec(obj.value)))
        {
            alert(Names[i]);
            obj.focus();
            return false;
        }
    }
    return true;
}