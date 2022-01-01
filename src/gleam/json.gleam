import gleam/map
import gleam/result
import gleam/option.{None, Option, Some}
import gleam/dynamic.{Dynamic}
import gleam/string_builder.{StringBuilder}

pub external type Json

pub type DecodeError {
  UnexpectedEndOfInput
  UnexpectedByte(byte: String, position: Int)
  UnexpectedSequence(byte: String, position: Int)
}

// TODO: document
// TODO: test
pub external fn decode(String) -> Result(Dynamic, DecodeError) =
  "thoas" "decode"

// TODO: document
// TODO: test
pub external fn to_string(Json) -> String =
  "gleam_json_ffi" "json_to_string"

// TODO: document
// TODO: test
external fn to_string_builder(Json) -> String =
  "thoas_encode" "encode"

// TODO: document
// TODO: test
pub external fn string(input: String) -> Json =
  "thoas_encode" "string"

// TODO: document
// TODO: test
pub external fn bool(input: Bool) -> Json =
  "thoas_encode" "boolean"

// TODO: document
// TODO: test
pub external fn int(input: Int) -> Json =
  "thoas_encode" "integer"

type Null {
  Null
}

// TODO: document
// TODO: test
pub external fn null() -> Json =
  "thoas_encode" "null"

// TODO: document
// TODO: test
// TODO: change argument order
pub fn nullable(input: Option(a), inner: fn(a) -> Json) -> Json {
  case input {
    Some(value) -> inner(value)
    None -> null()
  }
}

// TODO: document
// TODO: test
pub external fn object(entries: List(#(String, Json))) -> Json =
  "thoas_encode" "non_recursive_object"

// TODO: document
// TODO: test
// TODO: rename to array
// TODO: make into a mapping function?
pub external fn list(entries: List(Json)) -> Json =
  "thoas_encode" "non_recursive_array"
