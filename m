Return-Path: <linux-next+bounces-5268-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA05A17484
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 23:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D2C43A8F9D
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 22:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2003198A36;
	Mon, 20 Jan 2025 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gScmHZA7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6C191F98;
	Mon, 20 Jan 2025 22:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737411335; cv=none; b=To8YAB5rkbPixJpELAjVZJxYe4hqGLulgJyedePS0sFr/eIB7qnz0kBUhXDuphedLtguWksTcyRz+evu6FXMthzIXRvAgFD388svbiM4PWRJ7TCLii0KwapsZzuwDopkZejf3RaN7csBAfus6QvJABuDsD8pVazXzhHGgxMD4zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737411335; c=relaxed/simple;
	bh=hr2N3jTpXpaRGVkkLUtmbvlfidATjmEGhd+M3JjF7Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EDpgbyjq094dTN40PrEp/DyZibEMphd+8M8JjntoB0q8Plao1yz9MVIKPsqgUvuP3PmTUnYiFvlR7XW0+uuNKNwcTrWP3JmFMRCwXoxhXdJF6YCc8Trk81h/qUjDs4KWZXTjAsWN8Z8x746C+cak6HGjTXHIVMO1MGVvXZrpoQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gScmHZA7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737411318;
	bh=+0/+L4l8KafZOJylQBYoX+Q9qjG0R+S/pnDNjE/iRVA=;
	h=Date:From:To:Cc:Subject:From;
	b=gScmHZA7cAIL2sukqNuv50SL5lFXpUkzld2h2paXjVtnJArjC5GH0HqmoFH+Dgmd/
	 W8cLktaoh+8WlLLi6pixZ8qW/v+Azyt+hfYpn2Hzj5TJDpA+coE07CwiPfwiRMlZyR
	 1VKpSs6FEGCIDZ3XfCOQFgorKfSDlgJIjeOi3fWrp24g2jyIizhYHPIVEzfBkZdLqy
	 9AMgSCUMHWlLxTGI4WoH8lQSosgkGJ6CObefkdwecwq6JljW/YQ74booqqZlhMrN+A
	 JWxbMLMN0IwHgJKYg8TykPOe9jiELmjFOyn6sFTRNXuHCz1kWgXBCfYBUb49zMteLD
	 swYgbvtOKHRGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YcPm60zHwz4wy9;
	Tue, 21 Jan 2025 09:15:18 +1100 (AEDT)
Date: Tue, 21 Jan 2025 09:15:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Howells <dhowells@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the afs tree
Message-ID: <20250121091525.6ff05253@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hbe=_TKgj3ZhTJhMQe8_S9G";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Hbe=_TKgj3ZhTJhMQe8_S9G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  3c9ca856fd12 ("afs: Make /afs/@cell and /afs/.@cell symlinks")
  bcc4d777ff8d ("afs: Add rootcell checks")
  31ad47d22fac ("afs: Make /afs/.<cell> as well as /afs/<cell> mountpoints")

These are commits

  30bca65bbbae ("afs: Make /afs/@cell and /afs/.@cell symlinks")
  3e914febd79a ("afs: Add rootcell checks")
  92f08e9d3cf0 ("afs: Make /afs/.<cell> as well as /afs/<cell> mountpoints")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Hbe=_TKgj3ZhTJhMQe8_S9G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeOyv0ACgkQAVBC80lX
0Gwdtwf7Bj8ihb/xKRjVPlnG+Lv7Y3EWBfWIA1cSTMwPOHkLB5BrxXYG1BWIjRzk
WeMfA6Z/llPiAlNhglFZbJpNE2lpJGZbAyc9B/UeGMnzCPLwH+KhajzzVcazeTkR
qEbhRKyu8oPXN17X2L76g0OnGVKcaVeiwvXMhOvp7WtNpTzhoAHOFKrQp6NueiGT
KQevS/7hqKGOU0HljnaP9EL3od/Z7zUfSRhksarqt1GW7NHL3X/SXmhItna/pi2i
Jtr2daQei1TO6w8KHGP3FTmHeKSkdz6ncnb0oA7WAjcoWqXYnN9v9LTy14LmMe8K
4kVmatfsTb41jU1KT46KcJM8mXeG1g==
=3NSr
-----END PGP SIGNATURE-----

--Sig_/Hbe=_TKgj3ZhTJhMQe8_S9G--

