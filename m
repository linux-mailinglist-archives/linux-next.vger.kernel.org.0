Return-Path: <linux-next+bounces-3508-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7E96568A
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 06:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C8CD1C22AF9
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 04:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD9C374D1;
	Fri, 30 Aug 2024 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tqUF5YOm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC701D1308;
	Fri, 30 Aug 2024 04:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724993279; cv=none; b=CBbZCyx9tOq8+98zDzZMDovbB55dsmh/ilTM8p7vXEKqi/xyElnZOYv1Rqg4/clCKAx6f7WLZCqMGhuA9tncJFLCuJ3Di2QJOQgkxfUFgGW1YHRuXcC2LYDPknMBy6PqJORGmHs1nciakRWxJlaZwDuIhST35dRuZ/E/dylWluM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724993279; c=relaxed/simple;
	bh=HNbdFF8ZkyYf2ExapCZzkEGBxQStqMXicn25yg1ViwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uLzwx8HIhZeedKcyCj7RnxZa05404R6RBvYRmj0/1jd6OX0B7mc/+flIOwSdvHfISkJxsDKrjCzJM1ppVv6GZ97evVIAWXc+Wcp+bYGJTCVi+xzsAnxWiJRzH2bYgiYDqF3X9v/J7Pb1523u31iN5yE5DKUIAPobZJRqHxAR960=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tqUF5YOm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724993267;
	bh=DmqPPfjjxBgLHrE7hnPlZLuOXHTBCnLBFHcYq3/87Fc=;
	h=Date:From:To:Cc:Subject:From;
	b=tqUF5YOmR/2ZERy5kDrgmW2adV43lVDR5jmY+2k9bnjLWOYmgDEweO/wuEDEk1cK6
	 h370w9O3pKFb9Im+4tTY606PEW4dnJwV9Jv5MV+A0Itabryr2Zp+MDmhLg3TFrqEpg
	 d5L2CM7ipmlDH2CW0MTjdElOjGSw9R7jhO7hFHatAzY27d+5eW5mMRSpFbobNxMK3q
	 yh0YwpBKaVjB6eOoRF6Z6qbWLmcdFA6EuenImnw9S/lupmDCE98lWqv+DKSX2Fpqt9
	 t7rYUcdV5yUefXIcU4D17/seCsv/+nJGeiU8t41VEHrTx6jbdI9x/SM7zJtr18oF04
	 AWB/vYyIc9BUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ww5HR3G9mz4w2L;
	Fri, 30 Aug 2024 14:47:47 +1000 (AEST)
Date: Fri, 30 Aug 2024 14:47:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vinod Koul <vkoul@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the dmaengine tree
Message-ID: <20240830144746.58b98a53@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0ihUT_VibmyAihwSCkUbSVM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0ihUT_VibmyAihwSCkUbSVM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the dmaengine-fixes tree as different
commits (but the same patches):

  3f92ee7c4a4e ("dmaengine: dw: Unify ret-val local variables naming")
  17d4353413a4 ("dmaengine: dw: Simplify max-burst calculation procedure")
  2f87a9671ed5 ("dmaengine: dw: Define encode_maxburst() above prepare_ctll=
o() callbacks")
  d34e8466c633 ("dmaengine: dw: Simplify prepare CTL_LO methods")
  5bb11aedb530 ("dmaengine: dw: Add memory bus width verification")
  e2c97d200ac3 ("dmaengine: dw: Add peripheral bus width verification")

These are commits

  2ebc36b9581d ("dmaengine: dw: Unify ret-val local variables naming")
  d8fa0802f635 ("dmaengine: dw: Simplify max-burst calculation procedure")
  3acb301d3374 ("dmaengine: dw: Define encode_maxburst() above prepare_ctll=
o() callbacks")
  1fd6fe89055e ("dmaengine: dw: Simplify prepare CTL_LO methods")
  d04b21bfa1c5 ("dmaengine: dw: Add memory bus width verification")
  b336268dde75 ("dmaengine: dw: Add peripheral bus width verification")

in the dmaengine-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0ihUT_VibmyAihwSCkUbSVM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbRTvIACgkQAVBC80lX
0Gw7JAgAlDlGA9dSzfyuM69D6zfdF81Rwvsx88zPF/E+hslYIgrv9ui23b/saCUw
j4ZSZmoiNUqEdxjR6DFqoafv0PXH/qGlpxrPFmmJeG4xMSYoH+gszt3PdXAuWjXG
+SIZs5Pg6815X7W0XSqN5ObmOOXLOj3yO89gRc8wW9HYNA4vmWvovfmoYaDIz1pv
vJnBNJUYr2E7yWyD2ixEU1N9Xwb2C5xU6EVPtNYXlLO/W7bTtRtB6qBw6V/lV6PH
THiJo0ZfLnCF3Qg9XfVOdoQ9uwtQefqS4fC0CbcDu358WGbhJNMcBTBh/KpOuiah
ogpH4eCxj4jAPI1uIOEKfmwak9TcPQ==
=qOYf
-----END PGP SIGNATURE-----

--Sig_/0ihUT_VibmyAihwSCkUbSVM--

