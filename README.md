# Persona 5 Design System

A design system derived from the UI of **Persona 5** (Atlus, 2016): vermilion on soot, torn-paper edges, and type that leans eight degrees into the wind.

Plain CSS. No framework, no build step, no dependencies.

## Use it

```html
<link rel="stylesheet" href="tokens.css">
<link rel="stylesheet" href="components.css">
```

```html
<button class="p5-btn p5-btn--primary"><span>Confirm</span></button>
```

Buttons, tags, chips and nav items are skewed, so their label needs to sit in a child element that un-skews itself. That is what the `<span>` is for.

## Files

| File | Contents |
|---|---|
| `tokens.css` | Twelve colours, type scale, the −8° angle, spacing, hard-offset elevation, motion curves, five shard clip-paths. |
| `components.css` | Buttons, the All-Out Attack trigger, chips, tags, gauges, the HOLD UP banner, jaw nav, card, step HUD, marquee, fields, reduced-motion pass. |
| `DESIGN.md` | The spec: palette with usage and contrast, type rules, the five geometry laws, component index. |
| `SKILL.md` | Agent-facing rules. Point Claude or Cursor at this one. |
| `index.html` | The living styleguide. Self-contained; inlines both stylesheets. |
| `page-shell.css`, `page-body.html` | Sources for the styleguide page. |
| `build.sh` | Regenerates `index.html` from those sources. |

## The rules that carry it

1. `border-radius: 0`. Everywhere.
2. Every surface is a `clip-path` shard, never a cropped rectangle.
3. House angle is `-8deg`; panels tilt `-1.5deg`.
4. Shadows are hard offsets with zero blur.
5. Red is a weapon, not a background. Under ~15% of any screen.
## Credit

The visual language belongs to Atlus. This repository is an independent interpretation of it as web UI, not affiliated with or endorsed by Atlus or Sega.

## Licence

MIT. See `LICENSE`.
