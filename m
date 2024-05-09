Return-Path: <linux-next+bounces-2241-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB448C0AF0
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 07:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A30611C2081B
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 05:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D1C1494A6;
	Thu,  9 May 2024 05:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A7qBwnct"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD7D26D;
	Thu,  9 May 2024 05:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715232481; cv=none; b=aCdjJg6egPmsflsN86QPrTOgwP8EpNCNYygLpebM/MtHAzdcTEaNL1XXUyLdDP7JxvteOzhMfmdyOZK6cJ7ewIW+6oql4UQelmAKrhjdh50c0HiM9am1l8j69LuIL5/gjvpqFsbFL9xWBU5NeVZQdGUDImj7aIFEwA6W/yekLjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715232481; c=relaxed/simple;
	bh=I+47XEFh6b5rmRmXEQTYGFLVH6Rq1Q5dtD9kAXMcZ8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=edUx6Gx57c+GLka7fiup2LT5I7xM7WlEaWZGdzctg46/4YxbZkTCXzy4xlZdlR7C8agMEwEOKX9JBOwqhVtyyttTTaC+NrU1sbm4XerqEZQsLb5HSxSEJjgAQ/RU256YQMcuadgrgqnHSZwlbXu6Cd3YFW1c5n/6P5Dj/H939UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A7qBwnct; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715232470;
	bh=OiFjr8eeBnrjys+NcVU77ir+RjvKVv2n+fpJPVk/DvI=;
	h=Date:From:To:Cc:Subject:From;
	b=A7qBwnctxLYj6CWQ/gu3tTziGN8G7GVcrZCkKM2vhtGpLh0JoxR+1nQtIN/WzY4gx
	 Un/VPA5JzGpPGhFwt8R3SHsLS52lwCgD1jjgnFgk084vJEj8cM8lDeHgwSmx49zHMf
	 xyl3Xrf7UADo9FLYflBl1gHDk9ZQNplXoAe2OORgtleuOp8fLSZlbT2MCz+0w0aNN5
	 7GK3+npV8QtcmM2nK3kQnnqNBH8d/u8TgoGEBRhrnsfmseHezZdNEjct8fwqLpiPNQ
	 SbwBwXtZJPFFUdVwrASsMZopYnvZe6XmE+rHU9GvwYUtviZ7cjdc7ypNs/zfINuCI9
	 z6Voun3lDa3hQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZgWn1yqCz4x3C;
	Thu,  9 May 2024 15:27:49 +1000 (AEST)
Date: Thu, 9 May 2024 15:27:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Coly Li <colyli@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Mirvish <matthew@mm12.xyz>
Subject: linux-next: manual merge of the refactor-heap tree with the block
 tree
Message-ID: <20240509152745.08af752f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DC6FJK+sWMJ3qdz3Dr6HroC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DC6FJK+sWMJ3qdz3Dr6HroC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the refactor-heap tree got conflicts in:

  drivers/md/bcache/bset.c
  drivers/md/bcache/bset.h
  drivers/md/bcache/btree.c
  drivers/md/bcache/writeback.c

between commit:

  3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter")

from the block tree and commit:

  afa5721abaaa ("bcache: Remove heap-related macros and switch to generic m=
in_heap")

from the refactor-heap tree.

Ok, these conflicts are too extensive, so I am dropping the refactor-heap
tree for today.  I suggest you all get together and sort something out.

I fixed it up (see above) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Here are the conflicts:

diff --cc drivers/md/bcache/bset.c
index 463eb13bd0b2,bd97d8626887..000000000000
--- a/drivers/md/bcache/bset.c
+++ b/drivers/md/bcache/bset.c
@@@ -54,9 -54,11 +54,11 @@@ void bch_dump_bucket(struct btree_keys=20
  int __bch_count_data(struct btree_keys *b)
  {
  	unsigned int ret =3D 0;
 -	struct btree_iter iter;
 +	struct btree_iter_stack iter;
  	struct bkey *k;
 =20
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+=20
  	if (b->ops->is_extents)
  		for_each_key(b, k, &iter)
  			ret +=3D KEY_SIZE(k);
@@@ -67,9 -69,11 +69,11 @@@ void __bch_check_keys(struct btree_key
  {
  	va_list args;
  	struct bkey *k, *p =3D NULL;
 -	struct btree_iter iter;
 +	struct btree_iter_stack iter;
  	const char *err;
 =20
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+=20
  	for_each_key(b, k, &iter) {
  		if (b->ops->is_extents) {
  			err =3D "Keys out of order";
@@@ -1094,24 -1109,30 +1109,35 @@@ static inline bool btree_iter_end(struc
  void bch_btree_iter_push(struct btree_iter *iter, struct bkey *k,
  			 struct bkey *end)
  {
+ 	const struct min_heap_callbacks callbacks =3D {
+ 		.less =3D new_btree_iter_cmp,
+ 		.swp =3D new_btree_iter_swap,
+ 	};
+=20
  	if (k !=3D end)
- 		BUG_ON(!heap_add(iter,
- 				 ((struct btree_iter_set) { k, end }),
- 				 btree_iter_cmp));
+ 		BUG_ON(!min_heap_push(&iter->heap,
+ 				 &((struct btree_iter_set) { k, end }),
+ 				 &callbacks,
+ 				 NULL));
  }
 =20
 -static struct bkey *__bch_btree_iter_init(struct btree_keys *b,
 -					  struct btree_iter *iter,
 -					  struct bkey *search,
 -					  struct bset_tree *start)
 +static struct bkey *__bch_btree_iter_stack_init(struct btree_keys *b,
 +						struct btree_iter_stack *iter,
 +						struct bkey *search,
 +						struct bset_tree *start)
  {
  	struct bkey *ret =3D NULL;
 =20
++<<<<<<< HEAD
 +	iter->iter.size =3D ARRAY_SIZE(iter->stack_data);
 +	iter->iter.used =3D 0;
++=3D=3D=3D=3D=3D=3D=3D
+ 	iter->heap.size =3D ARRAY_SIZE(iter->heap.preallocated);
+ 	iter->heap.nr =3D 0;
++>>>>>>> refactor-heap/refactor-heap
 =20
  #ifdef CONFIG_BCACHE_DEBUG
 -	iter->b =3D b;
 +	iter->iter.b =3D b;
  #endif
 =20
  	for (; start <=3D bset_tree_last(b); start++) {
@@@ -1293,10 -1324,11 +1329,15 @@@ void bch_btree_sort_partial(struct btre
  			    struct bset_sort_state *state)
  {
  	size_t order =3D b->page_order, keys =3D 0;
 -	struct btree_iter iter;
 +	struct btree_iter_stack iter;
  	int oldsize =3D bch_count_data(b);
 =20
++<<<<<<< HEAD
 +	__bch_btree_iter_stack_init(b, &iter, NULL, &b->set[start]);
++=3D=3D=3D=3D=3D=3D=3D
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+ 	__bch_btree_iter_init(b, &iter, NULL, &b->set[start]);
++>>>>>>> refactor-heap/refactor-heap
 =20
  	if (start) {
  		unsigned int i;
@@@ -1323,11 -1355,13 +1364,17 @@@ void bch_btree_sort_into(struct btree_k
  			 struct bset_sort_state *state)
  {
  	uint64_t start_time =3D local_clock();
 -	struct btree_iter iter;
 +	struct btree_iter_stack iter;
 =20
++<<<<<<< HEAD
 +	bch_btree_iter_stack_init(b, &iter, NULL);
++=3D=3D=3D=3D=3D=3D=3D
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+=20
+ 	bch_btree_iter_init(b, &iter, NULL);
++>>>>>>> refactor-heap/refactor-heap
 =20
 -	btree_mergesort(b, new->set->data, &iter, false, true);
 +	btree_mergesort(b, new->set->data, &iter.iter, false, true);
 =20
  	bch_time_stats_update(&state->time, start_time);
 =20
diff --cc drivers/md/bcache/bset.h
index 011f6062c4c0,f79441acd4c1..000000000000
--- a/drivers/md/bcache/bset.h
+++ b/drivers/md/bcache/bset.h
@@@ -318,17 -323,7 +323,20 @@@ struct btree_iter=20
  #ifdef CONFIG_BCACHE_DEBUG
  	struct btree_keys *b;
  #endif
++<<<<<<< HEAD
 +	struct btree_iter_set {
 +		struct bkey *k, *end;
 +	} data[];
 +};
 +
 +/* Fixed-size btree_iter that can be allocated on the stack */
 +
 +struct btree_iter_stack {
 +	struct btree_iter iter;
 +	struct btree_iter_set stack_data[MAX_BSETS];
++=3D=3D=3D=3D=3D=3D=3D
+ 	MIN_HEAP_PREALLOCATED(struct btree_iter_set, btree_iter_heap, MAX_BSETS)=
 heap;
++>>>>>>> refactor-heap/refactor-heap
  };
 =20
  typedef bool (*ptr_filter_fn)(struct btree_keys *b, const struct bkey *k);
diff --cc drivers/md/bcache/btree.c
index d011a7154d33,a2bb86d52ad4..000000000000
--- a/drivers/md/bcache/btree.c
+++ b/drivers/md/bcache/btree.c
@@@ -1309,9 -1309,11 +1309,11 @@@ static bool btree_gc_mark_node(struct b
  	uint8_t stale =3D 0;
  	unsigned int keys =3D 0, good_keys =3D 0;
  	struct bkey *k;
 -	struct btree_iter iter;
 +	struct btree_iter_stack iter;
  	struct bset_tree *t;
 =20
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+=20
  	gc->nodes++;
 =20
  	for_each_key_filter(&b->keys, k, &iter, bch_ptr_invalid) {
@@@ -1570,9 -1572,11 +1572,11 @@@ static int btree_gc_rewrite_node(struc
  static unsigned int btree_gc_count_keys(struct btree *b)
  {
  	struct bkey *k;
 -	struct btree_iter iter;
 +	struct btree_iter_stack iter;
  	unsigned int ret =3D 0;
 =20
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+=20
  	for_each_key_filter(&b->keys, k, &iter, bch_ptr_bad)
  		ret +=3D bkey_u64s(k);
 =20
@@@ -1615,7 -1619,8 +1619,12 @@@ static int btree_gc_recurse(struct btre
  	struct gc_merge_info r[GC_MERGE_NODES];
  	struct gc_merge_info *i, *last =3D r + ARRAY_SIZE(r) - 1;
 =20
++<<<<<<< HEAD
 +	bch_btree_iter_stack_init(&b->keys, &iter, &b->c->gc_done);
++=3D=3D=3D=3D=3D=3D=3D
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+ 	bch_btree_iter_init(&b->keys, &iter, &b->c->gc_done);
++>>>>>>> refactor-heap/refactor-heap
 =20
  	for (i =3D r; i < r + ARRAY_SIZE(r); i++)
  		i->b =3D ERR_PTR(-EINTR);
@@@ -1912,8 -1916,10 +1921,10 @@@ static int bch_btree_check_recurse(stru
  {
  	int ret =3D 0;
  	struct bkey *k, *p =3D NULL;
 -	struct btree_iter iter;
 +	struct btree_iter_stack iter;
 =20
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+=20
  	for_each_key_filter(&b->keys, k, &iter, bch_ptr_invalid)
  		bch_initial_mark_key(b->c, b->level, k);
 =20
@@@ -1959,9 -1965,11 +1970,11 @@@ static int bch_btree_check_thread(void=20
  	cur_idx =3D prev_idx =3D 0;
  	ret =3D 0;
 =20
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+=20
  	/* root node keys are checked before thread created */
 -	bch_btree_iter_init(&c->root->keys, &iter, NULL);
 -	k =3D bch_btree_iter_next_filter(&iter, &c->root->keys, bch_ptr_bad);
 +	bch_btree_iter_stack_init(&c->root->keys, &iter, NULL);
 +	k =3D bch_btree_iter_next_filter(&iter.iter, &c->root->keys, bch_ptr_bad=
);
  	BUG_ON(!k);
 =20
  	p =3D k;
@@@ -2052,9 -2060,11 +2065,11 @@@ int bch_btree_check(struct cache_set *c
  	int ret =3D 0;
  	int i;
  	struct bkey *k =3D NULL;
 -	struct btree_iter iter;
 +	struct btree_iter_stack iter;
  	struct btree_check_state check_state;
 =20
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+=20
  	/* check and mark root node keys */
  	for_each_key_filter(&c->root->keys, k, &iter, bch_ptr_invalid)
  		bch_initial_mark_key(c, c->root->level, k);
@@@ -2548,11 -2558,12 +2563,16 @@@ static int bch_btree_map_nodes_recurse(
 =20
  	if (b->level) {
  		struct bkey *k;
 -		struct btree_iter iter;
 +		struct btree_iter_stack iter;
 =20
++<<<<<<< HEAD
 +		bch_btree_iter_stack_init(&b->keys, &iter, from);
++=3D=3D=3D=3D=3D=3D=3D
+ 		min_heap_init(&iter.heap, NULL, MAX_BSETS);
+ 		bch_btree_iter_init(&b->keys, &iter, from);
++>>>>>>> refactor-heap/refactor-heap
 =20
 -		while ((k =3D bch_btree_iter_next_filter(&iter, &b->keys,
 +		while ((k =3D bch_btree_iter_next_filter(&iter.iter, &b->keys,
  						       bch_ptr_bad))) {
  			ret =3D bcache_btree(map_nodes_recurse, k, b,
  				    op, from, fn, flags);
@@@ -2581,12 -2592,12 +2601,17 @@@ int bch_btree_map_keys_recurse(struct b
  {
  	int ret =3D MAP_CONTINUE;
  	struct bkey *k;
 -	struct btree_iter iter;
 +	struct btree_iter_stack iter;
 =20
++<<<<<<< HEAD
 +	bch_btree_iter_stack_init(&b->keys, &iter, from);
++=3D=3D=3D=3D=3D=3D=3D
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+ 	bch_btree_iter_init(&b->keys, &iter, from);
++>>>>>>> refactor-heap/refactor-heap
 =20
 -	while ((k =3D bch_btree_iter_next_filter(&iter, &b->keys, bch_ptr_bad)))=
 {
 +	while ((k =3D bch_btree_iter_next_filter(&iter.iter, &b->keys,
 +					       bch_ptr_bad))) {
  		ret =3D !b->level
  			? fn(op, b, k)
  			: bcache_btree(map_keys_recurse, k,
diff --cc drivers/md/bcache/writeback.c
index 792e070ccf38,c1d28e365910..000000000000
--- a/drivers/md/bcache/writeback.c
+++ b/drivers/md/bcache/writeback.c
@@@ -915,8 -915,9 +915,14 @@@ static int bch_dirty_init_thread(void *
  	k =3D p =3D NULL;
  	prev_idx =3D 0;
 =20
++<<<<<<< HEAD
 +	bch_btree_iter_stack_init(&c->root->keys, &iter, NULL);
 +	k =3D bch_btree_iter_next_filter(&iter.iter, &c->root->keys, bch_ptr_bad=
);
++=3D=3D=3D=3D=3D=3D=3D
+ 	min_heap_init(&iter.heap, NULL, MAX_BSETS);
+ 	bch_btree_iter_init(&c->root->keys, &iter, NULL);
+ 	k =3D bch_btree_iter_next_filter(&iter, &c->root->keys, bch_ptr_bad);
++>>>>>>> refactor-heap/refactor-heap
  	BUG_ON(!k);
 =20
  	p =3D k;

--=20
Cheers,
Stephen Rothwell

--Sig_/DC6FJK+sWMJ3qdz3Dr6HroC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY8XtEACgkQAVBC80lX
0Gx1cQgAlnYis1F3QZ9ig6G74MI7kIXKWQc4Fee7xsRxk4lHC4hEhHF9ekzE1HVt
kq1+lmwbzjh0J4nAcez0wLuVJ63+n5WVWaeXMLgAIXM7x1FsgmaHb0Op7NVxzXtx
8sNYm+wcLLmdYS59+/VDYuhx9dSSPR7/ZwFuO1RG05+fRb5ekTsOxy9NvJ7jHUxl
+VvRu1Bbp8MAafULTKNTii9OEqX5ZLSMSw7emOl1AxyxrOJEtT5kTyfHN1aGo78C
jHlIvqUUzkMhKkcd5Rq5qezDAM8+vu7GR6l1XiQbPsiux9wlbHj1ZGzjQ5aPR1g3
iwZ12JM6gZ94Sgfk31j2r+X2TgoIoQ==
=IZts
-----END PGP SIGNATURE-----

--Sig_/DC6FJK+sWMJ3qdz3Dr6HroC--

