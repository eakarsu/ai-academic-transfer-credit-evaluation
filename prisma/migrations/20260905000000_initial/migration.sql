-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransferApplication" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "applicationNumber" TEXT NOT NULL,
    "studentReference" TEXT NOT NULL,
    "sourceInstitution" TEXT NOT NULL,
    "targetProgram" TEXT NOT NULL,
    "submittedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransferApplication_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SourceCourse" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "courseCode" TEXT NOT NULL,
    "institution" TEXT NOT NULL,
    "credits" DOUBLE PRECISION NOT NULL,
    "grade" TEXT NOT NULL,
    "completedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SourceCourse_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TargetCourse" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "courseCode" TEXT NOT NULL,
    "department" TEXT NOT NULL,
    "credits" DOUBLE PRECISION NOT NULL,
    "outcomes" TEXT NOT NULL,
    "catalogVersion" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TargetCourse_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SyllabusEvidence" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "sourceCourseId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "contactHours" DOUBLE PRECISION NOT NULL,
    "learningOutcomes" TEXT NOT NULL,
    "assessmentMethods" TEXT NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SyllabusEvidence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArticulationAgreement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "institution" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "terms" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ArticulationAgreement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EquivalencyProposal" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "sourceCourseId" TEXT NOT NULL,
    "targetCourseId" TEXT NOT NULL,
    "proposedCredits" DOUBLE PRECISION NOT NULL,
    "rationale" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EquivalencyProposal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FacultyEvaluation" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "equivalencyProposalId" TEXT NOT NULL,
    "faculty" TEXT NOT NULL,
    "reviewedAt" TIMESTAMP(3) NOT NULL,
    "decision" TEXT NOT NULL,
    "rationale" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FacultyEvaluation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CreditAward" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "sourceCourseId" TEXT NOT NULL,
    "awardedCredits" DOUBLE PRECISION NOT NULL,
    "awardType" TEXT NOT NULL,
    "awardedAt" TIMESTAMP(3) NOT NULL,
    "authorizationReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CreditAward_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransferAppeal" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "sourceCourseId" TEXT NOT NULL,
    "submittedAt" TIMESTAMP(3) NOT NULL,
    "reason" TEXT NOT NULL,
    "evidence" TEXT NOT NULL,
    "decisionDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransferAppeal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "transferApplicationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "TransferApplication_createdAt_idx" ON "TransferApplication"("createdAt");

-- CreateIndex
CREATE INDEX "SourceCourse_createdAt_idx" ON "SourceCourse"("createdAt");

-- CreateIndex
CREATE INDEX "SourceCourse_transferApplicationId_idx" ON "SourceCourse"("transferApplicationId");

-- CreateIndex
CREATE INDEX "TargetCourse_createdAt_idx" ON "TargetCourse"("createdAt");

-- CreateIndex
CREATE INDEX "TargetCourse_transferApplicationId_idx" ON "TargetCourse"("transferApplicationId");

-- CreateIndex
CREATE INDEX "SyllabusEvidence_createdAt_idx" ON "SyllabusEvidence"("createdAt");

-- CreateIndex
CREATE INDEX "SyllabusEvidence_transferApplicationId_idx" ON "SyllabusEvidence"("transferApplicationId");

-- CreateIndex
CREATE INDEX "ArticulationAgreement_createdAt_idx" ON "ArticulationAgreement"("createdAt");

-- CreateIndex
CREATE INDEX "ArticulationAgreement_transferApplicationId_idx" ON "ArticulationAgreement"("transferApplicationId");

-- CreateIndex
CREATE INDEX "EquivalencyProposal_createdAt_idx" ON "EquivalencyProposal"("createdAt");

-- CreateIndex
CREATE INDEX "EquivalencyProposal_transferApplicationId_idx" ON "EquivalencyProposal"("transferApplicationId");

-- CreateIndex
CREATE INDEX "FacultyEvaluation_createdAt_idx" ON "FacultyEvaluation"("createdAt");

-- CreateIndex
CREATE INDEX "FacultyEvaluation_transferApplicationId_idx" ON "FacultyEvaluation"("transferApplicationId");

-- CreateIndex
CREATE INDEX "CreditAward_createdAt_idx" ON "CreditAward"("createdAt");

-- CreateIndex
CREATE INDEX "CreditAward_transferApplicationId_idx" ON "CreditAward"("transferApplicationId");

-- CreateIndex
CREATE INDEX "TransferAppeal_createdAt_idx" ON "TransferAppeal"("createdAt");

-- CreateIndex
CREATE INDEX "TransferAppeal_transferApplicationId_idx" ON "TransferAppeal"("transferApplicationId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_transferApplicationId_idx" ON "OperationalTask"("transferApplicationId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_transferApplicationId_idx" ON "RuleVersion"("transferApplicationId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_transferApplicationId_idx" ON "DocumentRequirement"("transferApplicationId");

-- AddForeignKey
ALTER TABLE "SourceCourse" ADD CONSTRAINT "SourceCourse_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TargetCourse" ADD CONSTRAINT "TargetCourse_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SyllabusEvidence" ADD CONSTRAINT "SyllabusEvidence_sourceCourseId_fkey" FOREIGN KEY ("sourceCourseId") REFERENCES "SourceCourse"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SyllabusEvidence" ADD CONSTRAINT "SyllabusEvidence_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticulationAgreement" ADD CONSTRAINT "ArticulationAgreement_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquivalencyProposal" ADD CONSTRAINT "EquivalencyProposal_sourceCourseId_fkey" FOREIGN KEY ("sourceCourseId") REFERENCES "SourceCourse"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquivalencyProposal" ADD CONSTRAINT "EquivalencyProposal_targetCourseId_fkey" FOREIGN KEY ("targetCourseId") REFERENCES "TargetCourse"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquivalencyProposal" ADD CONSTRAINT "EquivalencyProposal_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FacultyEvaluation" ADD CONSTRAINT "FacultyEvaluation_equivalencyProposalId_fkey" FOREIGN KEY ("equivalencyProposalId") REFERENCES "EquivalencyProposal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FacultyEvaluation" ADD CONSTRAINT "FacultyEvaluation_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CreditAward" ADD CONSTRAINT "CreditAward_sourceCourseId_fkey" FOREIGN KEY ("sourceCourseId") REFERENCES "SourceCourse"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CreditAward" ADD CONSTRAINT "CreditAward_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransferAppeal" ADD CONSTRAINT "TransferAppeal_sourceCourseId_fkey" FOREIGN KEY ("sourceCourseId") REFERENCES "SourceCourse"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransferAppeal" ADD CONSTRAINT "TransferAppeal_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_transferApplicationId_fkey" FOREIGN KEY ("transferApplicationId") REFERENCES "TransferApplication"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

