const boardService = require('./board.service')

module.exports = {
    getBoards,
    getBoardById,
    addBoard,
    updateBoard,
    removeBoard
}

async function getBoards(req, res) {
    try {
        const user = req.query
        const boards = await boardService.query(user.boardmentions)
        res.json(boards)
    } catch (error) {
        res.status(500).send({ error: 'Failed to get all boards' })
    }
}

async function getBoardById(req, res) {
    try {
        const { id } = req.params
        const board = await boardService.getById(id)
        res.json(board)
    } catch (error) {
        res.status(500).send({ error: 'Failed to get board' })
    }
}

async function addBoard(req, res) {
    try {
        const board = req.body
        const newBoard = await boardService.add(board)
        res.json(newBoard)
    } catch (error) {
        res.status(500).send({ error: 'Failed to add new board' })
    }
}

async function updateBoard(req, res) {
    try {
        const board = req.body
        const { id } = req.params
        const updatedBoard = await boardService.update(board, id)
        res.json(updatedBoard)
    } catch (error) {
        res.status(500).send({ error: 'Failed to update board' })
    }
}

async function removeBoard(req, res) {
    try {
        const { id } = req.params
        const removedBoard = await boardService.remove(id)
        res.send(removedBoard)
    } catch (error) {
        res.status(500).send({ error: 'Failed to remove board' })
    }
}