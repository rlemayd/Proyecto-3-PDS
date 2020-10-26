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

var currentGames = {}

var cellColors = ["whiteCells","greenCells","blueCells","redCells","yellowCells","orangeCells"]
var winColors = ["Wins_With_Green","Wins_With_Blue","Wins_With_Red","Wins_With_Yellow","Wins_With_Orange"]
var positions = [[1,5],[5,1],[5,5],[3,3]]

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

#Mapa 11x11 cuadrado
var map2 = {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
				"6": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
				"7": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
				"8": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
				"9": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
				"10": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
				"11": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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

#Mapa 7x7 cuadrado
var map3 = {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
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
				"6": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
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
				"7": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
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

#Mapa 11x11 Rombo
var map4 = {
				"1": {
						"mapValue":
						{
							"fields":
							{
								"6": {
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
								"5": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
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
				"6": {
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"11": {
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
				"7": {
						"mapValue":
						{
							"fields":
							{
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"10": {
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
				"8": {
						"mapValue":
						{
							"fields":
							{
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"9": {
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
				"9": {
						"mapValue":
						{
							"fields":
							{
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
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"8": {
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
				"10": {
						"mapValue":
						{
							"fields":
							{
								"5": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"6": {
										"mapValue":
										{
											"fields":
											{
												"color": {"integerValue": 0},
												"power": {"integerValue": 0}
											}
										}
									},
								"7": {
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
				"11": {
						"mapValue":
						{
							"fields":
							{
								"6": {
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

func getMap():
	currentMap = map1
	return currentMap
