import { Arg, FieldResolver, Mutation, Query, Resolver, Root } from "type-graphql";
import { Card, Deck } from "../models";
import { dbConn } from '../server'

@Resolver(() => Deck)
export class DeckResolver {
    constructor() {}

    @Query(() => [Deck])
    async decks(): Promise<Deck[]> {
        const client = await dbConn.client;
        const deckData = await client.query('SELECT * FROM Deck');

        return deckData.rows.map((deck) => new Deck(deck.id, deck.name, []))
    }

    @FieldResolver()
    async cards(@Root() deck: Deck): Promise<Card[]> {
        const client = await dbConn.client;
        const cardData = await client.query('SELECT * FROM Card WHERE deckid = $1', [deck.id]);

        return cardData.rows.map((card) => new Card(card.id, card.front, card.back));
    }

    @Mutation(() => Deck)
    async createsDeck(@Arg('name', {nullable: false}) name: string): Promise<Deck> {
        // create client connection and insert deck 
        return new Deck('0', '', [])
    }
}