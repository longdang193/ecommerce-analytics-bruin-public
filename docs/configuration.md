# Configuration

Use this document to understand the public configuration surfaces in DE-PROJECT.

## Main Configuration Surfaces

The core runtime and delivery behavior is defined by:

- `pipeline.yml`
  - Bruin pipeline definition
  - environment separation between `dev` and `prod`
  - BigQuery connection settings sourced from `GCP_SERVICE_ACCOUNT_KEY`
- `.env.local.example`
  - local example for credential injection
- `.github/workflows/ci.yml`
  - continuous validation for the pipeline and Cube semantic layer
- `.github/workflows/scheduled-run.yml`
  - scheduled production pipeline execution
- `cube-semantic/cube.js`
  - Cube server configuration entrypoint
- `cube-semantic/package.json`
  - local semantic-layer dependency surface

## Environment Separation

The project uses separate BigQuery datasets for development and production:

- development: `de_pipeline_dev`
- production: `de_pipeline`

That separation is declared in `pipeline.yml` and used by both local runs and scheduled automation.

## Secrets And Credentials

Secrets do not belong in the repository.

This project expects:

- `GCP_SERVICE_ACCOUNT_KEY` for Bruin and workflow execution
- local credentials to live in `.env.local` or another secure local secret mechanism
- GitHub Actions secrets to provide the credential material for CI or scheduled runs

Do not commit:

- service account JSON files
- `.env.local`
- raw secret values in YAML, Markdown, or workflow files

## Cube Semantic Layer Configuration

The semantic layer lives under `cube-semantic/`.

Important public surfaces there are:

- `cube-semantic/model/cubes/`
- `cube-semantic/model/views/`
- `cube-semantic/cube.js`
- `cube-semantic/package.json`

Local development typically installs dependencies with `npm ci` inside `cube-semantic/`, then validates or runs Cube against the modeled BigQuery tables.

## Workflow Configuration

The public repo includes two main workflows:

- `ci.yml`
  - validates Bruin assets
  - validates the Cube model
- `scheduled-run.yml`
  - runs the production Bruin pipeline on a schedule or manual dispatch

Those workflows assume the necessary GitHub secrets are configured in the repository where they run.

## Configuration Ownership Guide

Use this rule of thumb:

- pipeline execution behavior belongs in `pipeline.yml`
- credential examples belong in `.env.local.example`
- semantic-layer modeling belongs in `cube-semantic/`
- workflow automation belongs in `.github/workflows/`
- explanatory guidance belongs in these docs

## Related Docs

- [setup.md](setup.md)
- [usage.md](usage.md)
- [pipeline.md](pipeline.md)
- [architecture.md](architecture.md)
