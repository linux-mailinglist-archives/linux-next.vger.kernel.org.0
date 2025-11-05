Return-Path: <linux-next+bounces-8852-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9291C38066
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 22:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A92E1A269EB
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 21:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0982C11CB;
	Wed,  5 Nov 2025 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Om13Df+W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC90F286D55;
	Wed,  5 Nov 2025 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762377807; cv=none; b=R1D1HeHf5Rw1IaNW9rreSe6FLwAhPMMgpNudRhDV+CavB55GLtpdPXa1tE7ogYDA/C+D3Ydtu6Z60y7rwdhIFDmczyKZ8SGoqOFSWZkdDdCbXJf4dqdsluTZSvIv+K3+Bn+kIRSRTrae4f9+j62M02seCJ4jQH6/P8EMxXkrxH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762377807; c=relaxed/simple;
	bh=Iai1ENAktMXeWU4EY+ZLEJyCVOvgoF5443Fx6UkTA6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sOzYjaNageI17VWIWINPdR/nhyeNPgSDLl3gpbz+nUV38Gw+QykaSCIuNp06/2qHt7Q5sCZfyfmYxCOaMjOLC5u52sUDWmYhUQFI7+bnHHV+JcqV6a1vdM+gHwpNY4uW+lgTZ8Bo//H9X4GuCAFVKo+Velij1IgZUJOIdJFkUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Om13Df+W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762377799;
	bh=b2EvfYB6nTtFHDRoPeF1qEdqwv426++9ay7Hp9mJrPc=;
	h=Date:From:To:Cc:Subject:From;
	b=Om13Df+WfbiN48WGv0v1Pf88svzupXMpt61u3MVZ3dUxDURv9DwutNcoOf2iA4s6T
	 S5c3UwNbGNlr6BMG2iCczY0FAbxeFeygSlM5aHBc2MCfgROtr9QY4i+peRHeIJgdJe
	 3mF3IfHpjMqn6VTCHzL4kKb0yeVz4Glb9nmNqu5b96jpEilj5UsGbEAKwBNZcLs5/4
	 jFlmpzMqUdxRIkkkBe1jlnauSASfmjRubwJh2usYdQOYHUhhdQaYnh97kAkdpBNzzF
	 sshdKBnZF0piz7ppcReAxPuM0Fc3YTVc/2fLY3l0vgG4GFq/niSiLZ7SeW+XcocKh/
	 lfVPnWXPaPbRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1ywl3yfnz4w9q;
	Thu, 06 Nov 2025 08:23:19 +1100 (AEDT)
Date: Thu, 6 Nov 2025 08:23:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the rdma tree
Message-ID: <20251106082318.05ae9256@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/swDgAFDZlNMCJAd2G+WhRqR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/swDgAFDZlNMCJAd2G+WhRqR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b549c24d549d ("RDMA/irdma: Fix vf_id size to u16 to avoid overflow")

This is commit

  320258783765 ("RDMA/irdma: Fix vf_id size to u16 to avoid overflow")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/swDgAFDZlNMCJAd2G+WhRqR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkLwEYACgkQAVBC80lX
0GzXLQf/SwQHPPb93bb8BKQJojuFLEGpcwLwfjpSqbMWfAKWQkJhAnnG19qRUWVF
mOw8J18aP2FmJOMl9VwBvYabkocry1oJ8pmlQl9StDSrQKL1N+DWGUMsuSlrmcWC
raRE70i+WmbD1dzrXHKUtK/0sFeFH0L/75ehbAVVkM10jFjODY5kxzI6yzaC+jAM
0sZ0aGh0jE9DSEIPcvlSwtCdjMRAv4ejZdSGEvAbH/Lcv2jQ/ogtl9VBoroNF8Ne
lm4ZpCemPV+dSteyf/tt5uMPTuadFymWkGl+yzwbj7dIWAQ9tUkJOYsPA+N3roX0
Sa20OLYAWMXUmgtyWnxhCSq+QDTbZQ==
=tfBR
-----END PGP SIGNATURE-----

--Sig_/swDgAFDZlNMCJAd2G+WhRqR--

