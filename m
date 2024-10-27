Return-Path: <linux-next+bounces-4456-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D208A9B20CA
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2024 22:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BDEFB20DC5
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2024 21:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEB357CB6;
	Sun, 27 Oct 2024 21:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kdz+Vw3S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2EC2C182;
	Sun, 27 Oct 2024 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730063738; cv=none; b=FIAoTxSGUmfj0EapHNdCNVcTx8QNaBvGC6/2C/nJwJ0ILyIYn1BJ7/q5z5TK9/UqxKp0xNaxzSeoIAtUcfbKfFKsi+RWInpb2rzAdQrDRkEe3R9tURRksKjP0hvShHbUxiKnAxjSetiI1BRI6q6k1iB1Pt1yccVdJFiZaXaQ81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730063738; c=relaxed/simple;
	bh=kNI8DRRvPw8S3y4fm/o7RMu6hjZcoBU0ugv5vLkipdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=moH3pFBvEFUdqo/thDw7qaCo8B7vZjQperEmrpa2LEx7N1+X3BCmGUBZCLzmaWy7n24DojzcBmzPFKyT37eqCjuFNkOFBCqVEQCCBpc8FxkqjgiM5cy0q4PPo8VwtrinyNlfchrI2jfTTp9sRsjxgtEaiZm51eb2zyFoirKomlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kdz+Vw3S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730063731;
	bh=xlPG65IJvk0ErzV8qCbaqlLXP48+dQ+ZE45KwmX1evE=;
	h=Date:From:To:Cc:Subject:From;
	b=kdz+Vw3SUYcYoG1gWrTS3og8ak+a9MkdwvzmjTOQ/2CgWCSIPTs2wAdyoAFd8nToW
	 K5XGQ4FDPeniNw04Go6wr4/IWQhbIWaIZN4UytZj12P4YNiIKATF7JjSJXCV8L/2SI
	 xyGJu5Xq7441omxnwno6CSkA53nCtdlNeMyZjSy3B2W2LpOinXS9r/tUH3/Rd5POcI
	 p+whwPSiMbg6TT09QeWp1ZgIN08NmVE7/nsclsIuEPtBlcBy5qr5jbEYUhzN5Re2nA
	 XYuwkb5aoD1CUaDbFlw1jToBaW85D2ZGxpF9TEjd5blr5zqQU8OEeI5cd4ggFg8AT2
	 +D1Wl9XyxLV3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xc8SM2SnKz4wnp;
	Mon, 28 Oct 2024 08:15:31 +1100 (AEDT)
Date: Mon, 28 Oct 2024 08:15:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Cc: Vishal Chourasia <vishalc@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the crypto tree
Message-ID: <20241028081532.1e2c3616@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YnPz5LxppPa2m1DriP4AUKH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YnPz5LxppPa2m1DriP4AUKH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  504eebffb656 ("crypto: nx - Fix invalid wait context during kexec reboot")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/YnPz5LxppPa2m1DriP4AUKH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcerXQACgkQAVBC80lX
0GzynAf/cwFwS9YI+FNtc6pXhAjDuhN+yc8m6vVPxPAQP7QboaJkqbeic/6ezLWm
1awUKhgtYz4OZ2A3hONKAypMZISmFgrjfoQ9KkB1MYcQPsYoiaNWx6WmhphUG+pG
UdI39XL3k34T3zLVwB3RgjmX6ti+YSWjWshryUnDolOIypQPo28x88wA6ss+M8iH
rxhK8sbnFV6vStYGI/2I0zjyAWF1YUfL//9onnZ2Eo4toilVNWQQFGO7fnGd9oPk
3ejYRSGGuzaFt8Yne4g5PHuoZKsErVuA89GSx1azCcPgjsryTD2uKggZsE/qyFAg
Cvw+rVK4ZFTFlQotQVoI6n6E/svSYQ==
=A5Na
-----END PGP SIGNATURE-----

--Sig_/YnPz5LxppPa2m1DriP4AUKH--

