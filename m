Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F25F1CEF2F
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 10:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgELIdE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 04:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726187AbgELIdE (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 04:33:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65E7C061A0C;
        Tue, 12 May 2020 01:33:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49LrfN2jmkz9sRY;
        Tue, 12 May 2020 18:33:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589272380;
        bh=DNaLI3rs5URP4GyvGYsODqBAe/rN5kfAhX54Y6ZX+nc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kstNvSVjKdOiSfXSaaE/qze075pyAMlaaF8XiIrMcSmvrpKT5Yd4+eHuYOai395R4
         0Ls9xfpQ8hoCFUDOAnp8vIUGjL5CTj7vxGzgKwBlsGK3HzBrEeeAClxzKLEuk+Y7gP
         udFJsMJ9Kl5J9cpVuLJQCkO1wbd5KRwI456g39NfL/L8c0slMkJUm7tmfLGDggiHwb
         AmAi1MT1xk18CoaNra5xxv/WJ4fegFn+FuRWX+0QGvi9tp5dkWldwclmWPhRPwCnh8
         rWA5vOhW1QyWO82GYRqCaSjUdlBnucDxJFW4AaC4Qh5IQCQImoeVOJB9Op9TmED7KB
         PKr72hUkUd9hQ==
Date:   Tue, 12 May 2020 18:32:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the keys tree with the kbuild tree
Message-ID: <20200512183258.57d92642@canb.auug.org.au>
In-Reply-To: <20200504131655.2820b437@canb.auug.org.au>
References: <20200504131655.2820b437@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qzRvW+cCzaENv3Q9QAe2QWD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qzRvW+cCzaENv3Q9QAe2QWD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 4 May 2020 13:16:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> Today's linux-next merge of the keys tree got conflicts in:
>=20
>   samples/Kconfig
>   samples/Makefile
>=20
> between commit:
>=20
>   3ba9c29d1877 ("samples: watchdog: use 'userprogs' syntax")
>=20
> from the kbuild tree and commit:
>=20
>   631ec151fd96 ("Add sample notification program")
>=20
> from the keys tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc samples/Kconfig
> index 5005f74ac0eb,5c31971a5745..000000000000
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@@ -205,8 -190,11 +205,15 @@@ config SAMPLE_INTEL_ME
>   	help
>   	  Build a sample program to work with mei device.
>  =20
>  +config SAMPLE_WATCHDOG
>  +	bool "watchdog sample"
>  +	depends on CC_CAN_LINK
>  +
> + config SAMPLE_WATCH_QUEUE
> + 	bool "Build example /dev/watch_queue notification consumer"
> + 	depends on HEADERS_INSTALL
> + 	help
> + 	  Build example userspace program to use the new mount_notify(),
> + 	  sb_notify() syscalls and the KEYCTL_WATCH_KEY keyctl() function.
> +=20
>   endif # SAMPLES
> diff --cc samples/Makefile
> index 29c66aadd954,8617edf7f19a..000000000000
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@@ -26,4 -24,4 +26,5 @@@ obj-$(CONFIG_VIDEO_PCI_SKELETON)	+=3D v4l
>   obj-y					+=3D vfio-mdev/
>   subdir-$(CONFIG_SAMPLE_VFS)		+=3D vfs
>   obj-$(CONFIG_SAMPLE_INTEL_MEI)		+=3D mei/
>  +subdir-$(CONFIG_SAMPLE_WATCHDOG)	+=3D watchdog
  5fb5efa63ea4 ("samples: watchdog: use 'userprogs' syntax")> + subdir-$(CO=
NFIG_SAMPLE_WATCH_QUEUE)	+=3D watch_queue

This is now a conflict between commit

  5fb5efa63ea4 ("samples: watchdog: use 'userprogs' syntax")

from the kbuild tree and commit

  b8c9527a31b0 ("Add sample notification program")

from the notifications tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/qzRvW+cCzaENv3Q9QAe2QWD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66XzoACgkQAVBC80lX
0GyPBgf/SInzHr6C1PJAjdHDbpYxjJKAgD/U1c15UzSKCrvQT9WbrT0nB9Yl/EFr
jJOtr9EPmQo6FjEuO/yJYTGUCDcAsO7Q/XmCnvGcU5OZIam8p3wwC9OPqrETeUFW
sEpRv7WT+EHGamP5gEgMAbTtmm5WYBm35FTil6uYbsWYUwOgiOTmudKeQh/ieIvk
chKuQVpTyptFnWW11V2zd7qK4rtBceUvPTOJJSaMbnd4ylv77HzEjY8yucICEpQf
IleUeB11hPK3XUw7Ov2i99zu5TKUaREbX/2jEfpW93JusKCpAqvYRZS2Cs81nfll
ClGhAanUcCH82M7vQgZsGH4FShmXlw==
=Vadb
-----END PGP SIGNATURE-----

--Sig_/qzRvW+cCzaENv3Q9QAe2QWD--
