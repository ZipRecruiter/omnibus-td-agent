#!/usr/bin/env bats

load test_helper

setup() {
  init_redhat
  stub_redhat
}

teardown() {
  unstub_redhat
  rm -fr "${TMP}"/*
}

@test "show td-agent status successfully (redhat)" {
  echo 1234 > "${TMP}/var/run/td-agent/td-agent.pid"
  stub kill "-0 1234 : true"
  stub log_success_msg "echo \"\$@\""

  run_service status
  assert_output <<EOS
td-agent is running
EOS
  assert_success

  unstub kill
  unstub log_success_msg
}

@test "failed to show td-agent status (redhat)" {
  echo 1234 > "${TMP}/var/run/td-agent/td-agent.pid"
  stub kill "-0 1234 : false"
  stub log_failure_msg "echo \"\$@\""

  run_service status
  assert_output <<EOS
td-agent is not running
EOS
  assert_failure

  unstub kill
  unstub log_failure_msg
}
