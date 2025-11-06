Return-Path: <linux-next+bounces-8874-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4389C39111
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 05:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86D754F7D1D
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 04:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067B82C15B4;
	Thu,  6 Nov 2025 04:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qxo/g6Bu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832712C0F69;
	Thu,  6 Nov 2025 04:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762402268; cv=none; b=fmUWjpuOHgW8J8eUdmeaykupqXGfyQ0n4fYf9xgywgDLjuWKUJQTMgheGg9nW6X6BAKZgd32ESZrtJd6g/5oPwuk5tqH/79QHN7I9urpoJBa0l+3Mx8hyeQZbIUI5rRQpawsx3/p1qtNW/Q4pl0Otz8u72tWdTeFqfLh9H4YE9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762402268; c=relaxed/simple;
	bh=1tg0dwOIAcFbLHuuiHBqItfTKbUC3lvuBKcP1Y8Wenw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ADBCgrJmye6/jSvGNam7qeLJHoDri2X+KrM7je4eK0PFyEPRpiPhFB5TiBZ5oUkMP63uPTZZ9guz2x21BWCGoM24fHeQZyQ3VLSlWpqJfZyoajIPNulps1ihrpqr4CR7qFehHYfuLfypUaHzFIejVxBRlfLpVpwv8Hsjo8I4wt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qxo/g6Bu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762402264;
	bh=dFhmOsuufQIFucHr2acBcL8uU3+hPmDNDhhDUdAw+vA=;
	h=Date:From:To:Cc:Subject:From;
	b=qxo/g6Bu/w3eeKHcWrDeWnxE3JOes6TvN5PVmF2JZJc7HQrKaeTS88ykb+Acjs8Af
	 Pq0ZhF7abAUiiqEtkzjluwET+4o91ExdUX0M+pOr/RE99jccTZdj2LXXK/sdLa4d9X
	 L4ivZkh3HtWSHdKRS3QR9mUqW6n+enQxdYxLo2pZOw609ZGHf9TkelhQ5K769qkqLg
	 31BiCgcAMCARoko+X7XJdiA0H7xqiw0BRQFgqcLHoOBPuoVM5APSxzHSmSDeUNzGX9
	 rja55QqVu8pu/we/gpy0Yi6ASa9DZz3yNCprAh1qxpuJCXZov+pp9sS5zopXpGh85x
	 /MUNxBd9avK9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27zD2hnCz4wc4;
	Thu, 06 Nov 2025 15:11:04 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:11:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Lyude Paul <lyude@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20251106151103.2f1d5e00@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bbdBaA5aOyB_sDIilLsVTRs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bbdBaA5aOyB_sDIilLsVTRs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

WARNING: drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 'shm=
em' ot described in 'drm_gem_shmem_init'
WARNING: drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 'siz=
e' not described in 'drm_gem_shmem_init'

Introduced by commit

  e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem_s=
hmem_create()")

--=20
Cheers,
Stephen Rothwell

--Sig_/bbdBaA5aOyB_sDIilLsVTRs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMH9cACgkQAVBC80lX
0GzmpQf9HjdhNRZjXpidtT2NggiuOAIxYfU3uPc4TDuMHocL605O232mp/STyuys
uYMmeUYxG/D3mDVV1T0IGj+9K49Kr4yajUU4dI98ODQETHMCdUZyDFSUoObvWmt4
3If6aEBeoIkC+W7Dsxve+5+Z4HatWVtXnpJzFZ/cdv8cGG9ll/Dmz2DZOMJjeMGA
EX2z4zFWz6GQQ1yCk8JIH9x79SN8SCNpGUJcnl6BUHYCXCGz2vFE2GYbf0gwgh4U
TfuJDRexsPyesh1AZGqlGzraHikvdKqgu628wKJb4EDkGNz1zXQNBcx3eMEU8lxd
CQWnKsifXzOEFntXeGxK3PByXiC8lw==
=TGZG
-----END PGP SIGNATURE-----

--Sig_/bbdBaA5aOyB_sDIilLsVTRs--

