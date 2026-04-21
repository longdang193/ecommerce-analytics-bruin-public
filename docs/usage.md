# Usage

Use this guide for normal day-to-day DE-PROJECT operations.

## Common Validation Flow

Validate the pipeline structure before running it:

```powershell
bruin validate .
```

If you are working on the Cube semantic layer, also validate it locally:

```powershell
cd cube-semantic
npm ci
npx cubejs-cli validate
```

## Common Pipeline Runs

Run the project in the development dataset:

```powershell
bruin run --environment dev .
```

Run against production when you are ready for the production dataset:

```powershell
bruin run --environment prod .
```

## Day-To-Day Working Loop

A practical local loop is:

1. Update Bruin SQL assets, pipeline config, or Cube models.
2. Run `bruin validate .`.
3. Validate Cube locally if you changed semantic models.
4. Run the pipeline in `dev` when you want to test materialized outputs.
5. Review the resulting BigQuery tables and downstream semantic behavior.

## Semantic Layer Usage

The semantic layer is implemented with Cube and modeled under `cube-semantic/model/`.

Typical workflows include:

- reviewing cubes and views
- validating schema changes locally
- connecting BI tools to the Cube-powered semantic surface

## Documentation Navigation

Use these docs during normal operation:

- [setup.md](setup.md)
- [configuration.md](configuration.md)
- [pipeline.md](pipeline.md)
- [architecture.md](architecture.md)
- [lineage.md](lineage.md)
