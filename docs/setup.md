# Setup

Use this guide to bootstrap a local DE-PROJECT environment.

## Prerequisites

Install these tools before validating or running the project:

- Git
- Bruin CLI
- Python 3.13 or later if you want a local scripting/runtime baseline alongside Bruin
- Node.js 20 if you want to validate the Cube semantic layer locally
- access to BigQuery with permission to read the source dataset and write to the target datasets

## Source And Target Datasets

The project reads from the public GA4 sample dataset:

- `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

The project writes to:

- `de_pipeline_dev` for development runs
- `de_pipeline` for production runs

## Bruin Setup

Verify that Bruin is available:

```powershell
bruin --version
```

If Bruin is not installed yet, follow the official Bruin installation guide for your platform.

## Local Credentials

Create a local `.env.local` from `.env.local.example` and provide:

- `GCP_SERVICE_ACCOUNT_KEY`

Important rules:

- do not commit `.env.local`
- do not commit raw service account JSON
- use a service account that can read the public GA4 dataset and write to the target datasets

## Optional Cube Setup

If you want to validate the semantic layer locally:

```powershell
cd cube-semantic
npm ci
```

This installs the dependencies needed for local schema validation and development.

## First Validation Commands

From the repo root:

```powershell
bruin validate .
```

If you also want to check the Cube semantic layer locally:

```powershell
cd cube-semantic
npx cubejs-cli validate
```

## First Pipeline Run

Use the development environment first:

```powershell
bruin run --environment dev .
```

Switch to `prod` when you are ready to target the production dataset.

## After Setup

Continue with:

- [configuration.md](configuration.md) for config surfaces and secret handling
- [usage.md](usage.md) for day-to-day commands
- [pipeline.md](pipeline.md) for the end-to-end workflow
- [architecture.md](architecture.md) for the system design
