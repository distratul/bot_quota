#pragma semicolon 1
#include <sourcemod>

public Plugin:myinfo = 
{
    name = "[CS:GO] Bot Quota fix",
    author = "DisTraTuL",
    description = "Bot Quota fix",
    version = "1.0",
    url = "https://www.csgotracker.ro"
}

new Handle:g_hBotQuota;
 
public OnPluginStart()
{
    g_hBotQuota = FindConVar("bot_quota");
    if (g_hBotQuota != INVALID_HANDLE)
    {
        HookConVarChange(g_hBotQuota, OnBotQuotaChange);
    }
}
 
public OnBotQuotaChange(Handle:cvar, const String:oldVal[], const String:newVal[])
{
    if (StringToInt(newVal) > 0)
    {
        SetConVarInt(cvar, 0);
        //return Plugin_Handled;
    }
}  
