Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD0E31B2A4
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 22:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhBNVKG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 16:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbhBNVKG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 16:10:06 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D957BC061574;
        Sun, 14 Feb 2021 13:09:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df0Gp0zcNz9s1l;
        Mon, 15 Feb 2021 08:09:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613336964;
        bh=4dSDnzr5jLd4+tptHrFYGJDy8DF6kJWIe86xJbIIxCE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KikGzbzA2MUCk1CZr5BEi6e3LBb4lZYfVOyqXYaxxHPpof9p05lYw6uW6EcgE25Ay
         pdW6ByT7a0vkXw/jlXznvAhgIKRA14EmblirsFjwp0K+0kwywBMBW6RGv96mYeurKN
         GaRiM2geikk0apoDIPPGhTxWZrAfq6wf+My+F8049A4fqQfi6B1T0jcmh5tyOpyMgz
         Y7SefhLAt/+RHsft/GgUQ/QosNcQL1vV4D8reKxfj2RxbcTV9IIXpRO7k4yjldpvp0
         BXAaFBpOorSIo0h7V7jwI3S56rvQbm8Fape/ELitHPU8R7wWqRNrEWSFclen10JToC
         6b9wyQ12+DqdQ==
Date:   Mon, 15 Feb 2021 08:09:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: linux-next: manual merge of the risc-v tree with the arm-soc
 tree
Message-ID: <20210215080921.1643a833@canb.auug.org.au>
In-Reply-To: <20210125091256.302fd411@canb.auug.org.au>
References: <20210125091256.302fd411@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nj1KetWhXExABJk/p7=9uvy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Nj1KetWhXExABJk/p7=9uvy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Jan 2021 09:12:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the risc-v tree got conflicts in:
>=20
>   drivers/soc/Kconfig
>   drivers/soc/Makefile
>=20
> between commit:
>=20
>   89d4f98ae90d ("ARM: remove zte zx platform")
>=20
> from the arm-soc tree and commit:
>=20
>   08734e0581a5 ("riscv: Use vendor name for K210 SoC support")
>=20
> from the risc-v tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/soc/Kconfig
> index f357c6c659d2,c0143651f4a9..000000000000
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@@ -22,6 -23,6 +23,5 @@@ source "drivers/soc/ti/Kconfig
>   source "drivers/soc/ux500/Kconfig"
>   source "drivers/soc/versatile/Kconfig"
>   source "drivers/soc/xilinx/Kconfig"
> - source "drivers/soc/kendryte/Kconfig"
>  -source "drivers/soc/zte/Kconfig"
>  =20
>   endmenu
> diff --cc drivers/soc/Makefile
> index 9bceb12b291d,fa7071246546..000000000000
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@@ -28,4 -28,5 +28,4 @@@ obj-y				+=3D ti
>   obj-$(CONFIG_ARCH_U8500)	+=3D ux500/
>   obj-$(CONFIG_PLAT_VERSATILE)	+=3D versatile/
>   obj-y				+=3D xilinx/
> - obj-$(CONFIG_SOC_KENDRYTE)	+=3D kendryte/
>  -obj-$(CONFIG_ARCH_ZX)		+=3D zte/
> + obj-$(CONFIG_SOC_CANAAN)	+=3D canaan/

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/Nj1KetWhXExABJk/p7=9uvy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApkYEACgkQAVBC80lX
0GxBCgf9EBnNNAFGsDYpRbBlwjODohINzyfpePhPt46P7H0886gXLLaYs/gEMvCI
nvPxFanE8ArzvBp/ZLn+NyHLkVKCxskBam5xYxdJlBV1yemE9m7uPqJLYw2rySil
YKBSI5QITUTUYiWYHRW8RqyNJPwc05bgOt/aueY3z9UgnKWKCp4uYI2OMWmIpyiJ
P3dM/l8Pf8OEWKmaxATpWir2nrOiVtQv/0ltOinRT61WaA50BruhYf/l8sfl7zos
foibN0FTebir9XR7XvHh+KzA663PsLJ46LzV/JIq6WfugrWlciCfbu4Ad5c451xD
LjHaDx4uMfpmvPhIy4+AR3h7Kt3R3Q==
=VnuI
-----END PGP SIGNATURE-----

--Sig_/Nj1KetWhXExABJk/p7=9uvy--
