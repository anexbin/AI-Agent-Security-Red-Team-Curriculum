# Lab Environment

**Do not point anything in here at a host you do not own.**

## Status

Not yet needed. Phase 0 (Projects 01-06) runs entirely on the local machine
against an LLM API -- no lab required.

## When it gets used

Phase 2 onward. Docker services (DVWA, Juice Shop) and Vagrant VMs run in
NAT mode, localhost-only, with no internet-facing ports.

## Coming files

- `docker-compose.yml` -- intentionally-vulnerable apps (Phase 4+)
- `vagrant/` -- Linux and network lab VMs (Phases 2-3)
- `README.md` -- per-lab setup + safety checklist
