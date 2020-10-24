extends Node

var currentMap
var currentColor
enum {white,green,blue,red,yellow,orange}

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
