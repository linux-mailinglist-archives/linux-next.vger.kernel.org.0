Return-Path: <linux-next+bounces-3007-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F04930DEC
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 08:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EC31281474
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 06:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E891A136982;
	Mon, 15 Jul 2024 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsAcvM9i"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8341E89C;
	Mon, 15 Jul 2024 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721024781; cv=none; b=EYp5/lNkqVygXS9wu5KstN3GTvm70IFAjZOLL2QajIb4OEaZbam5cwPmEsRZRUGoZidrGLHnU+t2ExP/qRg36qdwMTXiodJjaIqSjT6g3o7dIGYPlpLe6n6yN2XobLpJj1YEenIAZSel8IbZdTmI4m7hKrl1J464gBhDuQzru8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721024781; c=relaxed/simple;
	bh=BH6AA3UTbnV/AHbCySuEini3oZ1Z1Oj3VsOPQeCnlyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLA5IJ2gjEJV/ssdT69U8WAqstgy+VmTLWgDPgO8yFqpCUCO/jR93IrLZ6r9xsjV9c5SsI1APzjla840nePsKsCXJdGWyG5U2oStkzxGR7FAZdrmS2O/4AT6uycOkhzQk3PcvBDbmRsxH8Bdyd342FTdGQP6OUyv+WneLhgbTzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsAcvM9i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81710C4AF0B;
	Mon, 15 Jul 2024 06:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721024781;
	bh=BH6AA3UTbnV/AHbCySuEini3oZ1Z1Oj3VsOPQeCnlyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZsAcvM9i/7iz+kaUnKc9cwhG/Ls+XznJEpTelyYICVvJ05Xh45cBOIp6TKVXyXYG2
	 /7vsQVFs+J/lQ+wpMSjWXnBCBUzjVpZ+FZPyHpL7zXYaA9vDzNBJm6oFHx8cOKnHIf
	 e2JUab11dDeslR9F+JDG7uAXUSr7GJD/VBoA2kmU0jOZglpsqO6H/IJiwbOrplwLtQ
	 IBhz66/qPpDaMoZov97QhTXjPBFh3rfUMNttqS0EHApwaZ074BoSyQ8yqIMf73JsM8
	 xw6QhTvPA/CzItIEhznnL6mK9zqi2w7kBmAifZlbBEfq6IUlhbh64u/WR2poROpBvI
	 IgYpigXSa+bUQ==
Date: Mon, 15 Jul 2024 11:56:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the net-next
 tree
Message-ID: <ZpTBCUXx5e24izzR@matsya>
References: <20240715151222.5131118f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715151222.5131118f@canb.auug.org.au>

Hi Stephen,

On 15-07-24, 15:12, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the phy-next tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> 
> from the net-next tree and commit:
> 
>   d7d2818b9383 ("phy: airoha: Add PCIe PHY driver for EN7581 SoC.")
> 
> from the phy-next tree.

lgtm, thanks for letting us know

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
> diff --cc MAINTAINERS
> index d739d07fb234,269c2144bedb..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -693,15 -682,14 +693,23 @@@ S:	Supporte
>   F:	fs/aio.c
>   F:	include/linux/*aio*.h
>   
>  +AIROHA ETHERNET DRIVER
>  +M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  +L:	netdev@vger.kernel.org
>  +S:	Maintained
>  +F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
>  +F:	drivers/net/ethernet/mediatek/airoha_eth.c
>  +
> + AIROHA PCIE PHY DRIVER
> + M:	Lorenzo Bianconi <lorenzo@kernel.org>
> + L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> + S:	Maintained
> + F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
> + F:	drivers/phy/phy-airoha-pcie-regs.h
> + F:	drivers/phy/phy-airoha-pcie.c
> + 
>   AIROHA SPI SNFI DRIVER
>   M:	Lorenzo Bianconi <lorenzo@kernel.org>
>   M:	Ray Liu <ray.liu@airoha.com>



-- 
~Vinod

