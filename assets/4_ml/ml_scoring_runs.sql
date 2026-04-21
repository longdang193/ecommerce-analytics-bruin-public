/* @bruin

name: ecommerce-analytics-bruin.de_pipeline.ml_scoring_runs
type: bq.sql
materialization:
    type: table
depends:
  - ecommerce-analytics-bruin.de_pipeline.ltv_predictions

@bruin */

/* @architecture
owner: lineage-and-observability
features:
  - analytics-serving-layer
  - lineage-and-observability
stages:
  - observability
  - serving
capabilities:
  - analytics-serving-layer.ml-operations-tables
  - lineage-and-observability.scoring-freshness-view
role: operations-table
canonical: true
*/

SELECT
    'ltv_model_v1'                    AS model_name,
    COUNT(*)                          AS rows_scored,
    MIN(scored_at)                    AS scoring_started_at,
    MAX(scored_at)                    AS scoring_ended_at,
    CURRENT_TIMESTAMP()               AS logged_at
FROM
    `ecommerce-analytics-bruin.de_pipeline.ltv_predictions`
