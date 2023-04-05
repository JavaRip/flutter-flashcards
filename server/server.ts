import express, { Request, Response, Application, RequestHandler, NextFunction } from 'express';
const app: Application = express();

function asyncWrap(f: RequestHandler): RequestHandler {
  return (req: Request, res: Response, next: NextFunction) => {
    Promise.resolve(f(req, res, next))
      .catch((e) => next(e || new Error()));
  };
}

export function exampleRoute(req: Request, res: Response): void {
  console.log(req.body)
  res.json();
}

app.use(express.static('dist/client/'));
app.post('/getMove', express.json(), asyncWrap(exampleRoute));

const port = 8080;
console.log(`server running on ${port}`);
app.listen(port);