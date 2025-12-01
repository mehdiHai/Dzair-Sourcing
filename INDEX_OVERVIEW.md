# Dzair Sourcing Index Overview

This document summarizes the main behaviors implemented in `index.html` to make it easier to understand or extend the single-page calculator.

## Stack and Entry Points
- The page is built as a standalone React 18 app rendered into `#app` via the UMD builds of React, ReactDOM, and Babel running in the browser.
- Tailwind is configured inline to provide a DZ color palette, while custom CSS handles layout and form polish.
- Service worker and manifest files enable PWA behavior.

## Localization
- All UI copy is defined in the `translations` object with Arabic and French keys, and the selected language also controls RTL/LTR layout.

## Key Data and Rates
- `defaultRates` seeds both official and black-market exchange rates for USD and EUR.
- Constants define customs logic: VAT (19%), solidarity tax (2%), vehicle-age-specific customs reductions, new-car vignette (150k DZD), and combined-rate tables for engine types.

## Inputs Collected
- Vehicle basics: price (FOB), condition (new vs. used), engine type, and currency.
- Foreign costs: freight and insurance in foreign currency at the black-market rate.
- Local costs: inspection, documentation, and port/broker fees in DZD.
- Exchange rates: user-adjustable official and black-market USD/EUR values.
- Resale period buckets (0–12, 12–24, 24–36, after 36 months) to model 2025 resale clawbacks on used-car advantages.

## Calculation Flow
1. Convert the FOB price and freight to DZD at the chosen black-market rate; sum local expenses and compute CIF customs value at the official rate.
2. For **new vehicles**, apply engine-specific customs duty rates, solidarity tax, and VAT, then add the fixed new-car vignette. Potential savings from choosing used vehicles are estimated using the discounted used-car combined rates.
3. For **used vehicles**, apply the combined customs rate table (base rate minus discount) to CIF, capturing both the final rate and the tax advantage amount for resale modeling.
4. Sum CIF-based taxes, vignette (if any), and local fees to present total cost; also keep exchange rates used for transparency.

## Resale Modeling (Finance Law 2025)
- For used cars, the stored tax advantage is pro-rated by the selected resale period: 100% refund (≤12 months), 66% (12–24), 33% (24–36), or none after 36 months. The UI surfaces both the refund owed and the advantage kept.

## PDF Export
- A jsPDF export generates a styled A4 report with logo, operation summary, detailed costs in DZD, advantage/resale sections, risk labels, and legal references.

## UI Highlights
- Organized cards collect inputs for vehicle info, foreign/local costs, and exchange rates with small helper tags.
- Result panels summarize conversion at black/official rates, customs breakdowns, total cost, and a savings banner encouraging used vehicles when applicable.
- Language toggle, currency toggle, and a CTA button drive the calculation; conditional render blocks hide outputs until a price is provided.
