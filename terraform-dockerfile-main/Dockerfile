FROM node:18

WORKDIR /usr/src/app

COPY package.json ./
RUN npm install express  # ติดตั้ง express

COPY app.js ./app.js
COPY index.html ./index.html

EXPOSE 80

CMD ["node", "app.js"]
