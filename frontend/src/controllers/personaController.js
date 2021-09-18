const controller = {};

controller.list = (req, res) => {
    req.getConnection((err, conn) =>{
        conn.query('SELECT * FROM persona', (err, personas) =>{
            if (err) {
                res.json(err);
            }
            console.log(personas);
            res.render('persona', {
                data: personas
            });
        });
    });
};

controller.save = (req, res) => {
    const data = req.body;
    req.getConnection((err, conn) =>{
        conn.query('INSERT INTO persona set ?', [data], (err, persona) => {
            res.redirect('/');
        });
    })
};

controller.delete = (req, res) => {
    const { id } = req.params;

   req.getConnection((err, conn) => {
      conn.query('DELETE FROM persona WHERE id = ?', [id], (err, rows) => {
        res.redirect('/');
      });
   })
};

module.exports = controller;