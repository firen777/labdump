interface IUser {
    id: string;
    username: string;
    password: string;
    greeting: string;
    gender: 'male'|'female'|'other';
}

interface IArticle {
    title: string;
    content: string;
    author: string; //reference to IUser.id
}