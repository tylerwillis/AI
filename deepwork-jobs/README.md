# DeepWork Jobs

Multi-step workflows with quality gates, built on [DeepWork](https://deepwork.md).

Each job here is a real implementation from my setup -- not an abstract template. To adapt one for your own use, point DeepWork at it:

```
/deepwork let's make a job like this: https://github.com/tylerwillis/AI/tree/main/deepwork-jobs/[job-name]
```

DeepWork reads the reference, asks you about your setup, and generates a customized version.

The majority of these jobs aren't software engineering. They're business processes: content publishing, competitive research, meeting analysis, report generation. Claude Code is a general-purpose automation platform, not just a code editor.

## [Content Publisher](content-publisher/)

7-step pipeline that scans your local projects for shareable content, helps you pick what to publish, researches each topic in depth, drafts writeups, and opens PRs to a GitHub repo. This job published itself -- it discovered and published everything in this repository.
