Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813BE2782D5
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 10:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgIYIh5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 04:37:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:38728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbgIYIh5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Sep 2020 04:37:57 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BA8A208B6;
        Fri, 25 Sep 2020 08:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601023076;
        bh=gpwZEFQ/+uBupX6jV0nVrhi45AEr20eCgci0AaJokA4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YO2YPFXMrbvnXCG0H5ENFVaRuBCFOmiGZJwU8ih4LYqk3FqBVfh8Lwe0YLlkgGtNW
         onUu4U5ej4ZlQjKPlkYETAGUPVz17jxZYw4Hg8pyu9F94y6BFQmtpZhRvC4AMos+fW
         kal4LTVSMAAwG/t95Vk7ylwplBt878cj6Wtcv67k=
Date:   Fri, 25 Sep 2020 16:37:49 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Wasim Khan <wasim.khan@nxp.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pci tree with the imx-mxs tree
Message-ID: <20200925083748.GJ25109@dragon>
References: <20200924115731.194ecd6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924115731.194ecd6f@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 24, 2020 at 11:57:31AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the pci tree got a conflict in:
> 
>   arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> 
> between commit:
> 
>   f7d48ffcfc6e ("arm64: dts: layerscape: Add label to pcie nodes")
> 
> from the imx-mxs tree and commit:
> 
>   c9443b6500ff ("arm64: dts: layerscape: Add PCIe EP node for ls1088a")
> 
> from the pci tree.

It should go through imx-mxs -> arm-soc, not pci tree.

Shawn

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
> diff --cc arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index ff5805206a28,f21dd143ab6d..000000000000
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@@ -517,7 -499,18 +517,18 @@@
>   			status = "disabled";
>   		};
>   
> + 		pcie-ep@3400000 {
> + 			compatible = "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
> + 			reg = <0x00 0x03400000 0x0 0x00100000
> + 			       0x20 0x00000000 0x8 0x00000000>;
> + 			reg-names = "regs", "addr_space";
> + 			num-ib-windows = <24>;
> + 			num-ob-windows = <128>;
> + 			max-functions = /bits/ 8 <2>;
> + 			status = "disabled";
> + 		};
> + 
>  -		pcie@3500000 {
>  +		pcie2: pcie@3500000 {
>   			compatible = "fsl,ls1088a-pcie";
>   			reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
>   			       0x28 0x00000000 0x0 0x00002000>; /* configuration space */
> @@@ -543,7 -536,17 +554,17 @@@
>   			status = "disabled";
>   		};
>   
> + 		pcie-ep@3500000 {
> + 			compatible = "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
> + 			reg = <0x00 0x03500000 0x0 0x00100000
> + 			       0x28 0x00000000 0x8 0x00000000>;
> + 			reg-names = "regs", "addr_space";
> + 			num-ib-windows = <6>;
> + 			num-ob-windows = <8>;
> + 			status = "disabled";
> + 		};
> + 
>  -		pcie@3600000 {
>  +		pcie3: pcie@3600000 {
>   			compatible = "fsl,ls1088a-pcie";
>   			reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
>   			       0x30 0x00000000 0x0 0x00002000>; /* configuration space */


