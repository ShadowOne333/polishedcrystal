MACRO movement
	db \2
	dw \1
ENDM

DoMovementFunction:
	push af
	call ApplyMovementToFollower
	pop af
	ld hl, .MovementPointers
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, d
	jp hl

.MovementPointers:
; entries correspond to movement_* constants (see macros/scripts/movement.asm)
	table_width 3
	movement TurnHead,           OW_DOWN                 ; 00
	movement TurnHead,           OW_UP                   ; 01
	movement TurnHead,           OW_LEFT                 ; 02
	movement TurnHead,           OW_RIGHT                ; 03
	movement TurnStep,           OW_DOWN                 ; 04
	movement TurnStep,           OW_UP                   ; 05
	movement TurnStep,           OW_LEFT                 ; 06
	movement TurnStep,           OW_RIGHT                ; 07
	movement NormalStep,         STEP_SLOW << 2 | DOWN   ; 08
	movement NormalStep,         STEP_SLOW << 2 | UP     ; 09
	movement NormalStep,         STEP_SLOW << 2 | LEFT   ; 0a
	movement NormalStep,         STEP_SLOW << 2 | RIGHT  ; 0b
	movement NormalStep,         STEP_WALK << 2 | DOWN   ; 0c
	movement NormalStep,         STEP_WALK << 2 | UP     ; 0d
	movement NormalStep,         STEP_WALK << 2 | LEFT   ; 0e
	movement NormalStep,         STEP_WALK << 2 | RIGHT  ; 0f
	movement NormalStep,         STEP_BIKE << 2 | DOWN   ; 10
	movement NormalStep,         STEP_BIKE << 2 | UP     ; 11
	movement NormalStep,         STEP_BIKE << 2 | LEFT   ; 12
	movement NormalStep,         STEP_BIKE << 2 | RIGHT  ; 13
	movement SlideStep,          STEP_SLOW << 2 | DOWN   ; 14
	movement SlideStep,          STEP_SLOW << 2 | UP     ; 15
	movement SlideStep,          STEP_SLOW << 2 | LEFT   ; 16
	movement SlideStep,          STEP_SLOW << 2 | RIGHT  ; 17
	movement SlideStep,          STEP_WALK << 2 | DOWN   ; 18
	movement SlideStep,          STEP_WALK << 2 | UP     ; 19
	movement SlideStep,          STEP_WALK << 2 | LEFT   ; 1a
	movement SlideStep,          STEP_WALK << 2 | RIGHT  ; 1b
	movement SlideStep,          STEP_RUN << 2 | DOWN    ; 1c
	movement SlideStep,          STEP_RUN << 2 | UP      ; 1d
	movement SlideStep,          STEP_RUN << 2 | LEFT    ; 1e
	movement SlideStep,          STEP_RUN << 2 | RIGHT   ; 1f
	movement TurningStep,        STEP_SLOW << 2 | DOWN   ; 20
	movement TurningStep,        STEP_SLOW << 2 | UP     ; 21
	movement TurningStep,        STEP_SLOW << 2 | LEFT   ; 22
	movement TurningStep,        STEP_SLOW << 2 | RIGHT  ; 23
	movement TurningStep,        STEP_WALK << 2 | DOWN   ; 24
	movement TurningStep,        STEP_WALK << 2 | UP     ; 25
	movement TurningStep,        STEP_WALK << 2 | LEFT   ; 26
	movement TurningStep,        STEP_WALK << 2 | RIGHT  ; 27
	movement TurningStep,        STEP_WALK << 2 | DOWN   ; 28
	movement TurningStep,        STEP_WALK << 2 | UP     ; 29
	movement TurningStep,        STEP_WALK << 2 | LEFT   ; 2a
	movement TurningStep,        STEP_WALK << 2 | RIGHT  ; 2b
	movement JumpStep,           STEP_SLOW << 2 | DOWN   ; 2c
	movement JumpStep,           STEP_SLOW << 2 | UP     ; 2d
	movement JumpStep,           STEP_SLOW << 2 | LEFT   ; 2e
	movement JumpStep,           STEP_SLOW << 2 | RIGHT  ; 2f
	movement JumpStep,           STEP_WALK << 2 | DOWN   ; 30
	movement JumpStep,           STEP_WALK << 2 | UP     ; 31
	movement JumpStep,           STEP_WALK << 2 | LEFT   ; 32
	movement JumpStep,           STEP_WALK << 2 | RIGHT  ; 33
	movement JumpStep,           STEP_BIKE << 2 | DOWN   ; 34
	movement JumpStep,           STEP_BIKE << 2 | UP     ; 35
	movement JumpStep,           STEP_BIKE << 2 | LEFT   ; 36
	movement JumpStep,           STEP_BIKE << 2 | RIGHT  ; 37
	movement RemoveSliding,      0                       ; 38
	movement SetSliding,         0                       ; 39
	movement RemoveFixedFacing,  0                       ; 3a
	movement FixFacing,          0                       ; 3b
	movement ShowObject,         0                       ; 3c
	movement HideObject,         0                       ; 3d
	movement SleepStep,          1                       ; 3e
	movement SleepStep,          2                       ; 3f
	movement SleepStep,          3                       ; 40
	movement SleepStep,          4                       ; 41
	movement SleepStep,          5                       ; 42
	movement SleepStep,          6                       ; 43
	movement SleepStep,          7                       ; 44
	movement SleepStep,          8                       ; 45
	movement LongSleepStep,      0                       ; 46
	movement EndStep,            0                       ; 47
	movement ResumeStep,         0                       ; 48
	movement RemoveObject,       0                       ; 49
	movement LoopStep,           0                       ; 4a
	movement Step4B,             0                       ; 4b
	movement SetStepType,        STEP_TYPE_TELEPORT_FROM ; 4c
	movement SetStepType,        STEP_TYPE_TELEPORT_TO   ; 4d
	movement SetStepType,        STEP_TYPE_SKYFALL       ; 4e
	movement DigStep,            0                       ; 4f
	movement BumpStep,           1                       ; 50
	movement FishingStep,        STEP_TYPE_GOT_BITE      ; 51
	movement FishingStep,        STEP_TYPE_FROM_MOVEMENT ; 52
	movement HideEmote,          0                       ; 53
	movement ShowEmote,          0                       ; 54
	movement ShakeScreenStep,    0                       ; 55
	movement ShakeTree,          24                      ; 56
	movement SmashRock,          0                       ; 57
	movement ReturnDig,          0                       ; 58
	movement SetStepType,        STEP_TYPE_SKYFALL_TOP   ; 59
	movement RunStep,            STEP_RUN << 2 | DOWN    ; 5a
	movement RunStep,            STEP_RUN << 2 | UP      ; 5b
	movement RunStep,            STEP_RUN << 2 | LEFT    ; 5c
	movement RunStep,            STEP_RUN << 2 | RIGHT   ; 5d
	movement NormalStep,         STEP_RUN << 2 | DOWN    ; 5e
	movement NormalStep,         STEP_RUN << 2 | UP      ; 5f
	movement NormalStep,         STEP_RUN << 2 | LEFT    ; 60
	movement NormalStep,         STEP_RUN << 2 | RIGHT   ; 61
	movement DiagonalStairsStep, STEP_WALK << 2 | DOWN   ; 62
	movement DiagonalStairsStep, STEP_WALK << 2 | UP     ; 63
	movement DiagonalStairsStep, STEP_WALK << 2 | LEFT   ; 64
	movement DiagonalStairsStep, STEP_WALK << 2 | RIGHT  ; 65
	movement ShakeExeggutor,     64                      ; 66
	movement NormalStep,         STEP_WALK << 2 | RIGHT  ; 67
	assert_table_length NUM_MOVEMENT_CMDS

SetStepType:
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], a
	ret

DigStep:
	call GetSpriteDirection
	rlca
	rlca
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_SPIN
	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ld hl, OBJECT_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

ReturnDig:
	call GetSpriteDirection
	rlca
	rlca
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], a
	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_RETURN_DIG
	ret

FishingStep:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_FISHING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], a
	ret

SmashRock:
	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STAND
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_ROCK_SMASH
	ret

ResumeStep:
EndStep:
	call RestoreDefaultMovement
	ld hl, OBJECT_MOVEMENT_TYPE
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_MOVEMENT_INDEX
	add hl, bc
	ld [hl], $0

	ld hl, wStateFlags
	res SCRIPTED_MOVEMENT_STATE_F, [hl]

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_FROM_MOVEMENT
	ret

RemoveObject:
	call DeleteMapObject
	ld hl, wObjectFollow_Leader
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr nz, .not_leading
	ld [hl], -1

.not_leading
	ld hl, wStateFlags
	res SCRIPTED_MOVEMENT_STATE_F, [hl]
	ret

Step4B:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STAND

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_STANDING

	ld hl, wStateFlags
	res SCRIPTED_MOVEMENT_STATE_F, [hl]
	ret

LongSleepStep:
	call JumpMovementPointer
	; fallthrough
SleepStep:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STAND

	ld hl, OBJECT_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

BumpStep:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_BUMP

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_BUMP

	ld hl, OBJECT_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

ShakeExeggutor:
	ld d, OBJECT_ACTION_SHAKE_EXEGGUTOR
	jr _ShakeStep

ShakeTree:
	ld d, OBJECT_ACTION_WEIRD_TREE
_ShakeStep:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], d

	ld hl, OBJECT_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

LoopStep:
	ld hl, OBJECT_MOVEMENT_INDEX
	add hl, bc
	ld [hl], $0
	jmp ContinueReadingMovement

RemoveSliding:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res SLIDING_F, [hl]
	jmp ContinueReadingMovement

SetSliding:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set SLIDING_F, [hl]
	jmp ContinueReadingMovement

RemoveFixedFacing:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res FIXED_FACING_F, [hl]
	jmp ContinueReadingMovement

FixFacing:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set FIXED_FACING_F, [hl]
	jmp ContinueReadingMovement

ShowObject:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res INVISIBLE_F, [hl]
	jmp ContinueReadingMovement

HideObject:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set INVISIBLE_F, [hl]
	jmp ContinueReadingMovement

HideEmote:
	call DespawnEmote
	jmp ContinueReadingMovement

ShowEmote:
	call SpawnEmote
	jmp ContinueReadingMovement

ShakeScreenStep:
	call JumpMovementPointer
	call ShakeScreen
	jmp ContinueReadingMovement

TurnHead:
	ld hl, OBJECT_DIRECTION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STAND

	ld hl, OBJECT_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

TurnStep:
	ld hl, OBJECT_1D ; new facing
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STEP

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TURN
	ret

RunStep:
	ld d, OBJECT_ACTION_RUN
	jr _ContinueStep

NormalStep:
	ld d, OBJECT_ACTION_STEP
	; fallthrough
_ContinueStep:
	push de
	call InitStep
	call UpdateTallGrassFlags
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STEP
	pop de
	ld [hl], d

	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit INVISIBLE_F, [hl]
	jr nz, SetWalkStepType

	ld hl, OBJECT_TILE_COLLISION
	add hl, bc
	ld a, [hl]
	cp COLL_LONG_GRASS
	jr z, .shake_grass
	cp COLL_TALL_GRASS
	jr z, .shake_grass
	cp COLL_PUDDLE
	call z, SplashPuddle
	jr SetWalkStepType

.shake_grass
	call ShakeGrass
SetWalkStepType:
	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret nz
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret

TurningStep:
	call InitStep
	call UpdateTallGrassFlags

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_SPIN
	jr SetWalkStepType

SlideStep:
	call InitStep
	call UpdateTallGrassFlags

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STAND
	jr SetWalkStepType

JumpStep:
	call InitStep
	ld hl, OBJECT_JUMP_HEIGHT
	add hl, bc
	ld [hl], $0

	ld hl, OBJECT_FLAGS2
	add hl, bc
	res IN_GRASS_F, [hl]

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STEP

	call SpawnShadow

	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_JUMP
	ret nz
	ld [hl], STEP_TYPE_PLAYER_JUMP
	ret

DiagonalStairsStep:
	call InitStep
	ld hl, OBJECT_JUMP_HEIGHT
	add hl, bc
	ld [hl], $0

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STEP

	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_STAIRS
	ret nz
	ld [hl], STEP_TYPE_PLAYER_STAIRS
	ret
