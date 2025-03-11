# -------------------------------------------
# Item Sign Command
# Created by: mvarken
# GitHub: https://github.com/mvarken
#
# Requirements:
# Citizen Built
# Denizen Built
# -------------------------------------------

sign_command:
    type: command
    name: sign
    usage: /sign
    description: Signiere einen Gegenstand mit deinem Namen.
    permission: signitem.use
    script:
    - if <player.item_in_hand> != <item[air]>:
        - if <player.item_in_hand.has_flag[signed]>:
            - narrate "Items können nur einmal signiert werden."
            - stop
        - if <player.item_in_hand.quantity.equals[1]>:
            - define text <context.raw_args.if_null[]>
            - define date <util.time_now.format[dd.MM.YYYY]>
            - define player_name <player.name>
            - inventory adjust slot:hand "lore:<player.item_in_hand.lore.if_null[]>|<&7>Signiert von <&6><[player_name]><&7> am <&e><[date]>"
            - inventory adjust slot:hand flag:signed:true
            - narrate "Du hast das Item erfolgreich signiert."
            - stop
        - else:
            - narrate "Du kannst nur einzelne Items signieren."
            - stop
    - else:
        - narrate "Du musst ein Gegenstand in der Hand halten, um es zu signieren."
        - stop
