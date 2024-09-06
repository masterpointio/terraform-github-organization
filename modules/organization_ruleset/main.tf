resource "github_organization_ruleset" "this" {
  name = var.name

  enforcement = var.enforcement

  dynamic "rules" {
    for_each = var.rules
    content {
      dynamic "branch_name_pattern" {
        for_each = rules.value.branch_name_pattern

        content {
          operator = branch_name_pattern.value.operator
          pattern  = branch_name_pattern.value.pattern
          name     = branch_name_pattern.value.name
          negate   = branch_name_pattern.value.negate
        }
      }

      dynamic "commit_author_email_pattern" {
        for_each = rules.value.commit_author_email_pattern

        content {
          operator = commit_author_email_pattern.value.operator
          pattern  = commit_author_email_pattern.value.pattern
          name     = commit_author_email_pattern.value.name
          negate   = commit_author_email_pattern.value.negate
        }
      }

      dynamic "commit_message_pattern" {
        for_each = rules.value.commit_message_pattern

        content {
          operator = commit_message_pattern.value.operator
          pattern  = commit_message_pattern.value.pattern
          name     = commit_message_pattern.value.name
          negate   = commit_message_pattern.value.negate
        }
      }

      dynamic "committer_email_pattern" {
        for_each = rules.value.committer_email_pattern

        content {
          operator = committer_email_pattern.value.operator
          pattern  = committer_email_pattern.value.pattern
          name     = committer_email_pattern.value.name
          negate   = committer_email_pattern.value.negate
        }
      }

      creation         = rules.value.creation
      deletion         = rules.value.deletion
      non_fast_forward = rules.value.non_fast_forward

      dynamic "pull_request" {
        for_each = rules.value.pull_request

        content {
          dismiss_stale_reviews_on_push     = pull_request.value.dismiss_stale_reviews_on_push
          require_code_owner_review         = pull_request.value.require_code_owner_review
          require_last_push_approval        = pull_request.value.require_last_push_approval
          required_approving_review_count   = pull_request.value.required_approving_review_count
          required_review_thread_resolution = pull_request.value.required_review_thread_resolution
        }
      }

      required_linear_history = rules.value.required_linear_history
      required_signatures     = rules.value.required_signatures

      dynamic "required_status_checks" {
        for_each = rules.value.required_status_checks

        content {
          dynamic "required_check" {
            for_each = required_status_checks.value.required_check

            content {
              context        = required_check.value.context
              integration_id = required_check.value.integration_id
            }
          }

          strict_required_status_checks_policy = required_status_checks.value.strict_required_status_checks_policy
        }
      }

      dynamic "required_workflows" {
        for_each = rules.value.required_workflows

        content {
          dynamic "required_workflow" {
            for_each = required_workflows.value.required_workflow

            content {
              repository_id = required_workflow.value.repository_id
              path          = required_workflow.value.path
              ref           = required_workflow.value.ref
            }
          }
        }
      }

      dynamic "tag_name_pattern" {
        for_each = rules.value.tag_name_pattern

        content {
          operator = tag_name_pattern.value.operator
          pattern  = tag_name_pattern.value.pattern
          name     = tag_name_pattern.value.name
          negate   = tag_name_pattern.value.negate
        }
      }

      update = rules.value.update
    }
  }

  target = var.target

  dynamic "bypass_actors" {
    for_each = var.bypass_actors
    content {
      actor_id    = bypass_actors.value.actor_id
      actor_type  = bypass_actors.value.actor_type
      bypass_mode = bypass_actors.value.bypass_mode
    }
  }

  dynamic "conditions" {
    for_each = var.conditions
    content {
      dynamic "ref_name" {
        for_each = conditions.value.ref_name

        content {
          exclude = ref_name.value.exclude
          include = ref_name.value.include
        }
      }

      repository_id = conditions.value.repository_id

      dynamic "repository_name" {
        for_each = conditions.value.repository_name

        content {
          exclude = repository_name.value.exclude
          include = repository_name.value.include
        }
      }
    }
  }
}
