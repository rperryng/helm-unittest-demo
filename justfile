# Run unit tests for helm templates
@test: helm-unittest

# Updates the template snapshots
@update-snapshots: (helm-unittest "true")

[private]
helm-unittest update-snapshots="false":
  @echo "Running helm templating unit tests ..."
  helm unittest ./ \
    {{ if update-snapshots == "true" { "--update-snapshot" } else { "" } }} \
    --values ./values.yaml
