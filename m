Return-Path: <linux-next+bounces-4177-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D389961F3
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 10:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E5671F23107
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 08:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616FD1885B2;
	Wed,  9 Oct 2024 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gM6wPfYh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375A2184528;
	Wed,  9 Oct 2024 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728461447; cv=none; b=rY7T3l0TEnlOFxhF8oS9B3YMp+gtvyqvzmT3peow9pHjsfUyonRjLKx/21nA7EJ5azmj1nVago5OCGAJLo3EFTOYvw/opk395eg18MHP9boKS+72AxX5MA6XYEreu8ltf5pmZLLpzXyRgQK6hAavzS/YUY99EHuTby18xcixDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728461447; c=relaxed/simple;
	bh=o7vzIwux/mRlQjF2CrbH+84suPWkVeoqpQYiU3l8qXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzogxYe3NxAj4VQXrdclaC+aF8BT2GaLhm2ZTPx089G4tmWsADe15VgsbhR3h6s+yQ9ie7D8pjQnqhgzvjVjS+e3SdK5hZmmkoa0YZL37id9E1CzA3sLuCGDYMHgWhXIV+GhM1B7BlFsGM57B1dp2VlQa/MQIMg86vkHQogb+TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gM6wPfYh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E60C4CECE;
	Wed,  9 Oct 2024 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728461446;
	bh=o7vzIwux/mRlQjF2CrbH+84suPWkVeoqpQYiU3l8qXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gM6wPfYh9DxbCyOU+rMSPoYE0H5iLvnx8csSDvxAejY7jxtIuZ+q6Klhk2L2zCdZW
	 GhVcAc0yoD0QYuYCcYmKsem0ssgHOjj7L5g5LB/TUJd/namboJUHypwE68mHVkIbAh
	 iv8UZYF+t5AQE3/BRvMrStMWgzUJ+oXUBAJaEU5D4WnUy8VjHPaIUXLEeBgbktn/pi
	 PyxmvavZv1v82yPhxAiikotkV32Wm28pb+zysFCz9Sd0wr0BomyIsiS/ikDHPMRLI+
	 GRfw7Bw3a/FkbCQpCH3rmViW1pgMXduJRQK2HCNR5KtPDWGi4x8XdDxskF8tUS2Oko
	 5l257JTi3xnJA==
Date: Wed, 9 Oct 2024 10:10:41 +0200
From: Ingo Molnar <mingo@kernel.org>
To: NeilBrown <neilb@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] fs/bcachefs: Fix __wait_on_freeing_inode() definition of
 waitqueue entry
Message-ID: <ZwY6gWsZCq_SdDKI@gmail.com>
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


* NeilBrown <neilb@suse.de> wrote:

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

Since the breakage was introduced via tip:sched/core, I've applied the fix 
below.

Does this look good to you?

Thanks,

	Ingo

================>
From: Ingo Molnar <mingo@kernel.org>
Date: Wed, 9 Oct 2024 10:00:09 +0200
Subject: [PATCH] fs/bcachefs: Fix __wait_on_freeing_inode() definition of waitqueue entry

The following recent commit made DEFINE_WAIT_BIT() type requirements stricter:

  2382d68d7d43 ("sched: change wake_up_bit() and related function to expect unsigned long *")

.. which results in a build failure:

  > fs/bcachefs/fs.c: In function '__wait_on_freeing_inode':
  > fs/bcachefs/fs.c:281:31: error: initialization of 'long unsigned int *' from incompatible pointer type 'u32 *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
  >   281 |         DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);

Since this code relies on the waitqueue initialization within
inode_bit_waitqueue() anyway, the DEFINE_WAIT_BIT() initialization
is unnecessary - we can just declare a waitqueue entry.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Suggested-by: NeilBrown <neilb@suse.de>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 fs/bcachefs/fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/fs.c b/fs/bcachefs/fs.c
index 5bfc26d58270..c410133541ba 100644
--- a/fs/bcachefs/fs.c
+++ b/fs/bcachefs/fs.c
@@ -183,8 +183,9 @@ static void __wait_on_freeing_inode(struct bch_fs *c,
 				    struct bch_inode_info *inode,
 				    subvol_inum inum)
 {
+	struct wait_bit_queue_entry wait;
 	wait_queue_head_t *wq;
-	DEFINE_WAIT_BIT(wait, &inode->v.i_state, __I_NEW);
+
 	wq = inode_bit_waitqueue(&wait, &inode->v, __I_NEW);
 	prepare_to_wait(wq, &wait.wq_entry, TASK_UNINTERRUPTIBLE);
 	spin_unlock(&inode->v.i_lock);


