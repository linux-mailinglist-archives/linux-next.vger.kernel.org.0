Return-Path: <linux-next+bounces-7850-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30609B1ACAB
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 05:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3EFC3BE6C5
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 03:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5131F1A23B9;
	Tue,  5 Aug 2025 03:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kmLSzrMl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF5A2AF03;
	Tue,  5 Aug 2025 03:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754363486; cv=none; b=NRNb+le1pmBJ0jI6d333MkDC3Dqkr4iBgAwCZlIGQxpxUMyFadj6+2+4espbOgCFVkjl5aojmjzqP0euKkNXTx5kzraG9EPKNaoqch+YRvzfTlKdfwl7BfMYH7NnQIQKK14F2AzKYgrb79KHeNuZrUPVg3uX47YRbkPZ8Ouqe4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754363486; c=relaxed/simple;
	bh=x1rstI4X2NEB6u07oXWYcLQjOLFzPHSwlZVLOHXtl7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cHl4FAACbWOWXVdJ87IXGooSBKfseZ+k4WG6ZGw6ghK/qbqE65b+qnU/DusHyoEliTlsULPjvFALOqSSa6JbObh4ajk0jmabzP5bXlMrpMI+BISA3HzxwKSnybkYexlBEXhHZubBk87V2IzBZFB00yp0Qv3Q01zIM5PHESbidks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kmLSzrMl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754363478;
	bh=3OiTv9RqNfMc/P4JCN5NATRnGjCprSQhXIfVbPH0KBc=;
	h=Date:From:To:Cc:Subject:From;
	b=kmLSzrMlsDsYlDx96XPiaipVnezubsb5KjunCPXqpmbxU2WG6PrYhVQInERw9EGPG
	 vq6cvjg71KFYOF3WYQuTYgm5kg2nzv1Dz7sfEXU1lJsqveC8SxF7xP6Bjxo9yXrMxR
	 IM/Ggd6K4nIfhmLZB4+8E7BK2zriXNphgkD6z1ms+pHMLp2bjclWQ+8HupRgN5MUNS
	 rKv8A6WpOuz7IzKOOSNxGoj/06jmDIVkOwANsp5+7+Nft5uWrQpwriO2JIib9+lYw8
	 69RmY3h1h3z40laynxBhST+bd8wUuosCLHNHQYfzAE5GHYO1uvepeoYaxbognUTvOC
	 M0OT7UOobDGog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwz3B3Vr8z4wb0;
	Tue,  5 Aug 2025 13:11:18 +1000 (AEST)
Date: Tue, 5 Aug 2025 13:11:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250805131117.2cefb8b6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4kgNcN3S7qUt/Ub8rJhsNWZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4kgNcN3S7qUt/Ub8rJhsNWZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:168: warning: expecting p=
rototype for struct dm_vupdate_work. Prototype was for struct vupdate_offlo=
ad_work instead

Introduced by commit

  c210b757b400 ("drm/amd/display: fix dmub access race condition")

--=20
Cheers,
Stephen Rothwell

--Sig_/4kgNcN3S7qUt/Ub8rJhsNWZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiRdlUACgkQAVBC80lX
0GwwjwgAkhKU+F12WsMcen1Toimp+930ZBOQv8NfWzfXuQnBgqfECm519e6VqqlC
3ecQC0BFEd2ywv487pPGsTRBGWtVcFM2LY7LhuZBmjIfUeyrYDjPc89I8M+kyGW5
pdJN1x+H07BYMFsiJr2z63pUYY6Df7yCpwD4ByTg14veyBP3S1NDXVj5DdemSRwp
PwLieUqYIJwjZt7VLvY0j6ENAIJlNMOiQO7kgn2iqt/A1YqO7vsYao9PhyA9NfDl
uCxpYLuxNl72pJDOR3jZD7u+Mc81AYsfIjRYVvz1PYGaoRaLCzc29oeK+c9hy/Q/
WJKpixhBX19H8AzLtkfo2XoP0Faiag==
=WY1d
-----END PGP SIGNATURE-----

--Sig_/4kgNcN3S7qUt/Ub8rJhsNWZ--

