const Cryptr = require('cryptr')
const bcrypt = require('bcrypt')
const userService = require('../user/user.service')

const cryptr = new Cryptr(process.env.SECRET1 || 'Secret-Code-1234')

module.exports = {
    login,
    signup,
    getLoginToken,
    validateToken,
    checkIfUserExists
}

async function login(email, password, isGoogleUser) {
    const user = await userService.getByEmail(email)
    if (!user) return Promise.reject('Invalid Email or password')
    if (!isGoogleUser) {
        const match = await bcrypt.compare(password, user.password)
        if (!match) return Promise.reject('Invalid username or password')
        delete user.password
        return user
    } else {
        return user
    }
}

async function signup(email, password, fullname, imgUrl) {
    const saltRounds = 10
    if (!email || !password || !fullname) return Promise.reject('fullname, email and password are required!')
    const hash = await bcrypt.hash(password, saltRounds)
    return userService.add({ email, password: hash, fullname, imgUrl })
}

function getLoginToken(user) {
    return cryptr.encrypt(JSON.stringify(user))
}

function validateToken(loginToken) {
    try {
        const json = cryptr.decrypt(loginToken)
        const loggedinUser = JSON.parse(json)
        return loggedinUser
    } catch (err) {
        console.log('Invalid login token')
    }
    return null
}

function checkIfUserExists(email) {
    return userService.getByEmail(email)
}
