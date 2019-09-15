Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E21E0B3251
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2019 23:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbfIOVr4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 17:47:56 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58338 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIOVrz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 17:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=m5M8jHwpRhnr+X0rLnNmbxvmCMiKTEmQHloHEyEilcs=; b=GtdjDgpNN75hM3KepNeL0KPX9
        sYRGTU5z9pfl3QtpaB6c8pdKRwIycZl88X6IyKUPgN9ZB4APCPpH1i8HjRCPfoDzEe5QUKNDAOPfY
        Tp/X3x9xvWvcvl0M0sl5pFk2yyetk/lbzEi+4lJrT6MG2QUcC7fZQvPUnjzOuT1zJP2DM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9cN3-0001SA-Vl; Sun, 15 Sep 2019 21:47:50 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 1C90427415FF; Sun, 15 Sep 2019 22:47:49 +0100 (BST)
Date:   Sun, 15 Sep 2019 22:47:49 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Alex Deucher <alexander.deucher@amd.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Roman Li <Roman.Li@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Jun Lei <Jun.Lei@amd.com>,
        Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the kbuild tree
Message-ID: <20190915214748.GJ4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NgG1H2o5aFKkgPy/"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--NgG1H2o5aFKkgPy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/dml/Makefile

between commit:

  54b8ae66ae1a345 ("kbuild: change *FLAGS_<basetarget>.o to take the path r=
elative to $(obj)")

=66rom the kbuild tree and commits:

  0f0727d971f6fdf ("drm/amd/display: readd -msse2 to prevent Clang from emi=
tting libcalls to undefined SW FP routines")
  542816ff168d8a3 ("drm/amd/display: Add DCN2.1 changes to DML")
  b04641a3f4c54b0 ("drm/amd/display: Add Renoir DML")
  057fc695e934a77 ("drm/amd/display: support "dummy pstate"")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/display/dc/dml/Makefile
index 83792e2c0f0e4,af2a864a6da05..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@@ -32,16 -32,29 +32,25 @@@ endi
 =20
  dml_ccflags :=3D -mhard-float -msse $(cc_stack_align)
 =20
+ ifdef CONFIG_CC_IS_CLANG
+ dml_ccflags +=3D -msse2
+ endif
+=20
 -CFLAGS_display_mode_lib.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o :=3D $(dml_ccflags)
 =20
  ifdef CONFIG_DRM_AMD_DC_DCN2_0
 -CFLAGS_display_mode_vba.o :=3D $(dml_ccflags)
 -CFLAGS_display_mode_vba_20.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_calc_20.o :=3D $(dml_ccflags)
 -CFLAGS_display_mode_vba_20v2.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_calc_20v2.o :=3D $(dml_ccflags)
 -endif
 +CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o :=3D $(dml_ccflags)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o :=3D $(dml_ccflag=
s)
 +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o :=3D $(dml_ccf=
lags)
++CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o :=3D $(dml_ccfl=
ags)
++CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o :=3D $(dml_c=
cflags)
+ ifdef CONFIG_DRM_AMD_DC_DCN2_1
 -CFLAGS_display_mode_vba_21.o :=3D $(dml_ccflags)
 -CFLAGS_display_rq_dlg_calc_21.o :=3D $(dml_ccflags)
 -endif
 -ifdef CONFIG_DRM_AMD_DCN3AG
 -CFLAGS_display_mode_vba_3ag.o :=3D $(dml_ccflags)
++CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o :=3D $(dml_ccflag=
s)
++CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o :=3D $(dml_ccf=
lags)
  endif
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

--NgG1H2o5aFKkgPy/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+sYQACgkQJNaLcl1U
h9A1Wgf/aYB4E5uPXEwza2IQcguTufjZTmITgJ8mTIXHcTVz7OHWVigGg3hySEbu
vCTsipyL1NvIiwMbXRxJxTfLbkBV0/w3XQaEL+hvcYOshU7p1DGNb0ukZtExjYqy
UywcNHC/yt2z2SGWj1w5lEwnkU/uDZ6eHsTp14JOUCcOG0rLNZ4NRHl8Q3Hi8mR1
XQ9TF8PitKWVTTpurrDTKcysSOurUvYNbVwO6RsLd3CSdnzJkPxweiJKNEgkaLYg
mm1wJPo/NlpsMwwdkZtKTcyvJA0Y3Qe+BPvoo5QfwUOzHStjRb43l/nQVz4eARDG
B/jpBuIWhNZst06fyTwbxxnh/GvlNw==
=2F48
-----END PGP SIGNATURE-----

--NgG1H2o5aFKkgPy/--
