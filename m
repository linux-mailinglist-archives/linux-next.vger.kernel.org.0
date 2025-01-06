Return-Path: <linux-next+bounces-5041-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27BA01E82
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8451883EE8
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 04:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62D573451;
	Mon,  6 Jan 2025 04:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DIFtXz68"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E604EEEB1;
	Mon,  6 Jan 2025 04:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736137475; cv=none; b=BhXIOAlFrHwYE5faP9Yvuf1+/p8zVw18xIKyXY+kNgbl0Jq0E/A6sXu8AsMUiMfqe5oqh7dJcSf2fte4EM7Bv5+ZPkzoBNoabNEMi4CVrAaD9d71/896d+JilCyrzjM1kou8jd95ssIeB2SZ+yg5T7rj0f4XMjckXozUPxZue6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736137475; c=relaxed/simple;
	bh=7Rja17X3xa5ksDJpQhN2v4WEkzkJDO1CILGcqNIzKDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IGQr+Uzc5Eg3BuUt57XtkF9L5rpGCFrbHx2phg68SGrb7oi82wW3ffCGhQ1kMorTSrOMueR9C+hzTQgSDg1Q9NEwLienqUKcLiWAlooU8fp5HcwmLd+rD0eY3pfWAA+Ve7sZldvA4AHHFEZ6bgVutSFUHd6K1WfeCCNH5SDxRc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DIFtXz68; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736137465;
	bh=vCjD6hXhmDbWFqx9wRMRRJQD5n/Qx7afCcegL1z3XLY=;
	h=Date:From:To:Cc:Subject:From;
	b=DIFtXz68t3+8L2n5Q9kev2KIR8eq9HwNtwqCXtQ4qrcefv/EjXuIxiVrbTpMAkAzf
	 nsR2gHEjAufUMRGeun0xf/CAkTxWbtZbViQkdVdzbeFi/TA96PutlmrnN6M0zm2r8E
	 Wx02+rs24WVkmDyh71c0T3ID+Y8OuwBaCcLek2lbWXvtSrCeXrXwiiuDoks7DGMyga
	 fot9tibtkrDHHvPp/lceZP0L91KqNnpyAUL38vWQi8nUvIbSFNYgb4Eym/nzvcgyJx
	 xvBeAybuyuQD7/VoI4T8THqTMz5BmxaoMh1YgvMn2rADW5ZSN4rHhMCtwg4jrrnmQs
	 PUaihppnx41Hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRLfx41bjz4x4v;
	Mon,  6 Jan 2025 15:24:25 +1100 (AEDT)
Date: Mon, 6 Jan 2025 15:24:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the phy-next tree
Message-ID: <20250106152431.6f61fdb1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5ndI1k+RoUYTeA0mev2+f/1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5ndI1k+RoUYTeA0mev2+f/1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the usb tree as a different commit
(but the same patch):

  413918c44c4f ("dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3 bindin=
gs")

This is commit

  f097a36ef88d ("dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3 bindin=
gs")

in the usb tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5ndI1k+RoUYTeA0mev2+f/1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7Wv8ACgkQAVBC80lX
0GzGWwgAkGdQ3UPZQ99d/ENO0H8KUd9WthFJ/NWTBXfR5BaUtDEteSIZ+F/2NuWa
czbs921v2Or4mHD9vCUz0rVytpVDxGByhaUNIlTDR4KPz+DqqMIvZF03tVa0Kqbp
o02nl29nyTLssOqil56/Y7Rr0e0hfGME5Hj7eTyxXFGhMSHg3Y2A2TKSTl0k6yOb
4o3QZu8ZaiAfeUuO3bsK+Yk5jAC+UTNTp10J1I9xMWn5mWBvx1W97iS3T+YXkrDN
EmghddaFbT4KXanuShEmhPYcTEXQzRB5qI6Uf+kN6cRmp2wYgjmNHkkl+YNUOobt
rjq3PRR/hZvKG7cctOh/+a5N5bmudQ==
=PB9e
-----END PGP SIGNATURE-----

--Sig_/5ndI1k+RoUYTeA0mev2+f/1--

