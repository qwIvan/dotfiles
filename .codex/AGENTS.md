<!-- context7 -->
Use the `ctx7` CLI to fetch current documentation whenever the user asks about a library, framework, SDK, API, CLI tool, or cloud service — even well-known ones like React, Next.js, Prisma, Express, Tailwind, Django, or Spring Boot. This includes API syntax, configuration, version migration, library-specific debugging, setup instructions, and CLI tool usage. Use even when you think you know the answer — your training data may not reflect recent changes. Prefer this over web search for library docs.

Do not use for: refactoring, writing scripts from scratch, debugging business logic, code review, or general programming concepts.

## Steps

1. Resolve library: `npx ctx7@latest library <name> "<what to look up>"` — use the official library name with proper punctuation (e.g., "Next.js" not "nextjs", "Customer.io" not "customerio", "Three.js" not "threejs")
2. Pick the best match (ID format: `/org/project`) by: exact name match, description relevance, code snippet count, source reputation (High/Medium preferred), and benchmark score (higher is better). If results don't look right, try alternate names or queries (e.g., "next.js" not "nextjs", or rephrase the question)
3. Fetch docs: `npx ctx7@latest docs <libraryId> "<what to look up>"` — run a separate `docs` command per distinct concept if the question spans multiple topics, unless it's about how they interact
4. Answer using the fetched documentation

You MUST call `library` first to get a valid ID unless the user provides one directly in `/org/project` format. Be specific about what to look up in the library's documentation — specific and detailed queries return better results than vague single words, but keep each query to a single concept unless the question is about how concepts interact; combined multi-topic queries dilute ranking and return shallow results for each topic. Do not run more than 3 commands per question. Do not include sensitive information (API keys, passwords, credentials) in queries.

For version-specific docs, use `/org/project/version` from the `library` output (e.g., `/vercel/next.js/v14.3.0`).

If a command fails with a quota error, inform the user and suggest `npx ctx7@latest login` or setting `CONTEXT7_API_KEY` env var for higher limits. Do not silently fall back to training data.
Run Context7 CLI requests outside Codex's default sandbox. If a Context7 CLI command fails with DNS or network errors such as ENOTFOUND, host resolution failures, or fetch failed, rerun it outside the sandbox instead of retrying inside the sandbox.
<!-- context7 -->

## 通用 Agent 要求

- 用户每个需求单独开一个对话。
- 只持久化用户明确提供或确认的内容，不写入助手的猜测或未经确认的扩展规则。
- 当单个 `.md` 文件过长、已经影响阅读或维护时，主动按主题拆分，并在原入口文档中保留清晰链接；避免过早拆分或产生大量零散文件。
- 对一次性或内部使用的小工具，优先采用自包含的单文件脚本；只有确有复用、配置管理或测试需要时才拆分多个文件。
- 脚本尽量简单易读，专注核心逻辑，避免堆叠边界判断和不必要的抽象。
- 用户偏好按顺序排列、方便人读和修改的命令清单脚本；除非必要，避免变量、条件判断、抽象和复杂封装。
- 对于需要多步骤、反复调用工具的特定任务，优先考虑启用新的子 agent 承担该任务，以减少主对话的上下文占用；由助手根据任务复杂度和类型选择子 agent 的模型与推理强度。

## GitHub MCP

- 当前环境提供 GitHub MCP 时，访问 GitHub 直接使用对应 MCP 工具；不要申请 `curl` 或其他网络命令访问 GitHub，也不要因等待此类批准而停下。
