Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AAD2DCA83
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 02:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731398AbgLQB0H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 20:26:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33835 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728002AbgLQB0H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Dec 2020 20:26:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxDnt4js6z9sSf;
        Thu, 17 Dec 2020 12:25:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608168324;
        bh=ANxjHRTARFBHBjOythRT7P1h03IlPXQyCzi51DZAg4o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EK3mfK7k7e/7l64XRi+ktKYGWfrVgIlbWIW8PxiOt1bNpRXy7/EwQvALBLivI4JZG
         xB83gb3Gom0HPl8ldv9kUbljjOOR5mV7BqySSmhuIrRUvVYt4ONfXg3IBj4myJEhMa
         H5qS8vceLwLnoEb29wT8JtqSwtnRUkys6oe2jvyjogXtJqYEUi/BcmYqMlWDR3NzmP
         pZWpuxR9CFAywJqVsFjDVGW7sy6jfFHZwNS/qKuNhsHA/gu6tOsuIsY1apTCNib25t
         PTkfr66Fyp00gO36Ggx2lEu8bSnIlu2BBGwv9wme/hkEx5X8Y95TRPTefWFhW87Xsa
         +rRhBdw6CHl8w==
Date:   Thu, 17 Dec 2020 12:25:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 risc-v tree
Message-ID: <20201217122521.23a6d7f2@canb.auug.org.au>
In-Reply-To: <20201214202107.66932c18@canb.auug.org.au>
References: <20201214202107.66932c18@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.5zph_I2oF6jMOWw+.elo/j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.5zph_I2oF6jMOWw+.elo/j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 14 Dec 2020 20:21:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   lib/Makefile
>=20
> between commit:
>=20
>   527701eda5f1 ("lib: Add a generic version of devmem_is_allowed()")
>=20
> from the risc-v tree and commits:
>=20
>   8250e121c672 ("lib/list_kunit: follow new file name convention for KUni=
t tests")
>   17bf776cf09a ("lib/linear_ranges_kunit: follow new file name convention=
 for KUnit tests")
>   23fa4e39ee62 ("lib/bits_kunit: follow new file name convention for KUni=
t tests")
>   1987f84faec6 ("lib/cmdline_kunit: add a new test suite for cmdline API")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc lib/Makefile
> index bcedd691ef63,dc623561ef9d..000000000000
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@@ -350,8 -350,7 +350,9 @@@ obj-$(CONFIG_PLDMFW) +=3D pldmfw
>  =20
>   # KUnit tests
>   obj-$(CONFIG_BITFIELD_KUNIT) +=3D bitfield_kunit.o
> - obj-$(CONFIG_LIST_KUNIT_TEST) +=3D list-test.o
> - obj-$(CONFIG_LINEAR_RANGES_TEST) +=3D test_linear_ranges.o
> - obj-$(CONFIG_BITS_TEST) +=3D test_bits.o
> + obj-$(CONFIG_BITS_TEST) +=3D bits_kunit.o
> + obj-$(CONFIG_CMDLINE_KUNIT_TEST) +=3D cmdline_kunit.o
> + obj-$(CONFIG_LINEAR_RANGES_TEST) +=3D linear_ranges_kunit.o
> + obj-$(CONFIG_LIST_KUNIT_TEST) +=3D list_kunit.o
>  +
>  +obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) +=3D devmem_is_allowed.o

This is now a conflict between the risc-v tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.5zph_I2oF6jMOWw+.elo/j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/as4EACgkQAVBC80lX
0GwfUgf6AyqcrcOI0HCuROEg4EiL3P5K/BSAxGVnF7PwRCZLeA8Gvvnf2wVTcSuP
FuhLvR+uApk3DCX6WdfhoGLiHGue9DY3ocXtd92SfZI55pDdbov9x4p5TrZFsZKT
NJKdzBs2S/GRGseQ/L5M5lcM4PGPUjW4TPlC6/PGz4Z3EnNJwtDR81qbaaib3k7/
3SCWcb0DKyl7THtc8lJ5Gu7cMsiEleSiZCdZunL28y27Oc8B5LwbDU7GgVfw6A4S
e34QBTgav4bhCd1MtasLJW0X4vhIA2FmtE7jVN2l7NvfiCT3ieJ8F4M4uvx11qfH
uKijsm9kWraiV0RK6eChvGSM7q77Xg==
=HJel
-----END PGP SIGNATURE-----

--Sig_/.5zph_I2oF6jMOWw+.elo/j--
