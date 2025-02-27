Return-Path: <linux-next+bounces-5596-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6831A48A9B
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 22:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2254E3B67EF
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 21:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1755D227E83;
	Thu, 27 Feb 2025 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bILzo0OY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2792B270ECA;
	Thu, 27 Feb 2025 21:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740692007; cv=none; b=A2wxboeFsDLJH/hM41a6xWeHoX721cXIqEF0mk+zVNjv0JQ7lXMWcDbGWxVuHreK4o3WCUiQ1Fsush+F9oG6V9fKLN+gNATN0ZNTZUkt29+pW+pkroI1z8/FPQGqmA0rb4Kdgo0pYW8xCKnSIaqANXaHle3DT0XNjVC+lRMnuIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740692007; c=relaxed/simple;
	bh=A7IYSizZTizig/Tk1UV473McV8kLlCEq+JAQvQsW6yg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gEMu9E7VxjdrJqW9ca+q1qXaF4Li8XUXn8sv9glFAangbRJ7VsJZBekEfaMN7FROHEaBch3jb3r39EHy4bEIjQJdB/QKlSxhhwkQTEDQpXHIQOTG3lwzXkQHfUqcIv0At6HH/7NguqBm5KliVMqlrGagXEdYyO6wGV39ZrThI+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bILzo0OY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740692001;
	bh=WTS8Q4RLwrClAXjD7MGFKZ+JWwquOzgx7VpIOnxxkGY=;
	h=Date:From:To:Cc:Subject:From;
	b=bILzo0OYuVxqxz1bkxmV7Uinu92jZ7Qb3H99JMr8g3FBvhNxeaXDfsDp2ecKpbj5R
	 vV1du+hkqOVvdTRHfphPfx6rbwC8G3RZ1DiPhl5RH6VEouB/2vHy1CJuURwqeUB2GH
	 KQ30CAuCUhAuXYDqFFTJdynyyN45y8vFjXiZmySsMF/0Fpsd1jBtfmUF2DRbY024cP
	 r3m1FoxgbgpORZ/B6eVClkvN1mqHklMc0Rg6zq5ozyHd4cWuTEyM/fP9BFgD2Dm5Yk
	 U91mqiiRS7e8PcIdfzVv5gt51TqMY8FYp9Tp+W+17eAdQPxrspbeHKlxinObC34Ldc
	 mpaMwi46+4yfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3l2910vVz4wyh;
	Fri, 28 Feb 2025 08:33:21 +1100 (AEDT)
Date: Fri, 28 Feb 2025 08:33:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20250228083320.1c42a84a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=Yg+UUnvXCDEgzdRzWebWUN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=Yg+UUnvXCDEgzdRzWebWUN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7d74877801bf ("drm/amdkfd: Fix Circular Locking Dependency in 'svm_range_=
cpu_invalidate_pagetables'")

Fixes tag

  Fixes: 3e5199134e47 ("drm/amdkfd: pause autosuspend when creating pdd")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 438b39ac74e2 ("drm/amdkfd: pause autosuspend when creating pdd")

--=20
Cheers,
Stephen Rothwell

--Sig_/=Yg+UUnvXCDEgzdRzWebWUN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfA2iAACgkQAVBC80lX
0GxVfQf/Qa1uOMUImnN/6O01pxwmcQu9LSMyWhKBaNik5hS70z2+8+h+CA90KwOo
ApJH7jpNUHTCPHU0sQz/TnsrmSVdvtj0QAUtOItCTc/HeQUUwrkvU7nVYwfvdeSL
u/Iajii/bpnkEOz9CVC11ZENhQeiEbpwjNqgM3Lysg12Yxmx/24/zQ44gVv3uHwB
5QHNTqej/F7crU8Pu8ZPtTwYGk0ihVJE+XBBl2f1w8vvutGF37s/4A3v/jCs4Dmi
dshJ7f5QPvE63DUJ1xXXQoECK9pJCbkxKSDmtgZppYLXTcEm5heWvAWN0OOgm74d
jkHUDbQgieXlczUo0xDdN+E0axMTHw==
=QH0A
-----END PGP SIGNATURE-----

--Sig_/=Yg+UUnvXCDEgzdRzWebWUN--

