import process;

const GH_TOKEN_ENV := "GH_TOKEN";
const POLL_INTERVAL_MS := 20000;
const ERROR_RETRY_MS := 60000;

fn test_constants() {
    assert_eq(GH_TOKEN_ENV, "GH_TOKEN");
    assert_eq(POLL_INTERVAL_MS, 20000);
    assert_eq(ERROR_RETRY_MS, 60000);
}

fn test_poll_interval_is_20_seconds() {
    assert_eq(POLL_INTERVAL_MS, 20 * 1000);
}

fn test_error_retry_is_60_seconds() {
    assert_eq(ERROR_RETRY_MS, 60 * 1000);
}
