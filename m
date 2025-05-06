Return-Path: <linux-next+bounces-6555-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE977AACF76
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 23:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22ED63BDB2B
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 21:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE84218AD1;
	Tue,  6 May 2025 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IF7vPjGU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EEB42A9B;
	Tue,  6 May 2025 21:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567034; cv=none; b=glkJMQSgynG5tkTMtRU/wGUGld5FY/KDrAMgKkmjFb94z5XX0eFUN2Oy7QqwpuGfkZNvux9lpyX4X4w1Yat7IGx7CKBp9gkdEXRk06EGuNwztCd6SlJaJg+mjNmcAo8SFKkhiNFcTAAKxd8wjFrC405XDXPf53hobVE0c8w/mVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567034; c=relaxed/simple;
	bh=yRQZ3SmqSI+7YdCunvexFi94dnpaRF2skY6OqU02/cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YPORY5L8RV7hakINl9i+MK+A3JIfR6GqP4KapxFOJFM0/u0Tb9du8MYFxXnVKOlhU+Su61tgNmWlYTSTXEf6qoHddbo801VlEilidi52TyR2PDXrj3I7uCf2pIfTQpi8rDcfVdDBNAldY3GO1xrIFg5eBIkHtXGqz4AIWb+UEko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IF7vPjGU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746567027;
	bh=yTGKGBLx76NNzRTZYnL2ZLu1gRrNUi9iZzIzRp9AXgA=;
	h=Date:From:To:Cc:Subject:From;
	b=IF7vPjGUCH4kw88UYxPXA/XytEPQLzhvmDMmVghlpuMsdXMYnRMJkcoAlDndoMBxn
	 4vxz1Yzs3dU62t+dV/BnpAgRy6oEZKqfWM4/7VfvnZZCH3dYli9TaGhS+pWYRKgqZt
	 aQFrXuu/jKM9N8mUhDuZfh2u4cEULMpb6/ixTXK+tfAPMoF3iNMontRXk6gWAekPgb
	 MdBtjazAO6wDHd6P4Hkx2ufCQowNWLGMoTAYdi5eu2GVG9303PC35rI6WIq+tJE/MF
	 6+li+DK6oyengLmWKx0xnpSVn7WI3SLgfr+CYgJmodXVT4U426NFtlyVFTDSPU0efA
	 OMxxBLShqyhFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZsWlR698pz4x8f;
	Wed,  7 May 2025 07:30:27 +1000 (AEST)
Date: Wed, 7 May 2025 07:30:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kvm-x86 tree
Message-ID: <20250507073027.72fe0914@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IYJ_5x1u.S9pbz.Y2_2NL84";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IYJ_5x1u.S9pbz.Y2_2NL84
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3813825ea6d5 ("tmp")

is missing a Signed-off-by from its author and committer.

linux-next is not a development tree, it is an integration test tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IYJ_5x1u.S9pbz.Y2_2NL84
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgaf3MACgkQAVBC80lX
0GyT0gf/WI+ReQvd515O8dQV7l96kzluLfW7BDRDQCsQmJVzJ0KVttOofDRgenqF
3L7BHLijHsP7PFxiwttRngg6TQTVl32nQcpsxlfaUjUXm3kLoAqFfKmBdkIaYcGM
ZkMALHQPnLKqasMmwfntupmqT9yrwlQQaYPGTi0fHA8oQCBKYa9lZ/A1qs9B7ri4
ljlhG9bebxkxkUXyC+EnXhYyhJmd8H733m3G7mfTaXDUmhZs8nLOqLD38cdBXjVB
RuVARJS7JC6Wn8XpcIYBRKjU/bNqa0a0aZSIEc6FJP75L2E1KHqYRFzTa08nfY+X
VigXKivAD+djZlT+yEk6w4H1FqIqmA==
=JNoF
-----END PGP SIGNATURE-----

--Sig_/IYJ_5x1u.S9pbz.Y2_2NL84--

