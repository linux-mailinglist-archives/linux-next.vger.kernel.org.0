Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07DB828EA8C
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 03:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732405AbgJOB5u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 21:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732382AbgJOB5u (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 21:57:50 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF72C061755;
        Wed, 14 Oct 2020 18:57:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBXVG5pVVz9sTD;
        Thu, 15 Oct 2020 12:57:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602727066;
        bh=toLc+QRxQ7GiJM66AMtu5RHjmWqmkH84Q0Iih67+Ffc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=THGFwqkib2b1LJdoVHlxMUH182sAPURvg1N5Xgvt0FjADqCwWYndC7Nn5+nSnqWer
         BH5biK9KNJ1vcvrE1JSttyqrGGywNM+83t84N5dKSCxMwmplJf9ErywBGI97unVyOo
         CKzQcw1ldX8479o8EXaTZSDwX5XC+9zieCvvTbMTXbI2bIFQ7fr6kwKYBsZixLZLVP
         soxE/Z9ojdQHg/TUISwbp1H4YtJTDROSDvgznmlluliUl1OEzjVv2czY77eW6RUx4a
         nDec6OPQbdW3DdXgSxDYqWhprSl8jjpkwcvgE+8FmTrXprPI44aHfq0PGjeXLc89mG
         PFPyuOZxexRcA==
Date:   Thu, 15 Oct 2020 12:57:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the kbuild tree
Message-ID: <20201015125741.655deb8a@canb.auug.org.au>
In-Reply-To: <20200925152545.60cccb7b@canb.auug.org.au>
References: <20200925152545.60cccb7b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Duat.Bz8_S2d4wuh_oAKb.I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Duat.Bz8_S2d4wuh_oAKb.I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 25 Sep 2020 15:25:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/arm/Makefile
>=20
> between commit:
>=20
>   596b0474d3d9 ("kbuild: preprocess module linker script")
>=20
> from the kbuild tree and commit:
>=20
>   5a17850e251a ("arm/build: Warn on orphan section placement")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/arm/Makefile
> index e15f76ca2887,e589da3c8949..000000000000
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@@ -16,6 -16,14 +16,10 @@@ LDFLAGS_vmlinux	+=3D --be
>   KBUILD_LDFLAGS_MODULE	+=3D --be8
>   endif
>  =20
> + # We never want expected sections to be placed heuristically by the
> + # linker. All sections should be explicitly named in the linker script.
> + LDFLAGS_vmlinux +=3D $(call ld-option, --orphan-handling=3Dwarn)
> +=20
>  -ifeq ($(CONFIG_ARM_MODULE_PLTS),y)
>  -KBUILD_LDS_MODULE	+=3D $(srctree)/arch/arm/kernel/module.lds
>  -endif
>  -
>   GZFLAGS		:=3D-9
>   #KBUILD_CFLAGS	+=3D-pipe
>  =20

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Duat.Bz8_S2d4wuh_oAKb.I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+HrJUACgkQAVBC80lX
0GwkYwf/cu/DZv6PluM8CrfGyXV8KbWAqHG1ceeADeYIHJUfNFL/DWUl+/rpErlB
XWkTzTRMrHxEsRaXgLHlMdiTUN5fq4akozw6X4Kb2QWnnJMJta18/vjTb+Yle5tv
8KsKKiFwJt5M0PJEigB4m3Bb47FAAQGiuVmz+xzF70PXUPGPbK2MEu6ae9j+MpZs
RN3SjsDVRERAYltTBwk30l518fQA7TpH40B8LI5iBpvw6xFYmXi/DcrVSZwq+52/
23bxA4C1PD/hggzyVda69uZym8WYLfnFs/g0t/Vgrgn+wW5awct5YtTeyDXOnj4Z
lbkt5W+S1w4tJSDEsQ5lBQtL/oa+Ig==
=Hnsh
-----END PGP SIGNATURE-----

--Sig_/Duat.Bz8_S2d4wuh_oAKb.I--
