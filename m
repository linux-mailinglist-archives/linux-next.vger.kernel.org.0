Return-Path: <linux-next+bounces-7406-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E3AFC6EA
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 11:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41DF71AA606E
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 09:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57261221FA1;
	Tue,  8 Jul 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EUokdT1x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586B121C177;
	Tue,  8 Jul 2025 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966445; cv=none; b=KSvK4LCfjFt3EK1AJE57ltrB/kyRhRIEM2aKNSHTxvhGF4HtiVELbJ/an+fSQWm9kP/n+fOylblleykVgCLsZ+jmF7ZhFyWvRQLNnBvk0u2sLlyaLlP2I1riyydwomGojOQmMHGpDqAyMNfFfSrepXE/VYA0bVUDbpXgcEph9Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966445; c=relaxed/simple;
	bh=pQ6xKwLepmmdEKc3X7qK4fPP1TniEWWLIjoj2byf2fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cUdCIMku9F8Thn6Msuxfl4xtW3GiumZ71Pbl2vMBxVAxOSMLnQ6dT3KRLq/RR9I3K6xe7s7QnUz+Ks1XGJMqQUm9O6Fl4A/3N0DOfCGYsE9xmaebx0juyDAle1tkViF9tnXDjK3NcP4//pwGDCIuB0S6uERC9qUg0MBLkPfkMBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EUokdT1x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751966380;
	bh=b+pBBLC9COe94gNaO140s6UhlP2EQVfL4jW3+S8hJ58=;
	h=Date:From:To:Cc:Subject:From;
	b=EUokdT1xFK9YaTKyUC+4Cu1bWKOQGP6aU5MuMkRIdSg7LIBUYGgX5F0vuxCn63EeH
	 zXFsKXwHo276bDko2uXXnpGoxwWLTkhLrwXwDRbJX0zAlxHcJe6je7EYQk+aYTGHut
	 1KIRUhI7SIsjeqsFqwEW6LnI3uRGU7ZBEegXAJC5T+JgxOcxEoUnogyiGHK4fbM7Ce
	 qyMfyvw2orYLxA3UCL2+A5+nqjZYNfxDM8RA3r9q/BLmWVwkdYjleGdih+2rRNJG1Y
	 RHLG9dSTYV4HOv1KcDTQte4objG0EFkbAozrxarAjRIGkq5TB524RIzONt54rOPhLL
	 Ye8h/EhWtNq2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbwY84vJmz4w2J;
	Tue,  8 Jul 2025 19:19:40 +1000 (AEST)
Date: Tue, 8 Jul 2025 19:20:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-msm tree
Message-ID: <20250708192038.6b0fd31d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=+JgOqK5bHMU50bS.bk+FW0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=+JgOqK5bHMU50bS.bk+FW0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-msm tree, today's linux-next build (htmldocs)
produced these warnings:

/next/drivers/gpu/drm/drm_gpuvm.c:2445: ERROR: Unexpected indentation. [doc=
utils
]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2447: WARNING: Bl=
ock quote ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2451: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2456: ERROR: Unex=
pected indentation. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2457: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]

Introduced by commit

  471920ce25d5 ("drm/gpuvm: Add locking helpers")

--=20
Cheers,
Stephen Rothwell

--Sig_/=+JgOqK5bHMU50bS.bk+FW0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhs4uYACgkQAVBC80lX
0Gx/wwf+PFqhcpaCWZmbLgQnG7aSqEY8JXwO0cz/I/n2pgQ4/V9vCidEsIDvDWTz
qrbJSGoO78cHW1dzRC/tuJFtpV1iYJqraoc8as0Um41IWB1Fw6QPjdJin1vP7Dnc
B6L8KvbufbMpxPM2dIs9lYFt+6fUEp6v92aPqir+J5lfT2tLllD+rmaxH8ua5CTK
8dLjkOAW3ypF8JzYxW+CQJu5dEYNpG4OFVtYU/Ca3xhZdpfLW4mGNlZQjgbOJZfE
m4OkB72YJToI6Vyjaa1gV7k5GsfBX+02wDkQHUb6kPdhvFoNMN/asqRG/YNfTSMk
WfykdsPNsTLcoh0XasIKnET0XEZ+4w==
=B7Fy
-----END PGP SIGNATURE-----

--Sig_/=+JgOqK5bHMU50bS.bk+FW0--

