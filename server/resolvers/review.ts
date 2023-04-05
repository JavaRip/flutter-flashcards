import { Arg, Mutation, Query, Resolver } from "type-graphql";
import { Review } from "../models";

@Resolver()
export class ReviewResolver {
    constructor() {}

    @Query(() => [Review])
    async decks(): Promise<Review[]> {

        return [
            new Review('0', '0', 1680720460, true)
        ];
    }

    @Mutation(() => Review)
    async createsCard(
        @Arg('cardId', {nullable: false}) ts: number, correct: boolean): Promise<Review> {
        return new Review('0', '0', 1680720460, true)
    }
}