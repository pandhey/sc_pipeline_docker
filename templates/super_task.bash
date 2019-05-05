#!/bin/bash

chmod +x align_task.bash

{% for SampleId in SampleIds %}
id{{ loop.index }}=`./align_task.bash {{ SampleId }}`
{% endfor %}
