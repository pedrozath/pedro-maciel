---
---

$("main").html """
  {% haml portfolio/jobs.haml %}
"""

if $("[data-partial=\"nav_jobs\"]").length > 0
  do app.assign_elements_to_filter

else
  $ """
    {% haml portfolio/nav_jobs.haml %}
  """
  .prependTo(".content")
  do app.init_filter
  do app.fixed_nav