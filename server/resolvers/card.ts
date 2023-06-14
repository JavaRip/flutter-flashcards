import { Arg, Mutation, Query, Resolver } from "type-graphql";
import { Card } from "../models";
import { dbConn } from "../server";

@Resolver()
export class CardResolver {
    constructor() {}

    @Query(() => [Card])
    async cards(): Promise<Card[]> {
        const client = await dbConn.client;
        const data = await client.query('SELECT * FROM Card');

        // map required because deckId in database is deckid in data.rows. snake_case?
        return data.rows.map(x => {
            return {
                id: x.id,
                deckId: x.deckid,
                front: x.front,
                back: x.back,
            }
        })
    }

    @Mutation(() => Card)
    async createsCard(@Arg('deckId', {nullable: false}) front: string, back: string): Promise<Card> {
        // insert cards from deckId
        return new Card('0', 'hello', 'newcard')
    }
}