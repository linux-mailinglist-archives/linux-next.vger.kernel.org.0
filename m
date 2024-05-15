Return-Path: <linux-next+bounces-2328-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F68C6F18
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 01:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B570281705
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 23:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B904D40858;
	Wed, 15 May 2024 23:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FKmkZqve"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0CC3C48E;
	Wed, 15 May 2024 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715815257; cv=none; b=czz4mql7kzq6rWiaXSgFCoPJXwDfgoHAT4HgnuRj3EF3J12Ob9f5Z6kHt1PH66zdhG9ot4dW9c3lDzJU4BNE8RLYrEvluJpcA2+uEMWrpeOtyzoa9Z5QrWjEjs5EgtFUrW3Z2C5IXh7IIv5kecWGMb3c2Im1ZHZ1UY7x4K3/B9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715815257; c=relaxed/simple;
	bh=6lC+EB8PMnn7w7tVrIFZKflEl1HH73+L4eUsnoKu1A4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GtR1VSikzGUYs6EkO072vYTTLTudaW27asTsWoz9CjykHVzO3btPrmkPeLFfhPNjmbLK+hFhVFS0TuCowWoax2/ECAV213/fQ8PIXeTOVL/+aL7bUvFQ0pnUKLCgkQrLO4GrfFPfM2UhhucPFfv/xiG9vXpkXzvUkNn7Vq/1PKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FKmkZqve; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715815252;
	bh=0LbV+Pj+2FBLlnHt+buhweww+h1gkW8waguXYfTAQFU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FKmkZqveqZ7PNZX6UW1TFH5/rAXkflxjF2cO+eKPcuZQnEbi8aRqms4BedQMoOYzY
	 B9qLOp/9L58I7kECBmZjTktIpYH0xPzU6Wn7+iMiXLkVUTzfwizdzJtk6x7DzGbcYu
	 c1s7KnObWYSNffyIm7DORmvgOUhCDzwRhayWVR+gYEhsv07GQXgnUuO1q5ZG5EvniZ
	 yzLitHAhQOpj6wLI0hvQib3dl2XP5XH50f29T1FqIlXgvcW1pNMI/NXbCg1Fm++tUb
	 vUvPsqtbqcgGSGxzmQyAVizVLO/psTwMgMaIbRhL3vXYO0oB0HqH1tQEsqDrNv66d8
	 tn/Go6wg0Dmfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vfq373LMkz4x1T;
	Thu, 16 May 2024 09:20:51 +1000 (AEST)
Date: Thu, 16 May 2024 09:20:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, Rob Clark <robdclark@gmail.com>, Sean
 Paul <seanpaul@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rob Clark <robdclark@chromium.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-msm tree with the kbuild
 tree
Message-ID: <20240516092050.2a258c6f@canb.auug.org.au>
In-Reply-To: <20240513120312.55d97d04@canb.auug.org.au>
References: <20240507125132.2af57c71@canb.auug.org.au>
	<20240513120312.55d97d04@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sSD=YDmJ8SjJ=sPXEg5_OuR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sSD=YDmJ8SjJ=sPXEg5_OuR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 May 2024 12:03:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 7 May 2024 12:51:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the drm-msm tree got a conflict in:
> >=20
> >   drivers/gpu/drm/msm/Makefile
> >=20
> > between commit:
> >=20
> >   7c972986689b ("kbuild: use $(src) instead of $(srctree)/$(src) for so=
urce directory")
> >=20
> > from the kbuild tree and commits:
> >=20
> >   0fddd045f88e ("drm/msm: generate headers on the fly")
> >   07a2f8716c41 ("drm/msm/gen_header: allow skipping the validation")
> >=20
> > from the drm-msm tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > diff --cc drivers/gpu/drm/msm/Makefile
> > index b8cc007fc1b9,718968717ad5..000000000000
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@@ -1,10 -1,11 +1,11 @@@
> >   # SPDX-License-Identifier: GPL-2.0
> >  -ccflags-y :=3D -I $(srctree)/$(src)
> >  +ccflags-y :=3D -I $(src)
> > + ccflags-y +=3D -I $(obj)/generated
> >  -ccflags-y +=3D -I $(srctree)/$(src)/disp/dpu1
> >  -ccflags-$(CONFIG_DRM_MSM_DSI) +=3D -I $(srctree)/$(src)/dsi
> >  -ccflags-$(CONFIG_DRM_MSM_DP) +=3D -I $(srctree)/$(src)/dp
> >  +ccflags-y +=3D -I $(src)/disp/dpu1
> >  +ccflags-$(CONFIG_DRM_MSM_DSI) +=3D -I $(src)/dsi
> >  +ccflags-$(CONFIG_DRM_MSM_DP) +=3D -I $(src)/dp
> >  =20
> > - msm-y :=3D \
> > + adreno-y :=3D \
> >   	adreno/adreno_device.o \
> >   	adreno/adreno_gpu.o \
> >   	adreno/a2xx_gpu.o \
> > @@@ -140,11 -145,68 +145,68 @@@ msm-display-$(CONFIG_DRM_MSM_DSI) +=3D =
ds
> >   			dsi/dsi_manager.o \
> >   			dsi/phy/dsi_phy.o
> >  =20
> > - msm-$(CONFIG_DRM_MSM_DSI_28NM_PHY) +=3D dsi/phy/dsi_phy_28nm.o
> > - msm-$(CONFIG_DRM_MSM_DSI_20NM_PHY) +=3D dsi/phy/dsi_phy_20nm.o
> > - msm-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) +=3D dsi/phy/dsi_phy_28nm_896=
0.o
> > - msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) +=3D dsi/phy/dsi_phy_14nm.o
> > - msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) +=3D dsi/phy/dsi_phy_10nm.o
> > - msm-$(CONFIG_DRM_MSM_DSI_7NM_PHY) +=3D dsi/phy/dsi_phy_7nm.o
> > + msm-display-$(CONFIG_DRM_MSM_DSI_28NM_PHY) +=3D dsi/phy/dsi_phy_28nm.o
> > + msm-display-$(CONFIG_DRM_MSM_DSI_20NM_PHY) +=3D dsi/phy/dsi_phy_20nm.o
> > + msm-display-$(CONFIG_DRM_MSM_DSI_28NM_8960_PHY) +=3D dsi/phy/dsi_phy_=
28nm_8960.o
> > + msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) +=3D dsi/phy/dsi_phy_14nm.o
> > + msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) +=3D dsi/phy/dsi_phy_10nm.o
> > + msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) +=3D dsi/phy/dsi_phy_7nm.o
> > +=20
> > + msm-y +=3D $(adreno-y) $(msm-display-y)
> >  =20
> >   obj-$(CONFIG_DRM_MSM)	+=3D msm.o
> > +=20
> > + ifeq (y,$(CONFIG_DRM_MSM_VALIDATE_XML))
> > + 	headergen-opts +=3D --validate
> > + else
> > + 	headergen-opts +=3D --no-validate
> > + endif
> > +=20
> > + quiet_cmd_headergen =3D GENHDR  $@
> >  -      cmd_headergen =3D mkdir -p $(obj)/generated && $(PYTHON3) $(src=
tree)/$(src)/registers/gen_header.py \
> >  -		      $(headergen-opts) --rnn $(srctree)/$(src)/registers --xml $< =
c-defines > $@
> > ++      cmd_headergen =3D mkdir -p $(obj)/generated && $(PYTHON3) $(src=
)/registers/gen_header.py \
> > ++		      $(headergen-opts) --rnn $(src)/registers --xml $< c-defines >=
 $@
> > +=20
> > + $(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
> > + 		$(src)/registers/adreno/adreno_common.xml \
> > + 		$(src)/registers/adreno/adreno_pm4.xml \
> > + 		$(src)/registers/freedreno_copyright.xml \
> > + 		$(src)/registers/gen_header.py \
> > + 		$(src)/registers/rules-fd.xsd \
> > + 		FORCE
> > + 	$(call if_changed,headergen)
> > +=20
> > + $(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
> > + 		$(src)/registers/freedreno_copyright.xml \
> > + 		$(src)/registers/gen_header.py \
> > + 		$(src)/registers/rules-fd.xsd \
> > + 		FORCE
> > + 	$(call if_changed,headergen)
> > +=20
> > + ADRENO_HEADERS =3D \
> > + 	generated/a2xx.xml.h \
> > + 	generated/a3xx.xml.h \
> > + 	generated/a4xx.xml.h \
> > + 	generated/a5xx.xml.h \
> > + 	generated/a6xx.xml.h \
> > + 	generated/a6xx_gmu.xml.h \
> > + 	generated/adreno_common.xml.h \
> > + 	generated/adreno_pm4.xml.h \
> > +=20
> > + DISPLAY_HEADERS =3D \
> > + 	generated/dsi_phy_7nm.xml.h \
> > + 	generated/dsi_phy_10nm.xml.h \
> > + 	generated/dsi_phy_14nm.xml.h \
> > + 	generated/dsi_phy_20nm.xml.h \
> > + 	generated/dsi_phy_28nm_8960.xml.h \
> > + 	generated/dsi_phy_28nm.xml.h \
> > + 	generated/dsi.xml.h \
> > + 	generated/hdmi.xml.h \
> > + 	generated/mdp4.xml.h \
> > + 	generated/mdp5.xml.h \
> > + 	generated/mdp_common.xml.h \
> > + 	generated/sfpb.xml.h
> > +=20
> > + $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADER=
S))
> > + $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_=
HEADERS))
> > +=20
> > + targets +=3D $(ADRENO_HEADERS) $(DISPLAY_HEADERS) =20
>=20
> This is now  conflict between the drm tree and the kbuild tree.

And now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/sSD=YDmJ8SjJ=sPXEg5_OuR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZFQ1IACgkQAVBC80lX
0Gy1pQf+LyZCjL7Hww6fBJsBQno7RSeYrTdWGuFi56VJVbQnO/8g1tEgkhS3bb8c
vsry0RPJkVckPWHZZ9XewogQ+qHU/DRm3sXDC/BVQ76cFscxGjxoIN77ZFyhtF4W
CNk6QFFdujafGCuK+nS3klKcC/LqffzoubsihmR/AKW+LFTtSSjaqnQtIW4QseIc
ElgdmWtWJlFaZJzmKgd7w6kHqe7e9Rt3E4nScs9XkwAN30AEtuRD8bvfhhLNjTpe
wVZyw09FeCMVkvh+06Egcwk5Kggiukua+wXCY7z5Eh0sRPcWaGQrFdJHZNCpj13R
eNOrup6Cy6SczWCAgRoQE2R8SqgOLQ==
=08ja
-----END PGP SIGNATURE-----

--Sig_/sSD=YDmJ8SjJ=sPXEg5_OuR--

