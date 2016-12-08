function rollNo()
{
    var rno = document.bedLayout.rno;
    if (ValidateRollNo(rno))
    {
        return true;
    }
    return false;
}
function ValidateRollNo(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a Roll No.\n";
        alert(error);
        document.bedLayout.rno.focus();
        return false;
    } 
     else if (fld.value.length != 10) {
        error = "The Roll No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.bedLayout.rno.focus();
        return false;
    }else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {
        error = "The Roll No. doesn't contain character at sixth position.\n";
        fld.style.background = '#F24D37';
        alert(error);
        document.bedLayout.rno.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }

}

function rollNo1()
{
    var rno = document.bedLayout1.rno;
    if (ValidateRollNo1(rno))
    {
        return true;
    }
    return false;
}
function ValidateRollNo1(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a Roll No.\n";
        alert(error);
        document.bedLayout1.rno.focus();
        return false;
    } 
     else if (fld.value.length != 10) {
        error = "The Roll No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.bedLayout1.rno.focus();
        return false;
    }else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {
        error = "The Roll No. doesn't contain character at sixth position.\n";
        fld.style.background = '#F24D37';
        alert(error);
        document.bedLayout1.rno.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }

}

function rollNo2()
{
    var rno = document.bedLayout2.rno;
    if (ValidateRollNo2(rno))
    {
        return true;
    }
    return false;
}
function ValidateRollNo2(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a Roll No.\n";
        alert(error);
        document.bedLayout2.rno.focus();
        return false;
    } 
     else if (fld.value.length != 10) {
        error = "The Roll No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.bedLayout2.rno.focus();
        return false;
    }else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {
        error = "The Roll No. doesn't contain character at sixth position.\n";
        fld.style.background = '#F24D37';
        alert(error);
        document.bedLayout2.rno.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }

}