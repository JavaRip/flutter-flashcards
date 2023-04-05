import { Field, ObjectType } from "type-graphql";

@ObjectType()
export class Card {
    @Field()
    id: string;

    @Field()
    deckId!: string;

    @Field()
    front!: string;

    @Field()
    back!: string;

    constructor(id: string, name: string, front: string, back: string) {
        this.id = id
        this.deckId = name
        this.front = front
        this.back = back
    }
} 