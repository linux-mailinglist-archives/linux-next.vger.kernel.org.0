Return-Path: <linux-next+bounces-2270-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3DB8C336C
	for <lists+linux-next@lfdr.de>; Sat, 11 May 2024 21:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B4531F215B5
	for <lists+linux-next@lfdr.de>; Sat, 11 May 2024 19:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433FA1CD00;
	Sat, 11 May 2024 19:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUvkIec+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B91C2AF;
	Sat, 11 May 2024 19:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715455494; cv=none; b=XJQrTfRv/SOpLFu9uMDwzNnqA/V/Nwbl62w7S0MUxo3JcHVICvY70rgR8mgXqsA8gvnoh/L4ZwbxI5MBbaP4AXiQQB6l+Mhq477Vx6q4DkBNSzUo0HXqowzv0LawuzkYj3Wlz2uCz9LRpt+NHQdu02mb2l8Ehy+zoVP5JxgFCAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715455494; c=relaxed/simple;
	bh=Oojtd8wUrtLbOQw+GM/SeCSUNsbclOuxrR75Sm5o014=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwE+RC3RLkaS7C+SS1dq8Y6R994/RDRW9zxmPH2PFaajz9q6t7ix2cHxk2iXz29D25EaPQQiJb1VZ7fGuJlNgth2j/xB9nIG0VqSfF0eEN3IZmYKrgh2PmSqMMSKHa4qObH2A+hpbtvO/v6+9fj6Uo7NyfkNHqvlX0NZbm/7bl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUvkIec+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2b2aab2d46dso821566a91.0;
        Sat, 11 May 2024 12:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715455492; x=1716060292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OAGU71RasMrQNUShiGxsismiL+Kwi9s8fXEHCVFp+mU=;
        b=JUvkIec+9Skh47wn5yBeHpZL50HdouI/R9bQVY2bl1Ife0Ug4+LlAM5itDKd9JaWJs
         BKjWiftofEOpknc15DTWKFsj4UZX9XM8zISPS+EhX6cakYaqtST9Qx3bigtm+xRMECZF
         KgpJuMfoLtALW0v4TZG9iMxMw6sYDAc3YQb/qphSsc1Hzv+574x2Hwq18YLRZPSoaJIL
         HHPBV5vk5LolVOec0B1qgvFiwWPc4za5Qetkdp/yGsK/4zJr+7UeksBLj2WTwA9n6rNK
         uW0/rIyRqJY0jxlQ0RGavG5O7uvSObqo6zbkDo89dtvihRLhRhtkqguwwkcblK2cepYL
         oIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715455492; x=1716060292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAGU71RasMrQNUShiGxsismiL+Kwi9s8fXEHCVFp+mU=;
        b=j1vt2EoYuE001FvTPdRktDAUvt+HhqrV0KsmJED0pC5bMKyoYqb6Se9gbglFKqYrcK
         zlWSFmqn6IamBmZL0VaA0TmW9U+S+4hO2/MQxH3GJGSMlYgOYQn5Yqx8BP6uDOW+CxCv
         ppiyEUPdcsUpAaaDvnu8Xo6CKA9lMj/TVVheyz1VZeDRuc1/DG9FQ+Jz5HYxT1yRVfW9
         vD3vw8yN4k9SyfvzS5pQsBJDoJk/0idffVPd/zjXZrP9+y1E8LzJQqRyfVPYkihpzl2a
         s2ihE2F5h3O0JEWe7ReemEVf0Y/69Rg79sHjGREUvDlidOG+jNiz1bVsY2C+/AuSyZVe
         VW4w==
X-Forwarded-Encrypted: i=1; AJvYcCURU2dquPC23zWXZMy4VUVp519j3kUFIFKcYcF/fbW6gGIHPqTcrldy3cAwD35ylm+nRnUqYANxkgN6IFB9O0h4c2F5ogA//maWcN99e9DbtaAj4HufCaZ685kaUqVAD1O2QWxYneha5Q==
X-Gm-Message-State: AOJu0YyJtRrso3L7qtqh2a4OxGvK7aRhF3mJvyjziz0Tt/VPNDhDOs6C
	WT7o7Guu5pNlIcnCzem85yznbXQU1rGdDGQeYn4BZD0s3xQo6GVT
X-Google-Smtp-Source: AGHT+IHA9Homf+/aelZZpl2LJTQYbvRx9yHcytSpcm++mrA9kVLtgx1X3/VaOvqG488eFYm+CtYxAg==
X-Received: by 2002:a17:90a:5285:b0:2a5:3f1f:a1d1 with SMTP id 98e67ed59e1d1-2b6cb7d0ebbmr5867849a91.0.1715455491619;
        Sat, 11 May 2024 12:24:51 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b6288498e2sm7078871a91.13.2024.05.11.12.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 12:24:51 -0700 (PDT)
Date: Sun, 12 May 2024 03:24:47 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Matthew Mirvish <matthew@mm12.xyz>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Coly Li <colyli@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <Zj/F/yf0ixB/eRX7@visitorckw-System-Product-Name>
References: <20240509152745.08af752f@canb.auug.org.au>
 <te64v6zwwor6jkco6uiu2zz7ern6ijhyu5okfvdz3bmj3w5qfp@mx4zdniwymqj>
 <Zj1RzZdtfL7UQax1@visitorckw-System-Product-Name>
 <buehluxvo234sj7onzl6wwjmuslmnkh7g6vnpru23kpti6qmpp@7nqak2ser7mw>
 <Zj2PX6Fy3BEnQc50@visitorckw-System-Product-Name>
 <20240510034618.GA3161190@mm12.xyz>
 <Zj3kowGa9XzJ0yak@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zj3kowGa9XzJ0yak@visitorckw-System-Product-Name>

On Fri, May 10, 2024 at 05:11:02PM +0800, Kuan-Wei Chiu wrote:
> On Thu, May 09, 2024 at 11:46:18PM -0400, Matthew Mirvish wrote:
> > On Fri, May 10, 2024 at 11:07:11AM +0800, Kuan-Wei Chiu wrote:
> > > On Thu, May 09, 2024 at 07:16:31PM -0400, Kent Overstreet wrote:
> > > > On Fri, May 10, 2024 at 06:44:29AM +0800, Kuan-Wei Chiu wrote:
> > > > > On Thu, May 09, 2024 at 03:58:57PM -0400, Kent Overstreet wrote:
> > > > > > On Thu, May 09, 2024 at 03:27:45PM +1000, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > > 
> > > > > > > Today's linux-next merge of the refactor-heap tree got conflicts in:
> > > > > > > 
> > > > > > >   drivers/md/bcache/bset.c
> > > > > > >   drivers/md/bcache/bset.h
> > > > > > >   drivers/md/bcache/btree.c
> > > > > > >   drivers/md/bcache/writeback.c
> > > > > > > 
> > > > > > > between commit:
> > > > > > > 
> > > > > > >   3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter")
> > > > > > > 
> > > > > > > from the block tree and commit:
> > > > > > > 
> > > > > > >   afa5721abaaa ("bcache: Remove heap-related macros and switch to generic min_heap")
> > > > > > > 
> > > > > > > from the refactor-heap tree.
> > > > > > > 
> > > > > > > Ok, these conflicts are too extensive, so I am dropping the refactor-heap
> > > > > > > tree for today.  I suggest you all get together and sort something out.
> > > > > > 
> > > > > > Coli and Kuan, you guys will need to get this sorted out quick if we
> > > > > > want refactor-heap to make the merge window
> > > > > 
> > > > > Hi Coli and Kent,
> > > > > 
> > > > > If I understand correctly, the reported bug is because we attempted to
> > > > > point (heap)->data to a dynamically allocated memory , but at that time
> > > > > (heap)->data was not a regular pointer but a fixed size array with a
> > > > > length of MAX_BSETS.
> > > > > 
> > > > > In my refactor heap patch series, I introduced a preallocated array and
> > > > > decided in min_heap_init() whether the data pointer should point to an
> > > > > incoming pointer or to the preallocated array. Therefore, I am
> > > > > wondering if my patch might have unintentionally fixed this bug?
> > > > > 
> > > > > I am unsure how to reproduce the reported issue. Could you assist me in
> > > > > verifying whether my assumption is correct?
> > > > 
> > > > This is a merge conflict, not a runtime. Can you rebase onto Coli's
> > > > tree? We'll have to retest.
> > > 
> > > Oh, sorry for the misunderstanding I caused. When I mentioned "bug" [1]
> > > earlier, I was referring to the bug addressed in
> > > 3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter"),
> > > not a merge conflict.
> > > 
> > > Here are the results after the rebase:
> > > https://github.com/visitorckw/linux.git refactor-heap
> > > 
> > > [1]: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2039368
> > 
> > The ubuntu kernels build with UBSAN now, and the bug reported is just a
> > UBSAN warning. The original implementation's iterator has a fixed size
> > sets array that is indexed out of bounds when the iterator is allocated
> > on the heap with more space -- the patch restructures it a bit to have a
> > single iterator type with a flexible array and then a larger "stack"
> > type which embeds the iterator along with the preallocated region.
> > 
> > I took a brief look at the refactor-heap branch but I'm not entirely
> > sure what's going on with the new min heaps: in the one place where the
> > larger iterators are used (in bch_btree_node_read_done) it doesn't look
> > like the heap is ever initialized (perhaps since the old iter_init
> > wasn't used here because of the special case it got missed in the
> > refactor?) With the new heaps it should be fairly easy to fix though;
> > just change the fill_iter mempool to be allocating only the minheap data
> > arrays and setup iter->heap.data properly with that instead.
> 
> Thank you, Matthew.
> Not initializing the heap's data pointer was indeed my mistake.
> Following your advice, I made the following modifications to the code
> on the refactor-heap branch in my github repo. I hope this time it
> works well.
>
Should I resend it as a patch series?

> 
> diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
> index a2bb86d52ad4..ce9d729bc8ff 100644
> --- a/drivers/md/bcache/btree.c
> +++ b/drivers/md/bcache/btree.c
> @@ -149,19 +149,19 @@ void bch_btree_node_read_done(struct btree *b)
>  {
>  	const char *err = "bad btree header";
>  	struct bset *i = btree_bset_first(b);
> -	struct btree_iter *iter;
> +	struct btree_iter iter;
> 
>  	/*
>  	 * c->fill_iter can allocate an iterator with more memory space
>  	 * than static MAX_BSETS.
>  	 * See the comment arount cache_set->fill_iter.
>  	 */
> -	iter = mempool_alloc(&b->c->fill_iter, GFP_NOIO);
> -	iter->heap.size = b->c->cache->sb.bucket_size / b->c->cache->sb.block_size;
> -	iter->heap.nr = 0;
> +	iter.heap.data = mempool_alloc(&b->c->fill_iter, GFP_NOIO);
> +	iter.heap.size = b->c->cache->sb.bucket_size / b->c->cache->sb.block_size;
> +	iter.heap.nr = 0;
> 
>  #ifdef CONFIG_BCACHE_DEBUG
> -	iter->b = &b->keys;
> +	iter.b = &b->keys;
>  #endif
> 
>  	if (!i->seq)
> @@ -199,7 +199,7 @@ void bch_btree_node_read_done(struct btree *b)
>  		if (i != b->keys.set[0].data && !i->keys)
>  			goto err;
> 
> -		bch_btree_iter_push(iter, i->start, bset_bkey_last(i));
> +		bch_btree_iter_push(&iter, i->start, bset_bkey_last(i));
> 
>  		b->written += set_blocks(i, block_bytes(b->c->cache));
>  	}
> @@ -211,7 +211,7 @@ void bch_btree_node_read_done(struct btree *b)
>  		if (i->seq == b->keys.set[0].data->seq)
>  			goto err;
> 
> -	bch_btree_sort_and_fix_extents(&b->keys, iter, &b->c->sort);
> +	bch_btree_sort_and_fix_extents(&b->keys, &iter, &b->c->sort);
> 
>  	i = b->keys.set[0].data;
>  	err = "short btree key";
> @@ -223,7 +223,7 @@ void bch_btree_node_read_done(struct btree *b)
>  		bch_bset_init_next(&b->keys, write_block(b),
>  				   bset_magic(&b->c->cache->sb));
>  out:
> -	mempool_free(iter, &b->c->fill_iter);
> +	mempool_free(iter.heap.data, &b->c->fill_iter);
>  	return;
>  err:
>  	set_btree_node_io_error(b);
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index cba09660148a..c6f5592996a8 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1914,8 +1914,7 @@ struct cache_set *bch_cache_set_alloc(struct cache_sb *sb)
>  	INIT_LIST_HEAD(&c->btree_cache_freed);
>  	INIT_LIST_HEAD(&c->data_buckets);
> 
> -	iter_size = sizeof(struct btree_iter) +
> -		    ((meta_bucket_pages(sb) * PAGE_SECTORS) / sb->block_size) *
> +	iter_size = ((meta_bucket_pages(sb) * PAGE_SECTORS) / sb->block_size) *
>  			    sizeof(struct btree_iter_set);
> 
>  	c->devices = kcalloc(c->nr_uuids, sizeof(void *), GFP_KERNEL);
> 

