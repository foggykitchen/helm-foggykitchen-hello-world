# helm-foggykitchen-hello-world

This repository contains the **Helm chart** used by FoggyKitchen OCI DevOps deployment patterns.

It is intentionally separate from the application repository:

- `foggykitchen-hello-world` builds the container image
- `helm-foggykitchen-hello-world` packages the deployment chart

That split keeps build and deploy responsibilities clean and composable.

---

## Purpose

The goal of this repository is to provide a **clean chart source** for OCI DevOps deployment patterns, including:

- Helm chart packaging in OCI DevOps
- OKE deployment using a chart artifact
- future canary and blue-green rollout patterns

---

## Repository Structure

```bash
helm-foggykitchen-hello-world/
├── helm/
│   └── helm-foggykitchen-hello-world-chart/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
├── build_spec.yaml
└── README.md
```

---

## OCI DevOps Usage

This repository is intended for chart packaging, not image building.

The included [build_spec.yaml](build_spec.yaml):

- derives a short `BUILDRUN_HASH` from `OCI_BUILD_RUN_ID`
- updates the chart version during the build
- packages the chart
- authenticates to OCI Registry as a Helm registry
- pushes the packaged chart to the OCI Helm repository

It intentionally does **not** build the application image. That belongs in:

- `foggykitchen-hello-world`

---

## Chart Notes

The chart now exposes:

- image repository, tag, and pull policy
- service type and port
- OCI Load Balancer shape settings
- optional ingress configuration
- optional image pull secrets
- replica count

This keeps it usable for both simple deploy patterns and future advanced rollout strategies.

---

## License

This repository is provided for educational and demo purposes.

