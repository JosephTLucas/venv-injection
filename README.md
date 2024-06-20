# venv injection

This repo contains a POC confirming my hypothesis that you can inject/overwrite dependencies in python venvs. Obviously this already requires a significant level of access, but could be used as part of a longer term or more tailored campaign.

## Scenario

An attacker with local access can overwrite dependencies in `site-packages`. When those dependencies are imported in user environments/scripts, they modified code will be used with no indicator to the user.

In this example, I added `print("Joe was here")` to `pandas.read_csv()`, but obviously you're only really limited by your imagination.

## Structure

- [make_bad.sh](make_bad.sh) is the construction of the malicious dependency that we want to inject into the user's context. It calls [add_code.sh](add_code.sh) to modify pandas.
- [make_clean.sh](make_clean.sh) represents the user creating their virtual environment with a standard `pip install pandas`.
- [exploit.sh](exploit.sh) is the overwriting of the user-installed pandas with our tampered version.
- [test.py](test.py) takes the place of the user's application code that you're attacking.

You should be able to run this with the provided Dockerfile. If `docker run` yields "Joe was here", the overwrite was successful.

I went with a complete directory swap instead of an in-place modification for cases where the code you're injecting relies on some kind of compiled objects, but in-place modification could also work for simple changes to simple libraries.