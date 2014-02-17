# motd tips

## /etc/issue
This file displays its contents when logging in on a tty (local terminal).

## /etc/motd
aka "Message Of The Day", contents are displayed when logging in from a ssh connection.

```
<% scope.to_hash.keys.each do |k| -%>
<%= k %>
<% end -%>
```

to output variables.