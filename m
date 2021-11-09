Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C503344AEE6
	for <lists+linux-next@lfdr.de>; Tue,  9 Nov 2021 14:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhKINmX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Nov 2021 08:42:23 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:33057 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbhKINmW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Nov 2021 08:42:22 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HpTc517clz4xbc;
        Wed, 10 Nov 2021 00:39:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636465174;
        bh=EB45jjDPR8bRPHUY2PFX+Xr70gTyQt9MZRx3eiXmAIE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UYUzHUBwCzbEUDYBBJPvspkA0no75gujDtj/VnpVB83w9PIDCp+8WlRSCDfB3+FjC
         jr4ixhq62/fOJ4luvb+apdga9o0Kop0lCs8fJuu4cO9IRxewVM2B3qpUVB59M2rL+W
         PwAXNO3ftt+VrTc+WnXOMvubdR2e2bX1k8SvPAEWK8ku7LhwdHj0OCCA/P0d0WpVrC
         HUiRPuGcoQEflXEhkeSYDpAYBRCYXTPHzyvjHjq1Z0pWZbQV6jk85Q4HfjbgvGDnGP
         vS5NB8Ggklr4l/xCoN+WiwlAD++eT//K0YZ3RDQlxcuwVm7fJQvwmTdsmBt0n46gdC
         mQK4ds9RCQ7mw==
Date:   Wed, 10 Nov 2021 00:39:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Scott Wood <oss@buserror.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?= =?UTF-8?B?Zw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Anders Roxell <anders.roxell@linaro.org>
Subject: Re: powerpc: mcu_mpc8349emitx.c:189:13: error: unused variable
 'ret' [-Werror=unused-variable]
Message-ID: <20211110003932.51a605ef@canb.auug.org.au>
In-Reply-To: <CA+G9fYvviLKpT7a-1ZDmVp8YN8cCG0ixLpxv2uSubtsw-CkZCQ@mail.gmail.com>
References: <CA+G9fYvviLKpT7a-1ZDmVp8YN8cCG0ixLpxv2uSubtsw-CkZCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dtUNaDO71cbSSM4a5=2bJ82";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dtUNaDO71cbSSM4a5=2bJ82
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Tue, 9 Nov 2021 18:37:48 +0530 Naresh Kamboju <naresh.kamboju@linaro.org=
> wrote:
>
> [Please ignore this email if it is already reported ]
>=20
> Regression found on powerpc gcc-8/9/10 and gcc-11 built with ppc6xx_defco=
nfig
> Following build warnings / errors reported on linux next 20211109.
>=20
> metadata:
>     git_describe: next-20211109
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_short_log: c8109c2ba35e (\"Add linux-next specific files for 2021=
1109\")
>     target_arch: powerpc
>     toolchain: gcc-11
>=20
> build error :
> --------------
> <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-W=
cpp]
> arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c: In function 'mcu_remove':
> arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c:189:13: error: unused
> variable 'ret' [-Werror=3Dunused-variable]
>   189 |         int ret;
>       |             ^~~
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:288:
> arch/powerpc/platforms/83xx/mcu_mpc8349emitx.o] Error 1
> make[4]: Target '__build' not remade because of errors.
> make[3]: *** [scripts/Makefile.build:571: arch/powerpc/platforms/83xx] Er=
ror 2
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
> build link:
> -----------
> https://builds.tuxbuild.com/20fICxLPRCpcISasoGwKGICBELv/build.log
>=20
> build config:
> -------------
> https://builds.tuxbuild.com/20fICxLPRCpcISasoGwKGICBELv/config
>=20
> # To install tuxmake on your system globally
> # sudo pip3 install -U tuxmake
> tuxmake --runtime podman --target-arch powerpc --toolchain gcc-11
> --kconfig ppc6xx_defconfig
>=20
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org

Caused by commit

  5d354dc35ebb ("powerpc/83xx/mpc8349emitx: Make mcu_gpiochip_remove() retu=
rn void")

that is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dtUNaDO71cbSSM4a5=2bJ82
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGKehQACgkQAVBC80lX
0Gw2jwgAi+V3loC+NLTzrpFxCXSjNprWeoVXI3ToJaT0/vQ/cMsIZb6mONSXQbwd
7yYuZ5imLl49d1LYfx4HImyUzvIukxyrrB8loOe4ZhAmns5k6uOBk3bw75TRupBj
YmxeGZWoL4cv9ZmVD1ukSQlXiCDqZ1/lKDCah8Jh/dHEAbO4Ax27MukiEWLZuk+b
3l86jBtgAk2JbohUnCB5ms4JKCwCV7K0tvL9AFUEIwgjegXbEEQA9vdUP6KSQWpe
zwtiRAGdIeq+UTZjNIbexze+p2OGUv2x0hPHv2dh63mbkUiCXQ1WZQtWU/QyadIr
xN6KBQXdJ3/4fNfpJAWsBzfxa/Tj7Q==
=70cK
-----END PGP SIGNATURE-----

--Sig_/dtUNaDO71cbSSM4a5=2bJ82--
