Return-Path: <linux-next+bounces-7902-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF73B21805
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 00:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9921E7A2BE0
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 22:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8192E3398;
	Mon, 11 Aug 2025 22:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nvCVpMSY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CD42D876D;
	Mon, 11 Aug 2025 22:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754950460; cv=none; b=dRqIrpb4gVuJJhFKhbWHJ/c62V9o2za5xC4kqsqb8Jif17VPrbaStzEHZIuePMkQ/MU/sk0IpVVFMPGiRIWDUfPNX/MCXxRCe8Uqc1KQfJFLUN9EX1r7ebEttVL/MqHzFiO3XFo9V3ilj6uuvCorcaASx/oTeCfM4NyrjGPq7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754950460; c=relaxed/simple;
	bh=rNqmJYUuNkirigbeEtaQtv3ziJFrOpPYskbV8drA3tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CwcZ1QtLrnUjnEyzVCImESwXWFr3ZVBeNqbfvrfFZL3jOpbcxj45IS1ZX4EDerMxv6Wf47fowi0W6yW/WYYP4EmQ3OQw/2ykrvqBgQDQGSZ0NrVZsoAFyJf/zBkX+v8piwABA5Kh3+vb8Ma/bgo5hHo1QbyoKEpdoI/nS9Er7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nvCVpMSY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754950456;
	bh=7aY/L4tXa2/G6c9SE43BwcRSx5vEreZf6e2DUj95vdQ=;
	h=Date:From:To:Cc:Subject:From;
	b=nvCVpMSYjfN4yENR5TuzTZ5Yk2uc1cbWQ7+ZLNznJJybkpHNavKtbULKFilB2EQJp
	 sulRwEqUJvMLa+nUQOEqp+fkice7SZMj+iDl7HDTCYPfNVj5Tk5mXN4zJEfqdpRl/c
	 X5JDxot9t0efjPPVnkLzGmhilbQoMSlgg4UN9Va8wzzw1yOuuLmj1OPfb4/tezE13d
	 Vuzslo/+GnqJBDQK88sruJMQ/OfK718Lzsb8RyBOEWBxUzCvlgNkjykj7c/4l69YxD
	 D/+xKDSHH5jMQ2m4EhluUi1p5z1zpKY5yxxjnzoYxjYZYZCmK611cMkULRoqjfMfL/
	 hLKqjq++XrkxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c187D0MPbz4x3d;
	Tue, 12 Aug 2025 08:14:15 +1000 (AEST)
Date: Tue, 12 Aug 2025 08:14:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the drm-misc tree
Message-ID: <20250812081415.7afe541e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tiSypBZkbj40cTkR4dplYCD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tiSypBZkbj40cTkR4dplYCD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  216d6d913861 ("drm/panfrost: Print RSS for tiler heap BO's in debugfs GEM=
S file")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/tiSypBZkbj40cTkR4dplYCD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiaazcACgkQAVBC80lX
0GwUKQf7BSOQHJtMMsw+EuxvA/iEgdY2Hm8QBQycMz1okKcXAvwaQ2PH2njHKgSC
LRlLnBgWx83SIOK8FgoWKoRw8SbGDlX1+fBkeeVJQBrpfsxI1VcEpKchoqGFiQ7L
H4KaQQJSZQKOklTYTYTtlvRK96xrZ8mAn0A71mIzh/0coY0KodhMeDnoZuwZBnU6
bfzS1zMF7DmD/ZOnyUt1ky7NUc6QM+WJjbq6M7Jm4AcKGcjr0K6suNZew1TQqd3N
dcnoodSH9KbI/iovuLmNlmglk34jLFnb53O4oKsJASR8js+ZpN8uuwy+V6ifWDaV
Dl+rVTR/6SYmFbW++QOEpAp+5wZ63g==
=jSrb
-----END PGP SIGNATURE-----

--Sig_/tiSypBZkbj40cTkR4dplYCD--

