Return-Path: <linux-next+bounces-9386-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2810CB4513
	for <lists+linux-next@lfdr.de>; Thu, 11 Dec 2025 00:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BBC43062BC7
	for <lists+linux-next@lfdr.de>; Wed, 10 Dec 2025 23:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4212FD672;
	Wed, 10 Dec 2025 23:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BxF5Qa8x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846DA61FFE;
	Wed, 10 Dec 2025 23:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765410553; cv=none; b=E4i+c9xo+oMnhr629UqmTLTLXkNqfn84A5sywWUUrjZMDfZU8jdhh6cTY/7RRUGKyZ5bnSmjXmDcRn0HUz6bCyoc06oiAVGDd3xZcFdno+RqpbwAjcTwO+VWhFGUMIzq0n3ymjH2ej/GNd/PpElaHr4sqEMbHRZXaaHgs5pHoI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765410553; c=relaxed/simple;
	bh=0Vh2HUd7VKjC0pEDdkapJTLQVDHRwRrfgXsTo5aJ+wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tvKN1shRUS+bQMra+WyZqcslx+WB2dY/74BGSlsiDaL1Kdr5FUiEMXPrmp2otcVaxgwF7EeFn5FRwHlhtI2f51NvrCDDpCryDyzaIjkbl25ld8TKI/l+fHbzSwxzPICcufdHgvbhAVHYIVc/JHKqKaeNBet4kYohdQvCrvTQ1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BxF5Qa8x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765410544;
	bh=wwMG6x8rNg+bfRmZAQZrffM5QcRn695dWnVNvAjv+Fw=;
	h=Date:From:To:Cc:Subject:From;
	b=BxF5Qa8xcDIpjNpioQnxNSyq+en4lf1T/Ja459IbGH8rhHu07WoWRFan4uIxCHfO9
	 W4IS0VG6ux4bgFtgm0F1yk6fwM/1VyI9fjGF1SlRTaBNWfTtk3YNpf4qY4dW/PG7ms
	 25Gd7b39nUj+2i7LwYA+jBJ9PL7+diTrzwHxG433fgwx5xOTUSrhJ6LJOPBGTzqsrx
	 Sv5TjNXNn9vfDjKek5kcf55HW+nbsjj8B6XRyb8ZRdyLDdSy4mtc8j/3PCa1nK/UBn
	 m4+ZwOw6nGFmaHd/kd6utSB4BaFDMquWi1Di4PXGMkeswKm65xI3K3BoetiAqJUr88
	 t+5UiHzxpcUiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dRXVm3Clhz4wBJ;
	Thu, 11 Dec 2025 10:49:04 +1100 (AEDT)
Date: Thu, 11 Dec 2025 10:49:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mailbox tree
Message-ID: <20251211104903.24a16b29@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WP=qE9MmmXteMiMSvF9dWvu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WP=qE9MmmXteMiMSvF9dWvu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mailbox tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c: In function 'mdp_prob=
e':
drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:311:41: error: implici=
t declaration of function 'cmdq_get_shift_pa' [-Wimplicit-function-declarat=
ion]
  311 |                 mdp->cmdq_shift_pa[i] =3D cmdq_get_shift_pa(mdp->cm=
dq_clt[i]->chan);
      |                                         ^~~~~~~~~~~~~~~~~

Caused by commit

  e1fe978a07c7 ("mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()")

I have used the mailbox tree from next-20251210 for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/WP=qE9MmmXteMiMSvF9dWvu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmk6Bu8ACgkQAVBC80lX
0Gzatwf/ctdS1U2P+KbgKg69YTjPKSh/jI9J+LEgHSVF37g34uWRgHEZ7UYae5+h
7mh1cdIvNfLpf2QkWW6ZoYXCBYbdGAo4wBG7pHZBzY5ptDTi5eHOYyPEpfRcOAWX
CA+H+ZQ/UPzbY8kYeRqSbmpB2DppOMTuaSs7Wrtr7L9sUXkJmB7kbNhajE/rK4v1
zRTHxBqomQXnTXriRHLg6k2QMkvbxWpEW1TrLQVbtBBQQrO1ka84vQ68Egf0xOlr
6qUdTWpRPKOEC5Is2bPr4jty5r5dBSVUfXmehSOEOnG9Ycg6+fI45I6f+npam4lu
FEYvUIanFeiDsv7/vvCf3FLI/+Sz7w==
=sWnJ
-----END PGP SIGNATURE-----

--Sig_/WP=qE9MmmXteMiMSvF9dWvu--

