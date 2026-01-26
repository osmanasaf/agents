# Java Rules

- Prefer immutability: records for data carriers, final fields, defensive copies for mutable state.
- Use sealed types and pattern matching; prefer switch expressions.
- Use virtual threads for I/O-bound work.
- Strings: text blocks for multiline, `String.formatted()` over `String.format()`.
- Collections: `List.of/Set.of/Map.of`, `Stream.toList()`; avoid mutable exposure.
- Optional: use for return types only; never as params; validate with `Objects.requireNonNull`.
- Date/time: `java.time` only; `Instant` for timestamps, `LocalDate` for dates.
- API stability: prefer extension over breaking public contracts.
