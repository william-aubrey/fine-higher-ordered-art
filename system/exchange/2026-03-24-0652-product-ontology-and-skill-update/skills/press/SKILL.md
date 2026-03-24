---
name: press
description: Generate personalized, watermarked PDFs for specific recipients. Parses natural language for title, recipient, email, then confirms and asks for a personal message before generating.
argument-hint: <copy of [title] for [name]. email is [email]>
user-invocable: true
---

# /press

Generate a personalized, watermarked PDF from the Librarian's Press.

## Step 0: Parse Input

Extract from the natural language arguments:

| Field | How to find it | Required |
|---|---|---|
| **Title** | The text after "copy of" and before "for" | Yes |
| **Recipient** | The name after "for" | Yes |
| **Email** | After "email is" or "email:" or similar | Optional |

If any required field can't be parsed, ask the user to clarify.

## Step 1: Resolve the Title

Look up the title against known manuscripts in the Press product catalog. Currently available:

| Title (matches) | Source path | Output dir |
|---|---|---|
| `c3po 3rd edition`, `3rd edition`, `3e`, `origin story` | `agents/librarian/products/library/make/whitepapers/c3po-3rd-edition/02-final-drafts/c3po-3rd-edition.md` | `agents/librarian/products/press/make/output/c3po-3rd-edition/` |

If no match, tell the user: "I don't have a manuscript registered for '[title]'. Available titles: [list]."

## Step 2: Confirm and Ask for Message

Present the details back to the user:

```
**Press Order Confirmation**

- **Title:** [resolved title]
- **Recipient:** [name]
- **Email:** [email or "not provided"]

What personal message would you like to include for [first name]?
(This appears on the personalization page. Press Enter to skip.)
```

**Stop and wait for the user's response.**

## Step 3: Generate

After the user provides a message (or says to skip), run the script:

```bash
python "agents/librarian/products/press/make/tools/personalize-pdf.py" \
  --name "[Recipient Name]" \
  --email "[email]" \
  --message "[personal message]" \
  --source "[resolved source path]" \
  --output "[resolved output dir]"
```

Omit `--email` if not provided. Omit `--message` if skipped.

## Step 4: Log the Pressing

Append a row to `agents/librarian/products/press/press-log.md`:

```
| [next #] | [YYYY-MM-DD] | [title] | [recipient] | [email] | [filename] | [pages] |
```

If the file doesn't exist, create it with the header row first.

## Step 5: Report

Show the user:
- Output file path
- Page count and file size
- Reminder: "PDF is in `[output dir]`. Ready to send to [recipient]."
