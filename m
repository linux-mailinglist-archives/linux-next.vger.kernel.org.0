Return-Path: <linux-next+bounces-8444-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B31B95047
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 10:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A464441710
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 08:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19631D38A;
	Tue, 23 Sep 2025 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/oEQTgv"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172C31D382;
	Tue, 23 Sep 2025 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616591; cv=none; b=IXWKqZcFlT63mKksdSvgzhAFpRE1VF8WiQNrB1RXOsU1dY8Z3u5AhLAjXtdvH1XqedcBvL0YC7tbUGplsAj8q5u3x3X0a+lhhjjmgkiTsfw9hy0WgKd8iRTgHee6qAX6KIL6RZnsg+M8PzWWlDZpemuk7VRwlndQ+LjzecesWKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616591; c=relaxed/simple;
	bh=HwC3qAi4Vb/ZTI0/KBf5ye1cSkZqvV0nCwG9ZNJDA1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8qnJkf7Em/YceVvSB9vXueMNJuKhSFt58dcjeSEabikktwz1b4DPbr2ZgVJdDvf3F23PkQ40yHOEQ21pDDDZ3vvwVA1ZRDTNUO36MTnOfvldelOBkdh7+uGALL9UrYcv8X8s2sU5pqYEbuFOdiOAWTUCIigayVzrgjoqyGn8tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/oEQTgv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFC9C4CEF5;
	Tue, 23 Sep 2025 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758616591;
	bh=HwC3qAi4Vb/ZTI0/KBf5ye1cSkZqvV0nCwG9ZNJDA1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/oEQTgvj9i4B2ilNtrcSXA4ixsg1NiVP7u3D5+EqITLW/PLpY2QiXybbLIVKMfry
	 5EoYTG+7DgcSWJIxLVqWM26dLnd1K3bqQnKbEXf/wBrb2a/FxSIBlTdhLM+giVOjB0
	 SQi8g5nFvyFeRKYZUQJJThdHDJUXk+crETMH6jlmz4JqoAcguvxkULGN2tl3EJgdA0
	 NsdWjBYtTKDtYjOkbzqHSfHayiHixlt5/919Q8iqqMdfHmPqi/ylJyaco3F/+DDOxy
	 lesTMHg254t2MNI249pVGSziCbFDLrLFCL/xT5jZsW03k/VujZH7c3ZQhnxlSxJsRh
	 kJ26IaisnF4HQ==
Date: Tue, 23 Sep 2025 09:36:27 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Dev Jain <dev.jain@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the arm64 tree with the origin tree
Message-ID: <aNJcC3aAfJ-gCv6m@willie-the-truck>
References: <aNJZaJT9elF0TDqH@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNJZaJT9elF0TDqH@finisterre.sirena.org.uk>

On Tue, Sep 23, 2025 at 10:25:12AM +0200, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/mm/mmu.c
> 
> between commit:
> 
>   ceca927c86e6f ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc function signature")
> 
> from the origin tree and commit:
> 
>   fa93b45fd397e ("arm64: Enable vmalloc-huge with ptdump")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc arch/arm64/mm/mmu.c
> index 980d7745a5499,10c2580995814..0000000000000
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@@ -47,6 -49,15 +49,8 @@@
>   #define NO_CONT_MAPPINGS	BIT(1)
>   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>   
>  -enum pgtable_type {
>  -	TABLE_PTE,
>  -	TABLE_PMD,
>  -	TABLE_PUD,
>  -	TABLE_P4D,
>  -};
>  -
> + DEFINE_STATIC_KEY_FALSE(arm64_ptdump_lock_key);
> + 

Thanks, the the correct resolution. I'll merge in for-next/fixes soon
(we have a dangling patch that depends on it) so this will disappear.

Will

