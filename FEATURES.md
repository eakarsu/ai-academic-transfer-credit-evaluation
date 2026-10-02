# Academic Transfer Credit Evaluation

Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals.

## Implemented records

- **Transfer Application**: name, application Number, student Reference, source Institution, target Program, submitted At, status.
- **Source Course**: name, course Code, institution, credits, grade, completed At, status.
- **Target Course**: name, course Code, department, credits, outcomes, catalog Version, status.
- **Syllabus Evidence**: title, version, contact Hours, learning Outcomes, assessment Methods, source Reference, status.
- **Articulation Agreement**: title, institution, version, effective At, expires At, terms, status.
- **Equivalency Proposal**: title, proposed Credits, rationale, status.
- **Faculty Evaluation**: title, faculty, reviewed At, decision, rationale, status.
- **Credit Award**: title, awarded Credits, award Type, awarded At, authorization Reference, status.
- **Transfer Appeal**: title, submitted At, reason, evidence, decision Due At, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Syllabus outcome comparison: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Course evidence extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Articulation term review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Faculty review preparation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Credit award explanation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Appeal evidence summary: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Transfer credit totals: Sum faculty-entered awards, reject duplicate source courses and show cap excess; equivalency is a reviewed decision.
- Transfer Application evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
