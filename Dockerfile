FROM node:20-alpine AS builder
WORKDIR /app
# Copy package files first to leverage Docker cache
COPY app/package.json app/yarn.lock ./
# Install ONLY production dependencies needed for the final image
# Using --production here saves space if you don't need devDeps for building
RUN yarn install --production --frozen-lockfile
# Copy source code
COPY app/src ./src

# ---- Production Stage ----
FROM node:20-alpine AS production
WORKDIR /app
# Copy necessary artifacts from the builder stage
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src 
COPY app/package.json ./

# Expose port
EXPOSE 8081

# Command to run the application
CMD [ "node", "src/index.js" ]