Return-Path: <linux-next+bounces-5772-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61267A5DD03
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 13:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB4307AC22F
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 12:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61EF2459E1;
	Wed, 12 Mar 2025 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ja+5gKgm"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F5F2B9BB;
	Wed, 12 Mar 2025 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741783507; cv=none; b=mE1mdDUKNqmFPUmbJJ1VeQTlr2IVTLcc8uUdwxlx2HR5ZkhSu+z8X4iEfyfF6TrR89G8SmmQHc76Vd7J4xW1GUMauBhSiSc/26juKgKD9x2RRQy8u80hntx//HKeN1blfvuVsah4/vF+wFSVAel9L/2Zd5v3fLgjMxLIRasvOzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741783507; c=relaxed/simple;
	bh=+b8Th12T7oDXe8c3bpWkzFtDu9UFBrDbNfykcKfGzAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fk+6dpXYQ305B7ysaJ64DEbM7sA3JAJDtFqhsnBD063AyZft1N3563JN1kOWJmZxbSUp2HL0Zt7dO5xvhTjoPjnl8VW4S4/F79tv8OkyiMIH+UpyaT53pLAijD7fdv8MaBW3aDIBMXsIky+FreZf4C2KAoz69FM05FiZ2kOlbbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ja+5gKgm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D712AC4CEF6;
	Wed, 12 Mar 2025 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741783507;
	bh=+b8Th12T7oDXe8c3bpWkzFtDu9UFBrDbNfykcKfGzAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ja+5gKgmJjq4VidyZW/HhQBwAXzmaiLTMmS64kBoloZFqIeHjxgeUjFlsk7O1DyIZ
	 mNq5O/x0wdBXAJFhlAQLFDhlZ/0THCLPMjHs2G9XahEv7bFgzGUrO9srsplzltYCCw
	 rDIApou2eeHjMJpFJj/Gux7Z0fkAEb24o8y1qGlAXWnVlbN4FsTemiWdhMkUOkoi22
	 4sDA1cx4W4V6ksThyEgo4b3eiItWWYkgQ2HRCd4lqubJtIJWhEufPOp7Vn4NnxDkKE
	 2U5qScseG+nVP/FwmylqGwgwSZGAIjnvPqSVPvxTyZc2Gyjt2LKxdYMG+Yu1ZXHD93
	 dHWq1AvRwFe7g==
Date: Wed, 12 Mar 2025 12:45:02 +0000
From: Will Deacon <will@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm-perf
 tree
Message-ID: <20250312124501.GA6181@willie-the-truck>
References: <20250312201853.0d75d9fe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312201853.0d75d9fe@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 12, 2025 at 08:18:53PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-arm tree got a conflict in:
> 
>   drivers/perf/apple_m1_cpu_pmu.c
> 
> between commit:
> 
>   c2e793da59fc ("perf: apple_m1: Don't disable counter in m1_pmu_enable_event()")
> 
> from the arm-perf tree and commit:
> 
>   75ecffc361bb ("drivers/perf: apple_m1: Refactor event select/filter configuration")
> 
> from the kvm-arm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/perf/apple_m1_cpu_pmu.c
> index 39349ecec3c1,6be703619a97..000000000000
> --- a/drivers/perf/apple_m1_cpu_pmu.c
> +++ b/drivers/perf/apple_m1_cpu_pmu.c
> @@@ -396,7 -428,11 +428,7 @@@ static void m1_pmu_enable_event(struct 
>   	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
>   	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
>   
> - 	m1_pmu_configure_counter(event->hw.idx, evt, user, kernel);
>  -	m1_pmu_disable_counter_interrupt(event->hw.idx);
>  -	m1_pmu_disable_counter(event->hw.idx);
>  -	isb();
>  -
> + 	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
>   	m1_pmu_enable_counter(event->hw.idx);
>   	m1_pmu_enable_counter_interrupt(event->hw.idx);
>   	isb();

Looks fine to me but I'd also be happy to stick the first two patches
on a shared branch to avoid this. Oliver?

Will

