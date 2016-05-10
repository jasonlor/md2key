-- NOTE: Using delay to prevent pbcopy overlap before pasting event.
-- We should think of a good way to prevent it or provide an option
-- to change the delay...
on run argv
  set indent to item 1 of argv as number
  set insertNewline to item 2 of argv as boolean

  tell application "System Events"
    delay 0.05 -- TODO: this should be configurable or removed

    keystroke "v" using { command down }

    if indent is greater than 0 then
      repeat indent times
        key code 48 -- tab
      end repeat
    else
      if indent is less than 0 then
        repeat indent * -1 times
          key code 48 using { shift down } -- tab
        end repeat
      end if
    end if

    if insertNewline is true then
      delay 0.05 -- TODO: this should be configurable or removed

      key code 36 -- return
    end if
  end tell
end run
