extends Node

var currentMap = {}
var currentColor = 0
var currentPosition = {}
var currentPlayers = {}
var currentGameCode = 0
var currentPlayerData = {}
var currentGameData = {}

#No estoy seguro si sería asi
var playerPressed = ""
var positions = []

var currentGames = {}

var cellColors = ["whiteCells","greenCells","blueCells","redCells","yellowCells","orangeCells"]
var winColors = ["Wins_With_Green","Wins_With_Blue","Wins_With_Red","Wins_With_Yellow","Wins_With_Orange"]

func generate_pos():
	positions = [[1,int(currentGameData["mapDim"]["integerValue"])],[int(currentGameData["mapDim"]["integerValue"]),1],[int(currentGameData["mapDim"]["integerValue"]),int(currentGameData["mapDim"]["integerValue"])],[ceil(int(currentGameData["mapDim"]["integerValue"])/2),ceil(int(currentGameData["mapDim"]["integerValue"])/2)]]

func generate_map(x):
	var map = {}
	for i in range(1, x + 1):
		var map2 = {}
		for j in range(1,x+1):
			map2[String(j)] = {
									"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
								}
		map[String(i)] = {
							"mapValue":
							{
								"fields":
									map2
							}		
						}
	return map

#Mapa de 5x5 cuadrado
var map1 = {
				"1": {
						"mapValue":
						{
							"fields":
							{
								"1": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"2": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"3": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"4": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"5": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									}
							}
						}
					},
				"2": {
						"mapValue":
						{
							"fields":
							{
								"1": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"2": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"3": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"4": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"5": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									}
							}
						}
					},
				"3": {
						"mapValue":
						{
							"fields":
							{
								"1": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"2": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"3": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"4": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"5": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									}
							}
						}
					},
				"4": {
						"mapValue":
						{
							"fields":
							{
								"1": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"2": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"3": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"4": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"5": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									}
							}
						}
					},
				"5": {
						"mapValue":
						{
							"fields":
							{
								"1": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"2": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"3": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"4": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"5": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									}
							}
						}
					}
			}

func getMap(x):
	
	currentMap = generate_map(x)
	return currentMap
