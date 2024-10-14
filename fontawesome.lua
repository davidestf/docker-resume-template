-- fontawesome.lua
function RawInline (el)
    if el.format == 'html' and el.text:find('class="fa[s]?') then
        local class_match = el.text:match('class="fa%s*(.-)"')
        if class_match then
            local command = string.format('\\faIcon{%s}', class_match)
            return pandoc.RawInline('latex', command)
        end
    end
    return el
end
