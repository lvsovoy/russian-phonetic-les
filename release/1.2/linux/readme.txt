// ============================================================================
// Russian Phonetic Les keyboard layout — Linux/XKB symbols file
// ============================================================================
//
// Source:   "Russian - Phonetic - Les" for Windows
//           Russian.dll v3.40, created with MSKLC 1.4
//           Registry key: a0000419  (HKLM\SYSTEM\...\Keyboard Layouts)
//
// Install:
// sudo cp ru_les /usr/share/X11/xkb/symbols/ru_les
// cat russian-phonetic-les.XCompose >> ~/.XCompose
// setxkbmap ru_les          # activate immediately
//
// Key layout overview (all keys produce Russian by default):
//
//   `      1  2  3  4  5  6  7  8  9  0  -  =
//   ё      !  "  №  ;  %  :  ?  *  (  )  _  +
//                         (AltGr: £  €        ₽)
//
//   я  ш  е  р  т  ы  у  и  о  п  ю  щ
//   Я  Ш  Е  Р  Т  Ы  У  И  О  П  Ю  Щ
//
//   а  с  д  ф  г  ч  й  к  л  ь  ж  э
//   А  С  Д  Ф  Г  Ч  Й  К  Л  ъ  Ж  Э
//                           (Shift ; → ъ)
//
//   з  х  ц  в  б  н  м  ,  .  /
//   З  Х  Ц  В  Б  Н  М  <  >  ?
//
// AltGr (Right Alt) key activates Level 3:
//   AltGr + `  → dead_diaeresis (¨) — see XCompose file for combinations
//   AltGr + 3  → £  (U+00A3)
//   AltGr + 4  → €  (U+20AC)
//   AltGr + 8  → ₽  (U+20BD, Russian ruble sign)
//   AltGr + '  → '  (U+2019, right single quotation mark)
//
// Dead diaeresis (¨) combinations — defined in companion XCompose file:
//   ¨ + б → ъ    ¨ + ц → ч    ¨ + з → ж    ¨ + а → э
//   ¨ + г → ѓ    ¨ + с → ш    ¨ + ш → щ    ¨ + е → ё
//   ¨ + у → ю    ¨ + и → ї    ¨ + ы → ў    ¨ + о → ё
//   ¨ + ¨ → `    ¨ + Space → ¨
//
// ============================================================================
