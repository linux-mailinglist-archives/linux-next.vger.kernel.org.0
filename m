Return-Path: <linux-next+bounces-3410-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EABA95E56C
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2024 23:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89426281729
	for <lists+linux-next@lfdr.de>; Sun, 25 Aug 2024 21:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87A347A4C;
	Sun, 25 Aug 2024 21:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YlQtpNLQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B125510E6;
	Sun, 25 Aug 2024 21:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724621540; cv=none; b=ke/QTplvr8rQow6JrhfQodMX8qwIg/AHSr+JE6qN35HY6u6hd+2h0bL7tuKvvxyn4KccQwYLbbEOz+/geWkP477O/aqgs2rar13ZyAvg6RRunqVncQAUaaaRl8SMOfPscuigKFAsBcOnoB7BMY4Xq5oGHXdLsrtpeOnPsQP+1xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724621540; c=relaxed/simple;
	bh=ipe3QSeakfVRr1oL4QUjUBB48O381ZOe7oTuoRCzf7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DxGaPcct6tbFmqnhgNaEojOZ77pcLHk1ZG8BfsUXdMrTl1aGdpLB0mVqM21Y7O/MgxYLuPmGJV1xyfFF0mGy305Uzy8BtY9ky9+FpyAruqqZ7HGCpVwcveSue13eFlRYob/4HzX1pDFHxSFmAqatckKeizyzt5tZcyEEwTNSuJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YlQtpNLQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724621536;
	bh=lbKRxfV/EmOmyAQH5hDXai4c3QhKtKDcKBQqxdaqVsM=;
	h=Date:From:To:Cc:Subject:From;
	b=YlQtpNLQuIN9Yso9zmKf0NhjUjReAywHahTg9CbUCQucysojnPWjcZ/lZJCMTyteb
	 rsCYjRxxFATwoKCmgPD5BMv0VMFv/hvRDOArxuLd/lVuKFB7sN6kfBkmlYX0hhdfuQ
	 HCZgUkBBnxT8MMVBvdmprCY2d3f+s9vP3ABT948kqntq65LhJBii898V4vOsBIGxy9
	 z3d/36jFUoe6zUpgHfUj9y5ELEaAb1lQtRRHK+wmCQAa3laLnvBYDzIiLywjvgYNRb
	 hhzE3WRd+4dhnrvtWs9MoHJkajg2CxUP4n2t+LzACQS6h48cJ21DGDq4LzriQS/Kn2
	 6egp8bhj4kzLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WsRpm5ztRz4x42;
	Mon, 26 Aug 2024 07:32:16 +1000 (AEST)
Date: Mon, 26 Aug 2024 07:32:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bitmap tree
Message-ID: <20240826073216.5c866e39@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7uSw3GWX/R3dkU2oFSf/MSe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7uSw3GWX/R3dkU2oFSf/MSe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  227428f1b724 ("lib/test_bits.c: Add tests for GENMASK_U128()")
  d39bb8bcdbb3 ("uapi: Define GENMASK_U128")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/7uSw3GWX/R3dkU2oFSf/MSe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbLouAACgkQAVBC80lX
0GwukAf+PYacsi/tz8+5/uKq5B5NOVHNWObqPSzEWCJ/C63n5oW8BuendNvpMEyo
Jc5LVGGTQ+hbyj+a8sVRP4Sj6kGCM7TEoDA704WG+mU+BemsGVYS3zBQfvbN/Agp
VK8Sy8uw7INf7HiLfXAnDAsqEgRYc25rFLacGEOKQ4hS6zRUQZvp74ah2fwXOOOm
KFuEBY/rQHXe2iIqHmZEA3hR5kLJmP7t5+lJNEehtR2sJGvAsGOKPzEffWcQ92uL
KiS/9kd50i1i9OqUR88w+mW/KbNpt/jUYYaHHlwyxrflTdhYw2TvPFQidhiIE4jz
3Q29PcOpOdRez3jc52M71tmWWKSivQ==
=et1M
-----END PGP SIGNATURE-----

--Sig_/7uSw3GWX/R3dkU2oFSf/MSe--

