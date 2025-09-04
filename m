Return-Path: <linux-next+bounces-8197-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EDFB448B4
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 23:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 151003BD7F4
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 21:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE53F295516;
	Thu,  4 Sep 2025 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qwzfPq4u"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95978289811;
	Thu,  4 Sep 2025 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757021959; cv=none; b=KCW/LepvgRQZv22Nn4EydyOHfBnaTyfnHYw3Mk9su/pClIH5bn+uPfTV5nnngiQLx+zUmXGp0XFa+Fuq+0LS5tpNeC7WbnHSAHz+vwt6cCfQNjKN6h1mmHa1cTPO3YRq/M4A1WTy5TLcbekXc/NF8kyiofC5OhUmMeWrmCOI/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757021959; c=relaxed/simple;
	bh=CgzHyk7M3wp8krgMkoMtwHi7XPO8bnN1Hs0c4PXUQi8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VYAUmgH1hYn8u1Cr+8j8Vr4/yH6AAPqclDJasa2uw8f6HuPO7iAyMBg0qcD/HRbmE8jeiqufDv2xYn5UpAFWl+IH4yHAg6xKj2rPjk3oW+o8IMvf5nZ/5ZcWwUBTcHLYmkJbetuzU8Xlangtf0YsPbuOowd0SShFNsgtsBuxsFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qwzfPq4u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D0DC4CEF0;
	Thu,  4 Sep 2025 21:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757021959;
	bh=CgzHyk7M3wp8krgMkoMtwHi7XPO8bnN1Hs0c4PXUQi8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qwzfPq4utwyATbcIlPoobfvRXZpuOSCl5LWUhvDmvrcBcgxWjUCqr/4ezrfZIaSfs
	 IaZGsOmmVGHWlL6iLcCyLk1r8i3ROUaqt2rhqbqsxGk4VJwJaCRKf9XJ8hJvsZBxgl
	 Hy40v9j1FDBBF7ZjIaD6+0nj6JTikXPXSOY5EUcM=
Date: Thu, 4 Sep 2025 14:39:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Liam R. Howlett"
 <Liam.Howlett@Oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>
Subject: Re: linux-next: manual merge of the slab tree with the mm-unstable
 tree
Message-Id: <20250904143918.dc01310952fe5b3a23deef77@linux-foundation.org>
In-Reply-To: <1c082ae4-f5a6-4385-8c31-1db2d0890e9c@suse.cz>
References: <20250904162951.365fa2ea@canb.auug.org.au>
	<1c082ae4-f5a6-4385-8c31-1db2d0890e9c@suse.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 4 Sep 2025 10:39:47 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:

> On 9/4/25 08:29, Stephen Rothwell wrote:
> > Hi all,
> > 
> > FIXME: Add owner of second tree to To:
> >        Add author(s)/SOB of conflicting commits.
> > 
> > Today's linux-next merge of the slab tree got a conflict in:
> > 
> >   tools/testing/vma/vma_internal.h
> > 
> > between commit:
> > 
> >   da018ebb7157 ("tools/testing/vma: clean up stubs in vma_internal.h")
> 
> We can solve it by me taking this and
> 
>   65d011b2bc05 ("maple_tree: remove redundant __GFP_NOWARN")
> 
> from the other thread and Andrew dropping them in mm-unstable. I tried to
> rebase mm-unstable locally while dropping those and there were no conflicts
> and they are self-contained cleanups. AFAIR Andrew was fine with such
> resolutions in the past.

Yep, I generally just drop things when these conflicts occur.

