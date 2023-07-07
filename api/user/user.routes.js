const express = require('express')
const { requireAuth, requireAdmin } = require('../../middlewares/requireAuth.middleware')
const { getUser, getUsers, deleteUser, updateUser, getUserByEmail } = require('./user.controller')
const router = express.Router()

module.exports = router

router.get('/', getUsers)
router.get('/byemail/', getUserByEmail)
router.get('/:id', getUser)
router.put('/:id', updateUser)
// router.delete('/:id', requireAuth, requireAdmin, deleteUser)