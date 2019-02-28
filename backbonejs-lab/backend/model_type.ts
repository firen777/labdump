export interface IUser {
    id: string;
    username: string;
    password: string;
    greeting: string;
    gender: 'male'|'female'|'other';
}

export interface IArticle {
    title: string;
    content: string;
    author: string; //reference to IUser.id
}