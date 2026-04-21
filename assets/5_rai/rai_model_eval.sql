/* @bruin

name: ecommerce-analytics-bruin.de_pipeline.rai_model_eval
type: bq.sql
materialization:
    type: table
depends:
  - ecommerce-analytics-bruin.de_pipeline.ltv_model

@bruin */

/* @architecture
owner: data-pipeline
features:
  - analytics-serving-layer
  - data-pipeline
stages:
  - data-engineering
  - serving
capabilities:
  - data-pipeline.responsible-ai-evaluation
  - analytics-serving-layer.serving-analytics-tables
role: rai-table
canonical: true
*/

-- MODEL EVALUATION TYPE: evaluation (not monitoring)
-- INTERPRETATION NOTE: Metrics are computed against the PROXY LABEL (historical revenue over the same
-- observed period as features), not true future LTV. This model is a customer value scorer.
-- Treat R², MAE, MSE as fit quality on observed data — not predictive accuracy for future revenue.
SELECT
    *,
    CURRENT_TIMESTAMP() AS evaluated_at,
    'ltv_model'         AS model_name,
    'v1'                AS model_version
FROM
    ML.EVALUATE(MODEL `ecommerce-analytics-bruin.de_pipeline.ltv_model`)
