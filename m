Return-Path: <linux-next+bounces-9210-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6CFC84296
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 10:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D08E44E7835
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 09:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061542E7198;
	Tue, 25 Nov 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVz6mqyO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3AB2DC78F;
	Tue, 25 Nov 2025 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764061950; cv=none; b=BNFj5LDOy49TuxtXGqkt+/BNVfutssGO3V+LNPb3wtxXiY2NN8da727fW2RhzCF507pYTNvAFoy//681zI1KMXaULqFwW3evL2o0JPS7XjOU6LCDlL/IK3S8pz2W0qcFDWTmEJy49J1WOtK3PlQEaF2ElDrLbChm+wXeCIdP0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764061950; c=relaxed/simple;
	bh=lrwI1vrFIypBu/bBYfQ9fTv6nebzcfVfvnT2wdwUe28=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aOuWJJ/4Uo+7yGCXej/CU4br6TV2OqozBYamZuDFTNIu2i2JfPrrNmGxHuoWxHToZT7sPS4QIkMZF+WnfCh5rhpma8M/eYkVXT6HlellOJhRycnPnlTAp71viGhdtDZ+zyq6ICZh7DRfHBEws0kYohSr/N655h8r1lpGgGAdia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVz6mqyO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21D0C116D0;
	Tue, 25 Nov 2025 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764061950;
	bh=lrwI1vrFIypBu/bBYfQ9fTv6nebzcfVfvnT2wdwUe28=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CVz6mqyO9OOu+B83TG6T1ApdNFktflt0j2AqEB+SmSUXpCLnQwfXiANnADA/ZoQVH
	 PTBayP594AhOCnmy3SvUML1hBYzqaCLa4xshcVuXbqtbIAangjBhEsdnMBdwZfOggh
	 Jw9LxLnaLJ7/d4+qPBKOMIxmY6sGttr9CaGQpPHuiYpEJcCqQ0644j9rH6Hucf/Grg
	 4jf5PTbeIxz/zI+KqN54U0sOyiQoWhN8nf3/YSLa9uW3w/KZlIOxx+QPcYf0eYEYdT
	 yY+XgXRX8qM6pxUktkV+6FzHsZ5vKgAv4HZRd6OkPMXdo4p1idapybCpfukzd4Wlbw
	 weWodKiyGvW9Q==
Date: Tue, 25 Nov 2025 02:12:26 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
    Stephen Rothwell <sfr@canb.auug.org.au>
cc: Palmer Dabbelt <palmer@dabbelt.com>, david@redhat.com, 
    Paul Walmsley <paul@pwsan.com>, Chunyan Zhang <zhangchunyan@iscas.ac.cn>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>, 
    Paul Walmsley <pjw@kernel.org>, Xu Lu <luxu.kernel@bytedance.com>
Subject: Re: linux-next: manual merge of the risc-v tree with the mm-unstable
 tree
In-Reply-To: <20251124120543.7dee3c33@canb.auug.org.au>
Message-ID: <deb9f5c1-87fd-9a1f-6277-93d63829bcf5@kernel.org>
References: <20251124120543.7dee3c33@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Andrew,

On Mon, 24 Nov 2025, Stephen Rothwell wrote:

> Today's linux-next merge of the risc-v tree got a conflict in:
> 
>   arch/riscv/include/asm/hwcap.h
> 
> between commit:
> 
>   a2fb99195ca8 ("riscv: add RISC-V Svrsw60t59b extension support")
> 
> from the mm-unstable tree and commit:
> 
>   0597b9c8627e ("riscv: Add ISA extension parsing for Zalasr")
> 
> from the risc-v tree.

[ ... ]

> diff --cc arch/riscv/include/asm/hwcap.h
> index f98fcb5c17d5,ae3852c4f2ca..000000000000
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@@ -106,7 -106,7 +106,8 @@@
>   #define RISCV_ISA_EXT_ZAAMO		97
>   #define RISCV_ISA_EXT_ZALRSC		98
>   #define RISCV_ISA_EXT_ZICBOP		99
>  -#define RISCV_ISA_EXT_ZALASR		100
>  +#define RISCV_ISA_EXT_SVRSW60T59B	100
> ++#define RISCV_ISA_EXT_ZALASR		101
>   
>   #define RISCV_ISA_EXT_XLINUXENVCFG	127

I think it might be easier for us, and would result in fewer merge 
conflicts, if we took this series through the RISC-V tree.  We're merging 
in quite a few changes to this hwcap.h file, and touching it in -mm is 
likely to result in some unnecessary merge conflicts when we send it to 
Linus.

If you'd still prefer to take it via -mm, we could also establish a shared 
base.

What do you think?


- Paul

