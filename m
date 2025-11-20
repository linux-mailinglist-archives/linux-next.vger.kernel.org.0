Return-Path: <linux-next+bounces-9096-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0CAC71B0C
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 02:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 4344D29578
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 01:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811D11E98E3;
	Thu, 20 Nov 2025 01:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="jCafNs+i"
X-Original-To: linux-next@vger.kernel.org
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5699E78F4A;
	Thu, 20 Nov 2025 01:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763602602; cv=none; b=FuHxphysxmzY62cP0nuLg72GkoCcSrdvVmqmrOBGGiX6Fbbm+01rZ9Jpg5nKH4lBlwqrbyHpH2J2XADwWZBihBVhwRCsRiMnh3AYI7ZXR1F3V+EEMnfSe5CZxxWmX0CY6Sp/ltpsZPugEEHsPXJEQWfX8DSgrv8CCutDDIqU0xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763602602; c=relaxed/simple;
	bh=2o3rGD4kby8PDdB1TTxtt1kLDg0DDNKCYn7jjvUodvI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FCcOtDC32mU2GQxPYK+g+nNHS8015vmyzSADVoR5rTCBQegeS7E6lUNWVbFzwkaFuHlreODgBpoaihAM5F01yM9cQPaXdoP4YikrVwlwLUiILPpBuhDC5KdaMicUVWzhpxVFVvoGjpr4+g7AgV3Xu02uKqsgD/2erDNt2qgfBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=jCafNs+i; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763602597; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=rTbg2vlSwyfPIy5oeuHNjVT3CsOxAP9z4olCscxz8XM=;
	b=jCafNs+iXDGRca0rs91NILAfnr1T4RPuwYMzzomZ3qr4zZmvFe5vbRbwCax17+CcB4HdOnQhie1Etp3szRmOFWdzl+vfZOAIWslG9ZVrouFwWfaBzbiAMzZeGnbNkGu6IFOzA2MuFn0hNFsgHvfAlelIcVkSx41wLLz520fPIUw=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wsr7M7L_1763602596 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 20 Nov 2025 09:36:36 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,  Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,  Linux Next Mailing
 List <linux-next@vger.kernel.org>,  Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm-unstable
 tree
In-Reply-To: <20251120102532.670ba5b6@canb.auug.org.au> (Stephen Rothwell's
	message of "Thu, 20 Nov 2025 10:25:32 +1100")
References: <20251120102532.670ba5b6@canb.auug.org.au>
Date: Thu, 20 Nov 2025 09:36:35 +0800
Message-ID: <8734697ae4.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Hi, Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the arm64 tree got a conflict in:
>
>   mm/memory.c
>
> between commit:
>
>   b08b123ead1a ("mm: avoid unnecessary use of is_swap_pmd()")
>
> from the mm-unstable tree and commit:
>
>   79301c7d605a ("mm: add spurious fault fixing support for huge pmd")
>
> from the arm64 tree.
>
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

The fix looks right to me.  Thanks!

---
Best Regards,
Huang, Ying

