<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%@include file="../component/setupCss.jsp" %>
        <style>
            @import url('https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css');
            .form-control {
                margin-right: 12px;
                width: 64px;
                height: 40px;
            }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #ff8880;
                outline: 0;
                box-shadow: none;
            }

            .form-control.form-control-solid {
                background-color: #F3F6F9;
                border-color: #F3F6F9;
                color: #3F4254;
                transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease;
            }

            .form-control.form-control-solid:active,
            .form-control.form-control-solid.active,
            .form-control.form-control-solid:focus,
            .form-control.form-control-solid.focus {
                background-color: #EBEDF3;
                border-color: #EBEDF3;
                color: #3F4254;
                transition: color 0.15s ease, background-color 0.15s ease, border-color 0.15s ease, box-shadow 0.15s ease;
            }

            .cursor {
                cursor: pointer;
            }

            input[type="text"] {
                display: block;
                margin : 0 auto;
            }
        </style>
    </head>
    <body class="d-flex flex-column min-vh-100">
        <!--header-->
        <%@include file="../component/header.jsp" %>
        <!--header-->




        <div style="padding-top: 30px;">
            <form action="VerifyCode" method="post">
                <input type='text' name='name' value='${name}' hidden>
                <input type='text' name='email' value='${email}' hidden>
                <input type='text' name='pass' value='${pass}' hidden>
                <input type='text' name='gender' value='${gender}' hidden>
                <input type='text' name='phone' value='${phone}' hidden>
                <input type='text' name='address' value='${address}' hidden>
                <input type='text' name='dob' value='${dob}' hidden>
                <h1 class="h2 text-center">Verify your email address</h1>
                <div class="mb-6 text-center mt-5">
                    <div id="otp" class="flex justify-center">
                        <input class="m-2 text-center form-control form-control-solid rounded focus:border-blue-400 focus:shadow-outline" type="text" name="verifyCode1" id="first" maxlength="1" />
                        <input class="m-2 text-center form-control form-control-solid rounded focus:border-blue-400 focus:shadow-outline" type="text" name="verifyCode2" id="second" maxlength="1" />
                        <input class="m-2 text-center form-control form-control-solid rounded focus:border-blue-400 focus:shadow-outline" type="text" name="verifyCode3" id="third" maxlength="1" />
                        <input class="m-2 text-center form-control form-control-solid rounded focus:border-blue-400 focus:shadow-outline" type="text" name="verifyCode4" id="fourth" maxlength="1" />
                        <input class="m-2 text-center form-control form-control-solid rounded focus:border-blue-400 focus:shadow-outline" type="text" name="verifyCode5" id="fifth" maxlength="1" />
                        <input class="m-2 text-center form-control form-control-solid rounded focus:border-blue-400 focus:shadow-outline" type="text" name="verifyCode6" id="sixth" maxlength="1" />
                    </div>
                </div>
                <h1 class="h4 text-center">In order to start using your account, you need to confirm your email address</h1>
                <div class="d-flex justify-content-center mr-5">
                    <button type="submit" value="verify" class="btn btn-warning btn-lg ms-3 text-center mt-3" style="border-radius: 10px">Verify</button>
                </div>
            </form>
        </div>


        <!--footer-->
        <footer class="footer_section mt-auto">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-col">
                        <div class="footer_contact">
                            <h4>
                                Contact Us
                            </h4>
                            <div class="contact_link_box">
                                <a href="">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <span>
                                        Location
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <span>
                                        Call +01 1234567890
                                    </span>
                                </a>
                                <a href="">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span>
                                        demo@gmail.com
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <div class="footer_detail">
                            <a href="" class="footer-logo">
                                Cinema
                            </a>
                            <p>
                                Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with
                            </p>
                            <div class="footer_social">
                                <a href="#">
                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-linkedin" aria-hidden="true"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-instagram" aria-hidden="true"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-pinterest" aria-hidden="true"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 footer-col">
                        <h4>
                            Opening Hours
                        </h4>
                        <p>
                            Everyday
                        </p>
                        <p>
                            08.00 Am -11.59 Pm
                        </p>
                    </div>
                </div>
                <div class="footer-info">
                    <p>
                        &copy; <span id="displayYear"></span> All Rights Reserved By
                        <a href="https://html.design/">Free Html Templates</a><br><br>
                        &copy; <span id="displayYear"></span> Distributed By
                        <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
                    </p>
                </div>
            </div>
        </footer>
        <!--footer-->
        <script>
            function OTPInput() {
                const inputs = document.querySelectorAll('#otp > *[id]');
                for (let i = 0; i < inputs.length; i++) {
                    inputs[i].addEventListener('keydown', function (event) {
                        if (event.key === "Backspace") {
                            inputs[i].value = '';
                            if (i !== 0)
                                inputs[i - 1].focus();
                        } else {
                            if (i === inputs.length - 1 && inputs[i].value !== '') {
                                return true;
                            } else if (event.keyCode > 47 && event.keyCode < 58) {
                                inputs[i].value = event.key;
                                if (i !== inputs.length - 1)
                                    inputs[i + 1].focus();
                                event.preventDefault();
                            } else if (event.keyCode > 64 && event.keyCode < 91) {
                                inputs[i].value = String.fromCharCode(event.keyCode);
                                if (i !== inputs.length - 1)
                                    inputs[i + 1].focus();
                                event.preventDefault();
                            }
                        }
                    });
                }
            }
            OTPInput();
        </script>
    </body>
</html>
