# Pipeline

Use this document for the end-to-end DE-PROJECT workflow.

## High-Level Flow

```text
GA4 public ecommerce events in BigQuery
  -> Bruin staging and intermediate transforms
  -> business marts and ML feature tables
  -> BigQuery ML training and scoring
  -> Responsible AI and observability tables
  -> BigQuery serving layer
  -> Cube semantic layer
  -> Looker Studio dashboards
```

## Stage Sequence

### 1. Source Read

The pipeline reads the bounded GA4 sample dataset from:

- `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

This is a bounded batch flow rather than an incremental streaming system.

### 2. Staging

Bruin flattens nested GA4 event structures and normalizes the source into:

- `stg_events_flat`

### 3. Intermediate Modeling

The pipeline builds reusable modeled tables such as:

- `int_sessions`
- `int_customers`

### 4. Business Marts And ML Features

Bruin materializes analytics and ML-facing outputs including:

- `kpi_daily`
- `funnel_daily`
- `rfm_segments`
- `ltv_features`

### 5. BigQuery ML And Responsible AI

The ML layer trains, versions, and scores the LTV workflow inside BigQuery, then produces:

- model registry and run metadata
- prediction snapshots and history
- Responsible AI evaluation, drift, and parity outputs

### 6. Serving Layer

The curated BigQuery serving layer is the trusted physical data surface for downstream consumers.

### 7. Semantic Layer

Cube defines cubes, views, and governed measures on top of the serving tables.

That semantic surface is then consumed by BI tools through Cube Cloud SQL API.

### 8. BI Consumption

Looker Studio consumes the governed semantic layer rather than raw GA4 or raw transformation tables.

## Operational Flow

The operational execution path is:

- developers and CI validate changes
- GitHub Actions schedules or triggers production runs
- Bruin executes against the target environment
- downstream serving, semantic, and BI layers reflect the updated outputs

## Related Specialized Docs

- [bigquery-public-data.ga4_obfuscated_sample_ecommerce Dataset.md](bigquery-public-data.ga4_obfuscated_sample_ecommerce%20Dataset.md)
- [lineage.md](lineage.md)
- [architecture.md](architecture.md)
