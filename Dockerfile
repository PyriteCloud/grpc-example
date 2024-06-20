FROM chainguard/rust:latest-dev as build

USER root
RUN apk add --no-cache protoc

WORKDIR /work

USER nonroot

COPY --chown=nonroot:nonroot . .
RUN cargo build --locked --release

FROM chainguard/glibc-dynamic:latest

COPY --from=build --chown=nonroot:nonroot /work/target/release/grpc-example /usr/local/bin/grpc-example

ENTRYPOINT ["/usr/local/bin/grpc-example"]