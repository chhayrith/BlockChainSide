# BlockChainSide

Run port:
vapor run serve --port 8080
vapor run serve --port 8090

API Routes
GET: http://127.0.0.1:8090/blockchain

POST: http://127.0.0.1:8080/mine
BODY Raw JSON:
{
    "from": "Jonh",
    "to": "Kimm",
    "amount": 50.0,
    "transactionType" : "domestic"
}

POST: http://127.0.0.1:8090/nodes/register
BODY Raw JSON:
[
    {
        "address": "http://127.0.0.1:8080"
    },
    {
        "address": "http://127.0.0.1:8090"
    }
]

