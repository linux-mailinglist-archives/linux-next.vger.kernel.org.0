Return-Path: <linux-next+bounces-6676-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77972AB2DC6
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 05:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FAF77A7AF7
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 03:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FD924E000;
	Mon, 12 May 2025 03:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I/WHBJrA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95F199FD0;
	Mon, 12 May 2025 03:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747019456; cv=none; b=f7OUITiLBaYeVM/kCDwJwhoDau6xtNshE2MhuHMBB+nkbR7Y14ugrmryfABA/Qj6arBDSrWd9gEIwIBvR0ucukXqT/Je331vSn80NyyVs/fYUyG+iLlUDk3DMBso9WMbnxHyMVdWBoOjXAgxZTNwCEIPxZ4gl9FHR+WkRVHT7AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747019456; c=relaxed/simple;
	bh=5BflEpTt4vxKVUMt6iogC6dFiPvg9w0YN196ebhi74Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S41BcfyY0S9xNjMtA5FHbapQzE8NZJtxGyIopy3/lcDkVusPf1jGDca9UfHRK0paQcayMtq0h1P812EFm32A0xByCUwjYapVJN8GnmgIy5EQCXdYrE1pVmkeqbXwrBqSkVtVl6VfMzXmFFzoY/IZ24Rq+iSoVxAv7eClN/Dntl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I/WHBJrA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747019451;
	bh=j/suTF6ggw3V61Hu3Lh3hB/SWv/0k+4zmticoUWqQPA=;
	h=Date:From:To:Cc:Subject:From;
	b=I/WHBJrA5zHRnqKrEmQ0c4pR8/Ps2vgFRNFdbQj7umkIr+0I+x8muoamnYUMFUQoc
	 MIxF9vF1HG5tqTQTtHndZvCVVQDeyGCw+iUL1/SmFmUGp6seDNRGwEAJAt9uRJmCh7
	 4T+HqHy5HM1++C8oMcIfy9rjE3rCCD2DlFQBqAiBNCP9luPQ8vutMQUAspdKtjQHhs
	 JZkumXqUbHDTWn6X631Y6kZDbWnUjZPjSTetrGsec0PUVU8EebR9r4HuBwKGVgLuHX
	 f5LKch+7jjtn7G1vydwXeWGkE0WLHH9Q7muKCsPq9cOnAfD1aDyq8zHyj5gpBrmNiA
	 cXJN0M1TtykHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwl3s2f2Nz4wcx;
	Mon, 12 May 2025 13:10:49 +1000 (AEST)
Date: Mon, 12 May 2025 13:10:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bluetooth tree
Message-ID: <20250512131048.345d15ab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iVAJ1PCJx6Ry0Cl+YyB3Dwb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iVAJ1PCJx6Ry0Cl+YyB3Dwb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the net tree as a different commit
(but the same patch):

  a1afd438e713 ("Bluetooth: MGMT: Fix MGMT_OP_ADD_DEVICE invalid device fla=
gs")

This is commit

  1e2e3044c1bc ("Bluetooth: MGMT: Fix MGMT_OP_ADD_DEVICE invalid device fla=
gs")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/iVAJ1PCJx6Ry0Cl+YyB3Dwb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghZrgACgkQAVBC80lX
0Gy3IwgAhdp8hMKmhhufhh2/AGNm97E8lzGDIvBmtvLVBV0V6z85D/+LMM6KvAy9
2ljx17nKYSEZJjcGrUY2n1AWYQNHV1emkmQG9mN3Aup/w8fiZ/eSrLcnrqoeTfZG
WmpkXpDD6BNjUvIwEV/pxfl3wdGrLR8fUI4Mul9hDLQP8kVrMB3YwbAIAWm6LoGH
14uX3y3sdWf9JsfW1vIEsZnlAxqrldygOCsxZzrDq6kDYhIXmeS6GC6HQ87f5Cq+
yGoFWHGSOghfhUl0MkKjuDPey5t8tu11yKx78mGtaiqKDv6XgomZPv6BpM1VTIGT
JfYZLwCOdfOgkFxDTcdVPdxSrAkvAw==
=ylc/
-----END PGP SIGNATURE-----

--Sig_/iVAJ1PCJx6Ry0Cl+YyB3Dwb--

