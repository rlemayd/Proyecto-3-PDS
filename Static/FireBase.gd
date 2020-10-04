extends Node

const API_KEY := "AIzaSyBpOev_MRnacUIsZG4Rg5ka05zvg2HnFZI"
const PROJECT_ID := "proyecto3-pds"

const REGISTER_URL := "https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=%s" % API_KEY
const LOGIN_URL := "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=%s" % API_KEY
const FIRESTORE_URL := "https://firestore.googleapis.com/v1/projects/%s/databases/(default)/documents/" % PROJECT_ID

var user_info := {}
var profile := {"email": {}}


func _get_user_info(result: Array) -> Dictionary:
	var result_body := JSON.parse(result[3].get_string_from_ascii()).result as Dictionary
	return {
		"token" : result_body.idToken,
		"id" : result_body.localId
	}


func _get_request_headers() -> PoolStringArray:
	return PoolStringArray([
		"Content-Type: application/json",
		"Authorization: Bearer %s" % "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCezK6vxPGKofqc\nwPirQz/gXXqlwJwljDzNV5ye5OoT8/X1Ri/m4VACDIoyfp1MalIswT8NDSjarwch\nyRox/aam2auP/tbEOKxfO5rLhGlS7ilDpwpwJ/z8s11TvCIre/UcO/epYWWzvWnD\nYg9qwFHBhJRKv0XDoubVUn89ga/b+6dCq9kxlCdwQZ9zJDAR6dkPRoLZIBjOKAeu\nb61ZsDo9/2eeeWPz8aLVONwz0nmZSTDcP0KMnXG0YR96wQeHlIK0LrYN8HeopXu+\n2feZPTBQPXBPVAvp3W2YNKEfxLNNlAYnd+HWT2cdR6WbVEwsJAqp0JMF6zwyfPjT\nxVR3cR2zAgMBAAECggEAOxVs6XkdZbdex3QFEbOz0Ib3WzSO5GmJNd2jKHuDnGjo\n2pmCuSSb4CdKQ/9YB1aHvJ8qFnEPAk6dGLT6Sh9WIj5a1vi6b8emWsiSj6Z0iaaT\nM9iyyYgXWO5jiwQ0snkseZTWUO8sJ/QRpeCWW+GyiY4KnsUL7/5sZHKNZRUbmX0y\nU04RxJNvGCBM3ZrcW9UsdUI/d1fzmEGFBAuyAvaLbtb0wCuPhGt9Ny4ap7IdB6J3\nYGEkmcxwsKGDXXIu4/wvSeGcYj7WZd84vthhgevriWBKDxETM30yatgWBdhl57Tj\nzkCJxteJit2mu72edrtwF6bHaceONe2wOUEFGFaWAQKBgQDSOF2qe+zRSF+7mJYC\nCjKmjKLDR87/QCg5xxY2XYtjYUCK88SoJR2WsBwl9O4mxgWKGSS/o+VdF8H4b4b/\n07fO8MnMvwclTHqRykZyLeEMEkSBB77hs7ScWIcQkeeiHDo9NzkT4OUnji1VDoz1\n7hb09uHDIdPTEPgSO3EyzWDMtQKBgQDBYaZ8dMJXttbAQ6EOjDwmTmlo9S+5ovFj\nArj7MtCy27Zs4s7GDgp0mZIcJeWeJT5JVf7pF+kFMECJ05E/6SnFK10eWWBT/YlV\nJXJB854vGuiayv5LwmrwaI35uxEEbN60E3muTRYWNf+W1aLHPx99pUEhsN5hxCp2\npewAeWUpxwKBgDJm40Y52ii/YnyW8/hfO4+lDm0lrWKTnlFkA1ZbjUzxh0kJczAh\nXfvAE6+iDutq9O8MYjw0boyoYpBPJR33RA2wu6GEd5Egyg5kYgmEKH39b0FEeyag\nMIB/1TpK0S+T9v6wW9YBSM/4DbRj/bYFNKnc+3oOhTwIyIGOkPBuP3Q1AoGAB3Qa\nFKXzb6oOcO6qYIMrNlbDXVZF9qO/Jg/OzW/R93Lcfynmyl90K7ZXmVoklYnd8rmr\nz5QqWRbZBfbvnEUCZSUcu7S6L8KP7oY49y3KpQomeQDl+EmQEaAWCNAbAc6obsxp\nXjx+Y3DFXyzwzzkxn4glEIVerOoAsP4IMKR9L7UCgYACWqjkmUb0xQ1DVHfY6MhX\nS7LK1xCuCxGAWYh4yAht8VK9TcLZqHXIX/fZIsHEdqqjSMEi7b0O+2mRZEHOcWoC\nXVlp36s58G0rKmukksuRJsJGyZlvJ1MX9woJkJjOK4Lr1Z0tI3bbovl+Kdq5JOZ+\nZxN/k02d7gwZtFIf8mTu0w=="
	])

func register(email: String, password: String, http: HTTPRequest) -> void:
	var body := {
		"email": email,
		"password": password,
	}
	http.request(REGISTER_URL, [], false, HTTPClient.METHOD_POST, to_json(body))
	var result := yield(http, "request_completed") as Array
	if result[1] == 200:
		user_info = _get_user_info(result)
		save_document("users?documentId=%s" % email, {}, http)


func login(email: String, password: String, http: HTTPRequest) -> void:
	var body := {
		"email": email,
		"password": password,
		"returnSecureToken": true
	}
	http.request(LOGIN_URL, [], false, HTTPClient.METHOD_POST, to_json(body))
	var result := yield(http, "request_completed") as Array
	if result[1] == 200:
		profile.email = email
		user_info = _get_user_info(result)


func save_document(path: String, fields: Dictionary, http: HTTPRequest) -> void:
	var document := { "fields": fields }
	var body := to_json(document)
	var url := FIRESTORE_URL + path
	print(url)
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_POST, body)


func get_document(path: String, http: HTTPRequest):
	var url := FIRESTORE_URL + path
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_GET)
	
func query(path: String, http: HTTPRequest):
	var url := FIRESTORE_URL + path +":runQuery?key=%s"%API_KEY
	
	var q = {
		"structuredQuery": {}
	} 
	
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_POST,to_json(q))


func update_document(path: String, fields: Dictionary, http: HTTPRequest) -> void:
	var document := { "fields": fields }
	var body := to_json(document)
	var url := FIRESTORE_URL + path
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_PATCH, body)


func delete_document(path: String, http: HTTPRequest) -> void:
	var url := FIRESTORE_URL + path
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_DELETE)
	
func test(path: String, http: HTTPRequest):
	var url := FIRESTORE_URL+"friends/b@b.com:listCollectionIds?key=%s"%API_KEY
	print(url)
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_POST,to_json({}))
