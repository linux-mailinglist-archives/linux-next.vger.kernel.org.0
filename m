Return-Path: <linux-next+bounces-4924-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 080489E9FD0
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 20:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBBCF164F0E
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 19:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B7D1552E4;
	Mon,  9 Dec 2024 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="s60iZQwx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C213B280;
	Mon,  9 Dec 2024 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733773526; cv=none; b=tOCMoCBjS6GHRztLU7K/ddgYCIBArjSN+BoV0NNBzRvkDT2MCW/DBbavZ8ffTXa+Kocn4ubbgJPP7U9aVANKuQIcxeiGcgkHgKpgcjn0ZlTgqgkULsIogBiA3LgaS3CHLdnmIGNd3UqSHWATMKiRxmEJiZ74JaNMLhG3Za2WQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733773526; c=relaxed/simple;
	bh=lVr2fYnmhfwM5+H/myTszO7aLzrPh/OBEFJeKMwsV/c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hmb/zj77g5/jpY1sudDHo5r5lZP9sfgrNwky7WVTu793LhNMI7qnpOT7cdxjAI4fGYZeoDIDayqb+BLy1p+kwmGZJ0M/MKZfN9uR9qorLThTLuvoe3scj9BhmsL1Ud+lJauR5P/Bw7Ar8LcbSAWhITonogGMbXOXcvemYTGPcAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=s60iZQwx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D77AC4CED1;
	Mon,  9 Dec 2024 19:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1733773525;
	bh=lVr2fYnmhfwM5+H/myTszO7aLzrPh/OBEFJeKMwsV/c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s60iZQwx9XzB//kbaVAu3qag7aHKNx6eAzow2yhKIhr7t6QcH9v14wi3dBA3+n1mT
	 Z1bNEM6qivaNlHZ8vIoHLqSi8x1uYQB1FX3j7gUthiTr6V6NTCSBLgaaHom8OIwgMr
	 78QSeayg0/mz+dseBR5ITFDxWRQn1C7BUVLM9OBE=
Date: Mon, 9 Dec 2024 11:45:24 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, surenb@google.com
Subject: Re: linux-next: duplicate patches in the tip tree
Message-Id: <20241209114524.a150aba86198e6f0fc9afcbc@linux-foundation.org>
In-Reply-To: <20241209110842.GM21636@noisy.programming.kicks-ass.net>
References: <20241209132941.58021bb7@canb.auug.org.au>
	<20241209110842.GM21636@noisy.programming.kicks-ass.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Dec 2024 12:08:42 +0100 Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Dec 09, 2024 at 01:29:41PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commits are also in the mm tree as different commits
> > (but the same patches):
> > 
> >   96450ead1652 ("seqlock: add raw_seqcount_try_begin")
> >   eb449bd96954 ("mm: convert mm_lock_seq to a proper seqcount")
> > 
> > These are commits
> > 
> >   46dbe8ab1205 ("seqlock: add raw_seqcount_try_begin")
> >   5f0d64389e1f ("mm: convert mm_lock_seq to a proper seqcount")
> > 
> > from the mm-unstable branch of the mm tree.  The latter ones are already
> > causing conflicts.
> 
> Why is this in -mm ?

Because
https://lore.kernel.org/all/20241206225204.4008261-1-surenb@google.com/T/#u
needs it.

> I agreed with Suren I'd take them through
> tip/perf/core to go along with Andrii's uprobe patch that relies on
> them.

