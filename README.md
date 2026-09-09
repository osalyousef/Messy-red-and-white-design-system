# Osama Design system

A design system derived from the UI of **Persona 5** (Atlus, 2016) and my own design: vermilion on soot, torn-paper edges, and type that leans eight degrees into the wind.

Plain CSS. No framework, no JavaScript, nothing to compile in your app. Three Google fonts are the only outside dependency.

Open `index.html` in a browser for the living styleguide: every component, rendered, with the rules beside it.

## Install

**npm**

```sh
npm install persona5-design-system
```

```css
@import "persona5-design-system/persona5.css";   /* tokens + components, one file */
```

Or take the halves separately:

```css
@import "persona5-design-system/tokens.css";
@import "persona5-design-system/components.css";
```

No bundler? `node_modules/persona5-design-system/persona5.css` is an ordinary stylesheet. Link it.

**CDN**

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/persona5-design-system@0.1/persona5.css">
```

**Copy the files**

Drop `tokens.css` and `components.css` into your project and link both. `components.css` is written entirely against the `--p5-*` custom properties, so it needs `tokens.css` present to render anything.

## Quick start

A whole page, from nothing:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo:wght@400;600;700&family=Rock+Salt&display=swap">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/persona5-design-system@0.1/persona5.css">

<body class="p5-ground">
  <h1 class="p5-display">Take your heart</h1>
  <p class="p5-lead">Everything below is one stylesheet and no script.</p>
  <div class="p5-row">
    <button class="p5-btn p5-btn--primary" type="button"><span>Confirm</span></button>
    <button class="p5-btn p5-btn--ghost" type="button"><span>Later</span></button>
  </div>
</body>
```

Two lines there are load-bearing:

- **The font link.** Anton, Archivo and Rock Salt do the work. Without them the type falls back to Arial Narrow and the system stops looking like itself. Self-host them if you prefer; keep the family names as they are in `tokens.css`.
- **`class="p5-ground"`.** It paints the warm black ground and the halftone. Every component assumes it is sitting on that.

## The `<span>` rule

Buttons, tags, chips and nav items are skewed −8°, and a skew shears the text with the box. Labels therefore sit in a child that un-skews itself:

```html
<button class="p5-btn"><span>Save</span></button>   <!-- upright text -->
<button class="p5-btn">Save</button>                <!-- sheared text -->
```

That is the single most common way to get this wrong.

## Components

| Class | Role | Shape |
|---|---|---|
| `.p5-attack` | Hero trigger, pentagon. One per screen. | `<button class="p5-attack"><span>Go</span></button>` |
| `.p5-btn` | Standard action. `--primary`, `--ghost`, `--danger`, `--sm`. | `<button class="p5-btn p5-btn--primary"><span>Confirm</span></button>` |
| `.p5-chip` | Filter toggle, state carried by `aria-pressed`. | `<button class="p5-chip" aria-pressed="true"><span>Active</span> <span class="p5-chip__count">12</span></button>` |
| `.p5-tag` | Static label. `--go`, `--alert`, `--hold`, `--solid`. | `<span class="p5-tag p5-tag--go"><span>Confirmed</span></span>` |
| `.p5-gauge` | Progress or capacity. `--go`, `--hold`, `--burn`. | `<div class="p5-gauge"><div class="p5-gauge__head"><span>Progress</span><span class="p5-gauge__val">62%</span></div><div class="p5-gauge__track"><div class="p5-gauge__fill" style="width:62%"></div></div></div>` |
| `.p5-banner` | The interrupt. Fang silhouette. `--hold`, `--go`. | `<div class="p5-banner"><span class="p5-banner__shout">Hold up!</span><span class="p5-banner__body">3 unsaved changes.</span></div>` |
| `.p5-jaw` | Primary nav. Active item slides out. | `<ul class="p5-jaw"><li class="p5-jaw__item" aria-current="page"><span>Overview</span></li></ul>` |
| `.p5-card` | Content card. | `<div class="p5-card"><div class="p5-card__media"></div><h3 class="p5-card__title">Quarterly Review</h3><div class="p5-card__meta">…</div></div>` |
| `.p5-step` | Sequenced HUD. `data-state="done \| active"`. | `<div class="p5-step" data-state="active"><span class="p5-step__no">02</span><div class="p5-step__body">…</div></div>` |
| `.p5-marquee` | Ticker. Must sit inside `.p5-marquee-clip`. | `<div class="p5-marquee-clip"><div class="p5-marquee"><div class="p5-marquee__track"><span>…</span><span>…</span></div></div></div>` |
| `.p5-field` | Text field. | `<div class="p5-field"><label class="p5-field__label" for="q">Search</label><div class="p5-input-shell"><input class="p5-input" id="q"></div></div>` |

Layout and type helpers: `.p5-ground`, `.p5-stack`, `.p5-row`, `.p5-shard` (`--paper`, `--ink`, `--tilt`), `.p5-display`, `.p5-eyebrow`, `.p5-lead`, `.p5-muted`, `.p5-scrawl`, `.p5-knockout`, `.p5-slash`.

## The rules that carry it

1. `border-radius: 0`. Everywhere.
2. Every surface is a `clip-path` shard, never a cropped rectangle.
3. House angle is `-8deg`; panels tilt `-1.5deg`.
4. Shadows are hard offsets with zero blur.
5. Red is a weapon, not a background. Under ~15% of any screen.

`DESIGN.md` gives the full spec: the twelve colours with contrast figures, the type scale, the motion timings.

## Pointing an agent at it

`SKILL.md` is the agent-facing version of the rules, short enough to sit in a context window. Give Claude or Cursor that file and it will stay inside the system instead of inventing values. Installed from npm it lands at `node_modules/persona5-design-system/SKILL.md`.

## Files

| File | Contents |
|---|---|
| `tokens.css` | Twelve colours, type scale, the −8° angle, spacing, hard-offset elevation, motion curves, five shard clip-paths. |
| `components.css` | Buttons, the All-Out Attack trigger, chips, tags, gauges, the HOLD UP banner, jaw nav, card, step HUD, marquee, fields, reduced-motion pass. |
| `persona5.css` | Generated. The two above, concatenated. What npm and the CDN serve. |
| `DESIGN.md` | The spec: palette with usage and contrast, type rules, the five geometry laws, component index. |
| `SKILL.md` | Agent-facing rules. |
| `index.html` | Generated. The living styleguide, self-contained. |
| `page-shell.css`, `page-body.html` | Sources for the styleguide page. |
| `build.sh` | Regenerates `persona5.css` and `index.html`. Run it after editing any source above. |

## Browser support

Custom properties, `clip-path`, `:focus-visible`, `prefers-reduced-motion`. Current Chrome, Safari, Firefox and Edge. No polyfills, no IE.

## Credit

The visual language belongs to Atlus. This repository is an independent interpretation of it as web UI, not affiliated with or endorsed by Atlus or Sega.

## Licence

MIT. See `LICENSE`.
