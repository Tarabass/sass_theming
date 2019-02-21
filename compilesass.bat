@echo off

set theme=%1

if not "%theme%" == "" (
    GOTO THEME
)

GOTO DEFAULT

:THEME
    (
        echo @import 'functions';
        echo @import 'mixins';
        echo @import 'themes/colors_%theme%';
        echo @import 'themes/theme_%theme%';
        echo @import 'themes/colors_default';
        echo @import 'themes/theme_default';
    ) > styles.scss

    GOTO COMPILE

:DEFAULT
    (
        echo @import 'functions';
        echo @import 'mixins';
        echo @import 'themes/colors_default';
        echo @import 'themes/theme_default';
    ) > styles.scss

    GOTO COMPILE

:COMPILE
    sass --watch styles.scss styles.css

    GOTO END

:END