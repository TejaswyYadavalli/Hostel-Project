/* 
 /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validatepassword(ChangePassword)
{
    var passid = document.ChangePassword.password;
    var passid1 = document.ChangePassword.newpassword;
    var passid2 = document.ChangePassword.conpassword;
    if (validatePassword(passid))
    {
        if (validatePassword1(passid1))
        {
            if (validatePassword2(passid2))
            {


                return true;

            }
        }
    }

    return false;
}

function validatePassword(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a password.\n";
        alert(error);
        document.ChangePassword.password.focus();
        return false;

    } else if (illegalChars.test(fld.value)) {
        error = "The password contains illegal characters.\n";
        fld.style.background = '#F24D37';
        alert(error);
        document.ChangePassword.password.focus();
        return false;

    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function validatePassword1(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a password.\n";
        alert(error);
        document.ChangePassword.newpassword.focus();
        return false;

    } else if (illegalChars.test(fld.value)) {
        error = "The password contains illegal characters.\n";
        fld.style.background = '#F24D37';
        alert(error);
        document.ChangePassword.newpassword.focus();
        return false;

    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function validatePassword2(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a password.\n";
        alert(error);
        document.ChangePassword.conpassword.focus();
        return false;

    } else if (illegalChars.test(fld.value)) {
        error = "The password contains illegal characters.\n";
        fld.style.background = '#F24D37';
        alert(error);
        document.ChangePassword.conpassword.focus();
        return false;

    }
    else {
        fld.style.background = 'White';
        return true;
    }

}

