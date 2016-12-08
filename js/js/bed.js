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

