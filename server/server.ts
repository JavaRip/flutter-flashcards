import 'reflect-metadata';
import { ApolloServer } from '@apollo/server';
import { buildSchema } from 'type-graphql';
import { startStandaloneServer } from '@apollo/server/standalone'
import { Client } from 'pg'
import * as dotenv from "dotenv";
dotenv.config({ path: __dirname + '/.env' });

export class dbConn {
    static client = dbConn.getClient();
    
    static async getClient(): Promise<Client> {
        const client = await new Client({
            host: process.env.PG_HOST,
            port: Number(process.env.PG_PORT),
            user: process.env.PG_USER,
            password: process.env.PG_PASSWORD,
            database: process.env.PG_DATABASE,
            ssl: false,
        })
        client.connect();
        
        return client;
    };
};

async function bootstrap() {
    const schema = await buildSchema({resolvers: [__dirname + '/resolvers/**/*.ts']})
    const server = new ApolloServer({schema: schema})
    const { url } = await startStandaloneServer(server, { listen: { port: Number(process.env.GQLPORT) || 4000 }})
    console.log(url)
}

bootstrap()