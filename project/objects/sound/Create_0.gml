volumeSound = 1
volumeMusic = 1

function playSoundEffect(index) {
	
	if index == snd_fingersnap {
		var randomPitch = random_range(0.5,1.5)
		audio_sound_pitch(snd_fingersnap,randomPitch)
	}
	
	audio_play_sound(index, 0, false)
	audio_sound_gain(index, volumeSound, 0)
	debug.log("Playing sound: " + string_upper(string(audio_get_name(index))))
}