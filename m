Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D770131B4F
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 23:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgAFW2A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 17:28:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:58422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgAFW2A (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 17:28:00 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4FC42072A;
        Mon,  6 Jan 2020 22:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578349677;
        bh=9/pXoDuPOel5TvHcthR39pw/yucCrUp29xCV7mhe3QQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gyvZqGKWN+TsgfzXDFiTRGYsvBq7Q2MieKNhkhDGeIT8rrGK9G5mFScXCIJmUsQEC
         X0VqSfRNfHB+Zg7QDvWsLp/ZhLiLM0Mpjhbu576bkI9VZv2JYtKd5RzEwJ23cEbAyO
         9a4HTX2s5+2+3B80fCLdmtSexKfuOxG58nZU0/yQ=
Date:   Mon, 6 Jan 2020 23:27:55 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: linux-next: build failure after merge of the sunxi tree
Message-ID: <20200106222755.hdi6fna2ypjwl2em@gilmour.lan>
References: <20200107092017.1f219a19@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xzhf6pkz635zwjnk"
Content-Disposition: inline
In-Reply-To: <20200107092017.1f219a19@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--xzhf6pkz635zwjnk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jan 07, 2020 at 09:20:17AM +1100, Stephen Rothwell wrote:
> Hi all,
>
> After merging the sunxi tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): /soc/spi@1c05000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): /soc/spi@1c05000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): /soc/spi@1c06000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): /soc/spi@1c06000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): /soc/spi@1c07000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): /soc/spi@1c07000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): /soc/spi@1c0f000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): /soc/spi@1c0f000: Reference to non-existent node or label "dma"
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [scripts/Makefile.lib:292: arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dtb] Error 2
> arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): /soc/spi@1c05000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): /soc/spi@1c05000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): /soc/spi@1c06000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): /soc/spi@1c06000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): /soc/spi@1c07000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): /soc/spi@1c07000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): /soc/spi@1c0f000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): /soc/spi@1c0f000: Reference to non-existent node or label "dma"
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [scripts/Makefile.lib:292: arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dtb] Error 2
> arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): /soc/spi@1c05000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:656.21-669.5: ERROR (phandle_references): /soc/spi@1c05000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): /soc/spi@1c06000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:671.21-684.5: ERROR (phandle_references): /soc/spi@1c06000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): /soc/spi@1c07000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:686.21-699.5: ERROR (phandle_references): /soc/spi@1c07000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): /soc/spi@1c0f000: Reference to non-existent node or label "dma"
> arch/arm/boot/dts/sun8i-r40.dtsi:701.21-714.5: ERROR (phandle_references): /soc/spi@1c0f000: Reference to non-existent node or label "dma"
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [scripts/Makefile.lib:292: arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dtb] Error 2
>
> I am not sure which commits caused this.  I have used the sunxi tree
> from next-20200106 for today.

I just (~1 minute ago) pushed a fix for this.

sorry for the troubles.

Maxime

--xzhf6pkz635zwjnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhO0awAKCRDj7w1vZxhR
xVXmAP9x3chdiZO7vDUMjdoWrEWEYIaYadKmWP/sF08xr/6/lQD+KgZDJYGY78dz
Sj3QiWhIuOMfwoMgPId46V/s2CIaaAI=
=MG1a
-----END PGP SIGNATURE-----

--xzhf6pkz635zwjnk--
