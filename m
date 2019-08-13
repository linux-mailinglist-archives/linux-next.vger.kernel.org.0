Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF2FA8B8AD
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 14:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbfHMMhu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 08:37:50 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33828 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727837AbfHMMhu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2019 08:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RiXljA9XAq8TTsQG2DLrqW1IlG7GF+sm/4jjgcBTQUg=; b=SgOV+FcH2HQ6bmrz3OemS87uh
        x5NFTLaH/f7s+GPBkMd6OGlNlLU0oSS2zAPaYjkQSw0YjNxipSaYNJPg73ut6XkXr551QfWHIw4vq
        KHAh87UQ/Tr3C7r89sIFFqH1OuFSwyNiqe4ihP6f/LJ5ljGN68sDR2Gov5TOf0qw7kTcA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hxW3Z-000854-EG; Tue, 13 Aug 2019 12:37:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 7A4992742B44; Tue, 13 Aug 2019 13:37:40 +0100 (BST)
Date:   Tue, 13 Aug 2019 13:37:40 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Christoph Hellwig <hch@lst.de>,
        Russell King <linux@armlinux.org.uk>
Cc:     kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: next/pending-fixes build: 222 builds: 3 failed, 219 passed, 3
 errors, 425 warnings (v5.3-rc4-185-g260510fdbaa7)
Message-ID: <20190813123740.GD5093@sirena.co.uk>
References: <5d52a9c3.1c69fb81.69154.3085@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q9KOos5vDmpwPx9o"
Content-Disposition: inline
In-Reply-To: <5d52a9c3.1c69fb81.69154.3085@mx.google.com>
X-Cookie: Poverty begins at home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 05:14:59AM -0700, kernelci.org bot wrote:

For the past few days -next has been failing to build configurations
with LPAE enabled:

> arm:
>     axm55xx_defconfig: (gcc-8) FAIL
>     keystone_defconfig: (gcc-8) FAIL
>     multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy: (gcc-8) FAIL

due to errors related to dma_atomic_pool_init()

> Errors summary:
>=20
>     1    dma-mapping.c:(.init.text+0x18): undefined reference to `dma_ato=
mic_pool_init'
>     1    /home/buildslave/workspace/workspace/kernel-build@8/linux/build/=
=2E./arch/arm/mm/dma-mapping.c:2427: undefined reference to `dma_atomic_poo=
l_init'
>     1    /home/buildslave/workspace/workspace/kernel-build@6/linux/build/=
=2E./arch/arm/mm/dma-mapping.c:2427: undefined reference to `dma_atomic_poo=
l_init'

caused by 896089d598c1d46 (arm: initialize the dma-remap atomic pool for
LPAE configs).  Nothing ensures that DMA_DIRECT_REMAP is selected in
such configurations so that function is not built.

--q9KOos5vDmpwPx9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1SrxMACgkQJNaLcl1U
h9CgOAf9HAUG9OGu+CgpIfqe7R2Pz/+/DbIg+5nSRQcOI4yoiS6ThMplRU173zb0
RM3DQHGcD3VqnDx8/sl0/iNz4a/V2Xdvwz8NfCYxVq3fytsOl+29i49XX4Eoezjx
oxA1zx8mhQrsjIpLSquneKvCcRgoCClWy3NOcZt3GVGjJXndQvbpGCTlsQXUTxKw
xMtjEzYjG8D10zEnjwNmQaY/4oq00LTJLgxo1kN05GV+2oNg4dLDdnVM7aiQyI05
PBbItn2wW3drNbhF2oIJI1IPrAZEEOgtOT9YMYiFFjWJ2pD1qEeWLkcHhLYql9FX
2ypUm+BdY4CTKRUMT7JiSIRkqxYKfw==
=R+E4
-----END PGP SIGNATURE-----

--q9KOos5vDmpwPx9o--
