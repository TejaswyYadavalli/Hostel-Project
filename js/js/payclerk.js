/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function payclerk(student)
{
    var rno = document.student.Rno;
    var name = document.student.Name;
    var add = document.student.Address;
    var phno = document.student.Phno;
    var fname = document.student.fName;
    var emp = document.student.Emp;
    var fphno = document.student.fPhno;
    var income = document.student.Income;
    var rank = document.student.Rank;
    var state = document.student.State;
    var country = document.student.Country;
    var category = document.student.Category;
    var date = document.student.date;
    var aadhar = document.student.Aadhar;
    var faadhar = document.student.fAadhar;
    var gender = document.student.Gender;
    var maritalstatus = document.student.MaritalStatus;
    var adm = document.student.adm;

    if (ValidateRollNo(rno))
    {
        if (ValidateName(name))
        {
            if (ValidateAdd(add))
            {
                if (ValidatePhno(phno))
                {
                    if (ValidateFname(fname))
                    {
                        if (ValidateEmp(emp))
                        {
                            if (ValidateFphno(fphno))
                            {
                                if (ValidateIncome(income))
                                {
                                    if (ValidateAdm(adm))
                                    {
                                        if (ValidateRank(rank))
                                        {
                                            if (ValidateState(state))
                                            {

                                                if (ValidateCountry(country))
                                                {
                                                    if (ValidateCategory(category))

                                                    {
                                                        if (ValidateGender(gender))

                                                        {
                                                            if (ValidateDate(date))
                                                            {
                                                                if (ValidateMaritalStatus(maritalstatus))
                                                                {
                                                                    if (ValidateAadhar(aadhar))
                                                                    {
                                                                        if (ValidateFaadhar(faadhar))
                                                                        {

                                                                            return true;
                                                                        }

                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }

                                                }

                                            }

                                        }

                                    }

                                }

                            }

                        }

                    }

                }

            }
        }

    }
    return false;
}
function ValidateRollNo(fld) {
    var error = "";

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a Roll  number.\n";
        alert(error);
        document.student.Rno.focus();
        return false;

    } else if (fld.value.length != 10) {
        error = "The Roll  No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.student.Rno.focus();
        return false;
    }
    else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {

        fld.style.background = '#F24D37';
        error = "The Roll No. doesn't contain character at sixth position.\n";
        alert(error);
        document.student.Rno.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }

}

function ValidateName(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = " Enter a Name.\n";
        alert(error);
        document.student.Name.focus();
        return false;
    } else if (!fld.value.match(/[a-zA-Z]/)) {
        fld.style.background = '#F24D37';
        error = "The Name can contain letters only.\n";

        alert(error);
        document.student.Name.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateAdd(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Address.\n";
        alert(error);
        document.student.Address.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidatePhno(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Phone No.\n";
        alert(error);
        document.student.Phno.focus();
        return false;
    }
    else if (fld.value.length != 10) {
        error = "The Phone No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.student.Phno.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9]/)) {
        fld.style.background = '#F24D37';
        error = "The Phone No. can contain digits only.\n";

        alert(error);
        document.student.Phno.focus();
        return false;
    }



    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateFname(fld) {

    var error = "";

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Father's Name .\n";
        alert(error);
        document.student.fName.focus();
        return false;
    }
    else if (!fld.value.match(/[a-zA-Z]/)) {
        fld.style.background = '#F24D37';
        error = "The Father's Name can contain letters only.\n";

        alert(error);
        document.student.fName.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateEmp(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Employment details.\n";
        alert(error);
        document.student.Emp.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateFphno(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Father's Phone No.\n";
        alert(error);
        document.student.fPhno.focus();
        return false;
    }
    else if (fld.value.length != 10) {
        error = "The father Phno. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.student.fPhno.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9]/)) {
        fld.style.background = '#F24D37';
        error = "The Father's Phno. can contain digits only.\n";

        alert(error);
        document.student.fPhno.focus();
        return false;
    }


    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateIncome(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter income.\n";
        alert(error);
        document.student.Income.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9.]/)) {
        fld.style.background = '#F24D37';
        error = "Income can contain digits and period only.\n";

        alert(error);
        document.student.Income.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;

    }
}
function ValidateRank(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Rank.\n";
        alert(error);
        document.student.Rank.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9]/)) {
        fld.style.background = '#F24D37';
        error = "The rank con contain digits only.\n";

        alert(error);
        document.student.Rank.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateState(fld) {

    var error = "";

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter State.\n";
        alert(error);
        document.student.State.focus();
        return false;
    }
    else if (!fld.value.match(/[a-zA-Z]/)) {
        fld.style.background = '#F24D37';
        error = "The state can contain letters only.\n";

        alert(error);
        document.student.State.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateCountry(fld) {

    var error = "";

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Country.\n";
        alert(error);
        document.student.Country.focus();
        return false;
    }
    else if (!fld.value.match(/[a-zA-Z]/)) {
        fld.style.background = '#F24D37';
        error = "The country can contain letters only.\n";

        alert(error);
        document.student.Country.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateDate(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Date.\n";
        alert(error);
        document.student.date.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateAadhar(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Student Aadhar No.\n";
        alert(error);
        document.student.Aadhar.focus();
        return false;
    }
    else if (fld.value.length != 12) {
        error = "The Aadhar No. should be of length 12. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.student.aadhar.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9]/)) {
        fld.style.background = '#F24D37';
        error = "The Aadhar No. can contain digits only.\n";

        alert(error);
        document.student.Aadhar.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }

}
function ValidateFaadhar(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Father's Aadhar No.\n";
        alert(error);
        document.student.fAadhar.focus();
        return false;
    }
    else if (fld.value.length != 12) {
        error = "The Father Aadhar should be of length 12. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.student.faadhar.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9]/)) {
        fld.style.background = '#F24D37';
        error = "The Father Aadhar can contain digits only.\n";

        alert(error);
        document.student.fAadhar.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;

    }

}

function ValidateAdm(fld) {
    if (fld.selectedIndex == 0) {
        alert("Select Admission Test.");
        return false;
    }
    else
    {
        return true;
    }
}

function ValidateCategory(fld)
{
    if ((fld[0].checked == false) && (fld[1].checked == false) && (fld[2].checked == false) && (fld[3].checked == false))
    {
        error = "Select category.\n";
        alert(error);

    }
    else {
        return true;
    }

}

function ValidateGender(fld)
{
    if ((fld[0].checked == false) && (fld[1].checked == false))
    {
        error = "Select Gender.\n";
        alert(error);
    }
    else {
        return true;
    }

}
function ValidateMaritalStatus(fld)
{
    if ((fld[0].checked == false) && (fld[1].checked == false))
    {
        error = "Select Marital Status.\n";
        alert(error);
    }
    else {
        return true;
    }

}
function payclerk1(bill)
{
    var rno1 = document.bill.rno;
    var accno = document.bill.accno;
    var date = document.bill.date;
    var amt = document.bill.amt;
    var cno = document.bill.cno;

    if (ValidateRollNo(rno1))
    {
        if (ValidateAccno(accno))
        {
            if (ValidateDate1(date))
            {
                if (ValidateAmt(amt))
                {
                    if (ValidateCno(cno))
                    {
                        return true;
                    }

                }

            }

        }

    }
    return false;
}
function ValidateRollNo(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a Roll  number.\n";
        alert(error);
        document.bill.rno.focus();
        return false;
    }
    else if (fld.value.length != 10) {
        error = "The Roll  No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.bill.rno.focus();
        return false;
    }
    else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {

        fld.style.background = '#F24D37';
        error = "The Roll No. doesn't contain character at sixth position.\n";
        alert(error);
        document.bill.rno.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }
}

function ValidateAccno(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = " Enter Account No.\n";
        alert(error);
        document.bill.accno.focus();
        return false;
    }
    else if (fld.value.length != 11) {
        error = "The Account  No. should be of length 11. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.bill.accno1.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9]/)) {
        fld.style.background = '#F24D37';
        error = "The Account No. can contain digits only.\n";

        alert(error);
        document.bill.accno.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;
    }
}
function ValidateDate1(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Date.\n";
        alert(error);
        document.bill.date.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }
}
function ValidateAmt(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Amount.\n";
        alert(error);
        document.bill.amt.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9.]/)) {
        fld.style.background = '#F24D37';
        error = "Amount can contain digits and period only.\n";

        alert(error);
        document.bill.amt.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;
    }
}
function ValidateCno(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Challan number .\n";
        alert(error);
        document.bill.cno.focus();
        return false;
    }
    else if (fld.value.length != 6) {
        error = "The challan No. should be of length 6. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.bill.cno.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9]/)) {
        fld.style.background = '#F24D37';
        error = "The Challan No. can contain digits only.\n";
        alert(error);
        document.bill.cno.focus();

        return false;
    }

    else {
        fld.style.background = 'White';
        return true;

    }
}
function payclerk2(fee)
{
    var rno2 = document.fee.rno1;
    var accno = document.fee.accno;
    var mbill = document.fee.mbill;
    var esst = document.fee.esst;
    var rrent = document.fee.Rrent;
    var wecharges = document.fee.wecharges;
    var month = document.fee.select;
    var year = document.fee.select1;
    var food = document.fee.ftype;


    if (ValidateRollNo1(rno2))
    {
        if (ValidateAccno1(accno))
        {

            if (ValidateMonth(month))
            {
                if (ValidateYear(year))
                {
                    if (ValidateMbill(mbill))
                    {
                        if (ValidateEsst(esst))
                        {
                            if (ValidateRrent(rrent))
                            {
                                if (ValidateWecharges(wecharges))
                                {
                                    if (ValidateFood(food))
                                    {
                                        return true;

                                    }
                                }
                            }
                        }
                    }

                }

            }

        }

    }
    return false;
}
function ValidateRollNo1(fld) {
    var error = "";
    var illegalChars = /[\W_]/; // allow only letters and numbers

    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter a roll  number.\n";
        alert(error);
        document.fee.rno1.focus();
        return false;
    }
    else if (fld.value.length != 10) {
        error = "The roll  No. should be of length 10. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.fee.rno1.focus();
        return false;
    } else if (!fld.value.match(/\d{5}[a-zA-Z]{1}\d{4}/)) {

        fld.style.background = '#F24D37';
        error = "The Roll No. doesn't contain character at sixth position.\n";
        alert(error);
        document.fee.rno1.focus();
        return false;
    }

    else {
        fld.style.background = 'White';
        return true;

    }
}

function ValidateAccno1(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = " Enter Account No.\n";
        alert(error);
        document.fee.accno.focus();
        return false;
    }
    else if (fld.value.length != 11) {
        error = "The Account No. should be of length 11. \n";
        fld.style.background = '#F24D37';
        alert(error);
        document.fee.accno.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9]/)) {
        fld.style.background = '#F24D37';
        error = "Account No. can contain digits and period only.\n";

        alert(error);
        document.fee.accno.focus();
        return false;
    }


    else {
        fld.style.background = 'White';
        return true;

    }
}
function ValidateMbill(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Monthly Bill.\n";
        alert(error);
        document.fee.mbill.focus();

        return false;
    }
    else if (!fld.value.match(/[0-9.]/)) {
        fld.style.background = '#F24D37';
        error = "Monthly Bill can contain digits and period only.\n";

        alert(error);
        document.fee.mbill.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;

    }
}
function ValidateEsst(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Esstablishment Rate.\n";
        alert(error);
        document.fee.esst.focus();

        return false;
    }
    else if (!fld.value.match(/[0-9.]/)) {
        fld.style.background = '#F24D37';
        error = "Income can contain digits and period only.\n";

        alert(error);
        document.fee.esst.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;

    }
}
function ValidateRrent(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Please Enter Room Rent .\n";
        alert(error);
        document.fee.Rrent.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9.]/)) {
        fld.style.background = '#F24D37';
        error = "The room rent contains illegal characters.\n";

        alert(error);
        document.fee.Rrent.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;

    }
}
function ValidateWecharges(fld) {

    var error = "";
    if (fld.value == "") {
        fld.style.background = '#F24D37';
        error = "Enter Water Electricity Charges.\n";
        alert(error);
        document.fee.wecharges.focus();
        return false;
    }
    else if (!fld.value.match(/[0-9.]/)) {
        fld.style.background = '#F24D37';
        error = "Water/Electricity charges can contain digits and period only.\n";

        alert(error);
        document.fee.wecharges.focus();
        return false;
    }
    else {
        fld.style.background = 'White';
        return true;

    }
}

function ValidateFood(fld)
{
    var error = "";
    if ((fld[0].checked == false) && (fld[1].checked == false))
    {
        error = "Select food type.\n";
        alert(error);
    }
    else {
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




