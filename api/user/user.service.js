const pool = require('../db.service')

module.exports = {
    query,
    getById,
    getByEmail,
    findUsersByEmail,
    updateMentions,
    add,
    update,
    // remove,
}

async function query(boardId) {
    try {
        let users
        if (boardId) users = await pool.query(`SELECT * FROM users WHERE boardmentions::jsonb @> '["${boardId}"]'::jsonb;`)
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
        console.log('err', err)
        throw err
    }
}
async function findUsersByEmail(email) {
    try {
        // const users = await pool.query(`SELECT * FROM users WHERE email = $1`, [email])
        const users = await pool.query(`SELECT * FROM users WHERE email LIKE $1 || '%'`, [email])
        return users.rows
    } catch (err) {
        console.log('err', err)
        throw err
    }
}

async function updateMentions(userId, boardId) {
    try {
        const result = await pool.query("SELECT boardmentions FROM users WHERE id = $1", [userId])
        const boardMentions = result.rows[0].boardmentions || []
        const updatedMentions = JSON.stringify([...boardMentions, boardId.toString()])
        await pool.query("UPDATE users SET boardMentions = $1 WHERE id = $2", [updatedMentions, userId])
    } catch (error) {
        throw error
    }
}

async function add(user) {
    try {
        const userToAdd = [
            user.fullname,
            user.email,
            user.password,
            user.imgUrl,
            user.boardmentions
        ]
        const addedUser = await pool.query(
            `INSERT INTO users(fullname, email, password, "imgUrl", boardmentions) 
            VALUES ($1, $2, $3, $4, $5) RETURNING *`, userToAdd)
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
        user.imgUrl,
        JSON.stringify(user.boardmentions)
    ]
    try {
        await pool.query(`UPDATE users SET fullname = $1, email = $2, password = $3, "imgUrl" = $4, boardmentions = $5 WHERE id = ${id}`, values)
    } catch (error) {
        console.log('error', error);
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

