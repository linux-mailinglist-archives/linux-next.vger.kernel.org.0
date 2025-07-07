Return-Path: <linux-next+bounces-7385-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2267AFBECD
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 01:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7B761AA57DB
	for <lists+linux-next@lfdr.de>; Mon,  7 Jul 2025 23:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A2626059D;
	Mon,  7 Jul 2025 23:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DZdFm7fj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CB28641B;
	Mon,  7 Jul 2025 23:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751932282; cv=none; b=ruNZtLWQDmp53NlMOne1lFJ27RycVTJZKmrtjcOGuD80oVf9jITKqWi7XyC63HZ05Wt5BOrDCBmQkcM6RbFbJX8vs/jthoKQbeWs55FizCvwYDi1SrYuA006KMeypdkrJe2YLdlWFWiJIy9nKlr8J3FhMglsmn/BRwjLvN69trQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751932282; c=relaxed/simple;
	bh=3YPjMLZTVygdM8dEsnVyxD48BuxrOc3p56jKv+wzmFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P3x2rVryRw3ziFl9qT3o6tVZoDgkNtcCHoKajO3tk1jHtWNA9Fo+pp/p7Airz8xuWOvQowgqgpQIqpq+aNcSjDDmWMPXgTT/AXsfzIOVhkX5i0sE+coITmSDy+t6a9SzKbGBn4QuMKGgNeTo8974DaOvDjKmJpRN9kjjsiLvp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DZdFm7fj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751932223;
	bh=JO3i9JPD8qnuRTsURPAV3l4t79n+m7y3BVBVrImp4us=;
	h=Date:From:To:Cc:Subject:From;
	b=DZdFm7fjBf/HmoVE2c4YJ+hoa/bKV9twVtr8l+FM0z9BAQH1VhU8fTGL07cNVx1gf
	 VbeU/6YW8ZnIaOTQUiSi4dNx+JfVu4maLik0eGsxbLBfDwkI92NSLZvfdlWd8F/sQm
	 T5qmBpksU69Ose2qj/VEiocpBBr5ucbIIDmdiHGwhCbnc8Ke/fHoNeDgHTL3OcOFqH
	 5Ivif+0svhvmABSZaDZTuBbUQ3XQqXTMZKpgkSGD3YP8KkPks5OS7DVYt//iqtskgT
	 jnsBZVCKXvRt2T4U3UREvZk+7OApxzd6V3BOhv+aTywXTdSAFqSjygOzmRJObK12mz
	 CVivtFiGU5Nmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbgwH3pwxz4wbW;
	Tue,  8 Jul 2025 09:50:23 +1000 (AEST)
Date: Tue, 8 Jul 2025 09:51:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250708095118.58337fec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7Uxg6u8CmbhdC2RObd8gaUK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7Uxg6u8CmbhdC2RObd8gaUK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the vfs-brauner-fixes tree as a different
commit (but the same patch):

  8c0bcafc722c ("coredump: fix PIDFD_INFO_COREDUMP ioctl check")

This is commit

  830a9e37cfb2 ("coredump: fix PIDFD_INFO_COREDUMP ioctl check")

in te vfs-brauner-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7Uxg6u8CmbhdC2RObd8gaUK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhsXXYACgkQAVBC80lX
0GwQNAf8Dve1qviY4ELOddFMC57/DhJvb/TlhLloTYpX+4vbURboDteBPzl+gdFc
p1t8xQawM7t/s/ZE6VxBtTVGa1h9wknB0BVcdfg1DR1FO8vDNmJW03i1+lFeYYwN
gMHPODrBjCKj0t9rn3tX35xvzc9iozI6+aMBIDlyK3578FFUL0llxE8ydhQT3ojX
nSpfLya/k1P4g929t9lwtKXY6YrkORZnOi36RnSBqHLf/Up7s09TmnBRtna6TjSh
rVoMAZxumqIs+SzJpmxZJOHNpviMIEuD+JzhorNJKRK/fLa9raPcnnnaWtEv8we3
I6z8TUeo5BdxI8y+qlfkVRNdGAb+xA==
=Wc60
-----END PGP SIGNATURE-----

--Sig_/7Uxg6u8CmbhdC2RObd8gaUK--

