import { Arg, Mutation, Query, Resolver } from "type-graphql";
import { Deck } from "../models";
import { dbConn } from '../server'

@Resolver()
export class DeckResolver {
    constructor() {}

    @Query(() => [Deck])
    async decks(): Promise<Deck[]> {
        const client = await dbConn.client;
        const data = await client.query('SELECT * FROM Deck')
        console.log(data)
        return [
            new Deck('0', 'name')
        ];
    }

    @Mutation(() => Deck)
    async createsDeck(@Arg('name', {nullable: false}) name: string): Promise<Deck> {
        return new Deck('0', '')
    }
}