extends Node

const API_KEY := "AIzaSyBpOev_MRnacUIsZG4Rg5ka05zvg2HnFZI"
const PROJECT_ID := "proyecto3-pds"

const REGISTER_URL := "https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=%s" % API_KEY
const LOGIN_URL := "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=%s" % API_KEY
const FIRESTORE_URL := "https://firestore.googleapis.com/v1/projects/%s/databases/(default)/documents/" % PROJECT_ID

var user_info := {}
var profile := {"email": {},
				"stats":{}
				}


func _get_user_info(result: Array) -> Dictionary:
	var result_body := JSON.parse(result[3].get_string_from_ascii()).result as Dictionary
	return {
		"token" : result_body.idToken,
		"id" : result_body.localId
	}


func _get_request_headers() -> PoolStringArray:
	return PoolStringArray([
		"Content-Type: application/json",
		"Authorization: Bearer %s" % user_info.token
	])

func register(email: String, password: String, http: HTTPRequest) -> void:
	var body := {
		"email": email,
		"password": password,
	}
	http.request(REGISTER_URL, [], false, HTTPClient.METHOD_POST, to_json(body))
	var result := yield(http, "request_completed") as Array
	var fields = {
		"Matches_Won": {"integerValue": 0},
		"Matches_Lost": {"integerValue": 0},
		"Matches_Tied": {"integerValue": 0},
		"Cells_Painted": {"integerValue": 0},
		"Wins_With_Red": {"integerValue": 0},
		"Wins_With_Blue": {"integerValue": 0},
		"Wins_With_Green": {"integerValue": 0},
		"Wins_With_Yellow": {"integerValue": 0},
		"Wins_With_Orange": {"integerValue": 0},
		"Maximum_Painted_Cells_In_Match": {"integerValue": 0},
		"Avg_Painted_Cells_Per_Match": {"integerValue": 0}
	}
	if result[1] == 200:
		user_info = _get_user_info(result)
		save_document("users?documentId=%s" % email, fields, http)

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
	
func up_document(path: String, fields: Dictionary, http: HTTPRequest) -> void:
	var document := { "fields": fields }
	var body := to_json(document)
	var url := FIRESTORE_URL + path
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_PUT, body)


func delete_document(path: String, http: HTTPRequest) -> void:
	var url := FIRESTORE_URL + path
	http.request(url, _get_request_headers(), false, HTTPClient.METHOD_DELETE)
