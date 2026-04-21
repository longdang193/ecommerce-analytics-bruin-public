/* @bruin

name: ecommerce-analytics-bruin.de_pipeline.ml_training_runs
type: bq.sql
materialization:
    type: table
depends:
  - ecommerce-analytics-bruin.de_pipeline.ltv_model

@bruin */

/* @architecture
owner: analytics-serving-layer
features:
  - analytics-serving-layer
stages:
  - serving
capabilities:
  - analytics-serving-layer.ml-operations-tables
role: operations-table
canonical: true
*/

SELECT
    training_run,
    iteration,
    'ltv_model'                                AS model_name,
    loss,
    eval_loss,
    duration_ms,
    learning_rate,
    CURRENT_TIMESTAMP()                        AS run_timestamp
FROM
    ML.TRAINING_INFO(MODEL `ecommerce-analytics-bruin.de_pipeline.ltv_model`)
