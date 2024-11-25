Return-Path: <linux-next+bounces-4838-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA069D79D0
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 02:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC833281B54
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 01:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF50D17D2;
	Mon, 25 Nov 2024 01:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oBwL+HEH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4A510F9;
	Mon, 25 Nov 2024 01:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732498850; cv=none; b=N6vtLaNPg1jUHpWlWWmgyw6I2Da7QvWkLYSBLSFoEumRczt4lwspJRYv1dcingrxxwXRAXI0KEVFkywPgg29oNrm5bK9hbeJPddfg/80fkLYxRIgwO9E4Wsy2hAHVq+PmKE3mrkpdpvPoQQSskJAXPpQ/rhsA8+tLZ8wFEp1k8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732498850; c=relaxed/simple;
	bh=RNynLa3D71yXKZo5ph4znbLIrR1RmU989NjkTpzsmCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R+8TrveTjQOHdkm9K1D/lGK0dwSFo/vixIaQpfjw30gTaVC7+38SvRjXBnsYttV/P5ZPriWI7bPioSmh3BfNd0oAKpfuwvJlIXhTSHaLP7RZXFHuH0jGb5ib7FC8x9dDWd7VQtMET4TSm9c/xEYxw/9liMuDOdHVGePtzDgg0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oBwL+HEH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732498842;
	bh=74zMZ3A2JI82wk/5PqLD3lnpmdhAK4niEM69Z9DRGNg=;
	h=Date:From:To:Cc:Subject:From;
	b=oBwL+HEHBOV5CPR3547nRvfU5OzIY5T6XykSaPxQmgqQ+BhAnLLRCAOQNnevwHzb+
	 k5YUVwdtD2+SBsfr0wBa6UiCuW2pwXZ+6oaN6ADRNybgZh/TyHBlQX/fC7LzsCrztc
	 /rricS7XpAwDaY5rlDsxYixWVNOz+CVgTm0jMk0HkzTCxP6V9Y79QIAeO/HfIaYm5l
	 yKouMBI8zVrBHIyyGg7Trh2z25/XX+LmSr6Y5e82m/m2tEFondWbzVrfuDhPHGZngS
	 LUMk33+7DLjhqggNoBQ1DBZcHQyOn2mlhVCxgl+DA1d/JJtNHdAUo7E51mtGajV21H
	 WI8inSrfVXF2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XxT1P6bkYz4x6J;
	Mon, 25 Nov 2024 12:40:41 +1100 (AEDT)
Date: Mon, 25 Nov 2024 12:40:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Drew Fustini <dfustini@tenstorrent.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: linux-next: manual merge of the mailbox tree with Linus' tree
Message-ID: <20241125124044.1437e2eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wvtL.voW4dsX+nXja+H4ya.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wvtL.voW4dsX+nXja+H4ya.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mailbox tree got a conflict in:

  MAINTAINERS

between commits:

  f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
  33a1a01e3afa ("net: stmmac: Add glue layer for T-HEAD TH1520 SoC")

from Linus' tree and commits:

  5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox drive=
r")
  b2cf36e4a2ac ("dt-bindings: mailbox: Add thead,th1520-mailbox bindings")

from the mailbox tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 78b9e776963f,5a406a4ab9cf..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -20103,10 -19869,10 +20103,12 @@@ L:	linux-riscv@lists.infradead.or
  S:	Maintained
  T:	git https://github.com/pdp7/linux.git
  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+ F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 +F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
  F:	arch/riscv/boot/dts/thead/
  F:	drivers/clk/thead/clk-th1520-ap.c
+ F:	drivers/mailbox/mailbox-th1520.c
 +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 =20
  RNBD BLOCK DRIVERS

--Sig_/wvtL.voW4dsX+nXja+H4ya.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdD1ZwACgkQAVBC80lX
0Gx9Ugf/Wth+8OzPd1aQmWfK6TVnG6enP36NGLWvPgFaQ0wR31iq29a+P1im7isZ
vG0JnriqeAo/eztQxhqkk6ezOXVBb/ikBPP0SZIQAwa6j0UmSx8BP2ehuU9EEwwg
Tsns4Kq9sZebN/s+xRdG671sp9TQK69AEphdMMjt/qZdTK2snNV3/yMsFNpt/RS2
OTsUbsS58oVooD2/rhXS3Bj+tXPs5Zvl2oTc3X+K6AeC78V1P7NeDmD3B1VknhmL
DJFhQ4CLDAfIRCFpB5z/gUCdHZkG4f2TJU9XiLzJvKYPtF5dTchke7FdCJOz8EXq
FyRJYe1vLkKAiWEYETx1StKianAtsA==
=+7NU
-----END PGP SIGNATURE-----

--Sig_/wvtL.voW4dsX+nXja+H4ya.--

