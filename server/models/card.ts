import { Field, ObjectType } from "type-graphql";

@ObjectType()
export class Card {
    @Field()
    id: string;

    @Field()
    front!: string;

    @Field()
    back!: string;

    constructor(id: string, front: string, back: string) {
        this.id = id
        this.front = front
        this.back = back
    }
} 