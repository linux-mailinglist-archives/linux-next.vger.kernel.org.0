Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CB628C927
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 09:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389896AbgJMHU3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 03:20:29 -0400
Received: from ozlabs.org ([203.11.71.1]:38799 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389829AbgJMHU2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Oct 2020 03:20:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9RlY02vRz9sTs;
        Tue, 13 Oct 2020 18:20:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602573626;
        bh=zc52PmRF4enBb3KdNeN/lkY7V5Sj3aLRPfM9ZwiVhy4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=S88ueZzMmWtgouo3f290oK8XH4AqwetRWbtM+P91NL+EvcurOwir41hoqYu1EqzzS
         oajqb8/R1hpSYoDVaV1MxIXApL5frR54vp8prruEtM5Hh0uyYwWrMKJeWWg9OZkwG5
         3AJbazqKcQRF+aJ40vJNhBQC64e0aiLLe+EIIDBXhSVA7uSOKo2XL1okHLVP9P8Fj+
         D8hKCtztN1cP01Zw57S0q6vkEUUVzFwNuCNRbrCf29Qa84cqduCQa5ZPXCXoCDyNwv
         8qmJJM7K9eJh0QoFxngsgF1UUsFxwaBSX9dcvFXXFmG3ALzpTQmXU+BwUqdo5FvwLB
         70I6FG8qoRFYg==
Date:   Tue, 13 Oct 2020 18:20:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mmc tree with the samsung-krzk
 tree
Message-ID: <20201013182024.70938a91@canb.auug.org.au>
In-Reply-To: <20200908144622.09385c88@canb.auug.org.au>
References: <20200908144622.09385c88@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0jvQS_1F3Tf7P_dHTbis07l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0jvQS_1F3Tf7P_dHTbis07l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Sep 2020 14:46:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the mmc tree got a conflict in:
>=20
>   drivers/mmc/host/Kconfig
>=20
> between commits:
>=20
>   cb6c03019cdd ("ARM: exynos: stop selecting PLAT_SAMSUNG")
>   db8230d29c3a ("ARM: s5pv210: don't imply CONFIG_PLAT_SAMSUNG")
>=20
> from the samsung-krzk tree and commit:
>=20
>   54d8454436a2 ("mmc: host: Enable compile testing of multiple drivers")
>=20
> from the mmc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/mmc/host/Kconfig
> index 0d7c61d8d1d9,dc646359b4ff..000000000000
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@@ -289,7 -301,8 +301,8 @@@ config MMC_SDHCI_TEGR
>  =20
>   config MMC_SDHCI_S3C
>   	tristate "SDHCI support on Samsung S3C SoC"
> - 	depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS)
> + 	depends on MMC_SDHCI
>  -	depends on PLAT_SAMSUNG || COMPILE_TEST
> ++	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
>   	help
>   	  This selects the Secure Digital Host Controller Interface (SDHCI)
>   	  often referrered to as the HSMMC block in some of the Samsung S3C

This is now a conflict between the mmc tree and the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0jvQS_1F3Tf7P_dHTbis07l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FVTgACgkQAVBC80lX
0GyZ7wgAj3Lt90XXfhTOJCW8tl887N62mOXdr097J3Ogr+0NyyEkaudfhqQBd/0m
D39j+aVlSLzaEXuGZcSsayEUvQ88mOsQVZIsIwRLY/kO+kjsjBpSwhPkMJ0DSb49
KvqvnKD/gRVNK8V7e8LEuwzH5TGe2Dcw0gqEJq4ozPSkpl96RqvUBbCw08h4m/4y
dTEBR0aeYqPTBLMrH7julZUZzqwr8dirN2oAhQxStUJtw1o3LwVjk7JgBoep9MXN
3zrO49+J51nGHC21carbaGEvRgOSUz2QuRW0ZG891jaO1F2ju2k3n3RFpIsX8jy3
2tI5ddo0AFi6gQXIsnGEnp/kVL7D+Q==
=3VR4
-----END PGP SIGNATURE-----

--Sig_/0jvQS_1F3Tf7P_dHTbis07l--
