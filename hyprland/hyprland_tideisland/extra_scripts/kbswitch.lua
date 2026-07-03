mainMod = "SUPER"

hl.bind(mainMod .. " + Backspace", function()
    -- 1. Executa a troca nativa do teclado
    hl.dispatch(hl.dsp.exec_cmd("hyprctl switchxkblayout current next"))

    -- 2. Dispara o notify-send puro (O Noctalia captura e cria o balão pop-up)
    -- hl.dispatch(hl.dsp.exec_cmd([[
    --    LAYOUT=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | sed 's/(.*)//') && \
    --    notify-send -t 1000 "Teclado" "Layout: $LAYOUT"
    --]]))
end)
