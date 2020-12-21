from xkeysnail.transform import *

define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL
})

define_multipurpose_modmap({
    Key.LEFT_ALT: [Key.MUHENKAN, Key.LEFT_ALT],
    Key.RIGHT_ALT: [Key.HENKAN, Key.RIGHT_ALT]
})
