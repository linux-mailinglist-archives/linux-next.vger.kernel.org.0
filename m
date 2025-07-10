Return-Path: <linux-next+bounces-7451-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B17E8AFF836
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 06:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 373591C4851B
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 04:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF66284B57;
	Thu, 10 Jul 2025 04:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fG8Blqsi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10277284B4E;
	Thu, 10 Jul 2025 04:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752123031; cv=none; b=a70U1gnwZCX5MIAvc2ge+YEKr/biqetAC32lYkoI2tZJP6dwvFTFacGJ/8oKLD2QmRbQ6doOQ19cke/C6xD3/STgG05wiXmzUazo+aR0+ORRZrb+R20PTqakHJRLfDAEj3MWAyATxbTFHB5f9q9AHFWtrTU7YdFK0km52q+GJ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752123031; c=relaxed/simple;
	bh=qBRON5J9h/w/pM9NBH3g/V5YO7Hdbl1/xh/qjc0/3vg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QpVU9toU3B2pmQo+QHVUujjjUqbH+quBbdF6SnVJKkIAW6B2RH4sO5BwXMtqqEqFetPgVVGws0mEsSkZ8bgDqq55g6fzYA5/hL9zsex73uGwSBPA0ikI+MukmcvRVFqpAwioSlIw6LdpT2JkDx6scqO2vJH0i+eVxie26iP/Axg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fG8Blqsi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A832C4CEF5;
	Thu, 10 Jul 2025 04:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752123030;
	bh=qBRON5J9h/w/pM9NBH3g/V5YO7Hdbl1/xh/qjc0/3vg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fG8BlqsiYH6NLmGr5qAXIeRYElmc9V/lOdkRv0d8LfnNFVe0mRAMuHBhpD5IHI1Nl
	 vANJWTEttn7yxqhLebeM6fFg0Z8xgxA9qbDnO4vEotPu2qzYsIXfhCaRoxGEfw6vpO
	 AhXQdh543fzeHgpSx2lhgxp5dTSHiqg+lmb4nBmc=
Date: Wed, 9 Jul 2025 21:50:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the mm-unstable
 tree
Message-Id: <20250709215029.dba56a7701ce41534dfd9352@linux-foundation.org>
In-Reply-To: <20250710143052.6d974c76@canb.auug.org.au>
References: <20250710143052.6d974c76@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Jul 2025 14:30:52 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the tip tree got a conflict in:
> 
>   mm/vmstat.c
> 
> between commit:
> 
>   954386324a11 ("mm/vmstat: utilize designated initializers for the vmstat_text array")

Oh dear god that patch will be the death of me.  Everyone likes to mess
with the vmstat array!

> from the mm-unstable tree and commit:
> 
>   8662a3e5e9c4 ("Revert "sched/numa: add statistics of numa balance task"")
> 
> from the tip tree.
> 
> I fixed it up (see below - search for NUMA_BALANCING) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 
> I assume that this will go away when the Revert above goes into Linus'
> tree (or returns to the mm-hotfixes tre).

Yep, thanks.

