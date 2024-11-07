Return-Path: <linux-next+bounces-4658-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD569C02BD
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 11:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3293528463A
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 10:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE0E1F12EA;
	Thu,  7 Nov 2024 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DdNPkhkr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD49A1F4FA7;
	Thu,  7 Nov 2024 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976238; cv=none; b=AWqvHt4rFBxfEixGP8s29AuvKLdEXA7vxD+1WKTdkgbkFU2pfLHHK73KzoFfLmqz/rjNVUlaieK0iEhnh/0ggJK3reo1NH1WqsHwP+jBfTxiMs/8eOWW62F/NdpIeFFY+WVMlvBnRSqQUvdGfCfqg09Y+j6GQmC7lfurj/q5+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976238; c=relaxed/simple;
	bh=X3ED5tXhkHujGgzUR1+C91PbNKBMFbhQSO35RVYbhm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e8BOYlWenQi/c4pnnvRXbSooQYiJmSJk5YxcnjcTXxGw7H89zRe/O9TLaTuRDAW2UXdhQYE6L1cNOofN7V3ShQdSGVnklOHAH0yf9Adqw2cwO6HOiTv0dzxDZaQGutTMSFIohbxQ09J7hBsMpNzuEpYkrwhhte2jPOHaU/Na3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DdNPkhkr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730976230;
	bh=NNGiz6SGhA/04CL4AMK1MojVzOnINp1eU/OCPu9ZPFE=;
	h=Date:From:To:Cc:Subject:From;
	b=DdNPkhkrKpWAmoXjy1YcWVDURMC/0xkF+dBD4n5w4mByHooK6+ARkJHXKFGShmrQr
	 PikEqC3J1qzQYzNC5hDPq2s/BMlvoynWkuz0DI63ZIW0Nh6t4nb6oGF7xg+HHMaQ+9
	 /sHsOcFi0g0pDnsZ1BfeFCwHf+FDNWY0RA2fNFG/r84SWt1vBRWzaT2NSjo1Izmftt
	 9asBTW9E/r/J0G/xkXmB2kQHZkeLJzY5ad2Umoi1HYchS30DmUiKEswcQPaIrK0iOV
	 s33Y2Wzh5f5ZtEMOlKayAtYkQn4NMWQnX6HnqxQSpwjjxL18f4yPDMQN0QvQpPjZXR
	 //Yl3VnkqVB3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkdwP2Flqz4x8f;
	Thu,  7 Nov 2024 21:43:49 +1100 (AEDT)
Date: Thu, 7 Nov 2024 21:43:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>, David Miller
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Drew Fustini
 <dfustini@tenstorrent.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pinctrl tree with the net-next tree
Message-ID: <20241107214351.59b251f1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KkCXynQNu6zKlQJ_vJthWwP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KkCXynQNu6zKlQJ_vJthWwP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  MAINTAINERS

between commits:

  f920ce04c399 ("dt-bindings: net: Add T-HEAD dwmac support")
  33a1a01e3afa ("net: stmmac: Add glue layer for T-HEAD TH1520 SoC")

from the net-next tree and commits:

  137ca342ae2d ("dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings")
  bed5cd6f8a98 ("pinctrl: Add driver for the T-Head TH1520 SoC")

from the pinctrl tree.

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
index 730c67f26c96,ff99fb6ad20c..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -20095,10 -19817,10 +20102,12 @@@ L:	linux-riscv@lists.infradead.or
  S:	Maintained
  T:	git https://github.com/pdp7/linux.git
  F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 +F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
+ F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
  F:	arch/riscv/boot/dts/thead/
  F:	drivers/clk/thead/clk-th1520-ap.c
 +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+ F:	drivers/pinctrl/pinctrl-th1520.c
  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 =20
  RNBD BLOCK DRIVERS

--Sig_/KkCXynQNu6zKlQJ_vJthWwP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcsmecACgkQAVBC80lX
0GwyrAf+Lxo8NRkdo2A6KUiTxn2DBZhe19Klo4VkRb7DE8camCjuRAG6+k9ZBWHc
GbqD3SA+CEbUrOtD2ZMGUK6LSlx/YyQk5DS7HhxdMCTPF8DkFB96pGna1ntpGo+A
eqckLBdxFik/dgT+A+iQZb2I9LlIT9VdMGWzvUFop8sf5o2itSPui6fuujD8m7cz
KtaRY0Ql2eTgpCup0V5dl0Vd1FJgTCLiSgTsuKcsFhjbkk7e5/cVjedmxOhialfW
p8Npl1FgC52px5wv41N2DPl1fvqCxiBemRTArFTC7anIDqEJEjd/SFzW6jqtUaCU
WUd3qYa1dROzmRf/QYj6vhkaGGjSTA==
=vGgB
-----END PGP SIGNATURE-----

--Sig_/KkCXynQNu6zKlQJ_vJthWwP--

