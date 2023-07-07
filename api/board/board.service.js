const pool = require('../db.service')
const userService = require('../user/user.service')

module.exports = {
    query,
    getById,
    remove,
    add,
    update
}

async function query(mentions) {
    try {
        let boards
        if(!mentions) return boards = []
        boards = await pool.query(`SELECT * FROM board where id in(${mentions.toString()})`)
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
        board.style,
        JSON.stringify(board.labels),
        JSON.stringify(board.groups),
        JSON.stringify(board.activities),
        JSON.stringify(board.cmpsOrder)
    ]
    try {
        const newBoard = await pool.query(
            `INSERT INTO board(title, archivedat, createdat, "createdby.id", "createdby.fullname", "createdby.imgurl", style, labels, groups, activities, cmpsorder) 
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *`, values)

        await userService.updateMentions(board.createdBy.id, newBoard.rows[0].id)
        return newBoard.rows
    } catch (error) {
        console.log(error)
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
        board.style,
        JSON.stringify(board.labels),
        JSON.stringify(board.groups),
        JSON.stringify(board.activities),
        JSON.stringify(board.cmpsorder)
    ]
    try {
        await pool.query(`UPDATE board SET title = $1, archivedat = $2, createdat = $3, "createdby.id" = $4, "createdby.fullname" = $5, "createdby.imgurl" = $6, style = $7, labels = $8, groups = $9, activities = $10, cmpsorder = $11 WHERE id = ${id}`, values)
        const updatedBoard = await pool.query('SELECT * FROM board WHERE id = $1', [id])
        return updatedBoard.rows[0]
    } catch (error) {
        throw error
    }
}