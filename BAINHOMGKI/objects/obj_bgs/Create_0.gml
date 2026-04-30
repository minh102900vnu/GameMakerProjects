audio_stop_sound(BGMT);

if (!audio_is_playing(BGMS)) {
    audio_play_sound(BGMS, 100, true);
}