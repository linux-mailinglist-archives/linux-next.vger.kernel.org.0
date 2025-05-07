Return-Path: <linux-next+bounces-6561-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A99AAD397
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 04:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 780CE7B7F1C
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 02:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EA71922D3;
	Wed,  7 May 2025 02:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Xx7FW2W7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7416E172BD5;
	Wed,  7 May 2025 02:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746586156; cv=none; b=bj74EQrOj2a2lNs2Fm25WnPsx6IzAobDpDpI+/6SOfDVmFVZ+VMXKgfqIo0RLrB05m3dOG6IwVeOK4xgfAPYYbFDIw6DY2P12UyFQotGLTWG/XnMRq/jyTdZsjA8k3lwtvblYwVnCK//Re86hn0HIWCCgVL6UpwFbNBS9SGoblM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746586156; c=relaxed/simple;
	bh=uymnc1ltsgShhsH06V7rrYc0WTXAor1D1tmY64y7a20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WBTPA0yNhCnvDU4Gj9yz5A9vUgO4JSgtP/OLSKKeFBq08ci0B1ip90eNd2hDeVuiAFXr7W142etUK3Eut/+R9DoWlYmrsqSyoOsu6L9swDstxvQzdtHzfulynQRMM6lVEMTZbMF1uwRzOmkDQg/IOkJEMkEdzf/sBOv7y0EyAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Xx7FW2W7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746586143;
	bh=5ZtQidN6t6pZN6NQ4jAauR/nh3kZzvNrzL3ii6tWoU4=;
	h=Date:From:To:Cc:Subject:From;
	b=Xx7FW2W7vg+zZcqlRl+NpXdOt/VGH5heoaNYhEVQwr5cs5HEWPPUsDmDwfWDhC1DF
	 uyudaE5jCjAgpCdNu8rPA55PN7ulZE7uukHGRQUJItx99KMptjCdUSHFUEI/h1gD3N
	 b6StBuptpGMRJpSFb+MqkJyvcmlHcGZAHlSPczZ/mf4y0m10ManStcdLVemRQs6VCX
	 JqDBB3mrh+03M5Dj58W5Go6g1BeLIouqV7OYrIoQ6PY9smgeabTgE/hkvqHuQBQ4PR
	 1H9tadQjEagQMCc473zLFjn5KS4lgofNIT9v7hlY4pYhH0n30bLDMWT7hk3fDhlpSM
	 h0zvnKthsuScw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zsfq15WMvz4wnp;
	Wed,  7 May 2025 12:49:01 +1000 (AEST)
Date: Wed, 7 May 2025 12:49:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Networking <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the net-next tree
Message-ID: <20250507124900.4dad50d4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lwo4oWK66gWmwmhOTn8cOzA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Lwo4oWK66gWmwmhOTn8cOzA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c

between commit:

  a9843689e2de ("net: txgbe: add sriov function support")

from the net-next tree and commit:

  567b0a520912 ("net: Switch to irq_domain_create_*()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c
index 3b9e831cf0ef,f2c2bd257e39..000000000000
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c
@@@ -198,9 -183,9 +198,9 @@@ int txgbe_setup_misc_irq(struct txgbe *
  	if (wx->mac.type =3D=3D wx_mac_aml)
  		goto skip_sp_irq;
 =20
 -	txgbe->misc.nirqs =3D 1;
 +	txgbe->misc.nirqs =3D TXGBE_IRQ_MAX;
- 	txgbe->misc.domain =3D irq_domain_add_simple(NULL, txgbe->misc.nirqs, 0,
- 						   &txgbe_misc_irq_domain_ops, txgbe);
+ 	txgbe->misc.domain =3D irq_domain_create_simple(NULL, txgbe->misc.nirqs,=
 0,
+ 						      &txgbe_misc_irq_domain_ops, txgbe);
  	if (!txgbe->misc.domain)
  		return -ENOMEM;
 =20

--Sig_/Lwo4oWK66gWmwmhOTn8cOzA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgayhwACgkQAVBC80lX
0Gwk+gf9HhS7VLW5VY+i7AoR6LLtszPJjibhtiyE7IJ70SdfbMYSxCosHJZ6F5Yc
gTL8qxffg2DGny7rByijfcyCWhyd4LKp04r2I9+ufiMS7IA0gdpNV02T2Ut/ZwI4
V4H1uUzLEjzYJyvkB1U4J+KhGuKHNdaFtnRGPDdSg8irLoGsqp7fEIF1aBS855tS
cewh6l3iChcHhDMugVB0TJd/qSZ5Jd2Zz+PBcbp89xhb0urE8tj7NgM2radeS1N/
R5CYVtIDgoAM4c0RM/PrcS9R6IYswRpwGNjTzvP9xoCp3RgaU/XagnTM6njejxDu
M4H4lMT0aXa0UtqvO1swJLaLRDjixg==
=6nvI
-----END PGP SIGNATURE-----

--Sig_/Lwo4oWK66gWmwmhOTn8cOzA--

