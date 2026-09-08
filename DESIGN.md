# Persona 5 Design System
Visual language derived from Persona 5 (Atlus, 2016).

## Palette: exact, closed set
| Token | Hex | Use |
|---|---|---|
| `--p5-red` | `#E60012` | Fills, borders, the one accent. Under ~15% of any screen. |
| `--p5-red-text` | `#FF4436` | Small red type on dark. `#E60012` is only 3.4:1 and fails. |
| `--p5-red-hot` | `#FF2A1F` | Hover / active fills. |
| `--p5-red-deep` | `#8E0009` | Hard offset shadows. Never a fill. |
| `--p5-black` | `#0B0709` | Page ground. Warm-shifted, not `#000`. |
| `--p5-soot` | `#241A1E` | Raised surface. |
| `--p5-ash` | `#3B2C32` | Hairlines, disabled. |
| `--p5-smoke` | `#A99CA1` | Muted text, 7.0:1 on the ground. |
| `--p5-bone` | `#F4EFEA` | Primary text, paper surfaces. |
| `--p5-go` | `#17E0D6` | Confirmed, complete, focus ring. |
| `--p5-hold` | `#FFC400` | Pending, caution. |
| `--p5-burn` | `#FF7A00` | Failed, expired, destructive. |

Semantic colours are **not** the accent. Never use red to mean "error". Red means *this product*.

## Type
- **Anton**: display. Uppercase, `line-height: .86`, always `skewX(-8deg)`. Child text un-skews.
- **Archivo**: UI and body. 400/600/700. Uppercase labels get `.1em` tracking.
- **Rock Salt**: hand scrawl. Max ~4 instances per screen, rotated −4°.

Scale: 12 / 13 / 15 / 19 / 28 / 44 / 68 / 112 px.

## Geometry: the rules that carry the aesthetic
1. `border-radius: 0`. Everywhere. No exceptions.
2. Every surface is a `clip-path` shard, torn paper, never a cropped rectangle.
3. House angle is `-8deg`. Panels tilt `-1.5deg`.
4. Shadows are hard offsets with **zero blur**, in `--p5-red-deep` or black.
5. Halftone stays at `.16` alpha under the text. Louder than that and it competes with body copy.

## Motion
`120ms` snap in with slight overshoot, `220ms` slide, `420ms` settle. Things arrive faster than they leave. One orchestrated moment per screen (the hero trigger); everything else is micro.

## Components
| Class | Role |
|---|---|
| `.p5-attack` | The hero trigger. Pentagon, one per screen. |
| `.p5-btn` | Standard action. Variants: `--primary`, `--ghost`, `--danger`, `--sm`. |
| `.p5-chip` | Toggle filter, driven by `aria-pressed`. |
| `.p5-tag` | Static state label. Variants: `--go`, `--alert`, `--hold`, `--solid`. |
| `.p5-gauge` | Progress or capacity. Variants: `--go`, `--hold`, `--burn`. |
| `.p5-banner` | The interrupt. Fang silhouette, shout plus body. |
| `.p5-jaw` | Primary nav. Active item slides out. |
| `.p5-card` | Content card with media, title, meta. |
| `.p5-step` | Sequenced HUD. `data-state="done | active"`. |
| `.p5-marquee` | Ticker. Must sit inside `.p5-marquee-clip`. |
| `.p5-input` | Text field. |
