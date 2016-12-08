/* global otherType */

function payLoginValidation()
{
    var uid = document.payLogin.username;
    var passid = document.payLogin.password;
    var htno = document.payLogin.htno;
    if ($(otherType).is(":visible"))
    {
        if (validateUsername(uid))
        {
            if (validatePassword(passid))
            {

                return true;


            }
        }
    }
    if ($(otherType2).is(":visible"))
    {
        if (validateHtno(htno))
        {
             return true;

        }
    }

    return false;
}
function validateUsername(fld) {
    var error = "";
    var illegalChars = /\W/; // allow letters, numbers, and underscores

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a username.\n";
        alert(error);
        document.payLogin.username.focus();
        return false;

    }
    else if (illegalChars.test(fld.value)) {
        fld.style.background = '#F24D37';
        error = "The username can contain letters, numbers, and underscores only.\n";
        alert(error);
        document.payLogin.username.focus();
        return false;

    } else {
        fld.style.background = 'White';
        return true;
    }
    
}

function validatePassword(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a password.\n";
        alert(error);
        document.payLogin.password.focus();
        return false;

    } else if (illegalChars.test(fld.value)) {
        error = "The password can contain letters and numbers only.\n";
        fld.style.background = '#F24D37';
        alert(error);
        document.payLogin.password.focus();
        return false;

    }
    else {
        fld.style.background = 'White';
         return true;
    }
   
}

function validateHtno(fld) {
    var error = "";

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a Hall-Ticket No.\n";
        alert(error);
        document.payLogin.htno.focus();
        return false;

    }else if (fld.value.length != 10) {
        error = "The Hall-Ticket No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.payLogin.htno.focus();
        return false;

    }
      else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {
               
        fld.style.background = '#F24D37';
        error = "The Hall-Ticket No. doesn't contain character at sixth position.\n";
        alert(error);
        document.payLogin.htno.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }
    
}
