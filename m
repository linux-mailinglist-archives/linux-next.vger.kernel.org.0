Return-Path: <linux-next+bounces-8111-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DBFB37851
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 04:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 592B74E38E9
	for <lists+linux-next@lfdr.de>; Wed, 27 Aug 2025 02:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E7E27E066;
	Wed, 27 Aug 2025 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Uh3TyZXF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1412F274659;
	Wed, 27 Aug 2025 02:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756262834; cv=none; b=c9Rp3+HyF5R2FIN/lqdkGg5lW9DMJAWRukbyY+bcPGSJBQWB9yWwhJtUtyjhSCKLOQo62nyrbLBxHzmfFbcqoFZ+kF2xswJ8W7D/gKzHpw2TOUEnznG4/mWKo+pS3kc+Euq5LXxfSUWAGJWvDLZW9OGgflvL06L19yukz1cy4XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756262834; c=relaxed/simple;
	bh=WYOQHrhr9S9x3rhiJyMo8wSV3s2guXpZBg5eCOnT3SE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NAB8SBgv5XoAcjOeEOgfhDpJdbSy33jLrWG4Wf0U3DL/FfM/gH5AnT0YbxOmDfLGih26wyoFArot1dJUWEP0MKvxa0Z4JmjoV/1fDJBM6uqXLPGfUwkPqcUnADWXQjW1c0VQXFOk2JtRyAVCIKi0+JYKUoioIM6UsIAFy5pKcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Uh3TyZXF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756262829;
	bh=VEevaZLXunh5kcrxrPzC7luYgUR+DnkDYnGRX/tr7nI=;
	h=Date:From:To:Cc:Subject:From;
	b=Uh3TyZXFLxXHEp5BV1UYeATHr6tGeLoR/PGGIzd9WjZXFOYWNE1rcAR7cpDH9HEB2
	 4aTnD11OdZHqC/rtZKZNJtWV1Njjv/yBZ3yBao5FDnVAclW1o2WafERmkRc4N2SjqS
	 CGNYmz71UEdMjk9H5H51TlODq3Q6Lg2unzgriGeqLf5MgcQLrLD2C7WoGumpVJCxDs
	 Inz1nmEyXS0WfZwagy3fqfm94uK1CdyH+62nG3makQ5BeT1euyahJHK1asSUI4S2VX
	 0WbKFf5ASG5s7f6Ert1AFN5OPJVxzBugi893NEvMS72W566xaoQ1dUzp7PzeQ3qK3d
	 LSgue48eFvZzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cBTT90fmPz4w1v;
	Wed, 27 Aug 2025 12:47:09 +1000 (AEST)
Date: Wed, 27 Aug 2025 12:46:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, Arnaldo Carvalho de Melo
 <arnaldo.melo@gmail.com>, Namhyung Kim <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vhost tree
Message-ID: <20250827124654.78881028@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X/CMIPvD_L_O2FwiQS/_ppW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X/CMIPvD_L_O2FwiQS/_ppW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the perf-current tree as a different
commit (but the same patch):

  c67e16d30dca ("tools headers: Sync uapi/linux/vhost.h with the kernel sou=
rce"
)

This is commit

  f79a62f4b3c7 ("tools headers: Sync uapi/linux/vhost.h with the kernel sou=
rce")

in the perf-current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/X/CMIPvD_L_O2FwiQS/_ppW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiucZ4ACgkQAVBC80lX
0GyNTwgAkezIJLd+S4/vSk4CuTo0GiA1wtp1ojsHysYRWYmS+AjR2lFGLBk1CzwP
5LXsvwRhvupj9Bpxm70ObXoVrZzgrkHxyFx5vmvyJ0C7xk1cFODmJsUOsalAQGf8
UFRFpxID7onJwOk9ucHnrP7hUB/sr33GhMKaO3LKzBCJzE1jYGtsKs97g6x1DoI7
PMEd6LuqpsrS6BCLu8XCarFZPuxQJ2DyVhyv4qNAOhInGTlXMI+zdkxoasgr43tU
I15YTtaGAWI50oth4i+p5wc/8UFflhmt/UGZPMOMJXHpYlro58hw/PwlefVr9Bcb
i2XqkOS2J7ywmsD2zezQZBdxuJ9o+Q==
=+sxV
-----END PGP SIGNATURE-----

--Sig_/X/CMIPvD_L_O2FwiQS/_ppW--

