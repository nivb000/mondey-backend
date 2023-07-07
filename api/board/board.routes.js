const express = require('express')
const { getBoards, getBoardById, addBoard, updateBoard, removeBoard } = require('./board.controller')
const requireAuth = require('../../middlewares/requireAuth.middleware')
const router = express.Router()

module.exports = router

router.get('/', requireAuth, getBoards)
router.get('/:id', requireAuth, getBoardById)
router.post('/', requireAuth, addBoard)
router.put('/:id', requireAuth, updateBoard)
router.delete('/:id', requireAuth, removeBoard)