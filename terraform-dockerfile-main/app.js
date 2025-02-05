const express = require('express');
const path = require('path');

const app = express();
const PORT = 80;

// ให้ Express เสิร์ฟไฟล์ static (index.html)
app.use(express.static(path.join(__dirname)));

app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`);
});
