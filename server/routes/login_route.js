const express = require('express'); 
const router  = express.Router() ;   
const Auth = require("../middlewares/auth_middleware.js")
const {LoginController,SignUpController,demoController,LogOutController,EmailVerificationController,CheckOtpValidContoller} = require("../controllers/auth_controller.js")  
const {AdminLoginController,AdminCreationTemp} = require("../controllers/admin_controller.js"); 
const Auth_Admin = require('../middlewares/admin_auth_middleware.js');

router.route("/login").post(LoginController) ;
router.route("/send-mail").post(EmailVerificationController) ;
router.route("/check-otp/:email").post(CheckOtpValidContoller) ;
router.route("/demoAuth").get(Auth ,demoController) ;
router.route("/demoAuth").get(Auth ,demoController) ;
router.route("/logout").get(Auth ,LogOutController) ;
router.route("/sign-up").post( SignUpController) ; 

router.route("/admin/login").post(Auth_Admin ,AdminLoginController) ;
router.route("/admin/create").post(Auth_Admin ,AdminCreationTemp) ;

module.exports = router ;