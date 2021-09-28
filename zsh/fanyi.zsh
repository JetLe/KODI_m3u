#! /home/vac/.config/zsh/

fy() {
    word=`echo $1 | tr -d '\n' | xxd -plain | sed 's/\(..\)/%\1/g'`
    result=$(curl -s "http://fanyi.youdao.com/openapi.do?keyfrom=CoderVar&key=802458398&type=data&doctype=json&version=1.1&q=$word")
    echo "\033[31m【检索】:\033[0m\c"
    echo  $result | awk -F 'query":' '{print $(2)}' | awk -F ',' '{print $1}'
    echo "\033[33m【释义】:\033[0m\c"
    echo  $result | awk -F ':' '{print $(2)}' | awk -F ',' '{print $1}'
    echo "\033[36m【说明】:\033[0m\c"
    echo  $result | awk -F 'explains":' '{print $(2)}' | awk -F '}' '{print $1}'

    if test '-s' = $2; then
        say $(echo $result | awk -F ':' '{print $(2)}' | awk -F ',' '{print $1}');
    fi
}

tq() curl wttr.in/$1
