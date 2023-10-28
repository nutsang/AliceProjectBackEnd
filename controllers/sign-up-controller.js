const signUPModel = require('../models/sign-up-model')

exports.ValidationAccount = (request, response) => {
    const atLeastOneUppercase = /[A-Z]/g
    const atLeastOneLowercase = /[a-z]/g
    const atLeastOneNumeric = /[0-9]/g
    const atLeastOneSpecialChar = /[#?!@$%^&*-]/g
    const eightCharsOrMore = /.{8,}/g
    const emailRegex = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/
    const { userName, email, password, confirmPassword } = request.body

    if(userName.length <= 0){
        throw response.status(400).json({message: 'กรุณากรอกนามแฝง'})
    }else if(email.length <= 0){
        throw response.status(400).json({message: 'กรุณากรอกอีเมล'})
    }else if(password.length <= 0){
        throw response.status(400).json({message: 'กรุณากรอกรหัสผ่าน'})
    }else if(confirmPassword.length <= 0){
        throw response.status(400).json({message: 'กรุณายืนยันรหัสผ่าน'})
    }else if(!email.match(emailRegex)){
        throw response.status(400).json({message: 'กรุณากรอกรูปแบบอีเมลให้ถูกต้อง'})
    }else if(!password.match(eightCharsOrMore)){
        throw response.status(400).json({message: 'ต้องการความยาวรหัสผ่านอย่างน้อย 8 ตัว'})
    }else if(!password.match(atLeastOneLowercase)){
        throw response.status(400).json({message: 'ต้องการตัวอักษรพิมพ์เล็กอย่างน้อย 1 ตัว'})
    }else if(!password.match(atLeastOneUppercase)){
        throw response.status(400).json({message: 'ต้องการตัวอักษรพิมพ์ใหญ่อย่างน้อย 1 ตัว'})
    }else if(!password.match(atLeastOneNumeric)){
        throw response.status(400).json({message: 'ต้องการตัวเลขอย่างน้อย 1 ตัว'})
    }else if(!password.match(atLeastOneSpecialChar)){
        throw response.status(400).json({message: 'ต้องการตัวอักษรพิเศษอย่างน้อย 1 ตัว'})
    }else if(password !== confirmPassword){
        throw response.status(400).json({message: 'กรุณากรอกรหัสผ่าน และ ยืนยันรหัสผ่านให้ตรงกัน'})
    }else{
        response.status(200).json({message: 'ผ่านการตรวจสอบ'})
    }
}

exports.SignUpAccount = (request, response) => {
    signUPModel.signUpAccount(request, response)
}