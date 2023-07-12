const pool = require('../db.service')

module.exports = {
    query,
    getById,
    getByEmail,
    findUsersByEmail,
    add,
    update,
    // remove,
}
async function query(members) {
    try {
        let users
        if (members) users = await pool.query(`SELECT * FROM users WHERE id = ANY($1)`, [members])
        else users = await pool.query('SELECT * FROM users')
        return users.rows
    } catch (err) {
        throw err
    }
}
async function getById(userId) {
    try {
        let user = await pool.query('SELECT * FROM users WHERE id = $1', [userId])
        user = user.rows[0]
        if (user) {
            delete user.password
            return user
        }
    } catch (err) {
        throw err
    }
}
async function getByEmail(email) {
    try {
        const user = await pool.query(`SELECT * FROM users WHERE email = $1`, [email])
        return user.rows[0]
    } catch (err) {
        throw err
    }
}
async function findUsersByEmail(email) {
    try {
        // const users = await pool.query(`SELECT * FROM users WHERE email = $1`, [email])
        const users = await pool.query(`SELECT * FROM users WHERE email LIKE $1 || '%'`, [email])
        return users.rows
    } catch (err) {
        throw err
    }
}

async function add(user) {
    try {
        const userToAdd = [
            user.fullname,
            user.email,
            user.password,
            user.imgUrl,
        ]
        const addedUser = await pool.query(
            `INSERT INTO users(fullname, email, password, "imgUrl") 
            VALUES ($1, $2, $3, $4) RETURNING *`, userToAdd)
        return addedUser.rows[0]
    } catch (err) {
        throw err
    }
}
async function update(user, id) {
    const values = [
        user.fullname,
        user.email,
        user.password,
        user.imgUrl
    ]
    try {
        await pool.query(`UPDATE users SET fullname = $1, email = $2, password = $3, "imgUrl" = $4 WHERE id = ${id}`, values)
    } catch (error) {
        throw error
    }
}

// async function remove(userId) {
//     try {
//         const collection = await dbService.getCollection('user')
//         await collection.deleteOne({ '_id': ObjectId(userId) })
//     } catch (err) {
//         logger.error(`cannot remove user ${userId}`, err)
//         throw err
//     }
// }

