Return-Path: <linux-next+bounces-4957-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D19F27BD
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 02:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A2E416563D
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 01:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BB2881E;
	Mon, 16 Dec 2024 01:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DNscYzg1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9698917557;
	Mon, 16 Dec 2024 01:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734312222; cv=none; b=gJYbcH3kT4Qg+MDJuhNXj16txsIYrBHRttQxzE75Z263wWhBKBJzPXUs8nrRRKm6CllaCKO+huj0UoCfn1812m2SS0zQCVbBORbbgWHOu1gTsJQB8u5g4LgamjsBho7ybrQwDjueiQz0NfF5O0gOkRSGn/+2IU9p3XLL42syqXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734312222; c=relaxed/simple;
	bh=DRBiqKujMjsImQzADrzzrxTE+MHAlU1W+/Cogt2GG9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=chLWmmchvh+0ZCrMNfJpIv6JehWrQ8ejBr3N0vGFkTUdy4z6O5FBFWqnyZU7EHG91NExOrgv+8RBQM6WF5w48kVwj9H4TMvMGqPJIH1MZVJk0EVjCzjfUmucCZRiQbUhYlN9/Y/9EyI5erakCtZBc5nZkoiz3i2hC/P/Xjpc7x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DNscYzg1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734312212;
	bh=9ir2YZ16xVLJ6GdB90uT3f1RahHszCW3tYf7WecHK9A=;
	h=Date:From:To:Cc:Subject:From;
	b=DNscYzg1zBLvwT67pS7N4ro1ULBe5YxRHtGWYg2Sh3vBT/lNlHL08zMZ/vTl+ZTtS
	 MGNJqLDh1HpBrmOz1855xr3Qlvlv5B5lf2QTzHCYLw10NQ5894unBiEAmMt2+Zx7hx
	 XLPtHlqRzWdlju4yWQi7NhOnRCPnlVzk9ucAhem9Vot/TNvH+pEQGEH1mZ7SMomzlm
	 1pwk7L9owGJhrgytLWKmz5rd3hgd8FwvDlWcQbYW7uuBRcbDTaakTxDkpQ0yCfjmxN
	 C5se0b0n64FGSC9b+Xf9R8WB+gjQEDeGS/4EKkwTeQegXLfcqPmUESgln+KXtGm9yY
	 X3y4jWXK1QPGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBMdw3G1Zz4wj1;
	Mon, 16 Dec 2024 12:23:30 +1100 (AEDT)
Date: Mon, 16 Dec 2024 12:23:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the net-next tree
Message-ID: <20241216122335.17c4ad5f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=HZ.yOK3ioZWpvaW4YiLve4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=HZ.yOK3ioZWpvaW4YiLve4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  734ff310d38c ("gve: Convert timeouts to secs_to_jiffies()")

This is commit

  3a7185048326 ("gve: convert timeouts to secs_to_jiffies()")

in the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/=HZ.yOK3ioZWpvaW4YiLve4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdfgRcACgkQAVBC80lX
0Gzkvwf+NCPBzCdw+ry0Mb1ACD9+50Szw8zVX9DyPIKst6y48LiqukmaBrQcLB8k
dXhsTsvOf9fsJUXFJ3TXpw1Wowhagi6JE+H2CQ0owznz1si0RSNP1ogIRt55p34x
64JznXBAF0ycqCK3vXIKxq+yhqqlNz1g5mkd1cJ0f2U1NwFWrCKdbEr070sBsvyx
6qsWUehHr+2BCTFxlGrJXEOARDXqoj+Oyy9ETKD7sU2G7GvhnyE3xJLZ9nHPb6fi
SKgMjQbJ8Nt4HazMdfkZDzZoWsYX7hFer1IKNf3xtqFQ7/lC+frE/EiA/YrfscS+
8EQPcO91ltKSXYiJdbExAmkev76LFw==
=/6/j
-----END PGP SIGNATURE-----

--Sig_/=HZ.yOK3ioZWpvaW4YiLve4--

