import { Field, ObjectType } from "type-graphql";

@ObjectType()
export class Review {
    @Field()
    id: string;

    @Field()
    cardId!: string;

    @Field()
    ts!: number; // timestamp

    @Field()
    correct!: boolean;

    constructor(id: string, cardId: string, ts: number, correct: boolean) {
        this.id = id
        this.cardId = cardId
        this.ts = ts
        this.correct = correct
    }
} 