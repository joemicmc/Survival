class_name InputActions
extends Node

const UI_DOWN := "ui_down"
const UI_UP := "ui_up"
const UI_ACCEPT := "ui_accept"
const DPAD_LEFT := "dpad_left"
const DPAD_RIGHT := "dpad_right"
const DPAD_UP := "dpad_up"
const DPAD_DOWN := "dpad_down"
const LEFT_STICK := "left_stick"
const RIGHT_STICK := "right_stick"
const LEFT_TRIGGER := "left_trigger"
const RIGHT_TRIGGER := "right_trigger"
const LEFT_SHOULDER := "left_shoulder"
const RIGHT_SHOULDER := "right_shoulder"
const LEFT_ACTION := "left_action"
const RIGHT_ACTION := "right_action"
const TOP_ACTION := "top_action"
const BOTTOM_ACTION := "bottom_action"
const START := "start"
const BACK := "back"

const BUTTONS: Array[String] = [
	DPAD_LEFT,
	DPAD_RIGHT,
	DPAD_UP,
	DPAD_DOWN,
	LEFT_STICK,
	RIGHT_STICK,
	LEFT_TRIGGER,
	RIGHT_TRIGGER,
	LEFT_SHOULDER,
	RIGHT_SHOULDER,
	LEFT_ACTION,
	RIGHT_ACTION,
	TOP_ACTION,
	BOTTOM_ACTION,
	START,
	BACK]

const VECTORS: Array[String] = [
	LEFT_STICK,
	RIGHT_STICK]

const UI: Dictionary = {
	DPAD_UP: UI_UP,
	DPAD_DOWN: UI_DOWN,
	BOTTOM_ACTION: UI_ACCEPT}
