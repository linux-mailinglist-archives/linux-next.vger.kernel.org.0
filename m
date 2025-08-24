Return-Path: <linux-next+bounces-8081-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C41B32E7B
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 10:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 884D9205834
	for <lists+linux-next@lfdr.de>; Sun, 24 Aug 2025 08:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86FE25EFBE;
	Sun, 24 Aug 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ab+QWU95"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590C03234;
	Sun, 24 Aug 2025 08:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756025181; cv=none; b=uVWHTJsYENG/KJ4heCgEdyVJDhTnXcREG6ezjuWBLHGL5RmcYeodHMoGrm98dbdTYL++xVV0lmxidy8tgQ8A2I7fjIFaVyRAQgJdtno1E5BGfvIZy6ELHPL9VsyJ/4HrQCSdYkDlyWPP8qz3Tl+xzpocXrrKpvBNeBuh4z9kLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756025181; c=relaxed/simple;
	bh=q3TxZz+hY4OgNmfzGpL/wjJtS1hO0cafNr4K1ixc+Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SMg50vq30gzrKfNXX/hk7H/85X/tlc6E/y0mgVBxjbxdyXX43iP1CqVL/77qAQhwArFLBRD+5PmKHR5i8rjomKVXxG04zlMfmOIuxe+5ea3UjpH06fW8wUMSmZrXK/vgU54hSLCWtTO9ooDukhUhQqZ+r2hHAf9FapgSaw0/uuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ab+QWU95; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756025167;
	bh=91Nzi7Xyg33pZmoRVfLnc4gIdsyMm0HV7+DxdzihZxc=;
	h=Date:From:To:Cc:Subject:From;
	b=Ab+QWU95LMyHg2gcXzpoXF/jKO1617GG+TxZfdSdFHujLPgMzpzkkTGqaRa+7KUQS
	 44X7i1/kDGr/DcGUST1QalVFF06UKIFBTs2ls0ZTD+Wf1Kj8iu/eZ5hZ+BVobA4Npm
	 Ptj/7+mtSOq1fTWCeqXzIxDjEBFpQiNEL+ayQgSNslwJ8sm6Y9S4rTV4e/Hym97gnD
	 53omRklWq3coiYc35qXKvKmW0J6X2IW5EXj2t+1wKmoEGBVNSYP7T30xdzes5VhBuB
	 zTOjSzDTjToMHIrPCqwYjp/pbVKXzUPxgdZnYFdeUE6K9JCZFjb8jJQyBHBYgyvF6d
	 fniPiYSszQ7cQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c8nZl0mgrz4w2D;
	Sun, 24 Aug 2025 18:46:07 +1000 (AEST)
Date: Sun, 24 Aug 2025 18:45:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the mips-fixes
 tree
Message-ID: <20250824184535.65e5b40e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fL2iM+oGR/+h5ulJnh7nkbA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fL2iM+oGR/+h5ulJnh7nkbA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  8c431ea8f3f7 ("mips: lantiq: xway: sysctrl: rename the etop node")
  7b2823292178 ("mips: dts: lantiq: danube: add missing burst length proper=
ty")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/fL2iM+oGR/+h5ulJnh7nkbA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiq0S8ACgkQAVBC80lX
0GzofAf/d35bMPj0pzWfCyZssf2G+VoQO1K0pNVDS24G2lp9HREkHrubPRasRHAr
ctmSK+V8+Dzho9Q0Jd21QqQXkq9V5iw6YVwavFzsjqmxaP/MzetfoMCF9Xa6O86j
8gF4S5efjAcj/JzIvdFB97H2mrBa/XgJL2lhXShbbdP9aa3+Whmk463G/39+vfYR
Oi4QhJY4yMqrMz5YVHDrBSftlfRf1CgVF1ok1MIl6zui25Gs0hkyA8BZkHwPwRLT
zobTPnGogk9TVPUXrw5QrY3fIZhppERM6mAJrZ0jI+eacHstGx3V6I5BI9DvUwb3
H+xSWkHJzzbxC1I+IL5q+coLoqqLAg==
=bqXh
-----END PGP SIGNATURE-----

--Sig_/fL2iM+oGR/+h5ulJnh7nkbA--

