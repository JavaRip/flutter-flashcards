import { Field, ObjectType } from "type-graphql";
import { Card } from "./card";

@ObjectType()
export class Deck {
    @Field()
    id: string;

    @Field()
    name: string;

    @Field(() => [Card])
    cards: Card[];

    constructor(id: string, name: string, cards: Card[]) {
        this.id = id
        this.name = name
        this.cards = cards
    }
} 