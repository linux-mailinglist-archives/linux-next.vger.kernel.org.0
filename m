Return-Path: <linux-next+bounces-2265-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA898C2060
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 11:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9D8DB21025
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 09:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CF814901F;
	Fri, 10 May 2024 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRWdVhOC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA876160880;
	Fri, 10 May 2024 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715332267; cv=none; b=okNUW1BbwGf+pC9NZWSdCQj/HQaFdGWujowDN5i0pk22IEL5p6UIm6rUwlcbgh1GQMZ5n7wXlKUXpIQ/M6bggBCwPKxLaSm+9JQzxeChdqEuM3S3/WqhMJkViXgQMvQYhLhSzmruJTtoL3X5cEfJS1jC3wVK/vecYX3oDIy1Y44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715332267; c=relaxed/simple;
	bh=iy7T+nDEmQevJHgHb9cm4kq3bs7CgLJ1Dtnev5Merg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNLm8dQapLdzxw8Rq+I7dz2yJARqIHtT0/cxV817F9t4xN0K+c9wIfYiJYA0wK9FzqoqCcvmbX9qEcXBXdVSVCXWu4fuasGUVB5Zzp7G/b48TmRDecKtxyNKe+Ch++Vy0+uoXzzKAW3fSQVPgBc3GHtI21Rolos8THupWK50Fsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRWdVhOC; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2b6215bcd03so485140a91.1;
        Fri, 10 May 2024 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715332263; x=1715937063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VyERfLizY6BgQpVDrcWfYPOa4d57tfajrLUm4Pmk48A=;
        b=NRWdVhOCa561i8IV/o6EZ0ff888HpZbZHU91SWpoXsIgRT0lTcmLDya+QbpDKZPP6P
         CmJqdW8PPPRLgvVM5eL8PZUO6qokPBDGlsdZLisBzsgWZyLZhVulS+JWBvUQMGWigsNm
         pxQKE1/fVA33vEmsGOYSWZJh4wbD9ca+ricprIgdInHhFzdxIuU3QhbzzlKemEtKSoj0
         2nu468r3Fk0j/o4dMDdVPW1+GjfAZGM/ZnMOMyPD0TXkJvBxoI/6jE6FEeqrrTqSrW5O
         aDhTuWnAcXlnD7TSecoypvvYjHEfUUv3VLRYNOWcUg7Yp9YVD+xf/SPteiBdja8wostF
         u5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715332263; x=1715937063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyERfLizY6BgQpVDrcWfYPOa4d57tfajrLUm4Pmk48A=;
        b=N2bEMCAYkl8s6mjKK8IvcSN8TFeMHmYU7vesmo5Cnd0ArDY0+XTuHk53Y83rEYobYn
         bOCRebmMHm4j3Wz7uJF2FEp02oAB3F+CZ0qrEOMR1xZXagzK5gAS+DkHWZmwEvD/yT4G
         nIBPQ2P53dhHC9+sfkzEIuNt5Ut4IM6KzDkeqOBIlO+ZjSkXWowJBfWr2bANMWIAoVXF
         SRrXTC5lEUh/hQeFWQKjeKOE1eUingEQSbyDYyaoCCG8kEdI/tyS3HBF1UmyZuMrcn5C
         MXo7F9DNJC68idRr8cj+jQWpTtFQ+gPgL5idIimkjWjGvw2CGWv5gEBziZ5xNHPtThKi
         RhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcIF7m5726Pkmb/Wih2R0zHYhJVPL8SZzEd2UKHnJ3QuPgwl42RDoUTuGz+sytwHUBFDVxRYKYY2mpXoLNKpj9jRH+32PbHfKq3IqjZsdoEhYZhttaIIh+veTeZu8CWfRzylsifBEQJw==
X-Gm-Message-State: AOJu0YzOni/X9c19BjK/T0RjdodAKRBQZQjOTUE8S4Q6MVN02hmnGKr8
	OC+2kd+Ri5VvK1ci18QR0meQD7Es1oraf1EFOQ8KJWr72yJOoW9+
X-Google-Smtp-Source: AGHT+IG6LoL7ehLAK7aJd4+hkhkaXGvXN764Pbud5L3mtmcuM9ZR6CtHCi03gTwJKAXL80A+Iubwxw==
X-Received: by 2002:a17:902:cec6:b0:1eb:ac3c:e39f with SMTP id d9443c01a7336-1ef441b5da6mr23105225ad.6.1715332262517;
        Fri, 10 May 2024 02:11:02 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d35fcsm28053615ad.25.2024.05.10.02.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 02:11:01 -0700 (PDT)
Date: Fri, 10 May 2024 17:10:59 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Matthew Mirvish <matthew@mm12.xyz>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Coly Li <colyli@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <Zj3kowGa9XzJ0yak@visitorckw-System-Product-Name>
References: <20240509152745.08af752f@canb.auug.org.au>
 <te64v6zwwor6jkco6uiu2zz7ern6ijhyu5okfvdz3bmj3w5qfp@mx4zdniwymqj>
 <Zj1RzZdtfL7UQax1@visitorckw-System-Product-Name>
 <buehluxvo234sj7onzl6wwjmuslmnkh7g6vnpru23kpti6qmpp@7nqak2ser7mw>
 <Zj2PX6Fy3BEnQc50@visitorckw-System-Product-Name>
 <20240510034618.GA3161190@mm12.xyz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510034618.GA3161190@mm12.xyz>

On Thu, May 09, 2024 at 11:46:18PM -0400, Matthew Mirvish wrote:
> On Fri, May 10, 2024 at 11:07:11AM +0800, Kuan-Wei Chiu wrote:
> > On Thu, May 09, 2024 at 07:16:31PM -0400, Kent Overstreet wrote:
> > > On Fri, May 10, 2024 at 06:44:29AM +0800, Kuan-Wei Chiu wrote:
> > > > On Thu, May 09, 2024 at 03:58:57PM -0400, Kent Overstreet wrote:
> > > > > On Thu, May 09, 2024 at 03:27:45PM +1000, Stephen Rothwell wrote:
> > > > > > Hi all,
> > > > > > 
> > > > > > Today's linux-next merge of the refactor-heap tree got conflicts in:
> > > > > > 
> > > > > >   drivers/md/bcache/bset.c
> > > > > >   drivers/md/bcache/bset.h
> > > > > >   drivers/md/bcache/btree.c
> > > > > >   drivers/md/bcache/writeback.c
> > > > > > 
> > > > > > between commit:
> > > > > > 
> > > > > >   3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter")
> > > > > > 
> > > > > > from the block tree and commit:
> > > > > > 
> > > > > >   afa5721abaaa ("bcache: Remove heap-related macros and switch to generic min_heap")
> > > > > > 
> > > > > > from the refactor-heap tree.
> > > > > > 
> > > > > > Ok, these conflicts are too extensive, so I am dropping the refactor-heap
> > > > > > tree for today.  I suggest you all get together and sort something out.
> > > > > 
> > > > > Coli and Kuan, you guys will need to get this sorted out quick if we
> > > > > want refactor-heap to make the merge window
> > > > 
> > > > Hi Coli and Kent,
> > > > 
> > > > If I understand correctly, the reported bug is because we attempted to
> > > > point (heap)->data to a dynamically allocated memory , but at that time
> > > > (heap)->data was not a regular pointer but a fixed size array with a
> > > > length of MAX_BSETS.
> > > > 
> > > > In my refactor heap patch series, I introduced a preallocated array and
> > > > decided in min_heap_init() whether the data pointer should point to an
> > > > incoming pointer or to the preallocated array. Therefore, I am
> > > > wondering if my patch might have unintentionally fixed this bug?
> > > > 
> > > > I am unsure how to reproduce the reported issue. Could you assist me in
> > > > verifying whether my assumption is correct?
> > > 
> > > This is a merge conflict, not a runtime. Can you rebase onto Coli's
> > > tree? We'll have to retest.
> > 
> > Oh, sorry for the misunderstanding I caused. When I mentioned "bug" [1]
> > earlier, I was referring to the bug addressed in
> > 3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter"),
> > not a merge conflict.
> > 
> > Here are the results after the rebase:
> > https://github.com/visitorckw/linux.git refactor-heap
> > 
> > [1]: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2039368
> 
> The ubuntu kernels build with UBSAN now, and the bug reported is just a
> UBSAN warning. The original implementation's iterator has a fixed size
> sets array that is indexed out of bounds when the iterator is allocated
> on the heap with more space -- the patch restructures it a bit to have a
> single iterator type with a flexible array and then a larger "stack"
> type which embeds the iterator along with the preallocated region.
> 
> I took a brief look at the refactor-heap branch but I'm not entirely
> sure what's going on with the new min heaps: in the one place where the
> larger iterators are used (in bch_btree_node_read_done) it doesn't look
> like the heap is ever initialized (perhaps since the old iter_init
> wasn't used here because of the special case it got missed in the
> refactor?) With the new heaps it should be fairly easy to fix though;
> just change the fill_iter mempool to be allocating only the minheap data
> arrays and setup iter->heap.data properly with that instead.

Thank you, Matthew.
Not initializing the heap's data pointer was indeed my mistake.
Following your advice, I made the following modifications to the code
on the refactor-heap branch in my github repo. I hope this time it
works well.

Regards,
Kuan-Wei

diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
index a2bb86d52ad4..ce9d729bc8ff 100644
--- a/drivers/md/bcache/btree.c
+++ b/drivers/md/bcache/btree.c
@@ -149,19 +149,19 @@ void bch_btree_node_read_done(struct btree *b)
 {
 	const char *err = "bad btree header";
 	struct bset *i = btree_bset_first(b);
-	struct btree_iter *iter;
+	struct btree_iter iter;

 	/*
 	 * c->fill_iter can allocate an iterator with more memory space
 	 * than static MAX_BSETS.
 	 * See the comment arount cache_set->fill_iter.
 	 */
-	iter = mempool_alloc(&b->c->fill_iter, GFP_NOIO);
-	iter->heap.size = b->c->cache->sb.bucket_size / b->c->cache->sb.block_size;
-	iter->heap.nr = 0;
+	iter.heap.data = mempool_alloc(&b->c->fill_iter, GFP_NOIO);
+	iter.heap.size = b->c->cache->sb.bucket_size / b->c->cache->sb.block_size;
+	iter.heap.nr = 0;

 #ifdef CONFIG_BCACHE_DEBUG
-	iter->b = &b->keys;
+	iter.b = &b->keys;
 #endif

 	if (!i->seq)
@@ -199,7 +199,7 @@ void bch_btree_node_read_done(struct btree *b)
 		if (i != b->keys.set[0].data && !i->keys)
 			goto err;

-		bch_btree_iter_push(iter, i->start, bset_bkey_last(i));
+		bch_btree_iter_push(&iter, i->start, bset_bkey_last(i));

 		b->written += set_blocks(i, block_bytes(b->c->cache));
 	}
@@ -211,7 +211,7 @@ void bch_btree_node_read_done(struct btree *b)
 		if (i->seq == b->keys.set[0].data->seq)
 			goto err;

-	bch_btree_sort_and_fix_extents(&b->keys, iter, &b->c->sort);
+	bch_btree_sort_and_fix_extents(&b->keys, &iter, &b->c->sort);

 	i = b->keys.set[0].data;
 	err = "short btree key";
@@ -223,7 +223,7 @@ void bch_btree_node_read_done(struct btree *b)
 		bch_bset_init_next(&b->keys, write_block(b),
 				   bset_magic(&b->c->cache->sb));
 out:
-	mempool_free(iter, &b->c->fill_iter);
+	mempool_free(iter.heap.data, &b->c->fill_iter);
 	return;
 err:
 	set_btree_node_io_error(b);
diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index cba09660148a..c6f5592996a8 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -1914,8 +1914,7 @@ struct cache_set *bch_cache_set_alloc(struct cache_sb *sb)
 	INIT_LIST_HEAD(&c->btree_cache_freed);
 	INIT_LIST_HEAD(&c->data_buckets);

-	iter_size = sizeof(struct btree_iter) +
-		    ((meta_bucket_pages(sb) * PAGE_SECTORS) / sb->block_size) *
+	iter_size = ((meta_bucket_pages(sb) * PAGE_SECTORS) / sb->block_size) *
 			    sizeof(struct btree_iter_set);

 	c->devices = kcalloc(c->nr_uuids, sizeof(void *), GFP_KERNEL);


