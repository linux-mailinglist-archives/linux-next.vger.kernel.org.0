Return-Path: <linux-next+bounces-4189-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71906997658
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 22:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02571F22487
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 20:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CA11E1C09;
	Wed,  9 Oct 2024 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Js5NuLIY"
X-Original-To: linux-next@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8B818A6B9
	for <linux-next@vger.kernel.org>; Wed,  9 Oct 2024 20:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728505353; cv=none; b=jc7l5KSzMT803Fe1LzB/o6uP8hqtt2JO1/tQHLBOvYaoXuXG7r/pTXMy7W//HPrSGOMuRciNWFARGhnVmvloOrxucQm/WqrZxtJYTcOqZkLP7rHWgQo4O7icZ61XAeUhh2E44zRQhoMuXsGY4B/pWyqCsZZHASRh+TZElkdqxYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728505353; c=relaxed/simple;
	bh=LQ7mQHruZvR8JdQbO1q7AUg9Cp5niugiM82nbTgMjdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vi08PtbS9ZL9oN9s2IrNlSvpD36FwbeBOIITe7PyAeUFKHv+XsZyITv5ZIOZmNUxj6CKlwGctb2I0UwFirmy1lDGeNOr/8/f8DZ4cDTB1Y1znPIbOzFCJvOgpiqvT2CK47P/pPwP24Bl7QVk2IahwzXVO21wILnNmY8KWO+sYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Js5NuLIY; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 9 Oct 2024 16:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728505345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TMdJPknoQhOpdik0XyKdYuoQBC817io3wy0gsr9UXr8=;
	b=Js5NuLIYl4OAOpDhVd5X9ZVKK1azgZ6epJ1C0hFCQkMTG4dfIagaiBH2e8d6lMftzL28ju
	oiuc5OuuzEHkDLLbJk8JABqIu0V3KfoWsVTySgfUCC2Ug7cPdL6n0nazJIgGfJaS9jlApG
	/qTOtoitdZEuYuqNPvi1Mvqw4aNbD30=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: NeilBrown <neilb@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <7qhvutk56llzwn3uwutbipkl3lzjnakr5ffphwumf3gm7qv33z@gujs4v4monj7>
References: <20241009144511.5fd62c94@canb.auug.org.au>
 <172844652013.444407.16580824583469743404@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172844652013.444407.16580824583469743404@noble.neil.brown.name>
X-Migadu-Flow: FLOW_OUT

On Wed, Oct 09, 2024 at 03:02:00PM GMT, NeilBrown wrote:
> On Wed, 09 Oct 2024, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > In file included from include/linux/fs.h:6,
> >                  from include/linux/highmem.h:5,
> >                  from include/linux/bvec.h:10,
> >                  from include/linux/blk_types.h:10,
> >                  from include/linux/bio.h:10,
> >                  from fs/bcachefs/bcachefs.h:188,
> >                  from fs/bcachefs/fs.c:4:
> > fs/bcachefs/fs.c: In function '__wait_on_freeing_inode':
> > fs/bcachefs/fs.c:281:31: error: initialization of 'long unsigned int *' from incompatible pointer type 'u32 *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
> >   281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
> 
> The fix we want is to replace that line with
>    struct wait_bit_queue_entry wait;
> I should have checked more carefully - sorry.
> 
> I guess we wait for rc3?
> 
> Kent: could you please make that change?  The inode_bit_waitqueue() does
> initialisation equivalent of DEFINE_WAIT_BIT() so you only need the declaration.

Alright, this is now in my for-next branch:

From 07b246b3b97c96dd81c22849656b0f920fb9c1e8 Mon Sep 17 00:00:00 2001
From: Kent Overstreet <kent.overstreet@linux.dev>
Date: Wed, 9 Oct 2024 16:21:00 -0400
Subject: [PATCH] bcachefs: __wait_for_freeing_inode: Switch to
 wait_bit_queue_entry

inode_bit_waitqueue() is changing - this update clears the way for
sched changes.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>

diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
index 0630bbb87590..2d3e134e847c 100644
--- a/fs/bcachefs/fs.c
+++ b/fs/bcachefs/fs.c
@@ -278,7 +278,8 @@ static void __wait_on_freeing_inode(struct bch_fs *c,
 				    subvol_inum inum)
 {
 	wait_queue_head_t *wq;
-	DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
+	struct wait_bit_queue_entry wait;
+
 	wq = inode_bit_waitqueue(&wait, &inode->v, __I_NEW);
 	prepare_to_wait(wq, &wait.wq_entry, TASK_UNINTERRUPTIBLE);
 	spin_unlock(&inode->v.i_lock);

