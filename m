Return-Path: <linux-next+bounces-2854-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9146192AF12
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 06:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B1B1B21B0B
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 04:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D947D07F;
	Tue,  9 Jul 2024 04:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F7EnHroO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A4728DB3;
	Tue,  9 Jul 2024 04:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720499265; cv=none; b=oOPGb1BWRmH7wsnK3ryosjMMGhzTA+gvJs4e4yFeoX/Jzlt071Ws/AY3130/68CNBBN5BkGgzFEbIMXOLTifDVRgin8/2gngEjVjk7wr/9R+A4GmJi/FteWRv/Kzy9iazthuT2iVALH/2ldasjGS+OPPSTcMUfumWA62HKGc63g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720499265; c=relaxed/simple;
	bh=Rq8UMxYcRBX75UhrKCJ/gQOueuS4Wwg/vnGKmRZTfwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m2qnmziXyYInrqwa+NJ7IsnWhMhfsoz1j+QgdCZ28+VYkYbXptHOcoFiWKTDmz+E6AK84sXQLMLrz/ZOXZUMurIYIm2fo6ISXQCTvse7D7oy1/Ke8Tflt+D7bt+o7eBdYnztJG9Gp5tiMl4igCKq0tvYhK1i09z1sHdU+am/W00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F7EnHroO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720499259;
	bh=GlY58UvqFVHgpHlpbM8kfBxfFvTpecOtBl7/YzMcjuE=;
	h=Date:From:To:Cc:Subject:From;
	b=F7EnHroO62Q1H21tQ/PzWdx6YyfNkR2ZGrW3a7nHAp+cTrn+xXdHqZOfuq57ZUosK
	 nR0u9wq2aIRPlScGlWHcadY8CIPOALs4xhUQleXY5p83TqC9Ksg9P3LgY/qDziJF7V
	 ssBp0kT9mEpPNi4jA4F7VY5Fabg3qN3Xrgm+eC8bwyffiwVCB2GCYFMjM+/kCJX7kB
	 e6wQGNhebxcs53z77aQLlTyM687P6UNABqygnTQvFcnExJHV4m5QAPduLdM5CmZwAW
	 Gwaw5IwNS6yVBfwNuKeAUQ2LUNDCzEXjgsbiMYZOxo45Z6NWzuq6n6xek8i2W90TDw
	 31uHR1p3RyTCg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ7JC5DYVz4wZx;
	Tue,  9 Jul 2024 14:27:39 +1000 (AEST)
Date: Tue, 9 Jul 2024 14:27:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the kbuild
 tree
Message-ID: <20240709142738.167999ba@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B7geL4Vw7Eo/RMNFQ6Ha8m/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B7geL4Vw7Eo/RMNFQ6Ha8m/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  scripts/Makefile.lib

between commit:

  ab6aaea6835b ("kbuild: avoid build error when single DTB is turned into c=
omposite DTB")

from the kbuild tree and commit:

  dd402cbd0afa ("kbuild: verify dtoverlay files against schema")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc scripts/Makefile.lib
index 636119dc4403,29da0dc9776d..000000000000
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@@ -407,12 -407,15 +407,19 @@@ cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags
  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
  	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 =20
 +# NOTE:
 +# Do not replace $(filter %.dtb %.dtbo, $^) with $(real-prereqs). When a =
single
 +# DTB is turned into a multi-blob DTB, $^ will contain header file depend=
encies
 +# recorded in the .*.cmd file.
+ DT_CHECK_CMD =3D $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BIN=
DING_DIR) -p $(DT_TMP_SCHEMA)
+=20
+ ifneq ($(CHECK_DTBS),)
+ quiet_cmd_fdtoverlay =3D DTOVLCH $@
 -      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(rea=
l-prereqs) ; $(DT_CHECK_CMD) $@ || true
++      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(fil=
ter %.dtb %.dtbo, $^) ; $(DT_CHECK_CMD) $@ || true
+ else
  quiet_cmd_fdtoverlay =3D DTOVL   $@
 -      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(rea=
l-prereqs)
 +      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(fil=
ter %.dtb %.dtbo, $^)
+ endif
 =20
  $(multi-dtb-y): FORCE
  	$(call if_changed,fdtoverlay)

--Sig_/B7geL4Vw7Eo/RMNFQ6Ha8m/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMvDoACgkQAVBC80lX
0GzLOwf6Azn898I9IYbx0cOxjh16AlgcpVB6sPvgFqO8txlQbKE8PQ+gZtfRgVB6
ET5ReR1GDHbBNzeHsMgmMzF+ZB1rXcS0WQDYyX485Qkc64LiimwQmVP/zRn7HaTP
JrdpTSJFr6W1XVMKabvRem9Qp3e3n21w5ykC7FlYCaw7P6YBFsWKM0rE8u/f5WAy
ngAAzx6/6oSxLb5uUK/3a4vIbp6IzWRkfebCqFnltb72dhoYrzfItpX78h6lEQz+
2g5S/ts/DRRWW/W2/D9eaY9mHBh66zNaVUwg1y+T+lynAHJIJZaWhkhcN0mSrYUz
lxY9Nau7EzUFW+nvDv+/mxuE6weLFA==
=9CNJ
-----END PGP SIGNATURE-----

--Sig_/B7geL4Vw7Eo/RMNFQ6Ha8m/--

