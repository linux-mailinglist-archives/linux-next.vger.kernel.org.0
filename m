Return-Path: <linux-next+bounces-6341-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1CA97A9E
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 00:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9572F17D264
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 22:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754A02BE7A7;
	Tue, 22 Apr 2025 22:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TaG7exrA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F1E2701BA;
	Tue, 22 Apr 2025 22:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745361871; cv=none; b=nPDidTvyetekuPhw5C4XrBX6C9ZY7TRLN/Os39weqFqJSolN1ED/Jw0EurVlgDYKB+bT9+uWc9ovvYC4OSqzyPvDkhlwgf2OV/YiJq/+TCUVN6BcyuO8Nta0Pntj55EIk1f/YMbfoOt9QHHPyMMICYvyuc0zS9GQ8/7s4wiRZs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745361871; c=relaxed/simple;
	bh=guPAke1V+WQyKscbwPiUwiyuxKsFDDcsB/IBahVD0Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UB4riAPPg0M3P91nzIr07OUBO0/X475JN0MnrGWBcRZuS8eshe/M5CqVblLnrqrEoxUJXfix6QUkIPE9U1s51dHKKYy2Lma+tbtPo/8H5p7xkBUoIlb5Cl/CFdb99Pkfz3QJcMQ0h7ZrKDjOuQz/6J86UpyT22eV2k52QVvreuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TaG7exrA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745361866;
	bh=z2qUei8K82qJlmxVydXr1gwmqN3VhQSEpDzokXjw+ho=;
	h=Date:From:To:Cc:Subject:From;
	b=TaG7exrAUQWnh5SjrUOjqHx2cdlRjQegI/QdWyGT3eAEI5qdXhnFJEPQfAGmmUA59
	 yHJO/4qyYhA/pxm61Eacssdoycqlptt9WwaJwr5NV3byIYJ+nPfVnJlp/3zUbTiZs0
	 4j2XDViDfQ6QgBhcnt5BEXA+3VF1hJBHt0clfp2ne8BmPXjBlJhNhh81Ua9rRqoXkH
	 3IRGYJq+AkR27M9/3LY3CrZe1NesQvMkecTzbfO+knqoFf3hr8Gu8Aon8oh39EfXwo
	 J05k5ihV0lEkwevFUTNBjUB5ckZni3JFFXctG6vnErbdats7rCHWMGHzndkcS+A8aW
	 7G6293OSM8o4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhy3F6YXGz4wnp;
	Wed, 23 Apr 2025 08:44:25 +1000 (AEST)
Date: Wed, 23 Apr 2025 08:44:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Liya Huang <1425075683@qq.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the devicetree tree
Message-ID: <20250423084425.1fc9fb24@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wi51BH4pgK5R2nEaScw+b=m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wi51BH4pgK5R2nEaScw+b=m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8b176c1dcd6c ("of: Build warn for missing fn() in _OF_DECLARE")

is missing a Signed-off-by from its author.

The email linked to has a '---' in the middle :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/wi51BH4pgK5R2nEaScw+b=m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgIG8kACgkQAVBC80lX
0GwfUggAimuPQw0wZ7WhD9XfEEqtHaHy5RUIr4dwrJrxi10OFgieaaOlBdaTiVHY
YM3ETC2NmMd4HryODjpw9+XvuRjUJtwErfwT+/tEYAuEnxDkBKv5bxkB+JKAAxno
v/bxwS216eU+MzfA/sDxH9sEPeNoXmAioR2eaTMiVFkvy+WaQJLuqsNJtetZxVc0
g/w1iXkHQ5FRyosa2XGTtxANkUHp/sUuXhucamWVpS87XpKAza9FzOfnMyP1rvuA
jeSlCJIr7kKwuVsUfJY7IENHwGmlvOScnE6Gbjwn+xlPrtnU9IYMQ3eWkbubTwuK
b8hiFlUCveWcqD6lYbDnVA5Whl3zQQ==
=WGVq
-----END PGP SIGNATURE-----

--Sig_/wi51BH4pgK5R2nEaScw+b=m--

