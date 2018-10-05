// JScript File

//checking and showing no of chars left
function calc(){
    str=form.txtmessbdy.value;
    len=str.length;
    if(len>135){
    alert("message not greater than 160 characters");
    return false;
    
    }
    s=135-len;
    form.txtalert.value=s.toString()+" Character Left";
    }      


function Trim(str)
{
	return str.replace(/^\s*|\s*$/g,"");
}

function IsTextBoxEmpty(TextBoxID)
{
    var txtObj=document.getElementById(TextBoxID);
    var val=Trim(txtObj.value);
    if(val=="" || val==null)
        return false;
    else
        return true;    
}

function IsSelectedCombo(ComboID)
{
    var cmb=document.getElementById(ComboID).selectedIndex;
    if(cmb>0)
        return true;
    else
        return false;
}

function GetSelectedTextCombo(ID)
{
    return document.getElementById(ID).options[document.getElementById(ID).selectedIndex].innerHTML;
}

function GetSelectedValueCombo(ID)
{
    return document.getElementById(ID).options[document.getElementById(ID).selectedIndex].value;
}

function IsEqual(str1,str2)
{
	if(str1!=str2)
		return false;
    else
        return true;
}

function IsValidEmail(str)
{
    var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
    if (filter.test(str))
        return true;
    else
        return false;
}

function IsNumeric(strValue)
{
    var ValidChars = "0123456789.";
    var IsNumber=true;
    var Char;
    for (i = 0; i < strValue.length && IsNumber == true; i++) 
    { 
        Char = strValue.charAt(i); 
        if (ValidChars.indexOf(Char) == -1) 
        {
            IsNumber = false;
            break;
        }
    }
    return IsNumber;
}

function RemoveAllItemsFromDDL()
{
    var x=document.getElementById("ddl_Installment");
    var y=x.options.length;
    for(var i=0;i<y;i++)
    {
        x.remove(0)
    }
}

function ValidateCommon()
{
// Example of alt ="BC~First Name~NUM~Numric Value~EC~Valid Email." for Blank Check
    var FormName=document.getElementById("aspnetForm");
    for(var i=0;i<FormName.elements.length;i++)
    {
        if(FormName.elements[i].alt)
        {
            var TextBoxID=FormName.elements[i].id;
            var altAttribute=FormName.elements[i].alt;
            var altAttributeArray=altAttribute.split("~"); 
            if(altAttributeArray[0]=="BC")//BC=Blank Check
            {
                if(Trim(FormName.elements[i].value)=="")
                {
                    alert("Please enter "+altAttributeArray[1]);
                    FormName.elements[i].focus();
                    return false;
                }
            }
            if(altAttributeArray[2]=="NUM")//NUM=Numeric
            {
                if(IsNumeric(FormName.elements[i].value)==false)
                {
                    alert("Please enter "+altAttributeArray[3]);
                    FormName.elements[i].focus();
                    return false;
                }
            }
            if(altAttributeArray[4]=="EC")//EC=Email Check
            {
                if(IsValidEmail(FormName.elements[i].value)==false)
                {
                    alert("Please enter "+altAttributeArray[5]);
                    FormName.elements[i].focus();
                    return false;
                }
            }
        }
        if(FormName.elements[i].type=="select-one") {
            //debugger;
            var ddlObj = FormName.elements[i].id;
            alert(ddlObj);
            var Message=ddlObj.split("_");
            var len=Message.length-1;
            if(Message[len]=="M")
            {
                if(IsSelectedCombo(ddlObj)==false)
                {
                    alert("Please select "+FormName.elements[i].title);
                    FormName.elements[i].focus();
                    return false;
                }
            }
        }
    }
    return true;
}
        
// Strat Timer
function StartTimer(id)
{
    setTimeout ( "setBlank("+id+")", 5000 );
}

function setBlank (id)
{
    document.getElementById(id.id).innerHTML="";
}

//End Timer


function addCloneRow(id) 
{
    var tbl=document.getElementById('tbody');
    var row=tbl.rows.length;
    alert(row);
    var tr = document.getElementById('tt');
    document.getElementById('tbody').appendChild(tr.cloneNode(true));
}

function removeCloneRow(id) 
{
    var tbl=document.getElementById('tbody');
    var row=tbl.rows.length;
    if(row==1)
    {
        alert("Can not delete.");
        return;
    }
    else
    {
        var tr = document.getElementById('tt');
	    tr.parentNode.removeChild(tr);
	}
}

function GetValueFromClonedRow()
{
    var tbl=document.getElementById('tbody');
    var ddls=document.getElementById('tbody').getElementsByTagName("select");
    var row=tbl.rows.length;
    var j=0;
    for(var i=0;i<ddls.length;i++)
    {
        j++;
        var txt=ddls[i].options[ddls[i].selectedIndex].innerHTML;
        alert(txt);
        if(j==3)
        {
            alert("Do");
            j=0;
        }
    }
}

function removeLastRowFromTable()
{
  var tbl = document.getElementById('tbody');//document.getElementById('tableName');
  var lastRow = tbl.rows.length;
  if (lastRow > 2) 
    tbl.deleteRow(lastRow - 1);
}









//not tested
function IsMobile()
{
    if(txt_empty(document.getElementById("txtMob"),"*",document.getElementById("spnMob"))==false)
    {
        flag=1;
        return false;
    }
    else if(chkNumeric1(document.getElementById("txtMob"),"",document.getElementById("spnMob"))==false)
    {
        flag=1;
        alert("Invalid mobile no.");
        return false;
    }
    else if(document.getElementById("txtMob").value.length<10)
    {
         //document.getElementById("spnMob").innerHTML="<font color='red'>" + "*" +"</font>";
         flag=1;
         document.getElementById("txtMob").focus();
         document.getElementById("txtMob").select();
         alert("Minimum 10 Characters.");
         return false;
    }
    if(document.getElementById("txtMob").value.length==10 && document.getElementById("txtMob").value.substring(0,1)!="9")
    {
    
        //document.getElementById("spnMob").innerHTML="<font color='red'>" + "*" +"</font>";
        flag=1;
        document.getElementById("txtMob").focus();
        document.getElementById("txtMob").select();
        alert("Invalid Mobile number.");
        return false;
    }
    else
    {
        document.getElementById("spnMob").innerHTML="";
            if(document.getElementById("txtMob").value=="0000000000" || document.getElementById("txtMob").value=="00000000000")
            {
                //document.getElementById("spnMob").innerHTML="<font color='red'>" + "*" +"</font>";
                flag=1;
                document.getElementById("txtMob").focus();
                document.getElementById("txtMob").select();
                alert("Invalid mobile no.");
                return false;
            }
            else
            {
                document.getElementById("spnMob").innerHTML="";
                if(document.getElementById("txtMob").value.length==11 && document.getElementById("txtMob").value.substring(0,2)!="09")
                {
                
                    //document.getElementById("spnMob").innerHTML="<font color='red'>" + "*" +"</font>";
                    flag=1;
                    document.getElementById("txtMob").focus();
                    document.getElementById("txtMob").select();
                    alert("Invalid Mobile number.");
                    return false;
                }
                else
                    document.getElementById("spnMob").innerHTML="";
            }
    }
            

}








//<script type="text/javascript">
//  var el = document.getElementById('div-01').nextSibling;
//  document.write('<p>Siblings of div-01</p><ol>');
//  while (el) {
//    document.write('<li>' + el.nodeName + '</li>');
//    el = el.nextSibling;
//  }
//  document.write('</ol>');
//</script>
