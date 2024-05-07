Return-Path: <linux-next+bounces-2196-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA18BD990
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 04:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 623121F224AB
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 02:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5B321101;
	Tue,  7 May 2024 02:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j0HM6cTo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B072E40D;
	Tue,  7 May 2024 02:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715050301; cv=none; b=Yk3b5+Z8VP9rNLd8/uUP0CQFl10Dceg2lJQ6tvgE3i/wxf8u/iMVFib8GU9trGqSh/A0P89zVKYnJ/fi2EOicYbl87l0E5aLFqJKP7vHsrS9uFOyY/t2bibDyVnGYAlYijxvWQ6sYoSxyyV5wkp+sptOXgz0tXd6ug2RR6Uawxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715050301; c=relaxed/simple;
	bh=AOtdC2IfGnOxc3+3DtkPnLxFoqJ5xNLRE20wbex8kS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FDhnI9xjaOPVBwy3lAjKCn3Yh2ZlY2R29F/vcnoXHJ9wbRnMgU2sds36jqALqHYUJbZwqlpfUIYPVkIqj5lPIDu2D2snGBe+VzP0w2SCrPw5jufhE9MIwBaCj846j5wdml85FXafvIONBd+OG2Qh7lAmUiaZrknjK6b5sXtfeAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j0HM6cTo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715050295;
	bh=kjlJBUoeDWirhBNXQNQ5xdvz6fIgsyg34uMj20M8ag8=;
	h=Date:From:To:Cc:Subject:From;
	b=j0HM6cTotXngvK/3pcVKVZCRicHP7dcARCG4WgoQFnL+Gj/oajcTxQjdk7+jbySnE
	 tVcaT6Dd6amGObSLmxHnJe+2gRqIvq+/y5dmX38jlRLfyvv+ypQx3cviHwil+evZ8Q
	 UNslq7RnMZ3mWvGmtnLyHKCL7CDRxdwz5IOKLuvBFJuUXcCpbrH0eX9P5WtgMe3AQ6
	 1mL5o2ux5eyeEZ309h6vVlTaKpUL00DSUbpTc134sP7qZ7vtF5ZiPlcqXss8wFuark
	 rGIjGH+D8k94PAQSX+3LvB654ZwSBOGucdVws3g9CUYOJLzaDZoEsZxkGTKd6jfS6G
	 rU/z+3Uyee2hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYN8R1BGVz4wcR;
	Tue,  7 May 2024 12:51:35 +1000 (AEST)
Date: Tue, 7 May 2024 12:51:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rob Clark <robdclark@chromium.org>
Subject: linux-next: manual merge of the drm-msm tree with the kbuild tree
Message-ID: <20240507125132.2af57c71@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rMu1udehB6TMha/adl/yGp1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rMu1udehB6TMha/adl/yGp1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/Makefile

between commit:

  7c972986689b ("kbuild: use $(src) instead of $(srctree)/$(src) for source=
 directory")

from the kbuild tree and commits:

  0fddd045f88e ("drm/msm: generate headers on the fly")
  07a2f8716c41 ("drm/msm/gen_header: allow skipping the validation")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/Makefile
index b8cc007fc1b9,718968717ad5..000000000000
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@@ -1,10 -1,11 +1,11 @@@
  # SPDX-License-Identifier: GPL-2.0
 -ccflags-y :=3D -I $(srctree)/$(src)
 +ccflags-y :=3D -I $(src)
+ ccflags-y +=3D -I $(obj)/generated
 -ccflags-y +=3D -I $(srctree)/$(src)/disp/dpu1
 -ccflags-$(CONFIG_DRM_MSM_DSI) +=3D -I $(srctree)/$(src)/dsi
 -ccflags-$(CONFIG_DRM_MSM_DP) +=3D -I $(srctree)/$(src)/dp
 +ccflags-y +=3D -I $(src)/disp/dpu1
 +ccflags-$(CONFIG_DRM_MSM_DSI) +=3D -I $(src)/dsi
 +ccflags-$(CONFIG_DRM_MSM_DP) +=3D -I $(src)/dp
 =20
- msm-y :=3D \
+ adreno-y :=3D \
  	adreno/adreno_device.o \
  	adreno/adreno_gpu.o \
  	adreno/a2xx_gpu.o \
@@@ -140,11 -145,68 +145,68 @@@ msm-display-$(CONFIG_DRM_MSM_DSI) +=3D ds
  			dsi/dsi_manager.o \
  			dsi/phy/dsi_phy.o
 =20
- msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) +=3D dsi/phy/dsi_phy_28nm.o
- msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) +=3D dsi/phy/dsi_phy_20nm.o
- msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) +=3D dsi/phy/dsi_phy_28nm_8960.o
- msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) +=3D dsi/phy/dsi_phy_14nm.o
- msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) +=3D dsi/phy/dsi_phy_10nm.o
- msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) +=3D dsi/phy/dsi_phy_7nm.o
+ msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) +=3D dsi/phy/dsi_phy_28nm.o
+ msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) +=3D dsi/phy/dsi_phy_20nm.o
+ msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) +=3D dsi/phy/dsi_phy_28nm=
_8960.o
+ msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) +=3D dsi/phy/dsi_phy_14nm.o
+ msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) +=3D dsi/phy/dsi_phy_10nm.o
+ msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) +=3D dsi/phy/dsi_phy_7nm.o
+=20
+ msm-y +=3D $(adreno-y) $(msm-display-y)
 =20
  obj-$(CONFIG_DRM_MSM)	+=3D msm.o
+=20
+ ifeq (y,$(CONFIG_DRM_MSM_VALIDATE_XML))
+ 	headergen-opts +=3D --validate
+ else
+ 	headergen-opts +=3D --no-validate
+ endif
+=20
+ quiet_cmd_headergen =3D GENHDR  $@
 -      cmd_headergen =3D mkdir -p $(obj)/generated && $(PYTHON3) $(srctree=
)/$(src)/registers/gen_header.py \
 -		      $(headergen-opts) --rnn $(srctree)/$(src)/registers --xml $< c-de=
fines > $@
++      cmd_headergen =3D mkdir -p $(obj)/generated && $(PYTHON3) $(src)/re=
gisters/gen_header.py \
++		      $(headergen-opts) --rnn $(src)/registers --xml $< c-defines > $@
+=20
+ $(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
+ 		$(src)/registers/adreno/adreno_common.xml \
+ 		$(src)/registers/adreno/adreno_pm4.xml \
+ 		$(src)/registers/freedreno_copyright.xml \
+ 		$(src)/registers/gen_header.py \
+ 		$(src)/registers/rules-fd.xsd \
+ 		FORCE
+ 	$(call if_changed,headergen)
+=20
+ $(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
+ 		$(src)/registers/freedreno_copyright.xml \
+ 		$(src)/registers/gen_header.py \
+ 		$(src)/registers/rules-fd.xsd \
+ 		FORCE
+ 	$(call if_changed,headergen)
+=20
+ ADRENO_HEADERS =3D \
+ 	generated/a2xx.xml.h \
+ 	generated/a3xx.xml.h \
+ 	generated/a4xx.xml.h \
+ 	generated/a5xx.xml.h \
+ 	generated/a6xx.xml.h \
+ 	generated/a6xx_gmu.xml.h \
+ 	generated/adreno_common.xml.h \
+ 	generated/adreno_pm4.xml.h \
+=20
+ DISPLAY_HEADERS =3D \
+ 	generated/dsi_phy_7nm.xml.h \
+ 	generated/dsi_phy_10nm.xml.h \
+ 	generated/dsi_phy_14nm.xml.h \
+ 	generated/dsi_phy_20nm.xml.h \
+ 	generated/dsi_phy_28nm_8960.xml.h \
+ 	generated/dsi_phy_28nm.xml.h \
+ 	generated/dsi.xml.h \
+ 	generated/hdmi.xml.h \
+ 	generated/mdp4.xml.h \
+ 	generated/mdp5.xml.h \
+ 	generated/mdp_common.xml.h \
+ 	generated/sfpb.xml.h
+=20
+ $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
+ $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEAD=
ERS))
+=20
+ targets +=3D $(ADRENO_HEADERS) $(DISPLAY_HEADERS)

--Sig_/rMu1udehB6TMha/adl/yGp1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY5lzQACgkQAVBC80lX
0GyZgwf/fjUdzPVjlywvKMkTQf//8575jxeB4GEbB25O6lzvRj+pgxw+mX6Td8R3
cZVgzMc5QzzQKetTfCVyJuisLhrByGdRWbxpXNOijkr/Golt79wT6OCZu4phwhbC
dROLtCFA63wfBFWntsXa8eR/jYx0QS3v2b4buMoO0g1YfkPBe8V1xg9l2U1OVwr6
MCSEWZHrfjJ7WXlSySqXM1fEf14R38KCoqyJnl4qki3w0JPEdGcxhLAH0pVyCu4G
as/o23ToMau5rcYxzBNrcnm2CiNjbeHYRkJF2U/HO5YOBzdORRAR5/qYH9SCj4PD
CYEMlvkSyrc4dIaOabLgoUHbm+CD3Q==
=72yT
-----END PGP SIGNATURE-----

--Sig_/rMu1udehB6TMha/adl/yGp1--

