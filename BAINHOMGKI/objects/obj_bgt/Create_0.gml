audio_stop_sound(BGMS);

if (!audio_is_playing(BGMT)) {
    audio_play_sound(BGMT, 100, true);
}