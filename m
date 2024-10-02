Return-Path: <linux-next+bounces-4065-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35398E57F
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 23:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 297082893E7
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 21:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FA9194C94;
	Wed,  2 Oct 2024 21:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="tMfvjxs3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EE31957F9
	for <linux-next@vger.kernel.org>; Wed,  2 Oct 2024 21:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727905687; cv=none; b=kQIKAHQsPuHOpknM/VKhfFooIzP4v1V61PVe29VFEyt8S2qK8zS9CbzXDscLO5LysscMHoPPDcmJeqvAgiL2MktD7pQO78sB/X4Q754AYLTFlZO8HJ2pknLmyxFgQQMtHH4gSXM2bsMZFPEcOhQU9XfO3cALIXcMQFabCpAFoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727905687; c=relaxed/simple;
	bh=BZj+UYgW+olu9CJ5ZzrSRBSx/tRZXm10pRIpJbtWNWo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lUFmm54uOXZJs2oPyPsr/iFAA93r4alc0tKTW0ZlN06vno3WHiKv6yoK/Gkf7SzLZH+/NSRldtKYjFkaBX/wYM6YT/a4+S9GZS3gPQYJV7YfjWmVbvL1GJcnNpU9aeUYvXclg0y2WaCwrS7rRSMtFJ6RtOs6IHs1kRXYyGWC9GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=tMfvjxs3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365A0C4CEC2;
	Wed,  2 Oct 2024 21:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1727905687;
	bh=BZj+UYgW+olu9CJ5ZzrSRBSx/tRZXm10pRIpJbtWNWo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tMfvjxs3Gi2Fju+QMLd0awIw3aIJvto+YgkC+LP8bsvcm/3znhXwHDQErWxJgqv5A
	 h5JIvB8FKJHcw9051qqtCYVQdgZnpxuQEninR5zeaNNUitBGDkF0wC76mf3JQhQdpa
	 6R8jYj36w9uNCvMacAO0Zte64FsSLtLNpXC8iAIs=
Date: Wed, 2 Oct 2024 14:48:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Brahmajit Das <brahmajit.xyz@gmail.com>
Cc: david@redhat.com, gorcunov@openvz.org, linux-next@vger.kernel.org
Subject: Re: [PATCH v2 1/1] fs: proc: Fix build with GCC 15 due to
 -Werror=unterminated-string-initialization
Message-Id: <20241002144806.255d62115286e173bbf42655@linux-foundation.org>
In-Reply-To: <20241002080914.841071-1-brahmajit.xyz@gmail.com>
References: <20241002080534.835250-1-brahmajit.xyz@gmail.com>
	<20241002080914.841071-1-brahmajit.xyz@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed,  2 Oct 2024 13:39:14 +0530 Brahmajit Das <brahmajit.xyz@gmail.com> wrote:

> GCC 15 enables -Werror=unterminated-string-initialization by default.
> This results in the following build error/s
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
>   917 |                 [0 ... (BITS_PER_LONG-1)] = "??",
>       |                                                 ^~~~
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
> fs/proc/task_mmu.c:917:49: error: initializer-string for array of ‘char’ is too long [-Werror=unterminate d-string-initialization]
> ...
> 
> To fix this, the length of the second argument of arary mnemonics needs

"array"

> to be 3 instead of previously set 2 (i.e. from [BITS_PER_LONG][2] to
> [BITS_PER_LONG][3])
> 

Yes, I'm not surprised that little party trick we used in there fools
gcc.  And really it deserves to die.

> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -909,8 +909,15 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
>  {
>  	/*
>  	 * Don't forget to update Documentation/ on changes.
> +	 *
> +	 * The length of the second argument of arary mnemonics

"array".  But really, just using "mnemonics[]" conveys all we need.

> +	 * needs to be 3 instead of previously set 2
> +	 * (i.e. from [BITS_PER_LONG][2] to [BITS_PER_LONG][3])
> +	 * to avoid spurious
> +	 * -Werror=unterminated-string-initialization warning
> +	 *  with GCC 15
>  	 */
> -	static const char mnemonics[BITS_PER_LONG][2] = {
> +	static const char mnemonics[BITS_PER_LONG][3] = {
>  		/*
>  		 * In case if we meet a flag we don't know about.
>  		 */

If we want to preserve the party trick then perhaps we can use

-                [0 ... (BITS_PER_LONG-1)] = { "??" },
+                [0 ... (BITS_PER_LONG-1)] = { '?', '?' },

and this will shut gcc up?

If we do remove the party trick (as you have done) then this:

		if (vma->vm_flags & (1UL << i)) {
			seq_putc(m, mnemonics[i][0]);
			seq_putc(m, mnemonics[i][1]);
			seq_putc(m, ' ');
		}

can be simplified (and probably sped up) with

		
		if (vma->vm_flags & (1UL << i))
			seq_printf(m, "%s ", mnemonics[i]);

yes?


