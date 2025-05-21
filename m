Return-Path: <linux-next+bounces-6881-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F146FABEE2C
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 10:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDE837A50BD
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 08:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A958236A6D;
	Wed, 21 May 2025 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOT/Sc8A"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9BC2367D0;
	Wed, 21 May 2025 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816863; cv=none; b=FOQ9yirzQa8eprZt1LYfOjzdP+TyUHhknAs1Rdl8tSpF+a9oWYQzGnAGBfQ/cZKI2Bif1696Ah6PCHcx2OOJHuEOlFm9PYzWi5yrXCrh//aljj9oGTzL2nYrUAjsvN1AqmgtWTJfnA6I24xEs31qxr3QrEWluzb6sOCbFTzuw/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816863; c=relaxed/simple;
	bh=btEHqkWsN5aJUBcONXQ4bLXl+kGdqvwNLtCf2mEbqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1D+WvnkeVjwcM10M6SkkUXct1+OjVpoNyWLgGfvSO8jM4PiSYT2a4QeKpcEXAzNrlWZMpQlCfCkWlqZ936ojJQr16n+14mywZg8nVg6SU2BladkA4MNqrslksbYAvTEWATiFqJEgyvBMmmOjirCqFO8yww+eO0/kF1dCf2nYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOT/Sc8A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30065C4CEE4;
	Wed, 21 May 2025 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747816862;
	bh=btEHqkWsN5aJUBcONXQ4bLXl+kGdqvwNLtCf2mEbqck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOT/Sc8AwIprEFxNyv5AklrGCuUoaUd80VqElyNmLzCnlfT7STf3KWg2OM7KlSbCx
	 MU77hzhfv18f0GzsQcjsqgMvt21ErJDrtctClZnH12dmBG3juAy615EexG+pjLg1Uy
	 FI+gb8VfTvI2Gsv3x9NplyFQuH8nNDzPbXAIS7ezmt6auOUNFo5phxGxwSBPRUbDLV
	 v+6pAa62I/2M74HGPsumlploL/c+5E4dg7BcHj+FpH/GGCdjv1QYZ7poHifCljZR6q
	 sNny8S/FwnslQRRBidVrLxaQ/jHGexpr6YB/gpaXOUz9dieU2jzvQOpPGWeN2GDE48
	 D4r+inlrwlr8A==
Date: Wed, 21 May 2025 09:40:57 +0100
From: Will Deacon <will@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20250521084057.GA20110@willie-the-truck>
References: <20250521113426.6752fc3a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521113426.6752fc3a@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, May 21, 2025 at 11:34:26AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/kernel/image-vars.h
> 
> between commit:
> 
>   117c3b21d3c7 ("arm64: Rework checks for broken Cavium HW in the PI code")
> 
> from Linus' tree and commit:
> 
>   90530521079e ("arm64/boot: Disallow BSS exports to startup code")
> 
> from the arm64 tree.

Thanks, Stephen. That looks correct to me. We're basically just
dropping the Cavium block here:

>  -#ifdef CONFIG_CAVIUM_ERRATUM_27456
>  -PI_EXPORT_SYM(cavium_erratum_27456_cpus);
>  -PI_EXPORT_SYM(is_midr_in_range_list);
>  -#endif

Will

