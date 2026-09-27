# Burn Stun System

A versatile system for applying burn and stun effects in FiveM.

## Features

- Apply burn effects to players with configurable duration and damage
- Apply stun effects to players with configurable duration and chance
- Log actions to a database for tracking and analysis

## Requirements

- FiveM server
- ESX framework
- MySQL database

## Installation

1. Download the script files.
2. Place the files in your FiveM server's resources directory.
3. Add the following line to your server.cfg file:

```
start BurnStunSystem
```

## Usage

### Commands

There are no player commands for this script. It is designed to be used by server administrators or other scripts.

### Permissions

This script does not require any specific permissions. It is designed to be used by server administrators or other scripts.

## Configuration

The script can be configured by editing the `config.lua` file. The following options are available:

```lua
Config = {}

-- Burn settings
Config.BurnDuration = 10 -- Duration of the burn effect in seconds
Config.BurnDamage = 5 -- Damage per second while burning

-- Stun settings
Config.StunDuration = 5 -- Duration of the stun effect in seconds
Config.StunChance = 0.5 -- Chance of successfully stunning a player

-- Database settings
Config.DatabaseName = 'burnstunsystem'
Config.DatabaseTable = 'burnstun_logs'
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=burn-stun-system&utm_content=bottom) — describe it in one sentence and get the full source code.
