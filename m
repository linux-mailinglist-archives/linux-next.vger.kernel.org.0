Return-Path: <linux-next+bounces-8178-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC9BB42C47
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 23:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64223A00F13
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 21:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356A62ECD16;
	Wed,  3 Sep 2025 21:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sNoOsf8a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D28C2EA72B;
	Wed,  3 Sep 2025 21:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756936533; cv=none; b=RCwe+X49USP5YQD2sKjEfogLshqCYmPQJr/wNxR2LSwd7rrXfiCjIcUwfzKLXKvEOic4SWC1H59esyxA7SJKxdTZXpdtBqj+cA+r8eBm0GXp//25VNZWi9wROxrIFd4mtK5xh+qMq36W0vj6wK++5yfOz25ang2Dgx4NIEJDg0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756936533; c=relaxed/simple;
	bh=qbgXaziuWpUIVTa4ZARCVmzQaaQ8YAeH29DbGRn3Eoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=emxVCnudN4GHjhg47fBxN7AoyhFM2d8Df5X1FNTjlLBxQoXkMJqZXUZhoj4nG4GW316l9tPHdcdxRHM4HfxdDP0ydqOpkZ6ZbG/z4JlWmkO7cAfwxS85+itTW0WDRJ3OcMkLrfPhf6ujIibiLFTnwJGKFaIp81Y4XRbqV4n3IoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sNoOsf8a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756936521;
	bh=U3GruG7NnNtODc61tr37LH/WCiD5v/QxymIz1hjqRWA=;
	h=Date:From:To:Cc:Subject:From;
	b=sNoOsf8adjPZchsH+ltugWMgrOfwt72es35nHSS/2Xmzx3rfihdAnj5PDgCTxfYDe
	 t8g+QsDCeJuotgC5Jl3/E8a6HgcOCH+ro/0qfbUx3S8RmRkB0GUR75bAuyNtgLewV5
	 e5L3p8fsa9hxcm/MzpnLMrsFBZHTJrKw72Qczo1ijmTZFYMpUDL1COKgsoj8cPcZc+
	 3Z3/S6sQhkwZ9friW4FVS7/J2KWr85TTmetLkD1uPAXC0n5U0DUOAOYAw1xqEJlxmx
	 4bawejjiup65jLeeZNyGwZVjJ1/B4rg9uvbUDRb6MUHLG9EBP5O2buSAYXYYTdLXL2
	 HZ3Z52XheiFHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHGcn02dJz4w9x;
	Thu,  4 Sep 2025 07:55:20 +1000 (AEST)
Date: Thu, 4 Sep 2025 07:55:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the broadcom tree
Message-ID: <20250904075520.41151515@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b_IxqdZehLV5Eciwv+SCRMU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b_IxqdZehLV5Eciwv+SCRMU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  2f8428700036 ("clk: rp1: convert from round_rate() to determine_rate()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/b_IxqdZehLV5Eciwv+SCRMU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi4uUgACgkQAVBC80lX
0GzX3QgAhAB5RfJGMcG+IAVy5CvuO7Zvh6ik73GorU5zDQ/jqsTcmaBPPFUmpIk5
VGAZO+EB8D/nbUNtkNPlO0WeoLUZIFpSVe2JAOfeZSP+JRbu7/DeuCeYLoOwwv3k
Tv2u7bnsLTScMklPmR/I22HiDmsXThRSBUv5MWtsDex7EKFPukMia4t+utze7U3t
VWcl1iAzpdvsEmNM5Kn/t4fxM2/VvhHjpVefuxdAy+DhoP3lKChVnXCRzzSw4Gmp
K112+lho16+QsrbEz3cxM0kRT2qkxONKaC19jIcgvItYYEmBzuqLC+MqXRr80bwo
xHmq1wVstR2rBSrn3jt8Wh9F5f9bUA==
=T7nO
-----END PGP SIGNATURE-----

--Sig_/b_IxqdZehLV5Eciwv+SCRMU--

