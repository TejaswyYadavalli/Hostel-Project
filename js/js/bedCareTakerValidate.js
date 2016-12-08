/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function valOccupancy(attendance)
{
    var hname = document.occupancy.hname;
    if (ValidateHostel(hname))
    {
        return true;
    }
    return false;
}

function ValidateHostel(fld) {
    var error = "";
    if (fld.selectedIndex == 0) {
        alert("Select Hostel");
        return false;
    }
    else
    {
        return true;
    }
}


function attendance(attendance)
{
    var rno1 = document.attendance.rno;
    var pdays=document.attendance.pdays;
    if (ValidateRollNo(rno))
    {
        if(ValidateDays(pdays)){
            return true;
        }
    }
    return false;
}

function ValidateRollNo(fld) {
    var error = "";

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a Roll number.\n";
        alert(error);
        document.attendance.rno.focus();

        return false;
    } else if (fld.value.length != 10) {
        error = "The Roll No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.attendance.rno.focus();
        return false;
    } else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {
               
        fld.style.background = '#F24D37';
        error = "The Roll No. doesn't contain character at sixth position.\n";
        alert(error);
         document.attendance.rno.focus();

        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateDays(fld) {
    var error = "";

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Days Present.\n";
        alert(error);
        document.attendance.pdays.focus();
        return false;
    } else if (fld.value.length <= 31) {
        error = "Days Present should be less than or equal to 31. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.attendance.pdays.focus();
        return false;
    } else if (!fld.value.match(/\d/)) {
               
        fld.style.background = '#F24D37';
        error = "The Days Present must be digits.\n";
        alert(error);
        document.attendance.pdays.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }

}



