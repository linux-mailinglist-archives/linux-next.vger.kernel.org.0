Return-Path: <linux-next+bounces-3829-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5FF9784F5
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 17:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBBFF1F22B87
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 15:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDA22BB13;
	Fri, 13 Sep 2024 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvnRCFVH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D5FDF60;
	Fri, 13 Sep 2024 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726241668; cv=none; b=tv92kbBO5NoPv7g7SXl08zfApDeU2Mmkxjes2jkkcS3maguYWcLeTNzdKmgCIiSnb0k0YfadbmKhA1u+MWCsjVxCaVzo4IFrtGI3XErLH/yK03WGa+FMrgUXm5/XHWAwUjCWG8wQBbZt3uheN9ZTfiRFvHAZkvX6D2JZZmKakHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726241668; c=relaxed/simple;
	bh=aeBS/jexYN5ZGjpVm407B7hRMZZ4ukiBkzvptBAgJaU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K8whIktNnD9tMaYTkWysVxoYKQLMKsgEmchp91ZdWo896lf5WJWg4NTR9+L17QyptrJF1az+N4SDZ+QpQS1NkGxkzJmD8vTq/z56gBjpkzNfVEBZxSxFOW8YvD0fbYc3h5Gxni6vfxiJmSycdvG3l8oSw2YpEyMBgd+1VxCXCmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvnRCFVH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58843C4CEC0;
	Fri, 13 Sep 2024 15:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726241667;
	bh=aeBS/jexYN5ZGjpVm407B7hRMZZ4ukiBkzvptBAgJaU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fvnRCFVHGls2KVupkmqKoiiT6kDNtgpUr/OtlXRhNExNuQwj/1mVFgnCGu6RaHVN5
	 yImCV0xqRqSYRTa9WEA+G6dyWs7hKhAnshmW04/6UdqvfI1ZyEPv6myYvbZIPgzbLg
	 RaDUjFNXhcs8MG0e708PDLA25bqBQWChlPVii3HZYW72/c6lGzBGAJnxLSX/YMLpI8
	 9k38k21KExHymnbg6c/H0/mlbkb7dvWpnkHsi09iQz2zpXi7IuX+PtRbZiAWZB1TtJ
	 CqA4Q+iV2ZG0HIcpVu76xHsnZ2Jha/4JTDOnOOWMHG8pkc8Z/8DzdVi32zwqL8t5u6
	 woBDZts1VdL6g==
Date: Fri, 13 Sep 2024 08:34:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Mina Almasry <almasrymina@google.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913083426.30aff7f4@kernel.org>
In-Reply-To: <20240913204138.7cdb762c@canb.auug.org.au>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<20240913204138.7cdb762c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 20:41:38 +1000 Stephen Rothwell wrote:
> I have bisected it (just using the net-next tree) to commit
> 
> 8ab79ed50cf10f338465c296012500de1081646f is the first bad commit
> commit 8ab79ed50cf10f338465c296012500de1081646f
> Author: Mina Almasry <almasrymina@google.com>
> Date:   Tue Sep 10 17:14:49 2024 +0000
> 
>     page_pool: devmem support
>     
> 
> And it may be pointing at arch/powerpc/include/asm/atomic.h line 200
> which is this:
> 
> static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
> {
>         s64 t;
> 
>         /* -mprefixed can generate offsets beyond range, fall back hack */
>         if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>                 __asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter))
> ;
>         else
>                 __asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
> 
>         return t;
> }
> 
> The second "asm" above (CONFIG_PPC_KERNEL_PREFIXED is not set).  I am
> guessing by searching for "39" in net/core/page_pool.s
> 
> This is maybe called from page_pool_unref_netmem()

Thanks! The compiler version helped, I can repro with GCC 14.

It's something special about compound page handling on powerpc64,
AFAICT. I'm guessing that the assembler is mad that we're doing
an unaligned read:

   3300         ld 8,39(8)       # MEM[(const struct atomic64_t *)_29].counter, t

which does indeed look unaligned to a naked eye. If I replace
virt_to_head_page() with virt_to_page() on line 867 in net/core/page_pool.c
I get:

   2982         ld 8,40(10)      # MEM[(const struct atomic64_t *)_94].counter, t

and that's what we'd expect. It's reading pp_ref_count which is at
offset 40 in struct net_iov. I'll try to take a closer look at 
the compound page handling, with powerpc assembly book in hand, 
but perhaps this rings a bell for someone?

