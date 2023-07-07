const userService = require('./user.service')


module.exports = {
    getUsers,
    getUser,
    getUserByEmail,
    updateUser
    // deleteUser,
}

async function getUsers(req, res) {
    try {
        const { boardId } = req.query
        const users = await userService.query(boardId)
        res.send(users)
    } catch (err) {
        res.status(500).send({ err: 'Failed to get users' })
    }
}

async function getUser(req, res) {
    try {
        const user = await userService.getById(req.params.id)
        res.send(user)
    } catch (err) {
        res.status(500).send({ err: 'Failed to get user' })
    }
}
async function getUserByEmail(req, res) {
    try {
        const users = await userService.findUsersByEmail(req.query.email)
        res.send(users)
    } catch (err) {
        res.status(500).send({ err: 'Failed to get user' })
    }
}

// async function deleteUser(req, res) {
//     try {
//         await userService.remove(req.params.id)
//         res.send({ msg: 'Deleted successfully' })
//     } catch (err) {
//         res.status(500).send({ err: 'Failed to delete user' })
//     }
// }

async function updateUser(req, res) {
    try {
        const { user } = req.body
        await userService.update(user, req.params.id)
        res.send({msg: 'User updated successfully'})
    } catch (err) {
        res.status(500).send({ err: 'Failed to update user' })
    }
}