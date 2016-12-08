/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function bedHManager(hManager)
{
    var rno = document.hManager.Rno1;
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
        error = "Enter a Roll number.\n";
        alert(error);
        document.hManager.Rno1.focus();
        return false;
    } 
    else if (fld.value.length != 10) {
        error = "The Roll No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        return false;
    }
    else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {
               
        fld.style.background = '#F24D37';
        error = "The Roll No. doesn't contain character at sixth position.\n";
        alert(error);
        return false;
    } 

    else {
        fld.style.background = 'White';
        return true;
    }
    
}



