# SourceOS / SociOS keyboard contract bindings

This directory contains downstream bindings from `shortcut-overlay` to the
canonical keyboard-first interaction contracts defined in `SourceOS-Linux/sourceos-spec`.

## Purpose

`shortcut-overlay` is a consumer of the keyboard-navigation canon. It does not
own the cross-surface contract family; it binds to it.

## Current binding

- `shortcut-overlay.interaction-surface.json` — local binding for the OS-wide
  shortcut overlay surface, including host-boundary and command-bus references.

## Notes

- Canonical schema ownership remains in `sourceos-spec`.
- Browser, Office, and Mac-on-Linux streams should consume the same canon rather
  than defining parallel interaction contracts.
