Return-Path: <linux-next+bounces-6636-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11144AB0DFD
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 10:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712863BBFB6
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 08:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32749274FFF;
	Fri,  9 May 2025 08:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qYRL09Yo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCDF2741BD;
	Fri,  9 May 2025 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781131; cv=none; b=UliXQCw7VW0PvPW3VQ79mmgY91PlpQE3oSL434jbRRD7sEbZdcU1lAiD1kXpXzXCcbJnxxxRrJwDZSdYtAF+m7yau5Ryj2Vv8sYg2zq8g2Njl0mgDI7xq40xt7H1J3r6s2H+wHtt4oLXIRGjaAKKQ4s+49ruxjfDMYsB4Dji7bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781131; c=relaxed/simple;
	bh=UEDOVnjTqqMWxWxuF2i+dnpAoxv1OLqxs+2ZUHo9ln4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hF0V4QQjymtjukSj7GAiXiJgzkhlqd2qOvY7YAxooo9t6Fb3A7WBWZAaHrvT8y00MnU5W4sj1UjDTvVHrhaUpRT4G0ZU5iambNbMARtSiB4WbLtEv3fx5KUq2ITjf3lIQTa9Jfv4R94As8qmYSUO6O0G0aCklgy/vRLdQ+NOtaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qYRL09Yo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746781126;
	bh=kAYNAYUdxgt3hOvZCZgJzCcKiXvhD5ZUJY1H8i+A9NQ=;
	h=Date:From:To:Cc:Subject:From;
	b=qYRL09YoqvqibtbjjW19DfYMDcATppYJ3QxxPDAsmYmpi8au0Jgoa5VK+ITeFaBhT
	 RWapNkPwClc64mgJaQjFIlam2Q9Gvj7Qpjef6XoGh7+drSXsgcETsFB/iP6Ygydfbc
	 L6eZPnoiADt3FJ1Ry644UtdvclDhLINp7yA4YEyqpg8sK4AUrrlZJfpxd/vjMXlqZO
	 KDtZc/nW393sKQWP9jR1iVfBBjmspp+P7Zro/B+AfsJwmgWkd2ZOal9P9goJeeSqFu
	 o/X+qyvxvC8LoFm78fqZZpm7g4Lp6Xjj3pUP1/JNUpG3VS9xd7l0kPPWnI+aHNE3ke
	 BMv3LFLmJewug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zv2wk0lk4z4xG4;
	Fri,  9 May 2025 18:58:46 +1000 (AEST)
Date: Fri, 9 May 2025 18:58:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250509185845.60bf5e7b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IZWcCZ_ruiqUhVw/1Ux/naG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IZWcCZ_ruiqUhVw/1Ux/naG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/userspace-api/media/glossary.rst:170: WARNING: duplicate term=
 description of SPI, other instance in gpu/amdgpu/amdgpu-glossary

Introduced by commit

  dd3d035a7838 ("Documentation/gpu: Add new entries to amdgpu glossary")

--=20
Cheers,
Stephen Rothwell

--Sig_/IZWcCZ_ruiqUhVw/1Ux/naG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdw8UACgkQAVBC80lX
0GxBjQf/Ri3t8q1VRMsy8l3HF0MO0nGaBz9GOhHBB5Efxy8VOd838Bp/uVGv85xL
wgFFKbDixL9quBw8aPbJ4QqpXoh3Nx78/fme0ZdytIDaRU5IHzfR45T3szwjtj0Z
kaabUGd61Xz2x9DPyDqPm8wlc4U36HXA07aJkNbUz+9Y0F8WZaU17OxvPw4rrh40
iP1UQcddw4s73osSAU6PWw3OQ/EXOkY7gRsSJZbnvzzjKr40F+RyfUCJXUZZyCoU
6IGPwAh64UVISlQpMsll8I46sefj3Ym6fjCFML2iEOeS/JuHaoEDAfeK3WVB+1KA
zJ4yOY6yfOpwLncLXIBf7RCEyNSncw==
=8HDl
-----END PGP SIGNATURE-----

--Sig_/IZWcCZ_ruiqUhVw/1Ux/naG--

