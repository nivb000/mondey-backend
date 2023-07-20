const authService = require('./auth.service')

module.exports = {
    login,
    signup,
    logout
}

async function login(req, res) {
    const { email, password } = req.body
    try {
        const user = await authService.login(email, password)
        const loginToken = authService.getLoginToken(user)
        res.cookie('loginToken', loginToken)
        res.json(user)
    } catch (err) {
        res.status(401).send({ msg: 'Invalid email or password', type: 'error' })
    }
}

async function signup(req, res) {
    try {
        const { email, password, fullname, imgUrl, isGoogleUser } = req.body
        if(isGoogleUser) {
            const isExists = await authService.checkIfUserExists(email)
            if(!isExists){
                await authService.signup(email, password, fullname, imgUrl)
            }
        }
        else {
            await authService.signup(email, password, fullname, imgUrl)
        }
        const user = await authService.login(email, password, isGoogleUser)
        const loginToken = authService.getLoginToken(user)
        res.cookie('loginToken', loginToken)
        res.json(user)

    } catch (err) {
        res.status(500).send({ err: 'Failed to signup' })
    }
}

async function logout(req, res) {
    try {
        console.log('*******************************************************************************logging out')
        res.clearCookie('loginToken')
        res.send({ msg: 'Logged out successfully' })
    } catch (err) {
        res.status(500).send({ err: 'Failed to logout' })
    }
}