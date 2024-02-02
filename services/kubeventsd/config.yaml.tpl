---
events:
  # Track Job completion
  - reason: [Completed]
    kind: [Job]
    to: [matrix]
  # Track all warnings in the cluster
  - type: [Warning]
    to: [matrix]

senders:
  - name: matrix
    spec:
      kind: Matrix
      template: |
        {% if type == "Normal" %}ℹ{% else %}⚠️{% endif %} A **{{ reason }}** event occured at **{{ eventTime }}**:<br/>
        > {{ message }}

        This relates to the **{{ involvedObject.apiVersion }}:{{ involvedObject.kind }}** `{{ involvedObject.name }}` in the `{{ involvedObject.namespace }}` namespace.

        ---
      homeserverUrl: "${homeserver}"
      roomId: "${room}"
      userId: "${username}"
      passwordEnv: "MATRIX_PASSWORD"
