import { Arg, Mutation, Query, Resolver } from "type-graphql";
import { Deck } from "../models";
import { dbConn } from '../server'

@Resolver()
export class DeckResolver {
    constructor() {}

    @Query(() => [Deck])
    async decks(): Promise<Deck[]> {
        const client = await dbConn.client;
        const deckData = await client.query('SELECT * FROM Deck');
        const cardData = await client.query('SELECT * FROM Card');
        const decks = [];

        for (const deck of deckData.rows) {
            deck.cards = [];
            for (const card of cardData.rows) {
                if (card.deckid === deck.id) {
                    deck.cards.push(card)
                }
            }
           decks.push(deck) 
        }

        return decks;
    }

    @Mutation(() => Deck)
    async createsDeck(@Arg('name', {nullable: false}) name: string): Promise<Deck> {
        return new Deck('0', '', [])
    }
}