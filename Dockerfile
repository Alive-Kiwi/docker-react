#BUILD PHASE

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <---- all the stuff we care about

# RUN PHASE

#ngnix start by default when we build ngnix
FROM nginx
#I WANT TO COPY SOMETHIN FROM BUILDER PHASE, 
# <THEN SPECIFY THE FOLDER WE WANT TO COPY>
# <THEN FOLDER WE WANT TO COPY YO>
COPY --from=builder /app/build /usr/share/nginx/html
