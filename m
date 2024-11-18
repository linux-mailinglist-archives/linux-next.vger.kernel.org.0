Return-Path: <linux-next+bounces-4802-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1492D9D19EF
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 21:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7DA51F22C67
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 20:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A181E5020;
	Mon, 18 Nov 2024 20:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MQaRMZai"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A5197531;
	Mon, 18 Nov 2024 20:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731963287; cv=none; b=GMmX5veiE0c3IQOIRfdUfkDTX+L2eQDqPFXPKkDJx4pfyVbo1Gc7EkEQ/KxUXQzrdPQufN3+PKRy0WmvlFf9A4BaE1ROfUZo7Nqr6cEad9p50LApf5CnwDvsjD1WJkLARkh+ZjJX5Qh4IanE3QeddGg7RidDMFDcvYDtiJXw14I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731963287; c=relaxed/simple;
	bh=+keMs4N1sPD/Y1I/jvOU0qdU2AEUGw51HztZHV8ciXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y5N7LhWySR1noW+5fa1ZSCC0t5QsLwECARwfU2hVcAwMqzYQvyRUEDzSAvU+WBXrG97Ta0oDfWsJvvRFxwcLGZpKGl5papkv8PhHiMxWAjoMoD8yAN5zCTlovE9tldquAYaql67dpLOqBnk2are+A4MQOBAz9JpTj88uPb/7qkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MQaRMZai; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731963270;
	bh=dv/up5UuotJfTMVa1ArB2LXUy/HZ+M2pQj9Wa2E6TXk=;
	h=Date:From:To:Cc:Subject:From;
	b=MQaRMZaiZikFDqrGWq+9n0LaLch5jJtrbtwfoSUhD9Hnq4gdu7O9mcb63suoUnqm1
	 bjeLzybKYJX5vcJu4ceSFkLX4JFeEfTrn6/cMrT8XSB/9rQzcrIG5HgHSQkes6c+E+
	 Jrhp9+pzKvUhYzC24u+/bHeo3af+GnP4rHlRIGOXW+sukdKxDZiPG+/LrzX16VH3QC
	 SHrcrp7buEDY+J70rH+1K7S2A5PiH8pSY6O9vqUa7h23OOchcVy25WYLfuqEZ9+E1Q
	 GFqDogFieWHI7imiJQVm42HP4pYg+EQyPwQK1KEDaag3y9mgrusAL5oHApxW2XjwS3
	 /x69VMPDF18MQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xsfxx6z1Hz4xfp;
	Tue, 19 Nov 2024 07:54:29 +1100 (AEDT)
Date: Tue, 19 Nov 2024 07:53:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the crypto-current tree
Message-ID: <20241119075339.7116dbcd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.7KF94p_M_=HG656=kKKz4=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.7KF94p_M_=HG656=kKKz4=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  6100da511bd2 ("crypto: lib/mpi - Fix an "Uninitialized scalar variable" i=
ssue")

This is commit

  cd843399d706 ("crypto: lib/mpi - Fix an "Uninitialized scalar variable" i=
ssue")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.7KF94p_M_=HG656=kKKz4=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc7qVMACgkQAVBC80lX
0GzH5Af/eYdY74dUFqdM+gsm+tORe5vqEQQ/sAN7CtJJXlxNEY//TRz98uyWafEp
E+JfH+i28Rlz3tirJCkbGOiVxBR7cufd2jxEhA2WMy2EKM3+8y96ZGwZMycHwyFc
4xMzv9/T9ZAKuWSDz4+mLfnHPxjWz3xU2xAPohS9uIGW2mVNZTh0E1JCRfxUvBSF
bAJrmCq9ItvssQUF3xD4Mv8BenLXCr4oPQgDfndvSV2r3sZ/UJ28pAlETlezCQFt
OqmReyn7aQWnqNBuqaDcnQqpT0HKvkDg9/DBQFNbh9KNmoUQaKCCngGLKnnVOP9E
ZsbyHuHBOvo0LiMv5iiO1tZ+L5EqWA==
=Z0ct
-----END PGP SIGNATURE-----

--Sig_/.7KF94p_M_=HG656=kKKz4=--

