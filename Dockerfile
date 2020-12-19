FROM node:14.15.1-alpine3.12 AS build
WORKDIR /src
COPY . .
RUN yarn

FROM node:14.15.1-alpine3.12 AS final
COPY --from=build /src /app
WORKDIR /app
ENV NODE_OPTIONS=
RUN chmod +x entrypoint.sh

EXPOSE 4000
CMD ["./entrypoint.sh"]