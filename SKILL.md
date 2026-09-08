---
name: persona5-ui
description: Persona 5 derived visual system. Use when building or restyling any UI in this design language: screens, components, marketing.
---

# Persona 5 Design System

Load `tokens.css` and `components.css`; use `--p5-*` tokens and `.p5-*` classes rather than inventing values.

## Non-negotiables
- `border-radius: 0`. Every element. A rounded corner breaks the aesthetic outright.
- Every panel gets a `clip-path` shard silhouette (`--p5-clip-shard`, `--p5-clip-tag`, `--p5-clip-fang`, `--p5-clip-scrap`). Plain rectangles read as unfinished.
- Display type is Anton, uppercase, skewed `-8deg`. Un-skew child content with `skewX(8deg)`.
- Shadows are hard offsets, zero blur, `--p5-red-deep` or black.
- Dark only. Do not add a light theme.

## Colour discipline
Stay inside the twelve tokens in `DESIGN.md`. Red is a weapon, not a background. Keep it under roughly 15% of any screen. Use `--p5-red` for fills and `--p5-red-text` for small type, since `#E60012` is only 3.4:1 on the ground. Cyan `--p5-go` means confirmed and is also the focus ring; amber `--p5-hold` means pending; orange `--p5-burn` means failed or destructive.

## Voice
Short, declarative, a little cocky. "Take it." "Not yet." Never apologetic, never "Oops!".

## Accessibility
Keep the `--p5-go` focus ring on every interactive element; the skew and clip-path make default outlines unreadable. Honour `prefers-reduced-motion`. Body text stays `--p5-bone` on `--p5-black`; never set body copy in `--p5-red`. Halftone stays under `.16` alpha behind any text.
