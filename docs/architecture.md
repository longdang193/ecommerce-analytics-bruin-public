# Architecture

Use this document for the cross-cutting DE-PROJECT system architecture.

## System Overview

DE-PROJECT is an end-to-end GA4 ecommerce analytics system built around BigQuery, Bruin, BigQuery ML, Cube, and Looker Studio.

Its major responsibilities are:

- ingest and normalize bounded GA4 source data
- materialize trusted analytics and ML-serving tables
- train and score an LTV model inside BigQuery
- expose governed semantic definitions through Cube
- support lineage and observability as first-class outputs

## Major Components

### BigQuery Source

The system reads from the public GA4 ecommerce sample dataset hosted in BigQuery.

### Bruin Pipeline

Bruin is the execution and orchestration layer for:

- staging
- intermediate modeling
- marts
- ML feature preparation
- data quality checks
- operational table materialization

### BigQuery ML

Model training and scoring happen inside BigQuery, which keeps the MVP architecture compact and close to the data.

### Serving Layer

The serving layer is the trusted physical data surface for analytics, ML operations, and observability outputs.

### Cube Semantic Layer

Cube defines the governed semantic surface:

- physical cubes
- business-facing views
- shared measures and dimensions

This prevents dashboard-level metric drift.

### Looker Studio

Looker Studio is the primary BI consumption layer and connects through Cube Cloud SQL API.

### Lineage And Observability

The architecture explicitly includes:

- lineage diagrams
- run tracking
- freshness
- data quality
- model monitoring
- parity and drift outputs

## Boundary Model

The architecture can be understood as a layered chain:

```text
source -> transformation -> ML and monitoring -> serving -> semantic -> BI
```

In this repository, those layers correspond to the main solution areas:

- data pipeline
- analytics serving layer
- cube semantic layer
- lineage and observability
- deployment and CI/CD

## Integration Points

The most important system boundaries are:

- BigQuery public source -> Bruin SQL assets
- Bruin outputs -> BigQuery serving tables
- BigQuery serving tables -> Cube semantic models
- Cube semantic models -> Looker Studio dashboards
- GitHub Actions -> Bruin and deployment surfaces

## Why The System Is Shaped This Way

This repo favors a relatively compact stack where each layer has one clear responsibility:

- BigQuery for storage and compute
- Bruin for orchestration and transforms
- BigQuery ML for in-warehouse ML workflows
- Cube for semantic governance
- Looker Studio for consumption
- explicit lineage and observability for trust and operability

That shape keeps the project understandable while still covering analytics, ML, BI, and monitoring concerns.

## Related Docs

- [pipeline.md](pipeline.md)
- [lineage.md](lineage.md)
- [bigquery-public-data.ga4_obfuscated_sample_ecommerce Dataset.md](bigquery-public-data.ga4_obfuscated_sample_ecommerce%20Dataset.md)
