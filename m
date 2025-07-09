Return-Path: <linux-next+bounces-7446-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50BAFF46C
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 00:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C9993AF565
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 22:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C8D23B619;
	Wed,  9 Jul 2025 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kgBTNeP2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FE7801;
	Wed,  9 Jul 2025 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752099036; cv=none; b=A2r1dlKgLkV9tybombjBCaejFny4nN8+IoDKvhK5RNKxyeJ7CNUD3CB7OE7gQVyDExWWpXxJwJlK8DyfgaqD72DgQABCQ0+MFAtVmxuoZXSY7yav1oxuk8JEMHgigeyqNITIomUoZdqegyNC8MK3DSh1nvNnwUZHqpNCdiH5I2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752099036; c=relaxed/simple;
	bh=Kli5mpE2XR1tiaCFbgzcWpNzsuwIqyKD34CDIqyDY5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L+qIyxtTAyR18DmGIIA5ivMKqe2T7dl3wd1KugpBWyCbx9pzgLZlYt8qTEwTc/Vouaux4saebdxSFNtxqe5xF7pxBKi8WYnK6BVU4Ye2eVwo/gzxIE3mktYWsC8nsoqABHuLlBrpEmeSH298TzHsFKJ+60phQLU331fRDweMgW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kgBTNeP2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752098959;
	bh=WGbuJLiv8BwZCgJbQipAujpqHvAEQvW+k8oJQX8JT2A=;
	h=Date:From:To:Cc:Subject:From;
	b=kgBTNeP2vDFrjFzmb265wTXgq88n/jKWGuMQxx41Y0xuHOq/qD9NmCejsaQU3g62V
	 H1hDVXr1nL9/qKiHNsl/yUmLUt8wequCECBC3wUX4p1jQhDm5uZ7ILaLdfd7OTyfGT
	 aq5MA5xAHMoI17tqepAvuG77k+w41q2bUleHiwECxZ6Z03aHlEf09CfJJTYE2ePYeG
	 6vMtXNPZ4gLdsp0qP+fTnjHd9w/bHc+JyYBkXxjoA9VYUkJfWdJ00dCUzZBTSMcizS
	 WgUAPB3ByBHDFkkBrKzvWyHMrtse4Epvkwo/aduvPaDKXhKomed+UiGdnTNKsKR9C+
	 lPGCzLrHTcebg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcsZl0QKCz4wy6;
	Thu, 10 Jul 2025 08:09:19 +1000 (AEST)
Date: Thu, 10 Jul 2025 08:10:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sergio Perez Gonzalez <sperezglz@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mmc tree
Message-ID: <20250710081027.318d1d83@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/suL8xZzRifMVoRve1IDsCjJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/suL8xZzRifMVoRve1IDsCjJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7aada8ecf66b ("mmc: loongson2: prevent integer overflow in ret variable")

Fixes tag

  Fixes: d0f8e961deae ("mc: loongson2: Add Loongson-2K2000 SD/SDIO/eMMC con=
troller driver")

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/suL8xZzRifMVoRve1IDsCjJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhu6NMACgkQAVBC80lX
0GxP/gf8CHsdVBUdlCicUIXZdJUqzPG1qH+7QG/zQtxZb6VxLH2zdsQHRBVbpDAB
Q2Ir6hJHCy87OyJIHYhAb8h6mSqtsy14aaD6JYxZL0QpoQd2gZ2NhlD5yDatiLyB
UX0J9h99OccXa+p5hpABCrv+AOItcpJdSxgGXOpB0Y+ao2V6uUGx1vXeaF8dK1kx
SKnv0v89jZIqdu83GOFarL4qJsC48Eb6MA7vTPOsdNx6ZBUy0M8tlVorMcr2qj32
hpY8FH7CITxQvaUnTWfJJyCkRH1UpqX8kqNNYEzQw/B4laiDqcXCKbenWuyMRr0T
J+hgxHVw0IW0ItH5/kj2q0slUhyA5g==
=xvZY
-----END PGP SIGNATURE-----

--Sig_/suL8xZzRifMVoRve1IDsCjJ--

