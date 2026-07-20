# Testing FAQS

Senior-level software testing interview FAQs with concise, practical answers.

---

## 1) What is the goal of software testing?

The goal of software testing is to identify defects, verify that the software behaves as expected, and reduce the risk of production failures. At a senior level, testing is also about confidence, feedback speed, and supporting safe delivery.

---

## 2) What is the difference between verification and validation?

Verification checks whether the product is being built correctly according to specifications. Validation checks whether the right product is being built for user needs. In simple terms: verification is “are we building it right?” and validation is “are we building the right thing?”

---

## 3) What is the test pyramid?

The test pyramid is a strategy that emphasizes having many fast unit tests, fewer integration tests, and even fewer end-to-end tests. It helps keep feedback fast, tests stable, and maintenance manageable. Senior engineers use it as a heuristic, not a rigid rule.

---

## 4) What is the difference between unit, integration, and end-to-end testing?

- **Unit tests** verify a small isolated piece of code.
- **Integration tests** verify interaction between components or systems.
- **End-to-end tests** validate a complete user flow through the system.

Each level has different cost, speed, and reliability tradeoffs.

---

## 5) Why are unit tests important?

Unit tests are fast, precise, and cheap to run. They help developers catch logic errors early and support refactoring by providing immediate feedback. They are best used for business rules and isolated behavior.

---

## 6) What makes a good test?

A good test is deterministic, readable, maintainable, focused, and valuable. It should fail for the right reason and be easy to understand. Good tests also avoid over-coupling to implementation details unless that is the point of the test.

---

## 7) What is test automation and why is it important?

Test automation is the use of scripts or tools to run tests repeatedly and consistently. It is important because it increases coverage, speeds up feedback, reduces manual effort, and supports CI/CD workflows. However, not everything should be automated.

---

## 8) What is regression testing?

Regression testing ensures that recent changes did not break existing functionality. It is essential after bug fixes, feature changes, refactoring, or dependency upgrades. Automation is especially valuable here.

---

## 9) What is smoke testing?

Smoke testing is a quick check to confirm the application is stable enough for deeper testing. It usually covers core functionality, such as app startup, login, and major user paths. It helps identify catastrophic failures early.

---

## 10) What is sanity testing?

Sanity testing is a focused check of a specific area after a small change or bug fix. It is narrower than regression testing and is used to confirm that a particular issue has been resolved or that a specific part of the system still behaves correctly.

---

## 11) What is exploratory testing?

Exploratory testing is a simultaneous process of learning, test design, and execution. It is useful when requirements are unclear, systems are complex, or you want to uncover edge cases that scripted tests may miss. Senior testers often combine it with automation.

---

## 12) What is risk-based testing?

Risk-based testing prioritizes test effort based on the likelihood and impact of failures. High-risk areas get more attention, while lower-risk areas may receive lighter coverage. This is a practical way to allocate limited testing resources.

---

## 13) What is a flaky test?

A flaky test passes and fails intermittently without code changes. Flakiness is often caused by timing issues, shared state, network dependence, race conditions, or environment instability. Senior teams treat flaky tests as technical debt because they erode trust in the suite.

---

## 14) How do you handle flaky tests?

Common strategies include:
- identifying the root cause
- removing timing dependence
- isolating test data
- avoiding shared mutable state
- making external dependencies deterministic
- using retries sparingly and only as a temporary mitigation

The goal is to fix instability, not hide it.

---

## 15) What is mocking and why is it used?

Mocking replaces real dependencies with controlled test doubles. It is used to isolate the unit under test, simulate edge cases, and avoid slow or brittle external calls. Senior engineers use mocks carefully to avoid tests that are too implementation-focused.

---

## 16) What is the difference between a mock, stub, spy, and fake?

- **Stub**: provides predefined responses
- **Mock**: verifies interactions or expectations
- **Spy**: records behavior while usually calling the real implementation
- **Fake**: a working but simplified implementation

These are tools for controlling dependencies in tests.

---

## 17) What is test coverage, and is 100% coverage enough?

Test coverage measures how much code is executed by tests, often in terms of lines, branches, or paths. High coverage is useful, but 100% coverage does not guarantee quality. Coverage should be treated as a signal, not a goal by itself.

---

## 18) What is behavior-driven development (BDD)?

BDD is an approach that focuses on describing software behavior in a business-readable way, often using Given-When-When-Then style scenarios. It helps align technical and business stakeholders, though BDD should still result in meaningful automated tests, not just documentation.

---

## 19) How do you test APIs effectively?

Effective API testing includes validating:
- status codes
- response schemas
- business rules
- authentication and authorization
- error handling
- idempotency
- performance and edge cases

Senior API testing also involves contract validation and integration with dependent systems.

---

## 20) What is the role of testing in CI/CD?

Testing is the quality gate that enables safe and frequent delivery. In CI/CD, tests run automatically at multiple stages to catch defects early, reduce risk, and provide fast feedback. Senior engineering teams design the pipeline so that failing tests block unsafe changes while keeping feedback fast enough to be useful.

---

If you want, I can also provide:
- **20 advanced testing questions**
- **testing interview FAQs for QA automation**
- **testing questions focused on unit/integration/e2e strategy**
- **a senior software testing cheat sheet**
