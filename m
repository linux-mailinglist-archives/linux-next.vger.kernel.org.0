Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D81E5E6A57
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 01:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbfJ1A5p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Oct 2019 20:57:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54739 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727051AbfJ1A5p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Oct 2019 20:57:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 471bsx19FKz9sPK;
        Mon, 28 Oct 2019 11:57:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572224261;
        bh=hDqh7wu/yQzM10Ws6uGcquRZWRFSL9gNf+r/NB/nf9A=;
        h=Date:From:To:Cc:Subject:From;
        b=fktUIehiQV0rh0zuD/PZRoVW0nlCrTcrncBNm9Lus+Zmg3gJBG4/d8MaQluBi+Yb+
         5lFvRGMdkoj2lEf9yN7jdw5CpSGBJaohP0bqdyM3ELf0IOgnVrNcvOINI/1p0pfq49
         uCX9Uo9f36leF7uzpaNamz7mPL5TaFbOaMl7p3DTjY3U1CuxfDlWUgODD0CsAMSb3a
         FggS20HicEnOaIp6KHDqGUA6+l8NOCX9VUhkxMlHaWa4eghLurmv0o7lR4slrRYG72
         roFwXi/Ut67mvGezH/aTb1nBBdPszX3IzgArJIM0uLJR03iC5u6l/xQ9t5b1pnDWtE
         VdREYecI8WvWA==
Date:   Mon, 28 Oct 2019 11:57:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20191028115740.791bdeba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lXDEOIEaUnX9aF2FDAC=od7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lXDEOIEaUnX9aF2FDAC=od7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/dcn20/Makefile

between commit:

  54b8ae66ae1a ("kbuild: change *FLAGS_<basetarget>.o to take the path rela=
tive to $(obj)")

from Linus' tree and commits:

  4f952528add3 ("drm/amdgpu: fix stack alignment ABI mismatch for Clang")
  971463bea55c ("drm/amdgpu: fix stack alignment ABI mismatch for GCC 7.1+")
  101d09f07966 ("drm/amdgpu: enable -msse2 for GCC 7.1+ users")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/dc/dcn20/Makefile
index ddb8d5649e79,be3a614963c6..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
@@@ -10,16 -10,21 +10,21 @@@ ifdef CONFIG_DRM_AMD_DC_DSC_SUPPOR
  DCN20 +=3D dcn20_dsc.o
  endif
 =20
- ifneq ($(call cc-option, -mpreferred-stack-boundary=3D4),)
- 	cc_stack_align :=3D -mpreferred-stack-boundary=3D4
- else ifneq ($(call cc-option, -mstack-alignment=3D16),)
- 	cc_stack_align :=3D -mstack-alignment=3D16
- endif
 -CFLAGS_dcn20_resource.o :=3D -mhard-float -msse
++CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -msse
 =20
- CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o :=3D -mhard-float -msse $(=
cc_stack_align)
+ ifdef CONFIG_CC_IS_GCC
+ ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+ IS_OLD_GCC =3D 1
+ endif
+ endif
 =20
- ifdef CONFIG_CC_IS_CLANG
+ ifdef IS_OLD_GCC
+ # Stack alignment mismatch, proceed with caution.
+ # GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boun=
dary=3D3
+ # (8B stack alignment).
 -CFLAGS_dcn20_resource.o +=3D -mpreferred-stack-boundary=3D4
++CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -mpreferred-stack-bou=
ndary=3D4
+ else
 -CFLAGS_dcn20_resource.o +=3D -msse2
 +CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o +=3D -msse2
  endif
 =20
  AMD_DAL_DCN20 =3D $(addprefix $(AMDDALPATH)/dc/dcn20/,$(DCN20))

--Sig_/lXDEOIEaUnX9aF2FDAC=od7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl22PQQACgkQAVBC80lX
0Gz/Fgf9FMfRLEvkuxRYD44yb4buxSvkNk05H7IKFgFMGFXfPI32uVdHW/uT/lxn
YdQ/jhmyS/08kHAVlgNGhkCOTU14FW5CNcL2xtAs/DBT1V2fp6SjJPJrkpQ3Hr16
hum5sT3fnUB2OZ+/GD23FaSAjKWE2VOFAmnz9xF6Q9gSq5AV9TQDLZCxNcO+fouW
ZrKXhIy5Fz8RD/7nuPNkGTdgFL+sFUWFc6UNRq72t1vYsT4MEX4DRH45Rp3lg4Lb
37xxLo0nNr6svS84OR3l1BJutBx8yl3DqYr0kfF6kj3zrFWUAjiiaDlA34ACvR7r
A5XRm6fgBDApmEN8hrUH/Sw2Wy2Ajg==
=b52H
-----END PGP SIGNATURE-----

--Sig_/lXDEOIEaUnX9aF2FDAC=od7--
