# DeepWork Jobs

Portable [DeepWork](https://github.com/unsupervisedcom/deepwork) job definitions -- structured multi-step workflows with quality gates that AI agents execute. Each job defines a repeatable process: the steps, their inputs/outputs, review criteria, and how they chain together.

DeepWork jobs are YAML + markdown files. Drop them into any project's `.deepwork/jobs/` directory and run them with the [DeepWork Claude Code plugin](https://github.com/unsupervisedcom/deepwork).

The majority of these jobs aren't software engineering. They're business processes: content publishing, competitive research, meeting analysis, report generation. Claude Code is a general-purpose automation platform, not just a code editor.

## [Content Publisher](content-publisher/)

7-step pipeline that scans your local projects for shareable content, helps you pick what to publish, researches each topic in depth, drafts writeups, and opens PRs to a GitHub repo. This job published itself -- it discovered and published everything in this repository.
