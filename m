Return-Path: <linux-next+bounces-3078-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E972D937170
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 02:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82CFD2824B0
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 00:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABA47E1;
	Fri, 19 Jul 2024 00:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sj480S62"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA8161;
	Fri, 19 Jul 2024 00:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721347800; cv=none; b=raifU3tQco7tV+LtmnTb9ElIISJNsrKNsch4sOg0aF0ksGQqPnUGgJZmlVpFs08tsSMa4iI/eqcoSyLYwORFEGxnzF5k2j89C38N1JwtJnSNh9Ows2UsiuRRCnC8kmGk+ea5c5suJcu2s+L3Kd/oqtUd3AxIwfQKdKhm8Ff+eiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721347800; c=relaxed/simple;
	bh=Y/yuO2CAKfwa2n2rrkWUSG+CR/C1MUfveIBViw3xcG0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9DmvTnsDRuiT/P+O1QzUzMlhosfSshjv4ANCQMxfKtnJQTPVsRb6CBazEw9KqK3DFIDVW+BjiGLwe6NVNi5ZGjCYshEIPX8PZLQ7P8DOfIaFJHn8SK08TMjVTFONiqYlJV6NGwfgKMCrHCenWwBfaTxVpBE1LkPDFmWWTbjkYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sj480S62; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721347789;
	bh=JAp9NdrqOTI3TDFiqw+Ir2+/BBXFZ9BHdxwdyPc9Lvk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sj480S62kCwyloj6GXmUi1do/W4P9sMCp6IKjzffHyfJh6Ft2KxxK26E4IKSPgBzz
	 ibMrPSIwwAepBGxWv3rQxFC3Tx2CfdfgPuUmX+Qfb4AoFlethShgteOlEX1c1P3u09
	 uenIFK3D32xR1G//aN2TYevUdV8n1NmHlj3nefDqDYoFv2t4W1GrT6A+RU/kqiGnPm
	 Ocaqyd0Nib5ZrvRirLuQx0RNlzFJU/CnRIG79uXOXj36IvFeM3ZpiXFc6NpM0OHjXb
	 JxKJaphuxnIiQhdfAdfWMTc9ZyiWpk6hqI/wovXi0gZK9cfY1dbyF0QKCP5sfc7iW9
	 pZn4ngjRxhslQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WQ96566Zgz4w2K;
	Fri, 19 Jul 2024 10:09:49 +1000 (AEST)
Date: Fri, 19 Jul 2024 10:09:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the kbuild
 tree
Message-ID: <20240719100949.0b7d044b@canb.auug.org.au>
In-Reply-To: <20240709142738.167999ba@canb.auug.org.au>
References: <20240709142738.167999ba@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ORqH.lG=Vzi_bMZ6xoahDrL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ORqH.lG=Vzi_bMZ6xoahDrL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2024 14:27:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>=20
>   scripts/Makefile.lib
>=20
> between commit:
>=20
>   ab6aaea6835b ("kbuild: avoid build error when single DTB is turned into=
 composite DTB")
>=20
> from the kbuild tree and commit:
>=20
>   dd402cbd0afa ("kbuild: verify dtoverlay files against schema")
>=20
> from the devicetree tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc scripts/Makefile.lib
> index 636119dc4403,29da0dc9776d..000000000000
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@@ -407,12 -407,15 +407,19 @@@ cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags
>   		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
>   	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>  =20
>  +# NOTE:
>  +# Do not replace $(filter %.dtb %.dtbo, $^) with $(real-prereqs). When =
a single
>  +# DTB is turned into a multi-blob DTB, $^ will contain header file depe=
ndencies
>  +# recorded in the .*.cmd file.
> + DT_CHECK_CMD =3D $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_B=
INDING_DIR) -p $(DT_TMP_SCHEMA)
> +=20
> + ifneq ($(CHECK_DTBS),)
> + quiet_cmd_fdtoverlay =3D DTOVLCH $@
>  -      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(r=
eal-prereqs) ; $(DT_CHECK_CMD) $@ || true
> ++      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(f=
ilter %.dtb %.dtbo, $^) ; $(DT_CHECK_CMD) $@ || true
> + else
>   quiet_cmd_fdtoverlay =3D DTOVL   $@
>  -      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(r=
eal-prereqs)
>  +      cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(f=
ilter %.dtb %.dtbo, $^)
> + endif
>  =20
>   $(multi-dtb-y): FORCE
>   	$(call if_changed,fdtoverlay)

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ORqH.lG=Vzi_bMZ6xoahDrL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaZrs0ACgkQAVBC80lX
0GxVjAf9HIG1Rhpkz5JduTHwtdmzoMRCHY/9ePkZeSYNEeihGbMhCegGbsCLEWHD
1XpgmYBbwj5W3+XGje2jg0CO513ogEH6mHGJMvsH/vLqOhLEp/2sjwTJxln+zSvm
6kwOnZ2ttx2zJRbVcsxUailhMLv4kpb5cTPrXU35OlsTsnb96Uvn96pW86UMld+j
F50QxYXVi5QfNC/e2nv7XSKeiW/GeB8DsOJoQAMO7U0b/p4K1Al/L7O7XvHa0yvH
opwJxKKCPjPknroYpI3IvKc7F3Vf0XlYKRyrNHYhaDIf3IVAtnNYW5ETjeMWRM5q
yxG5ZJSzxPykF/m1e+jcq2z0kF40Vg==
=K2V9
-----END PGP SIGNATURE-----

--Sig_/ORqH.lG=Vzi_bMZ6xoahDrL--

