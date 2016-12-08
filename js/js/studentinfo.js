/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function studentinfo1()
{
    var rno = document.td.Rno1;
    if (ValidateRollNo(rno))
    {
        return true;
    }
    return false;
}

function ValidateRollNo(fld) {
    var error = "";

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a roll  number.\n";
        alert(error);
        document.td.Rno1.focus();
        return false;
        
    } else if (fld.value.length != 10) {
        error = "The roll  No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.td.Rno1.focus();
        return false;
    }
    else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {

        fld.style.background = '#F24D37';
        error = "The Roll No. doesn't contain character at sixth position.\n";
        alert(error);
        document.td.Rno1.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }


}


function studentinfo()
{
    var rno = document.mmd.Rno;
    var mselect = document.mmd.mselection;
    var yselect = document.mmd.yselection;
    if (ValidateRollNo1(rno))
    {
        if (ValidateMonth(mselect))
        {
            if (ValidateYear(yselect))
            {
                return true;
            }
           
        }
    }
     return false;
}

function ValidateRollNo1(fld) {
    var error = "";

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a roll  number.\n";
        alert(error);
        document.mmd.Rno.focus();
        return false;

    } else if (fld.value.length != 10) {
        error = "The roll  No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.mmd.Rno.focus();
        return false;
    }
    else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {

        fld.style.background = '#F24D37';
        error = "The Roll No. doesn't contain character at sixth position.\n";
        alert(error);
        document.mmd.Rno.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateMonth(fld) {
    var error = "";
    if (fld.selectedIndex == 0) {
        alert("Select Month.");
        return false;

    }
    else
    {
        return true;
    }
}
function ValidateYear(fld) {
    var error = "";
    if (fld.selectedIndex == 0) {
        alert("Select Year.");
        return false;
    }
    else
    {
        return true;
    }
}






