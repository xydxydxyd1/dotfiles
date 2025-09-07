function merge_table(old, new)
    for k, v in pairs(new) do
        if type(v) == "table" and type(old[k]) == "table" then
            old[k] = merge_table(old[k], v)
        else
            old[k] = v
        end
    end
    return old
end

return {
    merge_table = merge_table
}
