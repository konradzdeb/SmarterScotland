do_package_checks()

if (ci_on_travis()) {
  get_stage("deploy") %>%
    add_step(step_test_ssh()) %>%
    add_step(step_build_pkgdown()) %>%
    add_step(step_push_deploy(branch = "gh-pages", path = "docs"))
}
