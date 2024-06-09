'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"manifest.json": "f850cb7471a63e909fd39d7f53e63fc6",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"main.dart.js": "7dcad90b6c8f9283f1bcd762c5ac1268",
"assets/AssetManifest.bin.json": "b9d09dfb44422c6bbbecc7825905be34",
"assets/AssetManifest.json": "221e35dba1ec0ffefcb592d15a874d0c",
"assets/AssetManifest.bin": "7654a3e6151e6bc665976c1128dc10bd",
"assets/images/Q3.4.png": "9fa1215e5a80b7c292029e5d3dc9c89c",
"assets/images/google.png": "1d46700a12739f696df407b6221c2a20",
"assets/images/c22.jpg": "4e955055296ac599c4be48387b01a917",
"assets/images/b2.jpg": "a80e083ee173f044fb48211093cb9b09",
"assets/images/epic_gamer.jpg": "8bba0d6f724b7be8253a5e35d6d66a86",
"assets/images/man.png": "7dfe6cc41c1fb47800c69628178dc729",
"assets/images/p3.jpg": "49a02a1ebdb2c8bff2256e81003df7be",
"assets/images/acc.png": "ac323e7635e33157ecafe0089c40c74e",
"assets/images/p44.png": "3c4778a0c85cbd06ac4f7abd43d77227",
"assets/images/ambitabh.jpg": "80ea9410d2b6a05082ac47fa35e18d39",
"assets/images/P4.png": "d16c2a0227c9938fae5704ce0723018d",
"assets/images/c2.jpg": "117cf8a74d9ec5c77509f75bea373dd4",
"assets/images/P42.png": "5d6616be3a5020aa9a07c1564bfb197e",
"assets/images/c24.jpg": "2459eec9621ab8025ebf41f558346048",
"assets/images/boy.png": "388e4750f57154375bf51458a361254b",
"assets/images/mahatma.jpg": "a759ff589dc55869b9a96c75324b5957",
"assets/images/p2.jpg": "6ead493893cf4f22e22e4994710f0425",
"assets/images/NICEPNG.png": "48e226908abb4993e30d3f4f1d566c72",
"assets/images/amit.jpg": "34a416289386c2be85d8bf4bbf742857",
"assets/images/a2.jpg": "9d4b4f0ab5c3e108891a475e61ba53b8",
"assets/images/ghosts.png": "f010e93826e50fa1e404b4dd6dffeb71",
"assets/images/avatar_main.jpg": "a88628d107ebc391300dd527cdf59606",
"assets/images/d2.jpg": "ed2f9ad46982aae810b7f8d53e0893cd",
"assets/images/LATA.jpg": "012e2a340715d46451408927a7a578b2",
"assets/images/p51.png": "afc0cc6c27c810851e73048fdd827be9",
"assets/images/notes.png": "9c4238c111580dd629b41095bcdce23e",
"assets/images/p43.png": "e958d19aac8da5140bf985c8386b9982",
"assets/images/game.jpg": "8bba0d6f724b7be8253a5e35d6d66a86",
"assets/images/idea.png": "c302742e6a88d35797b0157e75eb115b",
"assets/images/multitask.jpg": "e803200ac439b7568c087fde966de554",
"assets/images/sneak_peek.png": "b0904270166bf77c662c66d740f063d8",
"assets/images/nintendo_2x.png": "77501177828993e8348147491dcdb6b9",
"assets/images/c21.jpg": "2b54a77f6597b42b2b191a7fa9b93dca",
"assets/images/Mark.jpg": "39f29dac6c9c2a43c3529b9cf039fb9a",
"assets/images/c23.jpg": "e432ca24a7521dcc08c5f0132578ecac",
"assets/images/Q3.3.png": "845577cb38eb6f577d3478b7b4a88dd2",
"assets/images/APJ.jpg": "b2c217b61af705beba4b443269995608",
"assets/images/p41.png": "50821e6dd9abba79ff9b835d084ab3c1",
"assets/images/p53.png": "7651dee6f9f0b9e6d191f5844ac0b662",
"assets/images/acc2.png": "a2c9bb80c0a4f3a6ebdc0dccfad12d32",
"assets/images/p54.png": "525493377c7bcb6b21df26a450a924ce",
"assets/images/gamer.gif": "67b21c7a6d886aa663a9567c42db2715",
"assets/images/Mukesh.jpg": "75f726914477007a01f8017d903b9455",
"assets/images/p52.png": "96992d7cae7319eaeecd4dafcdeb1e48",
"assets/images/p5.png": "6a00d52714ef7eb96efc8d9072ad310b",
"assets/images/Q3.2.png": "fd388209a731328d73903df79fce3916",
"assets/images/Q3.1.png": "34af4fbb0e29456db1d2420cde1577d7",
"assets/images/Q3.png": "e394f3818d81e7191545ce5855aa5f86",
"assets/images/Sachin.jpg": "90f78e2242250d85fd943319000bb9e3",
"assets/images/switch.gif": "a173732250f4f4a59f883b8bad484739",
"assets/images/work.png": "084e31d2f5c2522cb4e355fdf58d0889",
"assets/packages/flutter_sound_web/src/flutter_sound_player.js": "26ecc2b7adb658117d6070c3283f18e3",
"assets/packages/flutter_sound_web/src/flutter_sound.js": "e2cf64af7f295ac21ba7f977be88690b",
"assets/packages/flutter_sound_web/src/flutter_sound_recorder.js": "e2b3cd667f0f14fb48e417de545be939",
"assets/packages/flutter_sound_web/howler/howler.js": "3030c6101d2f8078546711db0d1a24e9",
"assets/packages/enough_giphy_flutter/assets/attribution.gif": "d6fbf239f7c01fef9be3d0e06bc82375",
"assets/packages/zego_uikit/assets/icons/video_view_mic_on.png": "5f4a10f968013313145e45051cb20bf7",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_end.png": "3db1588b978af3720d74a5a6dbdb4cff",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_speaker_normal.png": "3783636d5601e7cba03cbefbfc9d9e93",
"assets/packages/zego_uikit/assets/icons/nav_close.png": "d5a4f6a62cf4761f787d0b2e718e535e",
"assets/packages/zego_uikit/assets/icons/member_mic_normal.png": "9c6cc34ee53802ea794e0d9e55b92124",
"assets/packages/zego_uikit/assets/icons/message_loading.png": "41913c24ab8f26819589af76852f6f4c",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_camera_off.png": "47c428aed459e061d743f6286c61b0ba",
"assets/packages/zego_uikit/assets/icons/video_view_camera_on.png": "767c529173c084143074a6a97e32f16f",
"assets/packages/zego_uikit/assets/icons/video_view_mic_off.png": "ffcd14ed2c2e4d68554bbab32ca83a7e",
"assets/packages/zego_uikit/assets/icons/video_view_full_screen_close.png": "347b5c7e154224cbe561f5d7a4a02bab",
"assets/packages/zego_uikit/assets/icons/video_view_mic_speaking.png": "f36f281fee197efe2eabc76b1355bc88",
"assets/packages/zego_uikit/assets/icons/member_camera_normal.png": "0c9b7ef19613acc4f7b45b03eaa8c05a",
"assets/packages/zego_uikit/assets/icons/back.png": "1cc8237aa89ef773a1e65d57293a5c06",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_camera_normal.png": "101da6ff95cb34d25aaef7a1c058c473",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_more_normal.png": "96fb3eb790757ec86896cbdd56953e97",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_speaker_off.png": "941cd4e186d9feeda35b793a55ab05cf",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_speaker_bluetooth.png": "c803bf03b3df3af7a34d36f895c8d0bb",
"assets/packages/zego_uikit/assets/icons/video_view_wifi.png": "15ceb63b27034d03ae339e78c63238a6",
"assets/packages/zego_uikit/assets/icons/send_disable.png": "7e80b5c74959ba84cbc7e50beb0e34f1",
"assets/packages/zego_uikit/assets/icons/member_camera_off.png": "7e4da8fda7851b9c07bdb16e54532021",
"assets/packages/zego_uikit/assets/icons/message_fail.png": "c4f7303a3963fa31acd74ca482d4e097",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_mic_off.png": "d522490af830e751a9735927194c2e8b",
"assets/packages/zego_uikit/assets/icons/video_view_camera_off.png": "00241c1e4517457be35ec8235b848633",
"assets/packages/zego_uikit/assets/icons/share_screen_stop.png": "abef995e3768c42d16ac5e1b05120cb5",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_mic_on.png": "2b8b980b6e013bcfdbb0b58f1e5f0640",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_end.png": "c0dc110bb095effd61589390546351d3",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_speaker_normal.png": "2037c7dec37882bf30049d75dd3740c4",
"assets/packages/zego_uikit/assets/icons/3.0x/nav_close.png": "6dd30082ee4dd26b634f2d107a320cda",
"assets/packages/zego_uikit/assets/icons/3.0x/member_mic_normal.png": "8a0ab49718e61d010bf1830f697511ec",
"assets/packages/zego_uikit/assets/icons/3.0x/message_loading.png": "567cf9465ee6f9b501bb6438207ae3aa",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_camera_off.png": "a1676a233c3fdf883b1b9525c52272c6",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_camera_on.png": "7369f517f02618f0ba7fe5c1e4fe55fd",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_mic_off.png": "33d5afecd9378cf570271818d4c56667",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_full_screen_close.png": "8dafedc394aa80ab9370073413e89be7",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_mic_speaking.png": "18354ef4c2606bcf96d4a0b3b9065193",
"assets/packages/zego_uikit/assets/icons/3.0x/member_camera_normal.png": "e0eecc41b8db3333d6e0b73c71af64fb",
"assets/packages/zego_uikit/assets/icons/3.0x/back.png": "c9d6e68a3c3d1b3b49723eb745b15e09",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_camera_normal.png": "be38e8cacecd08727f98b23a2cc1b297",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_more_normal.png": "45f7fe05bac7f3c1106d63c1078d7a7f",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_speaker_off.png": "4f9bd995c5123400a3f13b4e4f1ed90c",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_speaker_bluetooth.png": "d15c31d947ce16f9f08ed2066542c629",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_wifi.png": "0b78795289c2165bd6646f714cd2159c",
"assets/packages/zego_uikit/assets/icons/3.0x/send_disable.png": "61577087db110346c44498944d1f491c",
"assets/packages/zego_uikit/assets/icons/3.0x/member_camera_off.png": "0527fda34af9d6369549d7ae54ec467a",
"assets/packages/zego_uikit/assets/icons/3.0x/message_fail.png": "1904f578c97fc26b7ab85980495bb439",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_mic_off.png": "d7b3619803222f891f8d1487e2dd95af",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_camera_off.png": "5275a3c18503c20b5a6238450272d2be",
"assets/packages/zego_uikit/assets/icons/3.0x/share_screen_stop.png": "210873b802db239aec4c790855ef6d60",
"assets/packages/zego_uikit/assets/icons/3.0x/video_view_full_screen_open.png": "e4e91ee80390a53294a20c1e12dd783c",
"assets/packages/zego_uikit/assets/icons/3.0x/invite_reject.png": "50fe4208eaf232329d725b6be760ad05",
"assets/packages/zego_uikit/assets/icons/3.0x/member_mic_off.png": "a7489c5b6deafcb4eb10a02226bc3d9b",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_more_checked.png": "c3162cc37bc41fb13957b70b06476c3e",
"assets/packages/zego_uikit/assets/icons/3.0x/invite_voice.png": "f191776d49da7ce3d3f06a557aee74ea",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_mic_normal.png": "93436ec1f8389307c037521ce840f0a2",
"assets/packages/zego_uikit/assets/icons/3.0x/share_screen_start.png": "be1c3f30eef1e9777618df830e8c406f",
"assets/packages/zego_uikit/assets/icons/3.0x/send.png": "024f9c9faa2127335926a4037e23a684",
"assets/packages/zego_uikit/assets/icons/3.0x/s1_ctrl_bar_flip_camera.png": "06b289a7d6de55c6f7a5b43d7244afce",
"assets/packages/zego_uikit/assets/icons/3.0x/member_mic_speaking.png": "e1cea5ddeba80a0a16e608f75dcceac5",
"assets/packages/zego_uikit/assets/icons/3.0x/invite_video.png": "b3fd4d33ffcc9e0c05ac8353657faf0f",
"assets/packages/zego_uikit/assets/icons/video_view_full_screen_open.png": "c0fdccb5b807c1d25e9de110a2f24e46",
"assets/packages/zego_uikit/assets/icons/invite_reject.png": "aef7ea169c2aa2c1abfaa366fec54da0",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_mic_on.png": "85b79b0c60b1781019350176881d2006",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_end.png": "cb7886e14a43a4d7c6315025032a0272",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_speaker_normal.png": "f280aecd1664df5ddb9b41a3265fbc96",
"assets/packages/zego_uikit/assets/icons/2.0x/nav_close.png": "faf29b14204b46842cc095efc4131686",
"assets/packages/zego_uikit/assets/icons/2.0x/member_mic_normal.png": "e2788b3c2302b8b561e29c064e9a99ff",
"assets/packages/zego_uikit/assets/icons/2.0x/message_loading.png": "dc31511440f51dbf93422c6288644247",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_camera_off.png": "c0901dd816919eb4e6ffffd5f7239184",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_camera_on.png": "ceb2dfe462b738ad547939b553ff314d",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_mic_off.png": "ab6fdc4bef804d7470fa95ab724a3493",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_full_screen_close.png": "e5d96585b746432238b0c6eec6857526",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_mic_speaking.png": "017fb1acbfeafeab17d3119af65dc61b",
"assets/packages/zego_uikit/assets/icons/2.0x/member_camera_normal.png": "0a0decead6773a2ae1b1fc726cb2dba7",
"assets/packages/zego_uikit/assets/icons/2.0x/back.png": "3a15fb4e9557ed72c77543500486c5fb",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_camera_normal.png": "f9749113cfcdcf507dba5962aa71efec",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_more_normal.png": "e8cf0cb5b4ae57f3634325200b340aef",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_speaker_off.png": "3d36462e98a3dd959cdede0b81c3d311",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_speaker_bluetooth.png": "d24d7aeca55782323f36427f9f68889f",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_wifi.png": "d201ad7f9e9401f7fe60f79cd69e807c",
"assets/packages/zego_uikit/assets/icons/2.0x/send_disable.png": "8e810767d851b09a84eb05580e7e83d4",
"assets/packages/zego_uikit/assets/icons/2.0x/member_camera_off.png": "fab9cc0caa1ed63244039a2ac50af5a4",
"assets/packages/zego_uikit/assets/icons/2.0x/message_fail.png": "d0fb57427a0074f574aef0d474f213d8",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_mic_off.png": "0e0d07c9e48304166ba2963ce85c1cba",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_camera_off.png": "a5c8ecf7492e0f8a1487513a4c0ceef9",
"assets/packages/zego_uikit/assets/icons/2.0x/share_screen_stop.png": "28751ac6943d6195c81351dd954c9d7e",
"assets/packages/zego_uikit/assets/icons/2.0x/video_view_full_screen_open.png": "655a9f372024d96fca06c6a39d7e80d7",
"assets/packages/zego_uikit/assets/icons/2.0x/invite_reject.png": "f967ba275f67032b14a0383d8eff0779",
"assets/packages/zego_uikit/assets/icons/2.0x/member_mic_off.png": "4eda86a0a0a6ae75cf8521f63834a54d",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_more_checked.png": "86a57573701177bf50526ddf8919257d",
"assets/packages/zego_uikit/assets/icons/2.0x/invite_voice.png": "24970c6bf9acf13244d9b749e3ea8b4f",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_mic_normal.png": "bb82e53aa5e2da3ee06e82f1d788c992",
"assets/packages/zego_uikit/assets/icons/2.0x/share_screen_start.png": "dab73df5268a057e660fcab1861a11ca",
"assets/packages/zego_uikit/assets/icons/2.0x/send.png": "ade012f5e004a41459da5d44bfd2957f",
"assets/packages/zego_uikit/assets/icons/2.0x/s1_ctrl_bar_flip_camera.png": "a5e90392059a2957af9e255023ab7c73",
"assets/packages/zego_uikit/assets/icons/2.0x/member_mic_speaking.png": "16b678656c45cd19cd11baec8c8ac751",
"assets/packages/zego_uikit/assets/icons/2.0x/invite_video.png": "7246561fa86cc404de866e76d9737110",
"assets/packages/zego_uikit/assets/icons/member_mic_off.png": "da54635dfe0e424047509267c747c683",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_more_checked.png": "3573c99e2a7720ff2092e4f572b00012",
"assets/packages/zego_uikit/assets/icons/invite_voice.png": "849a299fd3670fc6693da77d392d4e45",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_mic_normal.png": "05b63e5db51f06fcf2fe8d8f2ffe9669",
"assets/packages/zego_uikit/assets/icons/share_screen_start.png": "0cd5f14df5e1bb573d2aef1de2ed32b6",
"assets/packages/zego_uikit/assets/icons/send.png": "b6f3a4923052cce9db8ef6fc39d2c90b",
"assets/packages/zego_uikit/assets/icons/s1_ctrl_bar_flip_camera.png": "6929bd51a1655cf7df3a23a2f3133ec8",
"assets/packages/zego_uikit/assets/icons/member_mic_speaking.png": "cf6b2e626ec6571f11d8638ae3fb8609",
"assets/packages/zego_uikit/assets/icons/invite_video.png": "8278efa5e15b6ea4e3af4b408611fe62",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/day_night_time_picker/assets/sun.png": "5fd1657bcb73ce5faafde4183b3dab22",
"assets/packages/day_night_time_picker/assets/moon.png": "71137650ab728a466a50fa4fa78fb2b9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/zego_zpns/assets/zpns.js": "b83a7288dbdd4914da1b0b78576f0ee6",
"assets/packages/flutter_vector_icons/fonts/Entypo.ttf": "31b5ffea3daddc69dd01a1f3d6cf63c5",
"assets/packages/flutter_vector_icons/fonts/EvilIcons.ttf": "140c53a7643ea949007aa9a282153849",
"assets/packages/flutter_vector_icons/fonts/Ionicons.ttf": "b3263095df30cb7db78c613e73f9499a",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Brands.ttf": "3b89dd103490708d19a95adcae52210e",
"assets/packages/flutter_vector_icons/fonts/SimpleLineIcons.ttf": "d2285965fe34b05465047401b8595dd0",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Regular.ttf": "1f77739ca9ff2188b539c36f30ffa2be",
"assets/packages/flutter_vector_icons/fonts/Fontisto.ttf": "b49ae8ab2dbccb02c4d11caaacf09eab",
"assets/packages/flutter_vector_icons/fonts/Octicons.ttf": "f7c53c47a66934504fcbc7cc164895a7",
"assets/packages/flutter_vector_icons/fonts/MaterialCommunityIcons.ttf": "b62641afc9ab487008e996a5c5865e56",
"assets/packages/flutter_vector_icons/fonts/Zocial.ttf": "1681f34aaca71b8dfb70756bca331eb2",
"assets/packages/flutter_vector_icons/fonts/AntDesign.ttf": "3a2ba31570920eeb9b1d217cabe58315",
"assets/packages/flutter_vector_icons/fonts/MaterialIcons.ttf": "8ef52a15e44481b41e7db3c7eaf9bb83",
"assets/packages/flutter_vector_icons/fonts/FontAwesome5_Solid.ttf": "605ed7926cf39a2ad5ec2d1f9d391d3d",
"assets/packages/flutter_vector_icons/fonts/FontAwesome.ttf": "b06871f281fee6b241d60582ae9369b9",
"assets/packages/flutter_vector_icons/fonts/Foundation.ttf": "e20945d7c929279ef7a6f1db184a4470",
"assets/packages/flutter_vector_icons/fonts/Feather.ttf": "a76d309774d33d9856f650bed4292a23",
"assets/packages/alarm/assets/long_blank.mp3": "d632dd58e2137a2e67849c108d5eb4b6",
"assets/packages/alarm/assets/not_blank.mp3": "71ac239a121767241ccfcc1b625d44e7",
"assets/packages/auth_buttons/images/secondary/email.svg": "15397430afa56e895000113fd8aabe6a",
"assets/packages/auth_buttons/images/secondary/google.svg": "d198f5fd4ff5986d8af9cf8eb9027713",
"assets/packages/auth_buttons/images/secondary/github.svg": "e2b548a359b2df7c7fe2e18d6ec15b2a",
"assets/packages/auth_buttons/images/secondary/facebook.svg": "2c40fb4ce64eab0b32b6ab4f253566e7",
"assets/packages/auth_buttons/images/secondary/huawei.svg": "c88269d9f902df301d4b6c49b5a5e9d8",
"assets/packages/auth_buttons/images/secondary/apple.svg": "e7ae0b5fd7b2a11ec4629a884641c383",
"assets/packages/auth_buttons/images/secondary/twitter.svg": "4f9c57fcb40ec7aa0406071c4dec6eff",
"assets/packages/auth_buttons/images/secondary/microsoft.svg": "f3cab8f90deddd345b878b74e860352e",
"assets/packages/auth_buttons/images/outlined/email.svg": "780cd3d1832fa5b1cd59b16494579241",
"assets/packages/auth_buttons/images/outlined/google.svg": "9100a6ae9c08541533fdfd1ffa8d4edd",
"assets/packages/auth_buttons/images/outlined/github.svg": "9b5dbdf8912fa2c6c58d832e40ee290e",
"assets/packages/auth_buttons/images/outlined/facebook.svg": "17ae60cd022e23148789be8a68716da0",
"assets/packages/auth_buttons/images/outlined/huawei.svg": "43e6bce20aff1651bea89a5ba1d74cef",
"assets/packages/auth_buttons/images/outlined/apple.svg": "546549e93151fc78951029fae842f855",
"assets/packages/auth_buttons/images/outlined/twitter.svg": "e09792ccb093063a1d0a84d619cd6830",
"assets/packages/auth_buttons/images/outlined/microsoft.svg": "9c395ca56ab2544abb46c60a4acaf08d",
"assets/packages/auth_buttons/images/default/email.svg": "720b2e4750311bbe2da2eec0ad4d2729",
"assets/packages/auth_buttons/images/default/google.svg": "c8a84e9ebef3c08f4cdcbfd0dc8044bb",
"assets/packages/auth_buttons/images/default/facebook.svg": "930f12e4368ca21a906e5e0be269cb0b",
"assets/packages/auth_buttons/images/default/huawei.svg": "5d26303d0f2d5c47a61572d381211f7e",
"assets/packages/auth_buttons/images/default/github_black.svg": "3f95161c44b7dc2a10a52195ca2d44ef",
"assets/packages/auth_buttons/images/default/apple.svg": "ead30544d55b2c61eb349ea5944aa4b8",
"assets/packages/auth_buttons/images/default/twitter.svg": "a44723fac9b4d66805d745c59b566033",
"assets/packages/auth_buttons/images/default/microsoft.svg": "0143e7fa98f86f66b31eda99d45da935",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/typicons_flutter/fonts/typicons.ttf": "29f9630f7d87a79830d1c321e1600f2e",
"assets/packages/zego_express_engine/assets/ZegoExpressWebFlutterWrapper.js": "1cd9c298ced09b7b18f3f5addd2c8466",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/im.png": "e69aca2198610729852a6571f06633cb",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_mic_normal.png": "ac4e085d93f6f938a140a6917ecfe540",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/back.png": "1cc8237aa89ef773a1e65d57293a5c06",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_speaker_bluetooth.png": "b04390d87db444304e3d4398631fc56e",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_camera_off.png": "c9cf4be875b6199968563a2cd1c074f0",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_leave.png": "e32ee1406a52f377e4ca331754648ac8",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/im.png": "a204a9ee814519e5405e5faa4c3c723e",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_mic_normal.png": "44b994d15577bf5ee3d48ce3d40f08f6",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/back.png": "c9d6e68a3c3d1b3b49723eb745b15e09",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_speaker_bluetooth.png": "ec25a7d033d06aaae7148174c4013a47",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_camera_off.png": "fb03b4577458f4f7e02975babac44b29",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_leave.png": "5bedec991805e42f6f7d0eb47818ca9f",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_mic_off.png": "0ab8bfe26ea6668e4deb1a44f45934f5",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_speaker_off.png": "a1492cc22394b4bc1c0108ac6b85df6b",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_camera_overturn.png": "522c321eae222817299840e170496638",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_member_normal.png": "eb5dee3f434a0a9fc2c601458d608841",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_speaker_normal.png": "f5e8192c65d25a03b5de7ae63b65c7ac",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_im.png": "7c406701f8f17e2d1fda20fbd37aa660",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/3.0x/top_camera_normal.png": "2a36e0e76624b90c4fabeb99b1dad43a",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_mic_off.png": "af8999a1c16c95613205861be9149cdc",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/im.png": "5419f695006e601b7bcc4e85e94d177f",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_mic_normal.png": "3ea2d932172c0454a09c45f078664d5b",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/back.png": "3a15fb4e9557ed72c77543500486c5fb",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_speaker_bluetooth.png": "78fcd46c9972d99710907c5f8ccf94bb",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_camera_off.png": "d434a043cbe06be56ede4f281964d581",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_leave.png": "dcda26c480ba5902e955fc92107d7bea",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_mic_off.png": "28554ecad59db57575dc4b637b53aa1f",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_speaker_off.png": "fcf47a9efe886a5d482bdde54aaeeec5",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_camera_overturn.png": "f648e99e1db0435a3641ef0c59bce702",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_member_normal.png": "21a466088f1aa00d0c77260dbea684cb",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_speaker_normal.png": "020a8d6c4d96d32b1a20e6aff07925c0",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_im.png": "bfae7b2c9d0cc8d79f94310fb3498818",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/2.0x/top_camera_normal.png": "5940d30e7642f8459debe9e01ce829a9",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_speaker_off.png": "3c95a868a57075926045623d8b44cbfa",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_camera_overturn.png": "07d7ce9e0ce2e0d5c3a3e7e3325e036e",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_member_normal.png": "4a669238d6446736c1add5e321688145",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_speaker_normal.png": "0ef8e12a60da54ce226ab88832c01455",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_im.png": "eb0fc118673f25f108dae6cf100349bd",
"assets/packages/zego_uikit_prebuilt_video_conference/assets/icons/top_camera_normal.png": "dc6b7ac94eaed5424802fcbead3fa668",
"assets/packages/floating_snackbar/assets/image/flutter_02.png": "6aa8464adbaf2dc20a6e34f2695a61fc",
"assets/packages/fluttericon/lib/fonts/Brandico.ttf": "791921e9b25210e2551b6eda3f86c733",
"assets/packages/fluttericon/lib/fonts/Elusive.ttf": "23f24df0388819e94db2b3c19841841c",
"assets/packages/fluttericon/lib/fonts/Fontelico.ttf": "3a1e1cecf0a3eae6be5cba3677379ba2",
"assets/packages/fluttericon/lib/fonts/Entypo.ttf": "58edfaf27b1032ea4778b69297c02b5a",
"assets/packages/fluttericon/lib/fonts/LineariconsFree.ttf": "276b1d61e45eb9b2dde9482545d9e3ac",
"assets/packages/fluttericon/lib/fonts/MfgLabs.ttf": "09daa533ea11600a98e3148b7531afe3",
"assets/packages/fluttericon/lib/fonts/WebSymbols.ttf": "4fd66aa74cdc6e5eaff0ec916ac269c6",
"assets/packages/fluttericon/lib/fonts/Octicons.ttf": "7242d2fe9e36eb4193d2bc7e521779bf",
"assets/packages/fluttericon/lib/fonts/FontAwesome5.ttf": "221b27a41202ddd33990e299939e4504",
"assets/packages/fluttericon/lib/fonts/Meteocons.ttf": "8b9c7982496155bb39c67eaf2a243731",
"assets/packages/fluttericon/lib/fonts/RpgAwesome.ttf": "99232001effca5cf2b5aa92cc3f3e892",
"assets/packages/fluttericon/lib/fonts/Zocial.ttf": "c29d6e34d8f703a745c6f18d94ce316d",
"assets/packages/fluttericon/lib/fonts/Maki.ttf": "9ecdcd7d24a2461a55d532b86b2740bd",
"assets/packages/fluttericon/lib/fonts/Iconic.ttf": "34e12214307f5f7cf7bc62086fbf55a3",
"assets/packages/fluttericon/lib/fonts/ModernPictograms.ttf": "5046c536516be5b91c15eb7795e0352d",
"assets/packages/fluttericon/lib/fonts/Linecons.ttf": "2d0ac407ed11860bf470cb01745fb144",
"assets/packages/fluttericon/lib/fonts/Typicons.ttf": "3386cae1128e52caf268508d477fb660",
"assets/packages/fluttericon/lib/fonts/FontAwesome.ttf": "799bb4e5c577847874f20bd0e9b38a9d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/tabler_icons/lib/src/fonts/TablerIcons.ttf": "03822db22aa3be8840a883c88bb5a6da",
"assets/NOTICES": "e682530f2a5896cb9c8e836f8df85623",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/image-medical-2.jpg": "e9d5296f94cfaabe314e8502d701afbf",
"assets/assets/icon_small.png": "74628b6f07bba4b2c4ee92f259c44afb",
"assets/assets/icons/foam.png": "09a259213b671ae9f3b8bf3b5a78f753",
"assets/assets/icons/emergency-call.gif": "1c4af35aa81f8ac9c33ba45867ea7403",
"assets/assets/icons/4.gif": "d27e6c384374264888d8a269e6aea70c",
"assets/assets/icons/nasalspray.gif": "966bb817238fa005383aee2d9e871558",
"assets/assets/icons/lotion.gif": "92e0824f9f303071b312b5d73b6a1207",
"assets/assets/icons/inhalator.png": "26fd1da648b7f7c9957ed869e7cc8da5",
"assets/assets/icons/herbal.png": "8d7e36300a652afc0a42599a4854c952",
"assets/assets/icons/more.gif": "34614821da9e5dca593852b83d1c3ea7",
"assets/assets/icons/no_reminders.gif": "d63d0060458b46c32b1a1755773c3af3",
"assets/assets/icons/no_alarm.gif": "43a8865a9c982001266a4ebc1c8e151a",
"assets/assets/icons/cream.png": "22cf3e79cd081315aee24c65327b6ab2",
"assets/assets/icons/lotion.png": "ec1f4b488ced49c76a936f9838fbc72b",
"assets/assets/icons/cream.gif": "66988dd928e27ff892309294c1c359b0",
"assets/assets/icons/suppository.png": "818aa1accd43889ebff3280f660b6a86",
"assets/assets/icons/spray.gif": "dc33a507c5f41221c863ca2635cbd5aa",
"assets/assets/icons/medicine.png": "d4ea517821e3d6d676e9755e8730095e",
"assets/assets/icons/pill.gif": "45add6d130083cb038cf83b866c18025",
"assets/assets/icons/spray.png": "bc90dca5371ab3add98e237a344d40f7",
"assets/assets/icons/pills.png": "1cf79c3a5cad564a53c94b4b9bfe1b8c",
"assets/assets/icons/heartbeat.gif": "22de0032d3cd5da8e63655eafe84464b",
"assets/assets/icons/tablet.gif": "983e6634923143be441af8d6107191d2",
"assets/assets/icons/powder.gif": "78005e5c4e9f820c739d587fb881bfa3",
"assets/assets/icons/pills.gif": "b9a50958440eac7fd7ce6350f438fa82",
"assets/assets/icons/tube.png": "cbafa2ee32c87be9ddd31109f05c602d",
"assets/assets/icons/inhalator.gif": "a02bfd110fec33a42509c2e917480ccd",
"assets/assets/icons/patch.png": "81f177fc085be50806357b2f05022853",
"assets/assets/icons/tablet.png": "95726e4a0c2e1e0d9e37e60ef3ef4d85",
"assets/assets/icons/image-.gif": "20b4472c2dc158dbdcf8bc85fde7f038",
"assets/assets/icons/powder.png": "884b4066cfc0ca72c87fd33093647f85",
"assets/assets/icons/patch.gif": "02bcee7407ddfbf0784acb0099db66b9",
"assets/assets/icons/height.gif": "d1ff2d2c6b705b168dd9764e23ccf2b5",
"assets/assets/icons/nutrients.png": "67c8fb18591e40cdfee8e12140aefbc8",
"assets/assets/icons/pill.png": "9b0ad477c40df8fd53f72d27e6213997",
"assets/assets/icons/nasalspray.png": "98a56530be42a46beb7d712ebf4cc4d8",
"assets/assets/icons/foam.gif": "ee5d1a193dba5ad1eb6abf21c109e93e",
"assets/assets/icons/syringe.gif": "9e2fb51a5041e59511af398bc66a0395",
"assets/assets/icons/1.gif": "b9f37e61dab7f88ce4f0eb16aa7526d5",
"assets/assets/icons/nutrients.gif": "1b5225e795058823974ffbfad76030b5",
"assets/assets/icons/liquid.gif": "e6e1045f48c6feb00cb6e46bee42ad4f",
"assets/assets/icons/herbal.gif": "1c6aaf2f77e63eed800ad95562c52963",
"assets/assets/icons/pills%2520(1).gif": "843cf8919378c6df6c0f7c2fa3003a0a",
"assets/assets/icons/tube.gif": "716790a0f2270844cc8c8b6978be433e",
"assets/assets/icons/drops.png": "d80b56f6e82307cfff2c9e33205509ff",
"assets/assets/icons/drops.gif": "fe178c79ad7e7cf7767d1d819292104a",
"assets/assets/icons/syringe.png": "6e08d0c80d5fba9e11db24455387458f",
"assets/assets/icons/weight-scale.gif": "6a56e40131a69cb322fda14f9d5d0a51",
"assets/assets/icons/suppository.gif": "9d84aca884fb3cf6ef671f735dbe8dff",
"assets/assets/icons/liquid.png": "cf6450d222a9d6f21f19dd4b5e967ef6",
"assets/assets/icons/2.gif": "34614821da9e5dca593852b83d1c3ea7",
"assets/assets/icons/3.gif": "475ad8ed32c71a9329ff178bde980216",
"assets/assets/KKK.png": "18439a3778dd18d5189b38c79f4f29c8",
"assets/assets/icon.png": "765d583e91091f70da0a5a9b081805bc",
"assets/assets/person.jpg": "307a5a4db274d339b081bd279e45da99",
"assets/assets/doctor-consulting-with-patient-vector.webp": "130dcfb8c31db72b6215d16713f6228e",
"assets/assets/images/icon_small.png": "74628b6f07bba4b2c4ee92f259c44afb",
"assets/assets/images/chatgpt_logo.png": "d729faa75ff41cdcc290f619d8462774",
"assets/assets/images/virtualAssistant2.png": "c34a215217364a1b38b72ecd2794b0c8",
"assets/assets/images/MyMeds.png": "94300c8966abb811dff87f195bdb16b0",
"assets/assets/images/doctor.webp": "a06a4b6c5004d4f07d44250b7c087bc3",
"assets/assets/images/MyMeds_12.png": "56e77c3793c6cccd2a9d8d2c4309207e",
"assets/assets/image-medical.jpg": "bf182e4d6a98fd7077de141289917ebd",
"assets/assets/vector-doc2.jpg": "3b086051b7799d1f8c3ca73e10c0fe5a",
"assets/assets/covid-bg.png": "0ed1d84cebe210fed9e9e7298db62fce",
"assets/assets/414-bg.png": "3ec7eb150c92f1723a8b20bce5336e67",
"assets/assets/search-bg.png": "ae90c5256c8dc9e86b0d03396d94a3ef",
"assets/assets/image-medical-3.jpg": "4aafe9c6a606f10d64a3b86c2f84a168",
"assets/assets/personas-vector-set.jpg": "a585b1e8e51031f075dca6a7d4992c31",
"assets/assets/audio/marimba.mp3": "d454c0d081c8749b6b0278ec58ae3ee3",
"assets/assets/doc.png": "8db37d2d132fd907aa5afed6572248aa",
"assets/assets/Medic.ly_poster1.png": "e6515eb051c8b1447663e0be9ee30072",
"assets/assets/poster2.png": "5f463830d8853402b864823e08bf8e3c",
"assets/assets/medical-red.png": "4ccb692d39e157848b70fa909fd9f83c",
"assets/assets/bg.png": "99b8c976a510c0200d322d1abe690753",
"assets/assets/icon/appicon.png": "0ed1d84cebe210fed9e9e7298db62fce",
"assets/assets/vector-doc.jpg": "232a7dadc456d22a133e9a7fa3c7cccf",
"assets/assets/19834.jpg": "d0c42102720aeaaba4d67d9db85962b8",
"assets/assets/19834-bg.png": "fbd69e80f5d40650894a6b9bbdd5cb76",
"assets/assets/covid.jpg": "812313a2154017b674f3e34879728dc0",
"assets/assets/19835.jpg": "3b47d6a72fdaa1fc8ce0064bd5ff9ffe",
"assets/assets/lll.png": "33af917b56996dae1687e0ff54693da2",
"assets/assets/backgroundImage.png": "8c40fb487da77e832bbeb144a9cab3ef",
"assets/assets/appointment.jpg": "353ad09f1935e278b153292909b181e2",
"assets/assets/error-404.jpg": "b16e717f48017de9d05055bcbc649ef9",
"assets/assets/logo.png": "311e1c433554f9659439c39be4217811",
"assets/assets/414.jpg": "2864168dd1131f0e9ed5181885fa85a2",
"assets/assets/logologo.png": "a51dd72c4ae826c5e21426a66440aab7",
"assets/assets/disease.png": "7af4b09b2db5e3aa09e86816f93bfa3f",
"assets/assets/search.jpg": "384e7f01b45948444d449239eedb6151",
"assets/assets/user.png": "6620d99d7d02e89a5c379af73293d794",
"assets/assets/img/baking_soda.png": "4e786b515a9451f155fae200d7a6c57f",
"assets/assets/img/m_3.png": "ecd381a0819bc7f23dddaaddb443ddbc",
"assets/assets/img/progress_each_photo.png": "58c9d3e90c32443f69fa3e3467dd0eb9",
"assets/assets/img/proteins.png": "6d32c61e949866a6b3a1f0c22db1744b",
"assets/assets/img/bed.png": "5d392213c160f9b97b321572bd0e75bd",
"assets/assets/img/google.png": "cc4e8e2c7da85fe08e9dc9e683d8b147",
"assets/assets/img/share.png": "b89db17802981588cccd5b75c9b463ef",
"assets/assets/img/no_bell.png": "9c04457f4509adff045093ba6ce93d21",
"assets/assets/img/p_next.png": "64742f0e884fc4cd1dd1d3fdd869cf6d",
"assets/assets/img/SleepGraph.png": "a12468292443db7920e7004a513f9342",
"assets/assets/img/pancake_1.png": "80f0e91ea47e494aaf324253ffc79493",
"assets/assets/img/goal_1.png": "bad78ea317d106357b465583538db194",
"assets/assets/img/more_btn.png": "b90f7cf197769b41b90f27bb2a19b797",
"assets/assets/img/ArrowRight.png": "03379d566b66af009ad1a496e068a2ec",
"assets/assets/img/on_4.png": "57b99c73ce80f7b60a83cd7bf4aa5c51",
"assets/assets/img/profile_tab.png": "f689c938459a11180f06704c144229d8",
"assets/assets/img/water.png": "958e11dee246b568c1a62fad96a32bf5",
"assets/assets/img/p_notification.png": "cc949cfd7015cddc282bf9b8aa2e63c9",
"assets/assets/img/goal_2.png": "122c69b1648686c3b47307128a8c0d99",
"assets/assets/img/Vibrate.png": "71dc36bdf9f6951434a97453d3d9c2e7",
"assets/assets/img/hight.png": "21b888394dc1e5abeadcc6d03d9d8116",
"assets/assets/img/sub_menu.png": "ad51c55e5465a042f0adc930aea52214",
"assets/assets/img/p_achi.png": "db47a038d2147d75f2bb717fefd8b30e",
"assets/assets/img/search.png": "9378acaaa6bf2e5a110765b9e2ff5b44",
"assets/assets/img/img_2.png": "471f944dfdf868745493e1becd64a570",
"assets/assets/img/home_tab_select.png": "c0ad01173170887e957088d97d0a8f85",
"assets/assets/img/oatmeal.png": "cfb9742c991c92b67a238b9bdfed5bd5",
"assets/assets/img/barbell.png": "1d95fb3c9b45a111dfc24c80d4475e3d",
"assets/assets/img/eggs.png": "bea3949cd7f1a860f8b457b591211e9f",
"assets/assets/img/repetitions.png": "7e71b4eb6bf5810a388fca2c78bf8a6a",
"assets/assets/img/flour.png": "f412ca83c871a5cf3dd2262c3f9a525c",
"assets/assets/img/next_go.png": "6d77535e183de2a793a02292bbc4d5cc",
"assets/assets/img/bottle.png": "c9a766c83933219b445c136ab6d4afa3",
"assets/assets/img/p_activity.png": "27b0cb855b791f5cae13a55935b64c37",
"assets/assets/img/p_personal.png": "b656b2a75dd1437862f544c182af5c6d",
"assets/assets/img/camera_tab_select.png": "0339805d5f7b96695286bec9476ee154",
"assets/assets/img/welcome.png": "1d1809e2d4c0702be86b4e016d9062c0",
"assets/assets/img/u2.png": "315d3ff825b0429749752ffc0a7886a5",
"assets/assets/img/carbo.png": "a87eb510fe9ebb1550f869f3dca5b1be",
"assets/assets/img/activity_tab_select.png": "c5a2764036d64c02db99ea63d99a9768",
"assets/assets/img/activity_tab.png": "657b2889675a91e857c3241b6b0bb29e",
"assets/assets/img/bell.png": "246d571e40ba4640b9db9e31a4ae5bc1",
"assets/assets/img/c_2.png": "5a303550d11c7b374f2df9a5a5af0c1e",
"assets/assets/img/p_setting.png": "c864f9c5b5327cccfb8bc4836192bc34",
"assets/assets/img/c_4.png": "452bec9e3c2df63cd38c4346919e16d2",
"assets/assets/img/pp_6.png": "b42ec377d80ec9daecf4b38afcb127c5",
"assets/assets/img/home_tab.png": "3bde55559793407d1e59d4ea4548f26c",
"assets/assets/img/black_btn.png": "3a3b2c24f00138d8bff3c81abde5b227",
"assets/assets/img/p_privacy.png": "bcc561265d23c7b110074030884402a5",
"assets/assets/img/salad.png": "c6e962f8fa2352befab89908d9219653",
"assets/assets/img/pp_3.png": "7be85b5f3a9e33ebff897776873e7dc7",
"assets/assets/img/u1.png": "0b18e804f9d85de0ce024ce038f07e53",
"assets/assets/img/glass-of-milk%25201.png": "68788d9ebb5c01092e47c22271f9cb25",
"assets/assets/img/m_2.png": "09dec36ba1164f0f7a694dd78d637125",
"assets/assets/img/Filter.png": "2d5797099749326d650a48e3a59631ff",
"assets/assets/img/burn.png": "5054e701f1b6bcfab8b175d91e196ea9",
"assets/assets/img/time_workout.png": "7c6fff5fd87150f728a21ed7e2067f80",
"assets/assets/img/gender.png": "d44e6c85a791dd87a97298481134add6",
"assets/assets/img/Repeat.png": "5dd7eaa858fc61351c851569811a54ec",
"assets/assets/img/weight.png": "59de5012690875925187797b6042fcd9",
"assets/assets/img/profile_tab_select.png": "f9af02d4abd7a90657470a42375e3d07",
"assets/assets/img/ArrowLeft.png": "8232bb5f5ccb3d7eee261bef19d84ef3",
"assets/assets/img/f_2.png": "4ed558298af87d48e17de474160d17b6",
"assets/assets/img/nigiri.png": "d543a124da90eba3cff311f4a6bf89eb",
"assets/assets/img/m_4.png": "113af868d9dc7001bc0194a4c842e62c",
"assets/assets/img/skipping_rope.png": "91d0e971e9cbefbbbfbd835b24a25515",
"assets/assets/img/Bed_Add.png": "3437c345b6eba582f9bc6d55b5ba8134",
"assets/assets/img/pic_5.png": "359f407ce96e1ab88e8258a0f3620e6e",
"assets/assets/img/p_contact.png": "22e33b39d659e370d9783ce6970a40ba",
"assets/assets/img/f_1.png": "c18c0a00f6d81b7d0b3e760c80023684",
"assets/assets/img/goal_3.png": "a56df4aef8ee73574056fbfa9976a8b4",
"assets/assets/img/detail_top.png": "a9f86053cd38f40ec9b879679e3fc2e7",
"assets/assets/img/pp_4.png": "edc467882c4dfe237cc5ec4bdbbab7e0",
"assets/assets/img/HoursTime.png": "fc5a55ccd5ad51c6b90bbf2d57aefdfd",
"assets/assets/img/honey_pan.png": "5d6dcb7439762cd7ebe15fd9db905fde",
"assets/assets/img/user_text.png": "4422f218035fcab41c5442e4219755e5",
"assets/assets/img/pic_4.png": "2c634aa7520a0c17abaec78fb1416618",
"assets/assets/img/egg.png": "8a89eaff0fef9107e848ff8cdf0baee7",
"assets/assets/img/difficulity.png": "50e0f9837c13341b6e033f150c932355",
"assets/assets/img/alaarm.png": "b5e07134440910f3396d98f235205edb",
"assets/assets/img/pp_5.png": "d65ce0863a86e637f52e274e369c1fba",
"assets/assets/img/camera_tab.png": "b08e251b48c001f67c82cf289c60c655",
"assets/assets/img/img_1.png": "95abfbc6eefe555064069b10d3983998",
"assets/assets/img/facebook.png": "42c906f0d34da4e3770aadc5cf7d2e65",
"assets/assets/img/complete_profile.png": "d1509c21363f4719bc071bcacaf7b8c3",
"assets/assets/img/Play.png": "6fe0b583cf13dd9741e09d604106262f",
"assets/assets/img/complete_workout.png": "1a2fdd3d161cf0a3c143bc4f3d3e1e24",
"assets/assets/img/on_2.png": "3a8845e6ad6f7f1b6664795ac1350af4",
"assets/assets/img/pp_7.png": "00809ae4cd76ccede8a375b0ae50d9aa",
"assets/assets/img/next_icon.png": "55ca725fe292918a5bffdbc0011e4ffc",
"assets/assets/img/pp_1.png": "0f03efa1f146eeb6fdc2f3107b59ef39",
"assets/assets/img/on_1.png": "8752f9226301744c7bd7bfe1afd4ec34",
"assets/assets/img/orange.png": "9f35e183c2114c9da372b9a2f38cd0a0",
"assets/assets/img/on_3.png": "be89f95af32d38ec0d9e33534388485f",
"assets/assets/img/what_1.png": "f7960487a861a0040791cd3dd44d328c",
"assets/assets/img/p_workout.png": "4306f1a6d5338148718edfb2167ce527",
"assets/assets/img/apple_pie.png": "0cef7515c3409890d43800e22a3234f9",
"assets/assets/img/sugar.png": "36ede388264d49457ffa048bcc22cfe8",
"assets/assets/img/date.png": "70ba8304724724aeff6f08247cc837f5",
"assets/assets/img/More_V.png": "ad51c55e5465a042f0adc930aea52214",
"assets/assets/img/c_1.png": "3fa8c36d01badbd33c987662c2d06409",
"assets/assets/img/sleep_grap.png": "682a09560018a218a8caf7bcd7ed9a25",
"assets/assets/img/choose_workout.png": "285f331dcb1739643d7c769770b9574b",
"assets/assets/img/closed_btn.png": "c29df36cc5c7711b6021c919bb79c9ac",
"assets/assets/img/coffee.png": "ef209ff13093591a1d8b6bfbbe1a05df",
"assets/assets/img/email.png": "d2f4af3eeb0c123001cc3ab0bb9fa3cf",
"assets/assets/img/show_password.png": "35352e98ec8698964e09326a5fadfddc",
"assets/assets/img/Workout1.png": "2b9c12fd71e4823078db48227e90f78b",
"assets/assets/img/bg_dots.png": "16bdc38a7993e02d0d67a6938eb2238d",
"assets/assets/img/foot.png": "aca6345f7d4d2085dc5ce50ef8422c7f",
"assets/assets/img/date_notifi.png": "cdc49e084478b7476edcb451a81dd0ed",
"assets/assets/img/time.png": "fbc700b6a013c881eacbc8078ec59dc9",
"assets/assets/img/fav.png": "b294e1ea492d61321c83a09cf19def92",
"assets/assets/img/m_1.png": "4ed558298af87d48e17de474160d17b6",
"assets/assets/img/video_temp.png": "62d70e69c81c4379c18c7050866367b6",
"assets/assets/img/lock.png": "f309389b6ae1525868b4b020a484a3bb",
"assets/assets/img/what_3.png": "ec2ddc1e72ed6f7994691241f89cca5e",
"assets/assets/img/c_3.png": "285c30cec225f867bcfbc7b25dcf077d",
"assets/assets/img/Workout2.png": "4cd14acf50e32484599c2f0cbc435b0c",
"assets/assets/img/sleep_schedule.png": "20856764be5386b2520f502220ff0db7",
"assets/assets/img/chicken.png": "0e4481ce6f5454a34f95bf2c65037d08",
"assets/assets/img/what_2.png": "b18b7b48207f52b6f823467d2496a9de",
"assets/assets/img/notification_active.png": "db4c7abdc4cf2b209ae81875dbcf365b",
"assets/assets/img/rd_1.png": "28597ee3e19abca071fd5e84382e6d82",
"assets/assets/img/Workout3.png": "1f901588cf4f70415799042f9461df96",
"assets/assets/img/pp_8.png": "b0f379ffa3d5e8948da53ff07f30554b",
"assets/assets/img/pp_2.png": "e3ff03e36f4b5fdefddb8ab53dd832f3",
"assets/assets/virus.jpg": "3ea398a353d0e47afc41dda1cb4f250e",
"assets/FontManifest.json": "79b666824b2ed41fe92fe0de2716ebbc",
"assets/lib/assets/doctor.gif": "0b8f7d00e6253ad8d281bf55ffb63873",
"assets/lib/assets/icon_small.png": "74628b6f07bba4b2c4ee92f259c44afb",
"assets/lib/assets/icons/foam.png": "09a259213b671ae9f3b8bf3b5a78f753",
"assets/lib/assets/icons/emergency-call.gif": "1c4af35aa81f8ac9c33ba45867ea7403",
"assets/lib/assets/icons/4.gif": "d27e6c384374264888d8a269e6aea70c",
"assets/lib/assets/icons/nasalspray.gif": "966bb817238fa005383aee2d9e871558",
"assets/lib/assets/icons/lotion.gif": "92e0824f9f303071b312b5d73b6a1207",
"assets/lib/assets/icons/inhalator.png": "26fd1da648b7f7c9957ed869e7cc8da5",
"assets/lib/assets/icons/herbal.png": "8d7e36300a652afc0a42599a4854c952",
"assets/lib/assets/icons/more.gif": "34614821da9e5dca593852b83d1c3ea7",
"assets/lib/assets/icons/no_reminders.gif": "d63d0060458b46c32b1a1755773c3af3",
"assets/lib/assets/icons/no_alarm.gif": "43a8865a9c982001266a4ebc1c8e151a",
"assets/lib/assets/icons/cream.png": "22cf3e79cd081315aee24c65327b6ab2",
"assets/lib/assets/icons/lotion.png": "ec1f4b488ced49c76a936f9838fbc72b",
"assets/lib/assets/icons/cream.gif": "66988dd928e27ff892309294c1c359b0",
"assets/lib/assets/icons/suppository.png": "818aa1accd43889ebff3280f660b6a86",
"assets/lib/assets/icons/spray.gif": "dc33a507c5f41221c863ca2635cbd5aa",
"assets/lib/assets/icons/medicine.png": "d4ea517821e3d6d676e9755e8730095e",
"assets/lib/assets/icons/pill.gif": "45add6d130083cb038cf83b866c18025",
"assets/lib/assets/icons/spray.png": "bc90dca5371ab3add98e237a344d40f7",
"assets/lib/assets/icons/pills.png": "1cf79c3a5cad564a53c94b4b9bfe1b8c",
"assets/lib/assets/icons/heartbeat.gif": "22de0032d3cd5da8e63655eafe84464b",
"assets/lib/assets/icons/tablet.gif": "983e6634923143be441af8d6107191d2",
"assets/lib/assets/icons/powder.gif": "78005e5c4e9f820c739d587fb881bfa3",
"assets/lib/assets/icons/pills.gif": "b9a50958440eac7fd7ce6350f438fa82",
"assets/lib/assets/icons/tube.png": "cbafa2ee32c87be9ddd31109f05c602d",
"assets/lib/assets/icons/inhalator.gif": "a02bfd110fec33a42509c2e917480ccd",
"assets/lib/assets/icons/patch.png": "81f177fc085be50806357b2f05022853",
"assets/lib/assets/icons/tablet.png": "95726e4a0c2e1e0d9e37e60ef3ef4d85",
"assets/lib/assets/icons/image-.gif": "20b4472c2dc158dbdcf8bc85fde7f038",
"assets/lib/assets/icons/powder.png": "884b4066cfc0ca72c87fd33093647f85",
"assets/lib/assets/icons/patch.gif": "02bcee7407ddfbf0784acb0099db66b9",
"assets/lib/assets/icons/height.gif": "d1ff2d2c6b705b168dd9764e23ccf2b5",
"assets/lib/assets/icons/nutrients.png": "67c8fb18591e40cdfee8e12140aefbc8",
"assets/lib/assets/icons/pill.png": "9b0ad477c40df8fd53f72d27e6213997",
"assets/lib/assets/icons/nasalspray.png": "98a56530be42a46beb7d712ebf4cc4d8",
"assets/lib/assets/icons/foam.gif": "ee5d1a193dba5ad1eb6abf21c109e93e",
"assets/lib/assets/icons/syringe.gif": "9e2fb51a5041e59511af398bc66a0395",
"assets/lib/assets/icons/1.gif": "b9f37e61dab7f88ce4f0eb16aa7526d5",
"assets/lib/assets/icons/nutrients.gif": "1b5225e795058823974ffbfad76030b5",
"assets/lib/assets/icons/liquid.gif": "e6e1045f48c6feb00cb6e46bee42ad4f",
"assets/lib/assets/icons/herbal.gif": "1c6aaf2f77e63eed800ad95562c52963",
"assets/lib/assets/icons/pills%2520(1).gif": "843cf8919378c6df6c0f7c2fa3003a0a",
"assets/lib/assets/icons/tube.gif": "716790a0f2270844cc8c8b6978be433e",
"assets/lib/assets/icons/drops.png": "d80b56f6e82307cfff2c9e33205509ff",
"assets/lib/assets/icons/drops.gif": "fe178c79ad7e7cf7767d1d819292104a",
"assets/lib/assets/icons/syringe.png": "6e08d0c80d5fba9e11db24455387458f",
"assets/lib/assets/icons/weight-scale.gif": "6a56e40131a69cb322fda14f9d5d0a51",
"assets/lib/assets/icons/suppository.gif": "9d84aca884fb3cf6ef671f735dbe8dff",
"assets/lib/assets/icons/liquid.png": "cf6450d222a9d6f21f19dd4b5e967ef6",
"assets/lib/assets/icons/2.gif": "34614821da9e5dca593852b83d1c3ea7",
"assets/lib/assets/icons/3.gif": "475ad8ed32c71a9329ff178bde980216",
"assets/lib/assets/KKK.png": "18439a3778dd18d5189b38c79f4f29c8",
"assets/lib/assets/icon.png": "765d583e91091f70da0a5a9b081805bc",
"assets/lib/assets/images/medication.gif": "028c15c6b9d659664791b26d063731a8",
"assets/lib/assets/images/ambulance.png": "cd030288e1f17d355911c8c075418c50",
"assets/lib/assets/images/bell.png": "5f9989695d04881b2075502aac8aa796",
"assets/lib/assets/images/taking_med.png": "d57977f40ce0a001ac011aacd79b5452",
"assets/lib/assets/LogO.png": "5ff200c353b46620df0b59c48078d226",
"assets/lib/assets/mede.png": "2a6b76671a2c9e65fd34831e8ab9122d",
"assets/lib/assets/user.png": "6620d99d7d02e89a5c379af73293d794",
"assets/lib/l10n/app_si.arb": "d41d8cd98f00b204e9800998ecf8427e",
"assets/lib/l10n/app_en.arb": "f0fbc07692360ce2cf50d73cc73423fa",
"flutter_bootstrap.js": "f25368697071bf01006fc91564252f9f",
"version.json": "1c8c7b946120ed7aee0b82d740bb1413",
"index.html": "2d3e73301e7d90cfeb0ee86ccd7724bc",
"/": "2d3e73301e7d90cfeb0ee86ccd7724bc",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
