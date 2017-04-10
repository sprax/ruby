
# From Slack's interface:
# Usernames may only contain lowercase letters, numbers, periods, 
# dashes and underscores and must start with a letter or number.

# /^[a-z0-9][a-z0-9._-]*$/.test(username);

arg = 'adD TiCkEt "How do I @%#*$^? get Office 365?" fOr @sprax'
matched = arg.match(/add ticket ['"]?(.*)['"] for @([a-z0-9][a-z0-9._-]*$/i)

# Use (?i) and (?-i) to toggle case-sensitivity off and on again:
cased = arg.match(/(?i)add ticket ['"]?(.*)['"] for (?-i)@([a-z0-9][a-z0-9._-]*$)/)


arg = "add Ticket \"why is an orange?\" for <@U1YADV56J|sprax>"
used = arg.match(/(?i)add ticket ['"]?(.*)['"] for <@[0-9A-Z]{5,12}(?-i)|([a-z0-9][a-z0-9._-]*>$)/)

args = "add Ticket \"why is an orange?\" for <@U1YADV56J|sprax>"
args.match(/(?i)add ticket ['"]?(.*)['"] for (<@[^\|]{5,}\|(?-i)([a-z0-9][a-z0-9._-]*>$))/)

# /tallsprax Add ticKet "Why eat a peach?" for @sprax

