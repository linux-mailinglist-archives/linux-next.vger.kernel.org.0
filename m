Return-Path: <linux-next+bounces-3853-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DA0978C13
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 02:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A653288DA1
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 00:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7ED1370;
	Sat, 14 Sep 2024 00:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqYlJ2c6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6220E6;
	Sat, 14 Sep 2024 00:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726273052; cv=none; b=iMD+lTkrIsk0UsRjf5O7LAIcJlb2G3ylE6g2d65a69XMBGltgzF5ebU6dJB04uUbvBG2yS3R0+0fEAk8YsIEnMZ6gRR8jRmKdaMAyL1r67xeT7oW/TOf0wmXhjv/BqNeq4rCZIYwAQdoD8HiJW4XmyX2mISORZ3tTOhfZh8lPL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726273052; c=relaxed/simple;
	bh=ZHm1Lv5MbMyugHEz223tEbfFV1KRfoLFCN+vTWzHnmg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TmwK86R8USv9gZg3NjO4h3T6QEv7OvmJf+Bms81ub+4YpvuEJzAJ801N9zZXt7TpXBxbPDmF/AONsoZ8XaOPncmryECd8BRVY2jQeah3mS6hLeNKwL0WO4EdO9bibq613vSq3XX1OTNQL0PkuE566ge7JdVRAzGf8YjybwC9RIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqYlJ2c6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19171C4CEC0;
	Sat, 14 Sep 2024 00:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726273050;
	bh=ZHm1Lv5MbMyugHEz223tEbfFV1KRfoLFCN+vTWzHnmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mqYlJ2c60vfgMFnBKVwwF+uVAM7efmBHPfOcj9aG3XgSISiKTBvljCTmRcm7nlj3W
	 vUExlayESGfIbxMrro/lk+6Lt9Fb6p3OwF1Kh1Fm80llxotXee+aeL8vvLN5NFZNKD
	 SRvdG1FPXSlyK7VsZhwrMaA2PDTX0EhyaAvN7yZQCHCTPCf0O2A4ilDpAOSMMApXVE
	 t1oFwB4Cn8UiZFPyKIE5tMyUlOtlBCmkFwMJ2/k5tXKqZY+jV++8CMAPPXR5UlWa2b
	 5HnoQGs2YMdoA22oLv6JBjw8FVwC8dwxNEqLmVbpGczSKmmvviFLtts+A34Or37HCu
	 oKu4m5XboH8og==
Date: Fri, 13 Sep 2024 17:17:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <20240913171729.6bf3de40@kernel.org>
In-Reply-To: <CAHS8izMwQDQ9-JNBpvVeN+yFMzmG+UB-hJWVtz_-ty+NHUdyGA@mail.gmail.com>
References: <20240913213351.3537411-1-almasrymina@google.com>
	<ZuS0wKBUTSWvD_FZ@casper.infradead.org>
	<CAHS8izMwQDQ9-JNBpvVeN+yFMzmG+UB-hJWVtz_-ty+NHUdyGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 15:20:13 -0700 Mina Almasry wrote:
> I have not reported the issue to GCC yet. From the build break thread
> it seemed a fix was urgent, so I posted the fix and was planning to
> report the issue after. If not, no problem, I'll report the issue and
> repost the fix with a GCC bugzilla link, waiting 24hr before reposts
> this time.

I should have clarified, the "please post ASAP" applies
to all devmem build fixes, ignore the cool down period :)

> I just need to go through the steps in https://gcc.gnu.org/bugs/,
> shouldn't be an issue.

Just post the link here, I'll add it to the commit msg when applying.

