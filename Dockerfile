# 1. Use an official Node.js runtime as the base image
FROM node:20-alpine

# 2. Set the working directory in the container
WORKDIR /app

# 3. Copy the package.json and package-lock.json first to leverage Docker's caching
COPY package.json package-lock.json ./

# 4. Install the dependencies
RUN npm install

# 5. Copy the rest of the project files
COPY . .

# 6. Build the Next.js project (with Tailwind CSS if applicable)
RUN npm run build

# 7. Expose the port Next.js runs on (3000)
EXPOSE 3000

# 8. Start the Next.js app in production mode
CMD ["npm", "run", "start"]

