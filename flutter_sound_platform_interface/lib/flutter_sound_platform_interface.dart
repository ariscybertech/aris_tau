

/*
 * Copyright 2018, 2019, 2020 Dooboolab.
 *
 * This file is part of Flutter-Sound.
 *
 * Flutter-Sound is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License version 3 (LGPL-V3), as published by
 * the Free Software Foundation.
 *
 * Flutter-Sound is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Flutter-Sound.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';



enum Codec {
  // this enum MUST be synchronized with fluttersound/AudioInterface.java
  // and ios/Classes/FlutterSoundPlugin.h

  /// This is the default codec. If used
  /// Flutter Sound will use the files extension to guess the codec.
  /// If the file extension doesn't match a known codec then
  /// Flutter Sound will throw an exception in which case you need
  /// pass one of the known codec.
  defaultCodec,

  /// AAC codec in an ADTS container
  aacADTS,

  /// OPUS in an OGG container
  opusOGG,

  /// Apple encapsulates its bits in its own special envelope
  /// .caf instead of a regular ogg/opus (.opus).
  /// This is completely stupid, this is Apple.
  opusCAF,

  /// For those who really insist about supporting MP3. Shame on you !
  mp3,

  /// VORBIS in an OGG container
  vorbisOGG,

  /// Linear 16 PCM, without envelope
  pcm16,

  /// Linear 16 PCM, which is a Wave file.
  pcm16WAV,

  /// Linear 16 PCM, which is a AIFF file
  pcm16AIFF,

  /// Linear 16 PCM, which is a CAF file
  pcm16CAF,

  /// FLAC
  flac,

  /// AAC in a MPEG4 container
  aacMP4,

  /// AMR-NB
  amrNB,

  /// AMR-WB
  amrWB,

  /// Raw PCM Linear 8
  pcm8,

  /// Raw PCM with 32 bits Floating Points
  pcmFloat32,

  /// PCM with a WebM format
  pcmWebM,

  /// Opus with a WebM format
  opusWebM,

  /// Vorbis with a WebM format
  vorbisWebM,
}


enum SessionCategory {
  ambient,
  multiRoute,
  playAndRecord,
  playback,
  record,
  soloAmbient,
  audioProcessing,
}


enum SessionMode
{
  modeDefault, // 'AVAudioSessionModeDefault',
  modeGameChat, //'AVAudioSessionModeGameChat',
  modeMeasurement, //'AVAudioSessionModeMeasurement',
  modeMoviePlayback, //'AVAudioSessionModeMoviePlayback',
  modeSpokenAudio, //'AVAudioSessionModeSpokenAudio',
  modeVideoChat, //'AVAudioSessionModeVideoChat',
  modeVideoRecording, // 'AVAudioSessionModeVideoRecording',
  modeVoiceChat, // 'AVAudioSessionModeVoiceChat',
  modeVoicePrompt, // 'AVAudioSessionModeVoicePrompt',
}

/// Control the focus mode.
enum AudioFocus {
  requestFocus,

  /// request focus and allow other audio
  /// to continue playing at their current volume.
  requestFocusAndKeepOthers,

  /// request focus and stop other audio playing
  requestFocusAndStopOthers,

  /// request focus and reduce the volume of other players
  /// In the Android world this is know as 'Duck Others'.
  requestFocusAndDuckOthers,

  /// Probably not to be used
  requestFocusAndInterruptSpokenAudioAndMixWithOthers,

  /// Probably not to be used
  requestFocusTransient,

  /// Probably not to be used
  requestFocusTransientExclusive,

  /// relinquish the audio focus.
  abandonFocus,

  /// Deprecated. Do not use
  doNotRequestFocus,
}

enum AudioDevice {
  speaker,
  // allowHeadset and allowEarPiece are the same behaviour on both Android and iOS
  headset,
  earPiece,
  blueTooth,
  // only for iOS, Android do the same as allowBlueTooth
  blueToothA2DP,
  // only for iOS, Android do nothing
  airPlay
}


// Audio Flags
// -----------
const outputToSpeaker = 1;
const allowHeadset = 2;
const allowEarPiece = 4;
const allowBlueTooth = 8;
const allowAirPlay = 16;
const allowBlueToothA2DP = 32;


/*
final List<String> iosSessionCategory = [
  'AVAudioSessionCategoryAmbient',
  'AVAudioSessionCategoryMultiRoute',
  'AVAudioSessionCategoryPlayAndRecord',
  'AVAudioSessionCategoryPlayback',
  'AVAudioSessionCategoryRecord',
  'AVAudioSessionCategorySoloAmbient',
];

 */

// Values for AUDIO_FOCUS_GAIN on Android
enum AndroidFocusGain {
  defaultFocusGain,
  audioFocusGain,
  audioFocusGainTransient,
  audioFocusGainTransientMayDuck,
  audioFocusGainTransientExclusive,
}

// Options for setSessionCategory on iOS
const int iosMixWithOthers = 0x1;
const int iosDuckOthers = 0x2;
const int iosInterruptSpokenAudioAndMixWithOthers = 0x11;
const int iosAllowBluetooth = 0x4;
const int iosAllowBluetoothA2DP = 0x20;
const int iosAllowAirplay = 0x40;
const int iosDefaultToSpeaker = 0x8;

