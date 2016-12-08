/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function addstaff()
{
    var staff = document.add.user;
    var uid = document.add.uname;
    var passid = document.add.pwd;
    var emailid = document.add.email;
    var passid1 = document.add.rpwd;
    if (validateUsers(staff))
    {
        if (validateUsername2(uid))
        {
            if (validateEmail(emailid))
            {
                if (validatePassword2(passid))
                {
                    if (validateRpassword(passid1))
                    {
                        return true;
                    }
                }
            }
        }
    }

    return false;
}

function validateUsername2(fld) {
    var error = "";
    var illegalChars = /\W/; // allow letters, numbers, and underscores
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a username.\n";
        alert(error);
        document.add.uname.focus();
        return false;

    }
    else if (illegalChars.test(fld.value)) {
        fld.style.background = '#F24D37';
        error = "The username can contain letters, numbers, and underscores only.\n";
        alert(error);
        document.add.uname.focus();
        return false;

    } else {
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
        document.add.pwd.focus();
        return false;

    } else if (illegalChars.test(fld.value)) {
        error = "The password can contain letters and numbers only.\n";
        fld.style.background = '#F24D37';
        alert(error);
        document.add.pwd.focus();
        return false;

    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function validateRpassword(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a password.\n";
        alert(error);
        document.add.rpwd.focus();
        return false;

    } else if (illegalChars.test(fld.value)) {
        error = "The password can contain letters and numbers only.\n";
        fld.style.background = '#F24D37';
        alert(error);
        document.add.rpwd.focus();
        return false;

    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function validateEmail(fld) {
    var error = "";
    var illegalChars = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Email.\n";
        alert(error);
        document.add.email.focus();
        return false;

    }
    else if (!illegalChars.test(fld.value)) {
        fld.style.background = '#F24D37';
        error = "You have entered invalid email address.\n";
        alert(error);
        document.add.email.focus();
        return false;

    } else {
        fld.style.background = 'White';
        return true;
    }

}
function validateUsers(fld) {
    var error = "";
    if (fld.selectedIndex == 0) {
        alert("Select Staff.");
        return false;
    }
    else
    {
        return true;
    }
}

function removestaff()
{
    var uid = document.remove.uname1;
    var staff1 = document.remove.user1;

    if (validateUser(staff1))
    {
        if (validateUsername(uid))
        {
            return true;
        }
    }
    return false;
}
function validateUser(fld) {
    var error = "";
    if (fld.selectedIndex == 0) {
        alert("Select Staff.");
        return false;
    }
    else
    {
        return true;
    }
}
function validateUsername(fld) {
    var error = "";
    var illegalChars = /\W/; // allow letters, numbers, and underscores
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a username.\n";
        alert(error);
        document.remove.uname1.focus();
        return false;

    }
    else if (illegalChars.test(fld.value)) {
        fld.style.background = '#F24D37';
        error = "The username can contain letters, numbers, and underscores only.\n";
        alert(error);
        document.remove.uname1.focus();
        return false;

    } else {
        fld.style.background = 'White';
        return true;
    }

}


