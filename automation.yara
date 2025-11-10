rule keylogger
{
        meta:
                author = "Sidharth P J"
                description = "This is an example file for keylogger testing"
                date = "13-10-2025"

        strings:
                $keyword_1 = "on_press"
                $keyword_2 = "listener.join"
                $keyword_3 = "pynput"

        condition:
                $keyword_1 or $keyword_2 or $keyword_3
}