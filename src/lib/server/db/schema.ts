import { pgTable, integer, text, serial } from 'drizzle-orm/pg-core';

export const UsersTable = pgTable('users', {
	id: serial('id').primaryKey()
});

export const MovieListTable = pgTable('MovieList', {
	id: serial('id').primaryKey(),
	name: text('name').notNull(),
	userId: integer('userId').references(() => UsersTable.id, { onDelete: 'cascade' })
});

export const MovieTable = pgTable('Movies', {
	id: serial('id').primaryKey(),
	title: text('title').notNull(),
	listId: integer('listId').references(() => MovieListTable.id, { onDelete: 'cascade' })
});
