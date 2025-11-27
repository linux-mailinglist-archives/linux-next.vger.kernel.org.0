Return-Path: <linux-next+bounces-9236-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E21C8CA23
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 03:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D10094E200A
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 02:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A490241691;
	Thu, 27 Nov 2025 02:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="giJOydaz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA832405ED;
	Thu, 27 Nov 2025 02:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764209193; cv=none; b=qRWZglj9cj9auecSEO6T/r3eyCFmgWswR7m5Hi4/KFSW6KzO3OpI4yYyTEBv+HLgzq2i8rE9AsCPOSR9ZnMQ8iFP/+Aii7Ppa7Xh3Vjf+XyrBT7RbNCIK9aw+35oiI3/gZyZl4bweMDNTfaMs/s0B2aE2cqUxyfuYIgIibqU+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764209193; c=relaxed/simple;
	bh=JCIrQSSrQdwP5raAQNqq6rSvyX6wiOXaXpFNHV0Og0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eWIc7GoXp1dOOSrABl2p5SfRI3LvoMJtBhbp/8nLNTu7n5bDFPiyh3B68JTKPACMveMkKxs/DAhjFJNGGQxBA3Qk3HqSiX3rfeO7RUeyWncd95JlVGkU/rVT6tJcfcNJLhoLGTkZbEKaAQblSrdYjP+o8pSzMQtCjVEC2ELoleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=giJOydaz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764209184;
	bh=uOiD1sDtaE9WtvJodj/HSuvTCZW0WFkMQbcDvlMzGFM=;
	h=Date:From:To:Cc:Subject:From;
	b=giJOydaz0oQKKPXnfoezAE0NoBRd2nsDtyRnNdG2cjNh8nrfOncem72i+9E10h0on
	 rNBN5o9c4Azl1XfAWqz0wXIt4GbQD2k9rMH6sVXXfpuSc5wr8BELK+jNHeaF9dtzw0
	 9QBce920l9tL1lpyLIGMOgK0zm9On05b9eLhSdJEKx4bVq2M5TDjLCVEp2lf2tZDai
	 6g5PooYntvbM/Qmhmj/zbrR1+szvOaFjxNnt/duE5oOu+4RwozYmx3bQmaKCHsB4Ll
	 ZNGi5t5UICFDazlNoQR3Q8/ybJoN5ywXHcHSYTEgWeB9dGsLBo0YrVy07qM5Ma5NAx
	 3+IJw+rJrioag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dH0Ch4XNbz4wD1;
	Thu, 27 Nov 2025 13:06:24 +1100 (AEDT)
Date: Thu, 27 Nov 2025 13:06:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexey Skidanov <alexey.skidanov@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20251127130624.563597e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S2hwAa7t9gvtT8DnM3r9g2f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S2hwAa7t9gvtT8DnM3r9g2f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In Linus' tree, today's linux-next build (htmldocs) produced this
warning:

WARNING: /home/sfr/kernels/next/next/include/linux/genalloc.h:52 function p=
arameter 'start_addr' not described in 'genpool_algo_t'

Introduced by commit

  52fbf1134d47 ("lib/genalloc.c: fix allocation of aligned buffer from non-=
aligned chunk")

This has been exposed recently after a bug was fixed that caused some
warnings to not be reported.

--=20
Cheers,
Stephen Rothwell

--Sig_/S2hwAa7t9gvtT8DnM3r9g2f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmknsiAACgkQAVBC80lX
0GwvdggAgzqx2dBeqErlrYtgxCUmt2uZJIg6eX3QnG4Q8r78WR404OOHPttTN+oG
H5dk9KJpOBwKtlY8kaOBpeOzVvfVEPh6IAwb0MO38U7PCU5yq+BZyvvfkhYWUyJz
diwHA3q9FpUnwOk8mGClkoXWl1+ugC3Ojc/+JE3uVeO59vepAvXfzXEIY1NuJ4+y
HextU28wzJq8D8CiB+0NxAqLE6sQ8Q57/4kC0DAwKH066FXD3hx8q9S9qkFGFuz1
2JcurIT70rt3nW0CoWG5G2IyLDoJMV/ZEffXqSeXO0xQoDcO9MfI6O1HthqPGYhp
2S9S0rlQApzKoI2/uEOr85s0ZS81FA==
=UdEM
-----END PGP SIGNATURE-----

--Sig_/S2hwAa7t9gvtT8DnM3r9g2f--

