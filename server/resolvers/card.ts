import { Arg, Mutation, Query, Resolver } from "type-graphql";
import { Card } from "../models";

@Resolver()
export class CardResolver {
    constructor() {}

    @Query(() => [Card])
    async decks(): Promise<Card[]> {

        return [
            new Card('0', '0', 'hello', 'world')
        ];
    }

    @Mutation(() => Card)
    async createsCard(
        @Arg('deckId', {nullable: false}) front: string, back: string): Promise<Card> {
        return new Card('0', '0', 'hello', 'newcard')
    }
}