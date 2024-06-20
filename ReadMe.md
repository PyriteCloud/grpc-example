# gRPC Example (Rust)

## Commands

```bash
grpccurl -plaintext -proto ./proto/calculator.proto -d '{"a":2,"b":3}' "0.0.0.0:50051" calculator.Calculator.Add
```

```bash
grpccurl -plaintext -d '{"a":2,"b":3}' "0.0.0.0:50051" calculator.Calculator.Add
```