Return-Path: <linux-next+bounces-2178-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BE8BC5C1
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 04:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F7D81F2219B
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 02:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8243FB89;
	Mon,  6 May 2024 02:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XCpdRj+6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC6B42073;
	Mon,  6 May 2024 02:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714962561; cv=none; b=SHMyAmstMJGO14oSi5kqWLY2xmxl7pHjx7KV+SvOoSX4kitdVGoCH+gftfvy7qkcs9ujj6nMLwLPIUb7yBrauYAJJbG2/cfEXuoIovfa6VzycAlNh+3y8CE2ho8uY7XFiBEY4xuUl3nAggyivAWdAHy75UevF26kywHF5lHp9g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714962561; c=relaxed/simple;
	bh=sLQUZMApqqLwfKOmiwgXagVQ77v4zYFltOYi02efLkI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uNhR72YBJF0N/vH8m/8Tp3BpXKAZCVI9BPPXhe69+ZN4pdRKXBan0z9qO1/N/0tqkwK387nZG0opmLzaHVrDODLcKAtrG4zVihqilHEKmSsjxBvjB8V1Kh2V4eG9yYk+0y+W52S3yGS5c1Rl70o0JEuHTDMNlXk7gj1IIRbffgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XCpdRj+6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714962556;
	bh=ne9JTXjWOHaKfsqQqJPT7Xw7twbf75bnHuJTPws1Js8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XCpdRj+6VU2tLfZoGUT8f+0/jHTC2YkQdm7DtKhti7CL+lxhVtWvq+joI5JTc7l3R
	 HSxBx0+Df4RISsw5mnJeU884SvB50kqu1Pwnc2g0aBfXL1GmjwdIUGgUXwAteSc68u
	 /zjmHrXGrIv8VRxKTXqs9z8BXNLCB1UOsPSgY7wPcP/CStkWQxn5+G6AYwJ9+QTg3h
	 8eODohEa3G1Fm2YR30PtF9jR1JEGjb3SyzFCWpy5jUOWUYR0oe90Az6hGXnGOB5ui6
	 we379tk3aVVRipgVJryAoB6uxznF1HP3Q7LqJGjQ98Hd6/MXw/6v+SKifkobMFQMW9
	 w7RcSBLZ+qn+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXlj85tfYz4x1H;
	Mon,  6 May 2024 12:29:16 +1000 (AEST)
Date: Mon, 6 May 2024 12:29:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-msm tree with the kbuild
 tree
Message-ID: <20240506122914.2f08c2cc@canb.auug.org.au>
In-Reply-To: <20240506121308.09de6f33@canb.auug.org.au>
References: <20240506121308.09de6f33@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N6B9A4OMDDwwhp/ysbm=qDh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N6B9A4OMDDwwhp/ysbm=qDh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 May 2024 12:13:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-msm tree got a conflict in:
>=20
>   drivers/gpu/drm/msm/Makefile
>=20
> between commit:
>=20
>   7c972986689b ("kbuild: use $(src) instead of $(srctree)/$(src) for sour=
ce directory")
>=20
> from the kbuild tree and commit:
>=20
>   0fddd045f88e ("drm/msm: generate headers on the fly")
>=20
> from the drm-msm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I actually needed the below instead.
--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/Makefile
index b8cc007fc1b9,c861de58286c..cb9e7adbc4e1
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
@@@ -140,11 -145,61 +145,61 @@@ msm-display-$(CONFIG_DRM_MSM_DSI) +=3D ds
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
+ quiet_cmd_headergen =3D GENHDR  $@
 -      cmd_headergen =3D mkdir -p $(obj)/generated && $(PYTHON3) $(srctree=
)/$(src)/registers/gen_header.py --rnn $(srctree)/$(src)/registers --xml $<=
 c-defines > $@
++      cmd_headergen =3D mkdir -p $(obj)/generated && $(PYTHON3) $(src)/re=
gisters/gen_header.py --rnn $(src)/registers --xml $< c-defines > $@
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

--Sig_/N6B9A4OMDDwwhp/ysbm=qDh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4QHoACgkQAVBC80lX
0GxW0Af/dV2NyUNKAo3Ei+eUSYDiolReQNRfKcZWpYjViJQjnuUxELPD8qb2vVzj
Cyzl4HKHl7goisHqJR0+JBiwIO6F8wiU0v5dp3ifgvPMZ2V2o4+S4n40EB9eB1ST
ibnF7u/ZhfW4aZYDCpuUGx1P/cXGhQQh8DmUwe0OvTXPcMNQROIRjD5F1q1glaRA
J/XqBgkCfss2Uaep1rtd2sW8JsThQMUUaaSOU2qPv1rc/cD77lGXuD7lo1HrokoL
ifKE0dEYvg2pAQ6uPSoLr4+epna3HcJyM+Myag+i5pZp1rzbLf0T8fZT64092gLg
ewyhpQEomfnttRhOk9iJIrqjjqQ+tg==
=AAdb
-----END PGP SIGNATURE-----

--Sig_/N6B9A4OMDDwwhp/ysbm=qDh--

