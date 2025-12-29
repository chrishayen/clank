import process;

const GH_TOKEN_ENV := "GH_TOKEN";
const POLL_INTERVAL_MS := 20000;
const ERROR_RETRY_MS := 60000;

fn main() {
    token := process.env(GH_TOKEN_ENV) or {
        print("Error: GH_TOKEN environment variable is not set");
        return;
    };

    result := process.shell("gh auth status") or {
        print("Error: GitHub authentication failed");
        print(err.message);
        return;
    };
    print("GitHub authentication successful");

    while true {
        result := process.shell("gh repo list --topic clank --json name --jq '.[].name'") or {
            print("Error fetching repositories:");
            print(err.message);
            print("Pausing for 1 minute before retry...");
            sleep(ERROR_RETRY_MS);
            continue;
        };

        if result.output.empty() {
            print("No repositories found with 'clank' topic");
        } else {
            print("Repositories with 'clank' topic:");
            print(result.output);
        }
        sleep(POLL_INTERVAL_MS);
    }
}
