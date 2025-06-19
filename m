Return-Path: <linux-next+bounces-7179-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE2AE02FF
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 12:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1F7E170234
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 10:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B0B220F52;
	Thu, 19 Jun 2025 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JcKj6Jyf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4898F21E0AD;
	Thu, 19 Jun 2025 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330781; cv=none; b=IfYZgmbjv0IWsGh5Cu67khwoqfksOop4lDeZGF8KcW1wjeNeQB0qVkBmwFnpmgx8upX1DvG8UjfLkmLvBaTf/QIJS9DfgwZDy1UFXZYN+VcnTybVtc5qGe6C0fmPP+qvOP4BmvXGVBSEyexE0J7Ku9LwxrYqKL1ObR778MaYiUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330781; c=relaxed/simple;
	bh=EGX3g6Sn6I4tatWsCSQ4Xmuh2IYdlCzBshgIniWX5g8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EBTKhJTAGvbWHJhxQ/FsNS3gErm6rMhTxUeTAe7SLnv65BCWSXQb7GfWYXiDSvtt7UXxIm5UnlY1i/YnFOy/wT/NBvamBUiZN6VIf3snjAiIjOFY1kmx238VMafjpAOiAZJg5+p+ZHKZOPk0VgmGm8VH+rF4mTD6/K0YV8+ITu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JcKj6Jyf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750330772;
	bh=bqHT6jLVoZ7STOU8FGhysfpRiQnCLdGWJVgr7wH6pTI=;
	h=Date:From:To:Cc:Subject:From;
	b=JcKj6Jyff4nfP/YxZNJ2RpT6/F/srCowY2ZjdY0rXwgJoObkOVfXuToRuimhzFxje
	 kVsFEqQ1vHr53G+6065X9IUcXeV1gTF+usg+27w4E6u0ghRdlbtDBIjESk02mMp0T5
	 juFRnvfYRPuWPrZU3F0f96QQSDvn96qg+nrXTMTz1CEEqe5XzBLfWs/89Wi+oVuZht
	 rzsmgJ7Q0bE3JWtP2Q1os3i46JHD68yMyE++votuqKQsVD4fwyzuyKswFOcJAwX0Dc
	 U8eDf+qJnG4cET2Lp4MrnRoqRt2JVLtrjWo4CDLFXfBJ6RjWHIrR928m2EkVbjrNUq
	 PIYmvyMqaE+HA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bNHg85r8yz4wyY;
	Thu, 19 Jun 2025 20:59:32 +1000 (AEST)
Date: Thu, 19 Jun 2025 20:59:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250619205931.41cf9332@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y=9vF1foaCvbzwNSF28c/ww";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y=9vF1foaCvbzwNSF28c/ww
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/include/amd_shared.h:444: warning: Function parameter o=
r struct member 'complete' not described in 'amd_ip_funcs'

Introduced by commit

  64c3e4a868f1 ("drm/amd: Add support for a complete pmops action")

--=20
Cheers,
Stephen Rothwell

--Sig_/Y=9vF1foaCvbzwNSF28c/ww
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhT7ZMACgkQAVBC80lX
0GxeLwgAm6xjVWUc9cabSallDHFZw2dwMRj+Nl4ybWmRFa1f28UYGUCFOT9Nm/QN
Aicmx6v8rPxyYjnUyeZaY5yAzG2pnRUv4/J72ZSZymzzXjIqolsGUbERcB8V014X
9VsWra5QdK4lH8eDAL8fP4hQCcJjWxcwNlNPsUW+3wxz5jf8Cwl/K+xGUlgBbPBw
vXHbwALFlqbEhx3kD0aqFSOp+FSZYspWbPUiUMWX9LdT0dHNY2M2XMXifYC2KZjt
WQFZAED4XQ7ZDyoPNu2GohU3et3cqRNA3Qh41ARPwxnboPZJvqcQmeqEG/N1/ZVv
vg5+NRp0cykFu6p2vcBWVmIg7s8j7A==
=49Gq
-----END PGP SIGNATURE-----

--Sig_/Y=9vF1foaCvbzwNSF28c/ww--

