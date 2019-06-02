structure(
    list(
        url = "http://statistics.gov.scot/sparql",
        status_code = 400L,
        headers = structure(
            list(
                server = "nginx",
                date = "Sun, 02 Jun 2019 16:41:12 GMT",
                `content-type` = "application/json; charset=utf-8",
                `transfer-encoding` = "chunked",
                connection = "keep-alive",
                status = "400 Bad Request",
                `x-frame-options` = "SAMEORIGIN",
                `x-xss-protection` = "1; mode=block",
                `x-content-type-options` = "nosniff",
                `cache-control` = "no-cache",
                `x-request-id` = "1d19e848-df66-4cf4-888d-f48c8199847f",
                `x-runtime` = "0.011374"
            ),
            class = c("insensitive", "list")
        ),
        all_headers = list(list(
            status = 400L,
            version = "HTTP/1.1",
            headers = structure(
                list(
                    server = "nginx",
                    date = "Sun, 02 Jun 2019 16:41:12 GMT",
                    `content-type` = "application/json; charset=utf-8",
                    `transfer-encoding` = "chunked",
                    connection = "keep-alive",
                    status = "400 Bad Request",
                    `x-frame-options` = "SAMEORIGIN",
                    `x-xss-protection` = "1; mode=block",
                    `x-content-type-options` = "nosniff",
                    `cache-control` = "no-cache",
                    `x-request-id` = "1d19e848-df66-4cf4-888d-f48c8199847f",
                    `x-runtime` = "0.011374"
                ),
                class = c("insensitive",
                          "list")
            )
        )),
        cookies = structure(
            list(
                domain = logical(0),
                flag = logical(0),
                path = logical(0),
                secure = logical(0),
                expiration = structure(numeric(0), class = c("POSIXct",
                                                             "POSIXt")),
                name = logical(0),
                value = logical(0)
            ),
            row.names = integer(0),
            class = "data.frame"
        ),
        content = charToRaw(
            "{\"errors\":\"There was a syntax error in your query: Lexical error at line 1, column 11.  Encountered: \\\" \\\" (32), after : \\\"TTTT\\\"\"}"
        ),
        date = structure(
            1559493672,
            class = c("POSIXct", "POSIXt"),
            tzone = "GMT"
        ),
        times = c(
            redirect = 0,
            namelookup = 3.5e-05,
            connect = 3.7e-05,
            pretransfer = 8.5e-05,
            starttransfer = 9.1e-05,
            total = 0.03804
        )
    ),
    class = "response"
)
