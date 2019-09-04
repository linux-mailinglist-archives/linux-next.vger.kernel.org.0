Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E28D9A7C2C
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 08:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbfIDG6e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 02:58:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43537 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728547AbfIDG6b (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Sep 2019 02:58:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46NZR85F6qz9s3Z;
        Wed,  4 Sep 2019 16:58:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567580309;
        bh=+yGdAVnwyl5d/8gD6V7LzJIk4KofIDM7ZLazGYBBPek=;
        h=Date:From:To:Cc:Subject:From;
        b=CkOyAHvpR+ngCGoTAbBThOv8Z7D10jM7RUL258rjOuaM0dp0z5Yz5/k4DORvfTvYL
         91BuDtUSXdoCUzhDvj3BGJ/Cwt5QB5k3SQmaDgB6QwQCWkV6JPivFQWcfRcEMyHtS8
         RNMUstuoHlt+aVZoGOVW7SsJi2NIWKLPny1QHs+Z7lFhO/++hRg3XyHBHr63Uf3DKd
         Jq5hfRx21MIykUuPhOWmNRtQFqoh+gdu6AC9bp40A1RyWkewIMNweL8htqy3r5K60g
         mwHCTnU32y/SRH0MNbqxv9DwO40ZEtZ7FXHNGmlVtxan5N8RAPKfcEdipGaQSOjkKX
         66OAtCUcfae2w==
Date:   Wed, 4 Sep 2019 16:58:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the kbuild tree
Message-ID: <20190904165828.72ad8583@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bUan/zPyd4y4kT7AX18wOHM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bUan/zPyd4y4kT7AX18wOHM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/dml/Makefile

between commit:

  30851871d5ab ("kbuild: change *FLAGS_<basetarget>.o to take the path rela=
tive to $(obj)")

from the kbuild tree and commit:

  b04641a3f4c5 ("drm/amd/display: Add Renoir DML")

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

diff --cc drivers/gpu/drm/amd/display/dc/dml/Makefile
index 289261b0de50,af2a864a6da0..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@@ -36,16 -36,25 +36,20 @@@ ifdef CONFIG_CC_IS_CLAN
  dml_ccflags +=3D -msse2
  endif
 =20
 -CFLAGS_display_mode_lib.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o :=3D $(dml_ccflags)
 =20
  ifdef CONFIG_DRM_AMD_DC_DCN2_0
 -CFLAGS_display_mode_vba.o :=3D $(dml_ccflags)
 -CFLAGS_display_mode_vba_20.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_calc_20.o :=3D $(dml_ccflags)
 -CFLAGS_display_mode_vba_20v2.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_calc_20v2.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o :=3D $(dml_ccflag=
s)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o :=3D $(dml_ccf=
lags)
  endif
+ ifdef CONFIG_DRM_AMD_DC_DCN2_1
 -CFLAGS_display_mode_vba_21.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_calc_21.o :=3D $(dml_ccflags)
++CFLAGS_$(AMDDALPATH)dc/dml/dcn21/display_mode_vba_21.o :=3D $(dml_ccflags)
++CFLAGS_$(AMDDALPATH)dc/dml/dcn21/display_rq_dlg_calc_21.o :=3D $(dml_ccfl=
ags)
+ endif
 -ifdef CONFIG_DRM_AMD_DCN3AG
 -CFLAGS_display_mode_vba_3ag.o :=3D $(dml_ccflags)
 -endif
 -CFLAGS_dml1_display_rq_dlg_calc.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_helpers.o :=3D $(dml_ccflags)
 -CFLAGS_dml_common_defs.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dml_common_defs.o :=3D $(dml_ccflags)
 =20
  DML =3D display_mode_lib.o display_rq_dlg_helpers.o dml1_display_rq_dlg_c=
alc.o \
  	dml_common_defs.o

--Sig_/bUan/zPyd4y4kT7AX18wOHM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1vYJQACgkQAVBC80lX
0Gwa4wf9Gh5ogsF9MVQZGX4Ts+E8DVdBHdw7EyVxhggTj3PC5GlPk7sbubiq5oqe
WMGGUH8vN80bZCBy2qYO1UDDpiwIp3R/U9N+Vbln3KWUeBGrzsjHtCaBRwMXDPyz
TjAvx0FzcuOVO0P0O4kUlSZybIyWsMJY4UGNKd6OVlnMMEplWIsv8r1tANdtL5sR
RQ3kGUp74sx6ve/GrVNKaIl0u+x4Pen0S6/8BCeBpIU5u/zihi9Uee4R8vhF8FBO
CaimGDMFaiIeXb68NaG2bwLZ+4kBurJk7tbRlYymZFwsBW5bAYIe9Q7MY0S5azNX
L6/VN5V7QOcF9NfvtRoC4IhtafYqgw==
=6Hw3
-----END PGP SIGNATURE-----

--Sig_/bUan/zPyd4y4kT7AX18wOHM--
