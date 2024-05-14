Return-Path: <linux-next+bounces-2296-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A71F8C4CA7
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 09:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89FE21C20C9D
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 07:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C8CF9EB;
	Tue, 14 May 2024 07:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="biuGn+mP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C6101E2;
	Tue, 14 May 2024 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715670720; cv=none; b=r2ZckNskKkNpe4ePZSW+m32F/FoJMF+iQ1zzZ8w3nem+1zQ9yygSHKXR/AEjjNZZhb4M/0gh03ETZQYg/STXTfRzqebTJ1W/4/6MmuZ3KZkm39SuaNghzQCGGctQNT3lVCUSRODOWJXeqh8h8VwYcrapEfE38R67rNX1B0R96NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715670720; c=relaxed/simple;
	bh=cOSULAH4zzj+lhfrDKtfR0j2wL6IkR4iwlPXlD5K3cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RKcWKnz5ECPGgQLmMnftPFY+2eWBlFq6AbnTsC7h3SJ0uinDCfcqNaaZ96TOxJTUGJh5xGhK2mtaG5rMyFe/8fKH/wJjUgEgTD1l5Y1XdrZ/zfNjh1oUOGHas8IfAxMF3oUtCYgHFTgT08GtEVcauLPnTEgMqwsawhbjlAcPngY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=biuGn+mP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715670715;
	bh=q4Eq0wErkTh7xJD9VaK0xWBmBA3aSLZdJ2laHtxhuZQ=;
	h=Date:From:To:Cc:Subject:From;
	b=biuGn+mPkhwhapJcxJyBbPbYH7py3jf7xfxNokxOykvc5TDn6tH/GXGD/n4SXCa1c
	 UsbX4aqlO9DyDR3U+tv+RT4PizODLBYPkGQf+QbunG7uSEjupIkTEW4Q7m9q4moWyY
	 25tW4LB391yCvHHkktie/QQ2CkvN4UoPd59lSsXVCWOwM9HoXdOdamWQMK18tYetCb
	 YGV0BvV+09KpVfj+3/KhWTfuWsvYXD2VNqm0FeZ0fSwyGuFzsIhXsmKCTWi+ihq/G1
	 9tUDJob5bG+uW92tnUCLyBhaj6srxTiBCrsm05QQZ4e6JLxI22bnmZPEMI/wqBIY9C
	 o+FQZCX1hUPkw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdnbZ1cl6z4wcg;
	Tue, 14 May 2024 17:11:54 +1000 (AEST)
Date: Tue, 14 May 2024 17:11:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Adam Nelson <adnelson@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240514171153.73fed88f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+u=ZZSyRVBxUYE6NB+F+=EG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+u=ZZSyRVBxUYE6NB+F+=EG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:580: warning: Function paramete=
r or struct member 'program_3dlut_size' not described in 'mpc_funcs'

Introduced by commit

  9de99fa8c1ea ("drm/amd/display: Fix 3dlut size for Fastloading on DCN401")

--=20
Cheers,
Stephen Rothwell

--Sig_/+u=ZZSyRVBxUYE6NB+F+=EG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZDDrkACgkQAVBC80lX
0GyqCgf/VFfLdp98m5K+WU7fJxZcASt+J6wP+15TofuJCL18DX0Xc+j/OP3VpJF8
qYIYl0Y1GrUl4CHkU5QiZdeewp1ySblDNZ9xWr2glb9K+B1LghtAA3uJ9Wddsm5D
OTB+l0uCXJWalJEa1BxhCwbQ0TARo+tegwLMX70PiyTff84D1OaB2jlp1w7V9Xgt
YUGCw2+uVIv52gcYb4Q2m35PUErlzEXAuhr745ucoZhc8fPbX3Oas97xSTYKWdaJ
fvZxlE8A4sMRx3Rr8fal4QyQxBfOjm4TKygsHUsDefX8rMbTnUimFznQeeIKTXed
iGEQ1DG0JLhaDdixBwWOoKurPQJKjA==
=BWnx
-----END PGP SIGNATURE-----

--Sig_/+u=ZZSyRVBxUYE6NB+F+=EG--

