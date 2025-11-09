import asyncdispatch, httpclient, json, strutils

const api = "https://tempmailer.org/api/v1"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "Host": "tempmailer.org",
    "Content-Type": "application/json",
    "accept": "application/json, text/plain, */*"
  })


proc get_messages*(email:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.get(api & "/addresses/" & email & "/emails")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc create_email*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  try:
    client.headers = headers
    let response = await client.post(api & "/addresses",body = "")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
