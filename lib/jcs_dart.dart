/// Cryptographic operations like hashing and signing depend on that the target data does not change during serialization, transport, or parsing.
/// By applying the rules defined by JCS (JSON Canonicalization Scheme), data provided in the JSON [RFC8259] format can be exchanged "as is", while still being subject to secure cryptographic operations.
/// JCS achieves this by building on the serialization formats for JSON primitives as defined by ECMAScript [ES], constraining JSON data to the I-JSON [RFC7493] subset, and through a platform independent property sorting scheme.
/// Public RFC: https://tools.ietf.org/html/rfc8785
/// Main Repository: https://github.com/cyberphone/json-canonicalization
///
/// More dartdocs go here.
library jcs_dart;

export 'src/jcs_dart_base.dart';

// TODO: Export any libraries intended for clients of this package.
