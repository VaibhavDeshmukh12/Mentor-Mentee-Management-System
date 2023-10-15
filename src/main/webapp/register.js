/**
 * 
 */

 var nameError=document.getElementById('name-error');
var usernameError=document.getElementById('username-error');
var yearError=document.getElementById('year-error');
var phoneError=document.getElementById('phone-error');
var emailError=document.getElementById('email-error');
var msgError=document.getElementById('message-error');
var IdError=document.getElementById('id-error');
var mIdError=document.getElementById('mid-error');
var passError=document.getElementById('pass-error');



function validateId(){
    var Id=document.getElementById('Id').value;
    if(Id.length== 0)
    {
        IdError.innerHTML="Id is Required";
        return false;
    }
    IdError.innerHTML="";
    return true;
}

function validateMentorId(){
    var mId=document.getElementById('mId').value;
    if(mId.length== 0)
    {
        mIdError.innerHTML="Mentor Id is Required";
        return false;
    }
    mIdError.innerHTML="";
    return true;
}

function validateYear(){
    var year=document.getElementById('year-name').value;
    if(year.length== 0)
    {
        yearError.innerHTML="Year is Required";
        return false;
    }
    if(!year.match( /^[A-Za-z]*\s*$/)){
        yearError.innerHTML="Year is Invalid";
        return false;
    }
    yearError.innerHTML='';
    return true;
}
function validatePassword()
{
    var pass=document.getElementById('pass').value;
    if(pass.length==0)
    {
        passError.innerHTML="Password is Required"
        return false
    }
    passError.innerHTML=""
    return true;


    
}

function validateUsername(){
    var name=document.getElementById('username').value;
    if(name.length== 0)
    {
        usernameError.innerHTML="Username Required";
        return false;
    }
    if(!name.match(  /^[a-zA-Z0-9_]+$/)){
        usernameError.innerHTML="Username is Invalid";
        return false;
    }
    usernameError.innerHTML='';
    return true;
}

function validateName(){
    var name=document.getElementById('contact-name').value;
    if(name.length==0)
    {
        nameError.innerHTML="Name is Required";
        return false;
    }
    if(name.length< 2)
    {
        nameError.innerHTML="Name is Invalid";
        return false;
    }
    if(!name.match(/^[A-Za-z]*\s{1}[A-Za-z]*$/)){
        nameError.innerHTML="Name is Invalid";
        return false;
    }
    nameError.innerHTML='';
    return true;
}

function validatePhone()
{
    var phone=document.getElementById('contact-phone').value;

    if(phone.length== 0)
    {
        phoneError.innerHTML="Phone no. is Required";
        return false;
    }
    if(phone.length!=10)
    {
        phoneError.innerHTML="Invalid Phone No";
        return false;
    }
    if(!phone.match(/^[0-9]{10}$/)){
        phoneError.innerHTML="Only Digits Are Allowed ";
        return false;
    }
    
    
    phoneError.innerHTML='';

    return true;
    
}

function validateEmail()
{
    var email=document.getElementById('contact-email').value;

    if(email.length== 0)
    {
        emailError.innerHTML="Email is Required";
        return false;
    }
    if(!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)){

        emailError.innerHTML="Email is Invalid";
        return false;
    }

    emailError.innerHTML='';
    return true;
}




function validateForm(){
    var submitText=document.getElementById('submit-error');
    if(!validateName() || !validatePhone() || !validateEmail() ||!validateId()||!validateMentorId()||!validateUsername()||!validatePassword()||!validateYear())
    {
        submitText.style.display='block';
        submitText.innerHTML='Please Fill the details correctly';
        setTimeout(function(){
            submitText.style.display='none';
        },3000)
        return false;
    }
    return true;
}

// ===========================================================================================================================
var usernameError1=document.getElementById('username-error1');
var passError1=document.getElementById('pass-error1');
var emailError1=document.getElementById('email-error1');
var phoneError1=document.getElementById('phone-error1');



var nameError1=document.getElementById('name-error1');
var IdError1=document.getElementById('id-error1');

function validateName1(){
    var name1=document.getElementById('contact-name1').value;
    if(name1.length==0)
    {
        nameError1.innerHTML="Name is Required";
        return false;
    }
    if(name1.length< 2)
    {
        nameError1.innerHTML="Name is Invalid";
        return false;
    }
    if(!name1.match(/^[A-Za-z]*\s{1}[A-Za-z]*$/)){
        nameError1.innerHTML="Name is Invalid";
        return false;
    }
    nameError1.innerHTML='';
    return true;
}
function validateId1(){
    var Id=document.getElementById('Id1').value;
    if(Id.length== 0)
    {
        IdError1.innerHTML="Mentor Id is Required";
        return false;
    }
    IdError1.innerHTML="";
    return true;
}

function validateUsername1(){
    var name=document.getElementById('username1').value;
    if(name.length== 0)
    {
        usernameError1.innerHTML="Username Required";
        return false;
    }
    if(!name.match(  /^[a-zA-Z0-9_]+$/)){
        usernameError1.innerHTML="Username is Invalid";
        return false;
    }
    usernameError1.innerHTML='';
    return true;
}
function validatePassword1()
{
    var pass=document.getElementById('pass1').value;
    if(pass.length==0)
    {
        passError1.innerHTML="Password is Required"
        return false
    }
    passError1.innerHTML=""
    return true;
}

function validateEmail1()
{
    var email=document.getElementById('contact-email1').value;

    if(email.length== 0)
    {
        emailError1.innerHTML="Email is Required";
        return false;
    }
    if(!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)){

        emailError1.innerHTML="Email is Invalid";
        return false;
    }

    emailError1.innerHTML='';
    return true;

}

function validatePhone1()
{
    var phone=document.getElementById('contact-phone1').value;

    if(phone.length== 0)
    {
        phoneError1.innerHTML="Phone no. is Required";
        return false;
    }
    if(phone.length!=10)
    {
        phoneError1.innerHTML="Invalid Phone No";
        return false;
    }
    if(!phone.match(/^[0-9]{10}$/)){
        phoneError.innerHTML="Only Digits Are Allowed ";
        return false;
    }
    
    
    phoneError1.innerHTML='';

    return true;
    
}
function validateForm1(){
    var submitText=document.getElementById('submit-error1');
    if(!validateName1() || !validatePhone1() || !validateEmail1() ||!validateId1()||!validateUsername1()||!validatePassword1())
    {
        submitText.style.display='block';
        submitText.innerHTML='Please Fill the details correctly';
        setTimeout(function(){
            submitText.style.display='none';
        },3000)
        return false;
    }
    return true;
}