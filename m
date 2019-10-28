Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329DDE6A5F
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 02:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbfJ1BD3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Oct 2019 21:03:29 -0400
Received: from ozlabs.org ([203.11.71.1]:37421 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727581AbfJ1BD3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Oct 2019 21:03:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 471c0Y4QD0z9sNw;
        Mon, 28 Oct 2019 12:03:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572224606;
        bh=i7ArOkOPCVtOfQnDVjrmr2pJ+xA+Nt8dJM4lSqoCdBc=;
        h=Date:From:To:Cc:Subject:From;
        b=oIP1UQeKKyB58N/+dUWkL8KMbgr9cAskfhUEBaQ+sR1p59qm17hYtlzbnwNRRaoBf
         VCU8QD09virOjY6CbeCORuFCw5Yds4hh4SdX5qg+cvhvDhMxRNl5mhBfFaQHB7Y2Hp
         r4DrFF/BkrUN+gh0js7k/dk71r7F8q9m10PqBXxLKmE21MpcA6pPwMrkOb1MgilB2u
         CM5myUMZzl9jWgNO/KGhe1jtCHMJKlZ1hzhi+rIQJnCCM+Spm/50IAoy/S57ZIkfo5
         jVIWlQYqH8kRm0PW67z8dP5Z7Ik5rQJPssVBv41ZE6wePVVxJuuww+WHxDZX5Uz2wK
         vWsOldRZm4ncA==
Date:   Mon, 28 Oct 2019 12:03:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20191028120325.1f0dfb5d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SptWgYLNrqX+FhGlFPABrTA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SptWgYLNrqX+FhGlFPABrTA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/dcn21/Makefile

between commits:

  d7b0827f28ab ("Merge tag 'kbuild-v5.4' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/masahiroy/linux-kbuild")
  c0e70e10b11b ("drm/amd/display: fix dcn21 Makefile for clang")

from Linus' tree and commits:

  618f55831b84 ("drm/amd/display: fix dcn21 Makefile for clang")
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

diff --cc drivers/gpu/drm/amd/display/dc/dcn21/Makefile
index ef673bffc241,feb7e705e792..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
@@@ -1,18 -1,23 +1,23 @@@
  #
  # Makefile for DCN21.
 =20
- DCN21 =3D dcn21_hubp.o dcn21_hubbub.o dcn21_resource.o
+ DCN21 =3D dcn21_hubp.o dcn21_hubbub.o dcn21_resource.o dcn21_hwseq.o dcn2=
1_link_encoder.o
 =20
- ifneq ($(call cc-option, -mpreferred-stack-boundary=3D4),)
- 	cc_stack_align :=3D -mpreferred-stack-boundary=3D4
- else ifneq ($(call cc-option, -mstack-alignment=3D16),)
- 	cc_stack_align :=3D -mstack-alignment=3D16
- endif
 -CFLAGS_dcn21_resource.o :=3D -mhard-float -msse
++CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o :=3D -mhard-float -msse
 =20
- CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o :=3D -mhard-float -msse $(=
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
 -CFLAGS_dcn21_resource.o +=3D -mpreferred-stack-boundary=3D4
++CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o +=3D -mpreferred-stack-bou=
ndary=3D4
+ else
 -CFLAGS_dcn21_resource.o +=3D -msse2
 +CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o +=3D -msse2
  endif
 =20
  AMD_DAL_DCN21 =3D $(addprefix $(AMDDALPATH)/dc/dcn21/,$(DCN21))

--Sig_/SptWgYLNrqX+FhGlFPABrTA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl22Pl0ACgkQAVBC80lX
0GzbfwgAl/Zx1fqOsi9h4M3m9WVpybj1Ww4AjucqlYUioGQXXG+oTkq2fBjScmTQ
TaQRqKTn5P42HsLpMkOAIqLV9d48g0P1UCF7qT1vyj/1sZ0p1v5a9hW4pDIE9Wet
ee5yRk+uFUsnIFV15+fPCMknSRcQpiWBjALH0uymqHIELsdvoxxvMOLTGaRNkPlM
oEUY5dO8ltQUB8z3AfHTlYPvh6pBb5iiS8cCq0pSwjO6QnSI0pwhDPzdEb02c361
+vPpGRCeAf/drwsucPTuV1+nfrWAL+8bNcivR23RrpTdNhB10ugzAATERapk+Bjf
3+t/c0bJC1VzHxt+ayxjAgeOh2FS2g==
=QlKz
-----END PGP SIGNATURE-----

--Sig_/SptWgYLNrqX+FhGlFPABrTA--
