# Process Definitions — Fine Higher Ordered Art

Process definitions structured as ICOM (Inputs, Controls, Outputs, Mechanisms) per IDEF0 standard.

## Structure

```
company/process/
  controls/         C3PO-authored constraints, approval gates, enterprise context, spec profiles, IDEF0 references
  interfaces/       Boundary contracts (A-0 ICOM, intercompany interfaces)
  mechanisms/       Process guides (SDD methodology)
```

## Authority

Files in `controls/` and `interfaces/` are **read-only**. They are authored and maintained by C3PO (the enterprise governance system). Changes originate in C3PO and are delivered via the exchange protocol.

To propose changes, use `/exchange write proposal` to send a proposal to C3PO.

Source: `G:\My Drive\A0 C3PO`
