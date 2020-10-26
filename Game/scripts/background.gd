extends Node

var currentMap = {}
var currentColor = 0
var currentPosition = {}
var currentPlayers = {}
var currentGameCode = 0
var currentPlayerData = {}
var currentGameData = {}

var currentGames = {}

var cellColors = ["whiteCells","greenCells","blueCells","redCells","yellowCells","orangeCells"]
var winColors = ["Wins_With_Green","Wins_With_Blue","Wins_With_Red","Wins_With_Yellow","Wins_With_Orange"]
var positions = [[1,5],[5,1],[5,5],[3,3]]


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
									}
							}
						}
					}
			}

func getMap():
	currentMap = map1
	return currentMap
