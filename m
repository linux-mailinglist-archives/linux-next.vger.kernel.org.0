Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5303111C11F
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 01:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfLLALZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 19:11:25 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43461 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbfLLALZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 19:11:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47YDjj4W14z9sRf;
        Thu, 12 Dec 2019 11:11:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576109481;
        bh=1EochNfJ4qAyV122QUZUTN6I8jUu2U8xKIz/HU7wsUA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cv8SWYPH5R0JlGpFsebWRq1wWjalo0Jg3hMK+ZYk5bjEJuaZWolfk995+cBtH9SHa
         B4g+CilBgXmw24aKFl5P4b2AIDQ8UKqpxSuyMmZNAQ66003B/2WsPy0igbdX5k5Zb1
         E1b0nJGt5Fthqtff9/2dW5m3SDMLvMtj/SS1q3E21wFbs2jJxzE2Zz+08lgCdphcyy
         9KZ3LFLY7euRq+tmOurXfrZSveZV/tZYaOmGLG+AOCxhe3nvgmsyNN9jqo5+WeVzWa
         EujpWDRAganDUVIwD5bXICBfOsyECjV3QFJk2U0xt4awENKy1vloAEj/8CAMbs7Qhu
         UXagUYKkAWYZg==
Date:   Thu, 12 Dec 2019 11:11:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Timothy Pearson <tpearson@raptorengineering.com>,
        Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20191212111121.3071b044@canb.auug.org.au>
In-Reply-To: <20191212110245.6f63732b@canb.auug.org.au>
References: <20191212110245.6f63732b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lzhOHMcH6Gd4dAO7S/Arsgy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lzhOHMcH6Gd4dAO7S/Arsgy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just cc'ing Dave.

On Thu, 12 Dec 2019 11:03:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the amdgpu tree got conflicts in:
>=20
>   drivers/gpu/drm/amd/display/dc/calcs/Makefile
>   drivers/gpu/drm/amd/display/dc/dcn20/Makefile
>   drivers/gpu/drm/amd/display/dc/dcn21/Makefile
>   drivers/gpu/drm/amd/display/dc/dml/Makefile
>   drivers/gpu/drm/amd/display/dc/dsc/Makefile
>=20
> between commits:
>=20
>   c868868f6b6a ("drm/amdgpu: fix stack alignment ABI mismatch for Clang")
>   00db297106e8 ("drm/amdgpu: fix stack alignment ABI mismatch for GCC 7.1=
+")
>=20
> from Linus' tree and commit:
>=20
>   86462415d58d ("amdgpu: Enable initial DCN support on POWER")
>=20
> from the amdgpu tree.
>=20
> I fixed it up (I think .. see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/amd/display/dc/calcs/Makefile
> index 26c6d735cdc7,4d3006bd4337..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/calcs/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
> @@@ -24,22 -25,23 +25,30 @@@
>   # It calculates Bandwidth and Watermarks values for HW programming
>   #
>  =20
>  -ifneq ($(call cc-option, -mpreferred-stack-boundary=3D4),)
>  -	cc_stack_align :=3D -mpreferred-stack-boundary=3D4
>  -else ifneq ($(call cc-option, -mstack-alignment=3D16),)
>  -	cc_stack_align :=3D -mstack-alignment=3D16
> ++ifdef CONFIG_X86
>  +calcs_ccflags :=3D -mhard-float -msse
> + endif
> +=20
>  -ifdef CONFIG_X86
>  -calcs_ccflags :=3D -mhard-float -msse $(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++calcs_ccflags :=3D -mhard-float -maltivec
> ++endif
>  =20
>  -ifdef CONFIG_CC_IS_CLANG
>  -calcs_ccflags +=3D -msse2
>  +ifdef CONFIG_CC_IS_GCC
>  +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  +IS_OLD_GCC =3D 1
>   endif
>   endif
>  =20
>  -ifdef CONFIG_PPC64
>  -calcs_ccflags :=3D -mhard-float -maltivec $(cc_stack_align)
>  +ifdef IS_OLD_GCC
>  +# Stack alignment mismatch, proceed with caution.
>  +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-bo=
undary=3D3
>  +# (8B stack alignment).
>  +calcs_ccflags +=3D -mpreferred-stack-boundary=3D4
>  +else
> ++ifdef CONFIG_X86
>  +calcs_ccflags +=3D -msse2
>  +endif
> + endif
>  =20
>   CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calcs.o :=3D $(calcs_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/calcs/dcn_calc_auto.o :=3D $(calcs_ccflags)
> diff --cc drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> index 63f3bddba7da,07f652d40f86..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> @@@ -6,26 -7,25 +7,32 @@@ DCN20 =3D dcn20_resource.o dcn20_init.o d
>   		dcn20_stream_encoder.o dcn20_link_encoder.o dcn20_dccg.o \
>   		dcn20_vmid.o dcn20_dwb.o dcn20_dwb_scl.o
>  =20
> - ifdef CONFIG_DRM_AMD_DC_DSC_SUPPORT
>   DCN20 +=3D dcn20_dsc.o
> - endif
>  =20
>  -ifneq ($(call cc-option, -mpreferred-stack-boundary=3D4),)
>  -	cc_stack_align :=3D -mpreferred-stack-boundary=3D4
>  -else ifneq ($(call cc-option, -mstack-alignment=3D16),)
>  -	cc_stack_align :=3D -mstack-alignment=3D16
> ++ifdef CONFIG_X86
>  +CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -msse
> + endif
> +=20
>  -ifdef CONFIG_X86
>  -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -msse =
$(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -malti=
vec
> ++endif
>  =20
>  -ifdef CONFIG_CC_IS_CLANG
>  -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -msse2
>  +ifdef CONFIG_CC_IS_GCC
>  +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  +IS_OLD_GCC =3D 1
>   endif
>   endif
>  =20
>  -ifdef CONFIG_PPC64
>  -CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -malti=
vec $(cc_stack_align)
>  +ifdef IS_OLD_GCC
>  +# Stack alignment mismatch, proceed with caution.
>  +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-bo=
undary=3D3
>  +# (8B stack alignment).
>  +CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -mpreferred-stack-b=
oundary=3D4
>  +else
> ++ifdef CONFIG_X86
>  +CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -msse2
>  +endif
> + endif
>  =20
>   AMD_DAL_DCN20 =3D $(addprefix $(AMDDALPATH)/dc/dcn20/,$(DCN20))
>  =20
> diff --cc drivers/gpu/drm/amd/display/dc/dcn21/Makefile
> index 14113ccf498d,041464d001bd..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
> @@@ -1,24 -2,26 +2,33 @@@
>   #
>   # Makefile for DCN21.
>  =20
> - DCN21 =3D dcn21_hubp.o dcn21_hubbub.o dcn21_resource.o dcn21_hwseq.o dc=
n21_link_encoder.o
> + DCN21 =3D dcn21_init.o dcn21_hubp.o dcn21_hubbub.o dcn21_resource.o \
> + 	 dcn21_hwseq.o dcn21_link_encoder.o
>  =20
>  -ifneq ($(call cc-option, -mpreferred-stack-boundary=3D4),)
>  -	cc_stack_align :=3D -mpreferred-stack-boundary=3D4
>  -else ifneq ($(call cc-option, -mstack-alignment=3D16),)
>  -	cc_stack_align :=3D -mstack-alignment=3D16
> ++ifdef CONFIG_X86
>  +CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o :=3D -mhard-float -msse
> + endif
> +=20
>  -ifdef CONFIG_X86
>  -CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o :=3D -mhard-float -msse =
$(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o :=3D -mhard-float -malti=
vec
> ++endif
>  =20
>  -ifdef CONFIG_CC_IS_CLANG
>  -CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o +=3D -msse2
>  +ifdef CONFIG_CC_IS_GCC
>  +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  +IS_OLD_GCC =3D 1
>   endif
>   endif
>  =20
>  -ifdef CONFIG_PPC64
>  -CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o :=3D -mhard-float -malti=
vec $(cc_stack_align)
>  +ifdef IS_OLD_GCC
>  +# Stack alignment mismatch, proceed with caution.
>  +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-bo=
undary=3D3
>  +# (8B stack alignment).
>  +CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o +=3D -mpreferred-stack-b=
oundary=3D4
>  +else
> ++ifdef CONFIG_X86
>  +CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o +=3D -msse2
>  +endif
> + endif
>  =20
>   AMD_DAL_DCN21 =3D $(addprefix $(AMDDALPATH)/dc/dcn21/,$(DCN21))
>  =20
> diff --cc drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 8df251626e22,82c8978c81ab..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@@ -24,22 -25,23 +25,30 @@@
>   # It provides the general basic services required by other DAL
>   # subcomponents.
>  =20
>  -ifneq ($(call cc-option, -mpreferred-stack-boundary=3D4),)
>  -	cc_stack_align :=3D -mpreferred-stack-boundary=3D4
>  -else ifneq ($(call cc-option, -mstack-alignment=3D16),)
>  -	cc_stack_align :=3D -mstack-alignment=3D16
> ++ifdef CONFIG_X86
>  +dml_ccflags :=3D -mhard-float -msse
> + endif
> +=20
>  -ifdef CONFIG_X86
>  -dml_ccflags :=3D -mhard-float -msse $(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++dml_ccflags :=3D -mhard-float -maltivec
> ++endif
>  =20
>  -ifdef CONFIG_CC_IS_CLANG
>  -dml_ccflags +=3D -msse2
>  +ifdef CONFIG_CC_IS_GCC
>  +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  +IS_OLD_GCC =3D 1
>   endif
>   endif
>  =20
>  -ifdef CONFIG_PPC64
>  -dml_ccflags :=3D -mhard-float -maltivec $(cc_stack_align)
>  +ifdef IS_OLD_GCC
>  +# Stack alignment mismatch, proceed with caution.
>  +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-bo=
undary=3D3
>  +# (8B stack alignment).
>  +dml_ccflags +=3D -mpreferred-stack-boundary=3D4
>  +else
> ++ifdef CONFIG_X86
>  +dml_ccflags +=3D -msse2
>  +endif
> + endif
>  =20
>   CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o :=3D $(dml_ccflags)
>  =20
> diff --cc drivers/gpu/drm/amd/display/dc/dsc/Makefile
> index 970737217e53,08edd919ec82..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dsc/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
> @@@ -1,22 -2,23 +2,30 @@@
>   #
>   # Makefile for the 'dsc' sub-component of DAL.
>  =20
>  -ifneq ($(call cc-option, -mpreferred-stack-boundary=3D4),)
>  -	cc_stack_align :=3D -mpreferred-stack-boundary=3D4
>  -else ifneq ($(call cc-option, -mstack-alignment=3D16),)
>  -	cc_stack_align :=3D -mstack-alignment=3D16
> ++ifdef CONFIG_X86
>  +dsc_ccflags :=3D -mhard-float -msse
> + endif
> +=20
>  -ifdef CONFIG_X86
>  -dsc_ccflags :=3D -mhard-float -msse $(cc_stack_align)
> ++ifdef CONFIG_PPC64
> ++dsc_ccflags :=3D -mhard-float -maltivec
> ++endif
>  =20
>  -ifdef CONFIG_CC_IS_CLANG
>  -dsc_ccflags +=3D -msse2
>  +ifdef CONFIG_CC_IS_GCC
>  +ifeq ($(call cc-ifversion, -lt, 0701, y), y)
>  +IS_OLD_GCC =3D 1
>   endif
>   endif
>  =20
>  -ifdef CONFIG_PPC64
>  -dsc_ccflags :=3D -mhard-float -maltivec $(cc_stack_align)
>  +ifdef IS_OLD_GCC
>  +# Stack alignment mismatch, proceed with caution.
>  +# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-bo=
undary=3D3
>  +# (8B stack alignment).
>  +dsc_ccflags +=3D -mpreferred-stack-boundary=3D4
>  +else
> ++ifdef CONFIG_X86
>  +dsc_ccflags +=3D -msse2
>  +endif
> + endif
>  =20
>   CFLAGS_$(AMDDALPATH)/dc/dsc/rc_calc.o :=3D $(dsc_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dsc/rc_calc_dpi.o :=3D $(dsc_ccflags)

--=20
Cheers,
Stephen Rothwell

--Sig_/lzhOHMcH6Gd4dAO7S/Arsgy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3xhakACgkQAVBC80lX
0Gx7pwgApP6XbMild6k44vrsSsGbV03PzHyvNmkW140/oAGpqgEr0LixnX+98dwE
zrJ8zIVBgTJTyNUo7tpL061tcm6GFmzn0ueX4zOpPSlVbR7Q5uboaPjSUWnPoIGx
jXIshKqskNS6E2/buc3gxoNUxiGb5jU32YkNol1djQfUx006wdt1r+K+N6I/LDpK
6lr0Il1uuh4Ei6d173FXogFgtgKRrzA7Y2+UHMO8eSLiuwnqTXfk7qtZA2u9xuzO
nklzlPXYECjqdiymTwDP0YUpf116vICfG2/ZmvutybBZrUavHT2ZuW4+rB0I4Xmt
I1XXA5l+0ziAcEUbfU0rTqGBrZuOBQ==
=ii7W
-----END PGP SIGNATURE-----

--Sig_/lzhOHMcH6Gd4dAO7S/Arsgy--
