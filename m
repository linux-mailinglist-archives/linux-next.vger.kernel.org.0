Return-Path: <linux-next+bounces-2739-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1716191D68A
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 05:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C07A428177D
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 03:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FEA8F45;
	Mon,  1 Jul 2024 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="swak4w/V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41133FE;
	Mon,  1 Jul 2024 03:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719804088; cv=none; b=jOlVP8h6ENF7bo+SCEQbqBrHO7jXlGKtMV0tb+Qw+AEuMn+GDpQYsxIHrF05FEKhDbUM+RgrljxnrdAgR0HlW/8wPMJniTx07cPYvEGeuX9bgN880efu21Obdo96DDYuDo+f2nyg8K/eXFzIUhk6WM3cz1rq5O8+Wqnrg2t88qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719804088; c=relaxed/simple;
	bh=ie984JjnufMNG8gtik0B1DbDh0He9aGl8c9enPQIJw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JJ9ov10xVl9uRND4RyH3m03DXeLPZ+J3IO6x40MbpRBfBhrayHpy1pvwFDKm5pOLEZmiDTIzGMfFhtmfNjCSlYyv9trY10njL20sJ3Lh5aoZ4AxXm9txtBoDNZ1EKGrPMn/eyC3dy8xyZZlZRWXkRFlwP9e5rrB65IzAxpdwJcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=swak4w/V; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719804082;
	bh=/himKk0EB/VSbL42eb9r2KBYsuq+WGuoFE5HJbq7IVs=;
	h=Date:From:To:Cc:Subject:From;
	b=swak4w/VQ4obKFFTtqoIbFycTKJ5A9amDEf+Fu4eNu8Hyd3PRHZAcsNsLm+zfpM1d
	 0o67LF6P+ZkPgFnOfg4hbBlpdmIv+55qUbIpGtUEjZEbToeOCsyJZetM/IxP0FAufo
	 K94F5wfCZlbCOykPnr+5asnPv3m6R/F2c110s6ctzJrQ14/lPf5MDmxomL4DFPijrt
	 yITlCkcS2iq/tSve/ESfbmwknv9CDM8XTqOV4onDyYtPMFnImz9pqYzFztBxAvheUp
	 b0l+HyD39an3oIL6qeXMgHQ7tCUbEsUDNXQYuVT/rqSx+RGNVP+jOtDzydm2yHGUoS
	 fAsX/U5hEfUKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCBCQ4kbcz4w2P;
	Mon,  1 Jul 2024 13:21:22 +1000 (AEST)
Date: Mon, 1 Jul 2024 13:21:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, A@web.codeaurora.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20240701132122.363a78e4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d2xvYhwwrktq05=_pw5t8Y3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d2xvYhwwrktq05=_pw5t8Y3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-nonmm-stable tree as a different
commit (but the same patch):

  7f07ee5a23a5 ("proc: Remove usage of the deprecated ida_simple_xx() API")

This is commit

  cda1c8e0c33d ("proc: remove usage of the deprecated ida_simple_xx() API")

in the mm-nonmm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/d2xvYhwwrktq05=_pw5t8Y3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCILIACgkQAVBC80lX
0GyMSwf/ZmvXrw8p1Og4CVj2ksSMdXh5gDY04es3JpyWs6jXLpZ4QVXht4pns4V2
s7Ffmrv6Ck0LGxrM48JNSZIZhZozbu3qGSUOWjdfjKJKe3skWKufJPdJVJp5UTmr
8HOYHOouabHHuuZn9cskQ0rKOeHzd9kTahiz1z0RP+RpgPwGdWyNLQdA7FUkosmJ
YUzzC3bD6suioM/dOu94F/eUUrGKsvxk2Sse0rpl6AhYdab/jy13oCIh2y3psWch
ypb/eW1j1/i/Gp7CFTdqWhj5XM79pKOY+fyA4Y9YM2epR33T9o/MehbHQ8rfdhSI
lzjQjnpXwQfJ/TECrxYwTSWVk6fJFQ==
=87Co
-----END PGP SIGNATURE-----

--Sig_/d2xvYhwwrktq05=_pw5t8Y3--

