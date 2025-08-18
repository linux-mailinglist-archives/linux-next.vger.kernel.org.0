Return-Path: <linux-next+bounces-7963-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF621B295D9
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 02:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A5053AFECF
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 00:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C9126AE4;
	Mon, 18 Aug 2025 00:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nNbb+UwN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33131771A;
	Mon, 18 Aug 2025 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755477178; cv=none; b=OZmYSM2l4KVqaOCAS6Ma/RGnMOJkUmAwk6jdo5iGltSjECMGlwYeKwOlmFlJ8OSaiDckui0mst0x3Nqh64XgPrX2MopI9rM3RK4b6t+iPQin+71VFKNmq1dNJngM3lpfJBfxqnsJWT5n4zPzYeBt/SnJAMdElbbt7YZazKI8uFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755477178; c=relaxed/simple;
	bh=Z8h9sNu6tX727SR5xknw1SwVammrXVHzB3kROMcRHJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DFz/gNuYTFaleQdEt2FpmI6mMLqdzQWl4ZeVg1YF4aBgYVzftwKYT9VnnGFnogaYfj00gfk2KhogMQ2UDnDKxMYwW2jlWUcrpOB80ZFKIqx++9hjMnomv7MbWYaVBJ7lFPBjsXNhJUxtwHDG6g/3FvP8DQ/3ioB5y8/gOPMr+Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nNbb+UwN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755477171;
	bh=ozZt6QumBduwdxcygZpOmtkDcVUIHNPlLDutr9Flqss=;
	h=Date:From:To:Cc:Subject:From;
	b=nNbb+UwNueEG/Z15j1E7rqz0lxdnKe7VmDXfnMgmkCvccUuKpjlwFLrSPhgUcWfqx
	 e1txGD/YGF4h5YUvr/asQf8kTTpUOzAo9Avbpahq/pGYOwIPjyBo/MLkkyDC8o6jCi
	 ljIdkP5gQrHX8TanTuKD0VSyjKFlOcD4NWgVUvuilf61/i2lZOYz1vuvLZbFaoOP8T
	 ISzjgRY6fPxZ2/Z5oZj6r7GhDdwdTJ2d4YatsxgQdMvCP4m4D4vWYMsbGlCNIO54ZV
	 JAC90aIWmAR+qXWDwtMpLZiIgk6TDckk+eXDLzacRpjQlw9Dzw8mVuPuwc3s9+X0kF
	 RZruB7FgDxabQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4twL72xlz4wbd;
	Mon, 18 Aug 2025 10:32:50 +1000 (AEST)
Date: Mon, 18 Aug 2025 10:32:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-nonmm-unstable tree
Message-ID: <20250818103250.7ad8ecf4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5Fuw9PXWrOybad+5spHi2=O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5Fuw9PXWrOybad+5spHi2=O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the vfs-brauner-fixes tree as a different
commit (but the same patch):

  3e3462ebe71c ("iov_iter: iov_folioq_get_pages: don't leave empty slot beh=
ind")

This is commit

  334430b2d585 ("iov_iter: iov_folioq_get_pages: don't leave empty slot beh=
ind")

in the vfs-brauner-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5Fuw9PXWrOybad+5spHi2=O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiidLIACgkQAVBC80lX
0Gxx6QgAgJTh12z80qhI/uKBjRfp18xFmjf+m1Q+zp9WmbWzeAIVeBP1XSOJyON/
k0vQp6Vlcx3Ta3Lh7uz0iNtrWKiZHZcMxT/UGSZq1TMa1e3dOAzU75VXtPO1i13H
OxDYO5zPAubJ0d3THhEb6IFaxx1Xg5lO8sckqM/MDDz+KcOJb0jwka0/iQHTQ6aM
pzr3kd+PoVLZ1X7ezWm4jQrVkRec5WT+RsG0nlJV4PtHbPjzgIo28d7sqZBkvEfK
Rzr92RJTwzHeQJ3WH64Ure9iw+ff+sruBIQKUhdfishAvx6jOzwTSgL1ab3YEyb0
ma4Um4HwTaIPuzXSh00q+hxe8ti1Bw==
=BASZ
-----END PGP SIGNATURE-----

--Sig_/5Fuw9PXWrOybad+5spHi2=O--

