---
name: sign-in-with-apple-is-the-default-path
levels: [L9]
mechanisms:
  - ASAuthorizationAppleIDButton as primary CTA
  - CloudKit for account-less sync (when applicable)
  - email/password demoted to secondary affordance
sources:
  - Bear: CloudKit sync, no account required
  - Things 3: CloudKit sync, no account at all
  - prestige indie apps: Apple ID primary, email secondary
related-properties: []
added: 2026-05-16
category: ia-flow-screen
---

# Sign in with Apple is the default path

Apple ID sign-in is the primary, visually dominant option; email is secondary. Passwords are an admission of failure.

## What it means

Every credential field is a churn surface — every character the user has to type is a chance to abandon. Sign in with Apple collapses authentication to a Face ID glance and removes the password entirely. AAA apps make it the visually dominant option (full-width Apple button at the top), demote email to a secondary affordance, and ideally eliminate accounts entirely via CloudKit when the data model allows.

## Exemplars

- **Bear** — CloudKit sync, no account screen at all
- **Things 3** — CloudKit sync, account-less by design
- **Most prestige indie apps** — Sign in with Apple is the primary CTA, email is a fallback link

## Violators (apps that pay the price)

- **Notion** — email/password primary, no Apple ID option for years
- **Robinhood** — regulatory requirements force traditional credentials
- **Legacy enterprise apps** — credentials-first because the backend predates federated identity

## Why it matters at AAA quality

Every credential field is a churn surface. Apple ID collapses sign-in to a Face ID glance, removing the single largest friction point in account-gated apps.

## Your reflection

<!-- Optional one-paragraph note. Leave empty if no reflection. -->
