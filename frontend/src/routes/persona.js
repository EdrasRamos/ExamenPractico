const express =require('express');
const router = express.Router();

const personaController = require('../controllers/personaController');

router.get('/', personaController.list);
router.post('/add', personaController.save);
router.get('/delete/:id', personaController.delete);


module.exports = router;