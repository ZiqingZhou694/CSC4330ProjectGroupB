
// login switch box
let login=document.getElementById('login');
let register=document.getElementById('register');
let form_box=document.getElementsByClassName('form-box')[0];
let register_box=document.getElementsByClassName('register-box')[0];
let login_box=document.getElementsByClassName('login-box')[0];
register.addEventListener('click', ()=>{
    form_box.style.transform='translateX(80%)';
    login_box.classList.add('hidden');
    register_box.classList.remove('hidden');
})
login.addEventListener('click',()=>{
    form_box.style.transform='translateX(0%)';
    register_box.classList.add('hidden');
    login_box.classList.remove('hidden');
})
// icons
const showHiddenInput =(loginbox, inputpass,inputIcon) =>{
    const login = document.getElementById(loginbox),
        input = document.getElementById(inputpass),
        iconEye = document.getElementById(inputIcon)
    iconEye.addEventListener('click', ()=>{
        if(input.type === 'password'){
            input.type = 'text'
            iconEye.classList.add('bx-show')
        }
        else{
            input.type = 'password'
            iconEye.classList.remove('bx-show')
        }
    })
}
showHiddenInput('login-box', 'input-pass','input-hide');
// var login_error = document.getElementById("login_error");
// var pass_error = document.getElementById("pass_error");
// var both_empty = document.getElementById("empty_error");

// message box

// function myFunction(x) {
//     // Get the snackbar DIV
//     // Add the "show" class to DIV
//     x.className = "show";
//
//     // After 3 seconds, remove the show class from DIV
//     setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
// }
document.getElementById('Sign_up').addEventListener('click',validate);
function validate(){


    var uname = document.getElementById('username1').value;
    var pwd = document.getElementById('password').value;
    var email = document.getElementById("email").value;
    var pwd2 = document.getElementById("pwd").value;

    if(uname == null || uname ==""){
        // myFunction(both_empty);
        layer.msg("用户名不能为空",{icon:2})

        // return false;
    }
    else{
        if(pwd == null || pwd ==""){
            // myFunction(login_error);
            layer.msg("密码不能为空",{icon:2})
        }
        else if(email == null || email ==""){
            // myFunction(pass_error);
            layer.msg("邮箱不能为空",{icon:2});

        }else if(pwd2 == null || pwd2 ==""){
            layer.msg("请确认密码",{icon:2});
        }else if(pwd != pwd2){
            layer.msg("确认密码不正确",{icon:2});
        }

    }

}
document.getElementById('validate').addEventListener('click',validatepass);


function validatepass(){


    var username = document.getElementById('username').value;
    var password = document.getElementById('input-pass').value;

    if((username == null || username =="") && (password == null || password =="")){
        // myFunction(both_empty);
        layer.msg("用户名和密码不能为空",{icon:2})

        // return false;
    }
    else{
        if(username == null || username ==""){
            // myFunction(login_error);
            layer.msg("用户名不能为空",{icon:2})
        }
        else if(password == null || password ==""){
            // myFunction(pass_error);
            layer.msg("密码不能为空",{icon:2});

        }

    }


    const loginFail =(loginFail) =>{
        const  Fail=document.getElementsByClassName(loginFail)[0]
        Fail.classList.add('show')
        setTimeout(function (){Fail.classList.remove('show')}, 3000)
    }
    loginFail('loginFail')
}
