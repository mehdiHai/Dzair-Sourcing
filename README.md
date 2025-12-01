# Dzair-Sourcing
Dzair Sourcing Cars – Advanced calculator for vehicle import costs in Algeria.  Supports USD/EUR, official vs parallel rates, new/used cars, engine types, full customs calculations, and multi-language (AR/FR/Tamazight).

## How to run locally
You can serve the static calculator with the included helper script:

```bash
# optionally override PORT, defaults to 3000
PORT=3000 ./start.sh
```

Then open `http://localhost:3000/index.html` in your browser.

## PDF fonts
- The PDF export is fully self-contained: DejaVu Sans regular and bold are embedded as Base64 strings inside `index.html`, so no external font downloads or binary assets are required.
