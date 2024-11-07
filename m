Return-Path: <linux-next+bounces-4664-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 131509C0546
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 13:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44B3C1C222F3
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 12:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0488B2076A5;
	Thu,  7 Nov 2024 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDMZ8ulT"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F261DDA3B;
	Thu,  7 Nov 2024 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730981241; cv=none; b=QOrVGMFNMr6FL9cpYY1Gqm3lw8JnWXOGAnGO3d2ku+v2gpYvA/Iz8FF++2PZqT/SUh+NEehj3JP/aroDSEhcFV24cEXsCtDyE2TEnU9/kNFmaClvLHXSkZAXF/xrqti1i21u0UhRAYG8mNMZ1+XpNQuuAEojlhFG3FNAJgsEw64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730981241; c=relaxed/simple;
	bh=aV/yt2FEb1VZzg2wB06BQaCHt8ud8wPjKu/vn4z79jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJtlInDeyEK2sx/FamZt0O2Yop9E/HtmGrCWr4+G9Bl3C7mQIr+IYMjVv18oue7eHCRL58QvtGPNuDi7zVNOTwkntLL55n/+C1pevOkInSj/GIxBWSMl4dCrejumHLWLR0CmwCn1dUN5o5XFIKPsjEazaqSulMQ4Iz8b7qbE7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDMZ8ulT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625EAC4CECE;
	Thu,  7 Nov 2024 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730981241;
	bh=aV/yt2FEb1VZzg2wB06BQaCHt8ud8wPjKu/vn4z79jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDMZ8ulTbjtrs1CPEYWVqZaYocLftQbNkrAcfZ23VmAeQOLRGufOi7plIUtb+cFIb
	 /DGPitjAtS7fa5uTTL2wfug9rAftXNWfJmkSnEdyYU28RZ3zUxWaB9o+GGjPum5ZbR
	 9xMSLUPf1FbCXaP9k5Q++83n289UwsdZ4kZTXwwuBE67CpkpWVSdZke20094ufFlzV
	 rE9S7PExl10BTTHSXFiC0blN5g7wik+xhwkV26Dr9kjppr8hAcCZfJHTPZ6hpQ++M1
	 Qa7pCzEF5vkqc3RrNltjnbbhcRcVlhDVE7V1zcswY7TfxcpIxZ3zRES/FVQYxR14Mp
	 T8j4wnXH2DxwQ==
Date: Thu, 7 Nov 2024 12:07:16 +0000
From: Manivannan Sadhasivam <mani@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <20241107120716.rkymr4sedc5co2nx@thinkpad>
References: <20241107230231.688e865b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107230231.688e865b@canb.auug.org.au>

On Thu, Nov 07, 2024 at 11:02:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pci tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> In file included from drivers/pci/msi/pcidev_msi.c:5:
> drivers/pci/msi/../pci.h:862:1: error: expected identifier or '(' before '{' token
>   862 | {
>       | ^
> drivers/pci/msi/../pci.h:861:20: error: 'of_pci_is_supply_present' declared 'static' but never defined [-Werror=unused-function]
>   861 | static inline bool of_pci_is_supply_present(struct device_node *np);
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~

That's silly on me. Krzysztof, could you please fix it in the branch?

- Mani

> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   0a93ef0a2d90 ("PCI/pwrctl: Create pwrctl devices only if at least one power supply is present")
> 
> I have applied the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 7 Nov 2024 22:53:24 +1100
> Subject: [PATCH] fixup for "PCI/pwrctl: Create pwrctl devices only if at least
>  one power supply is present"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/pci/pci.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 345db6844690..7dc82eac5b04 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -858,7 +858,7 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
>  	return 0;
>  }
>  
> -static inline bool of_pci_is_supply_present(struct device_node *np);
> +static inline bool of_pci_is_supply_present(struct device_node *np)
>  {
>  	return false;
>  }
> -- 
> 2.45.2
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
மணிவண்ணன் சதாசிவம்

