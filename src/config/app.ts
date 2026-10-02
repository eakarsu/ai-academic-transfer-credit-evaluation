export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-academic-transfer-credit-evaluation",
  "title": "Academic Transfer Credit Evaluation",
  "tagline": "Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals.",
    "entities": [
      "TransferApplication",
      "SourceCourse",
      "TargetCourse"
    ],
    "workflows": [
      "syllabus-outcome-comparison",
      "course-evidence-extraction"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals.",
    "entities": [
      "SyllabusEvidence",
      "ArticulationAgreement",
      "EquivalencyProposal"
    ],
    "workflows": [
      "articulation-term-review",
      "faculty-review-preparation"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals.",
    "entities": [
      "FacultyEvaluation",
      "CreditAward",
      "TransferAppeal"
    ],
    "workflows": [
      "credit-award-explanation",
      "appeal-evidence-summary"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "TransferApplication": {
    "name": "TransferApplication",
    "label": "Transfer Application",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "applicationNumber",
        "kind": "string"
      },
      {
        "name": "studentReference",
        "kind": "string"
      },
      {
        "name": "sourceInstitution",
        "kind": "string"
      },
      {
        "name": "targetProgram",
        "kind": "string"
      },
      {
        "name": "submittedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "SourceCourse": {
    "name": "SourceCourse",
    "label": "Source Course",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "courseCode",
        "kind": "string"
      },
      {
        "name": "institution",
        "kind": "string"
      },
      {
        "name": "credits",
        "kind": "number"
      },
      {
        "name": "grade",
        "kind": "string"
      },
      {
        "name": "completedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "TargetCourse": {
    "name": "TargetCourse",
    "label": "Target Course",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "courseCode",
        "kind": "string"
      },
      {
        "name": "department",
        "kind": "string"
      },
      {
        "name": "credits",
        "kind": "number"
      },
      {
        "name": "outcomes",
        "kind": "string"
      },
      {
        "name": "catalogVersion",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "SyllabusEvidence": {
    "name": "SyllabusEvidence",
    "label": "Syllabus Evidence",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "sourceCourseId",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "contactHours",
        "kind": "number"
      },
      {
        "name": "learningOutcomes",
        "kind": "string"
      },
      {
        "name": "assessmentMethods",
        "kind": "string"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "ArticulationAgreement": {
    "name": "ArticulationAgreement",
    "label": "Articulation Agreement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "institution",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "terms",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "EquivalencyProposal": {
    "name": "EquivalencyProposal",
    "label": "Equivalency Proposal",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "sourceCourseId",
        "kind": "string"
      },
      {
        "name": "targetCourseId",
        "kind": "string"
      },
      {
        "name": "proposedCredits",
        "kind": "number"
      },
      {
        "name": "rationale",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "FacultyEvaluation": {
    "name": "FacultyEvaluation",
    "label": "Faculty Evaluation",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "equivalencyProposalId",
        "kind": "string"
      },
      {
        "name": "faculty",
        "kind": "string"
      },
      {
        "name": "reviewedAt",
        "kind": "date"
      },
      {
        "name": "decision",
        "kind": "string"
      },
      {
        "name": "rationale",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "CreditAward": {
    "name": "CreditAward",
    "label": "Credit Award",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "sourceCourseId",
        "kind": "string"
      },
      {
        "name": "awardedCredits",
        "kind": "number"
      },
      {
        "name": "awardType",
        "kind": "string"
      },
      {
        "name": "awardedAt",
        "kind": "date"
      },
      {
        "name": "authorizationReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "TransferAppeal": {
    "name": "TransferAppeal",
    "label": "Transfer Appeal",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "sourceCourseId",
        "kind": "string"
      },
      {
        "name": "submittedAt",
        "kind": "date"
      },
      {
        "name": "reason",
        "kind": "string"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "decisionDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "transferApplicationId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "syllabus-outcome-comparison",
    "title": "Syllabus outcome comparison",
    "description": "Syllabus outcome comparison using selected transfer application records and supplied evidence.",
    "prompt": "Syllabus outcome comparison for Academic Transfer Credit Evaluation. Operational scope: Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals. Specific AI scope: Compare syllabi and suggest equivalent courses; faculty approve awarded credit. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "course-evidence-extraction",
    "title": "Course evidence extraction",
    "description": "Course evidence extraction using selected transfer application records and supplied evidence.",
    "prompt": "Course evidence extraction for Academic Transfer Credit Evaluation. Operational scope: Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals. Specific AI scope: Compare syllabi and suggest equivalent courses; faculty approve awarded credit. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "articulation-term-review",
    "title": "Articulation term review",
    "description": "Articulation term review using selected transfer application records and supplied evidence.",
    "prompt": "Articulation term review for Academic Transfer Credit Evaluation. Operational scope: Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals. Specific AI scope: Compare syllabi and suggest equivalent courses; faculty approve awarded credit. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "faculty-review-preparation",
    "title": "Faculty review preparation",
    "description": "Faculty review preparation using selected transfer application records and supplied evidence.",
    "prompt": "Faculty review preparation for Academic Transfer Credit Evaluation. Operational scope: Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals. Specific AI scope: Compare syllabi and suggest equivalent courses; faculty approve awarded credit. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "credit-award-explanation",
    "title": "Credit award explanation",
    "description": "Credit award explanation using selected transfer application records and supplied evidence.",
    "prompt": "Credit award explanation for Academic Transfer Credit Evaluation. Operational scope: Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals. Specific AI scope: Compare syllabi and suggest equivalent courses; faculty approve awarded credit. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "appeal-evidence-summary",
    "title": "Appeal evidence summary",
    "description": "Appeal evidence summary using selected transfer application records and supplied evidence.",
    "prompt": "Appeal evidence summary for Academic Transfer Credit Evaluation. Operational scope: Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals. Specific AI scope: Compare syllabi and suggest equivalent courses; faculty approve awarded credit. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected transfer application records and supplied evidence.",
    "prompt": "Evidence completeness review for Academic Transfer Credit Evaluation. Operational scope: Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals. Specific AI scope: Compare syllabi and suggest equivalent courses; faculty approve awarded credit. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected transfer application records and supplied evidence.",
    "prompt": "Operations handoff draft for Academic Transfer Credit Evaluation. Operational scope: Manage course equivalencies, syllabus versions, articulation agreements, faculty reviews and student appeals. Specific AI scope: Compare syllabi and suggest equivalent courses; faculty approve awarded credit. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
