<!-- GENERATED FILE - do not edit directly. -->
<!-- Source: managed architecture metadata sources -->

# Feature Overview

## BigQuery Analytics Serving Layer

- Feature ID: `analytics-serving-layer`
- Status: `active`
- Contract: `docs/features/analytics-serving-layer/analytics-serving-layer.yaml`
- Source: redacted in public mirror
- Lineage: redacted in public mirror
- Summary: Curated physical BigQuery tables produced by the Bruin pipeline. Serves as the trusted single source of truth for downstream consumers such as Cube and BI tools.

## Cube Semantic Layer

- Feature ID: `cube-semantic-layer`
- Status: `active`
- Contract: `docs/features/cube-semantic-layer/cube-semantic-layer.yaml`
- Source: redacted in public mirror
- Lineage: redacted in public mirror
- Summary: Open-source semantic layer deployed on Cube Cloud. Defines cubes, views, and shared measures/dimensions once in YAML so dashboards consume governed metrics instead of redefining them per report.

## GA4 â†’ BigQuery Data Pipeline

- Feature ID: `data-pipeline`
- Status: `active`
- Contract: `docs/features/data-pipeline/data-pipeline.yaml`
- Source: redacted in public mirror
- Lineage: redacted in public mirror
- Summary: End-to-end ELT pipeline that reads GA4 ecommerce events from BigQuery public data, flattens nested fields, builds intermediate customer/session base tables, and materializes analytics marts, ML feature tables, Responsible AI evaluation tables, and observability tables orchestrated by Bruin.

## Deployment + CI/CD

- Feature ID: `deployment-cicd`
- Status: `building`
- Contract: `docs/features/deployment-cicd/deployment-cicd.yaml`
- Source: redacted in public mirror
- Lineage: redacted in public mirror
- Summary: GitHub Actions deployment layer for the Bruin pipeline and Cube semantic model. Provides environment separation, CI validation, scheduled production runs, and Cube Cloud auto-deploy on git push.

## Lineage + Observability

- Feature ID: `lineage-and-observability`
- Status: `active`
- Contract: `docs/features/lineage-and-observability/lineage-and-observability.yaml`
- Source: redacted in public mirror
- Lineage: redacted in public mirror
- Summary: First-class lineage traceability from source to mart, model, prediction, and BI, plus operational monitoring tables covering pipeline runs, data quality, freshness, model training/scoring, and Responsible AI alerts.

## Stages

- `data-engineering`: Data Engineering
- `deployment`: Deployment
- `observability`: Observability
- `semantic-layer`: Semantic Layer
- `serving`: Analytics Serving
