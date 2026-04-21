/* @bruin

name: ecommerce-analytics-bruin.de_pipeline.funnel_daily
type: bq.sql
materialization:
    type: table
depends:
  - ecommerce-analytics-bruin.de_pipeline.int_sessions

@bruin */

/* @architecture
owner: analytics-serving-layer
features:
  - analytics-serving-layer
  - data-pipeline
stages:
  - data-engineering
  - serving
capabilities:
  - data-pipeline.analytics-mart-materialization
  - analytics-serving-layer.serving-analytics-tables
role: mart
canonical: true
*/

SELECT
    session_date                                               AS event_date,
    campaign,
    device_category,
    traffic_source,
    COUNT(DISTINCT session_id)                                 AS sessions,
    SUM(reached_view)                                          AS view_sessions,
    SUM(reached_cart)                                          AS cart_sessions,
    SUM(reached_checkout)                                      AS checkout_sessions,
    SUM(reached_purchase)                                      AS purchase_sessions,
    SAFE_DIVIDE(SUM(reached_purchase), COUNT(DISTINCT session_id)) AS session_conversion_rate
FROM
    `ecommerce-analytics-bruin.de_pipeline.int_sessions`
GROUP BY
    session_date, campaign, device_category, traffic_source
