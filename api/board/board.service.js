const pool = require('../db.service')
const userService = require('../user/user.service')

module.exports = {
    query,
    getById,
    remove,
    add,
    update
}

async function query(userId) {
    try {
        let boards
        if(!userId) return boards = []
        boards = await pool.query(`SELECT * FROM board WHERE members @> '"${userId}"'::jsonb;`)
        return boards.rows
    } catch (error) {
        throw error
    }
}
async function getById(id) {
    try {
        const board = await pool.query("SELECT * FROM board WHERE id = $1", [id])
        return board.rows[0]
    } catch (error) {
        throw error
    }
}
async function remove(id) {
    try {
        await pool.query("DELETE FROM board WHERE id = $1", [id])
        return `Board ${id} has been deleted`
    } catch (error) {
        throw error
    }
}

async function add(board) {
    const values = [
        board.title,
        board.archivedAt,
        board.createdAt,
        board.createdBy.id,
        board.createdBy.fullname,
        board.createdBy.imgUrl,
        JSON.stringify(board.labels),
        JSON.stringify(board.groups),
        JSON.stringify(board.activities),
        JSON.stringify(board.cmpsOrder),
        JSON.stringify(board.members)
    ]
    try {
        const newBoard = await pool.query(
            `INSERT INTO board(title, archivedat, createdat, "createdby.id", "createdby.fullname", "createdby.imgurl", labels, groups, activities, cmpsorder, members) 
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *`, values)
        return newBoard.rows[0]
    } catch (error) {
        throw error
    }
}

async function update(board, id) {
    const values = [
        board.title,
        board.archivedat,
        board.createdat,
        board['createdby.id'],
        board['createdby.fullname'],
        board['createdby.imgurl'],
        JSON.stringify(board.labels),
        JSON.stringify(board.groups),
        JSON.stringify(board.activities),
        JSON.stringify(board.cmpsorder),
        JSON.stringify(board.members)
    ]
    try {
        await pool.query(`UPDATE board SET title = $1, archivedat = $2, createdat = $3, "createdby.id" = $4, "createdby.fullname" = $5, "createdby.imgurl" = $6, labels = $7, groups = $8, activities = $9, cmpsorder = $10, members = $11 WHERE id = ${id}`, values)
        const updatedBoard = await pool.query('SELECT * FROM board WHERE id = $1', [id])
        return updatedBoard.rows[0]
    } catch (error) {
        throw error
    }
}