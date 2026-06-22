agent Assistant {

    memory:auto

    on message(userText) {

        response = ai.reason(userText)

        if response.confidence < 0.7 {
            response = ai.research(userText)
        }

        return response
    }
}
