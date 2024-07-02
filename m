Return-Path: <linux-next+bounces-2807-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC6924B71
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 00:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2132CB24D54
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 22:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0231C0935;
	Tue,  2 Jul 2024 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GlEy/DVA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12681C0937;
	Tue,  2 Jul 2024 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719958180; cv=none; b=kJoQOe56gWv9GVZr1zwmpXbWxtIW5uRPvCqjz8Xdm3mYE0je5K65K8IFizUV1TCgJcfs4J1w58vHV7fVOwAI7TFBbdnQOwn6oKrNeQA5U8YWVsGCJoj4chZzc5LSl9rwCbAad1+n3rULRxLXmot/TsbHdJxjXcceaWgHjB5Opao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719958180; c=relaxed/simple;
	bh=HneT7Zg0Pf23OwjE62Awq/LcjB5/GI8zOXPmaFXRTgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rGxux8287JgfYyOE5HtIV1PUaAqoYYha+KVyHvQpPWdc5Lcs8TcFhzCwanNe1JRrgL7tUjDKgVu7X5rqk+LLbWLNJOFZDerlOIVUZioQAWkx2r4q7ENzGfmvJpZGV4ZzMUnAzI0CcZstNg9g0ZHTwmcXTscuvQ8FYGVXOpk66OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GlEy/DVA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719958173;
	bh=1DMbAfswIQcxH5Q12ImA4L+b9UxvSpiTqVZ53v+IvhI=;
	h=Date:From:To:Cc:Subject:From;
	b=GlEy/DVAtrc+wTkc9ktUD7tlT/+I2Y9dVHtxZyAtHEP38OtUCE0XxMUG+n8YKffSO
	 n/yC2/gavDniVcxSuKe+YnD+Qyuqg0bsj2J1yIE1DJRLDtonFCVtSQsTUpNIbmdXzd
	 XuyqOFi+gS+fVb0YhFjKF+iIrmc9MU2NCVvv21nngLY2tgjy/fD60TKd2QwXDRVx5Q
	 ACEZZ8OJ1pHsK8D2Z7YuBg/J59biyEL90Bhi1OvY61FqMt65vaX6P4Nr3fkpbVNmDn
	 A1Jr5y5zoLdFJzqOQrOD024m/aLCPwuwNDhjWjtiI0ShuGTpRoP1Ff4qKFLY0EflW8
	 hT+v6+mHalzQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDHBf6pH5z4wx6;
	Wed,  3 Jul 2024 08:09:30 +1000 (AEST)
Date: Wed, 3 Jul 2024 08:09:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <20240703080929.319d3e52@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=uLm2ThrxjEsSbDbsMPY7l3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=uLm2ThrxjEsSbDbsMPY7l3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e968e6d21d03 ("lib/build_OID_registry: avoid non-destructive substitution=
 for Perl < 5.13.2 compat")

Fixes tag

  Fixes: 5ef6dc08cfde ("lib/build_OID_registry: don't mention the full path=
 of

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/=uLm2ThrxjEsSbDbsMPY7l3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEepkACgkQAVBC80lX
0Gw75Af8CTrF1A8Igob1jit9YI5K2ceQQaK+82rKIbMJcvXWzdzvTclXR+yVb7oz
gpGy0hHeXRBRt16ddGnDZXUGTYo9z2YE1YhqOWmh5QfJkUaxWIPKMjKXDOOpJ9Vf
pG8ddeg6ZeTf8X09AyKWcBbE9Fv8kMi62DNRkJsJeVOg4QGZxxvCDc2Tv0MRYZpt
O7Vncqldu3r4HxkoRUUGOrB2WxlehkQ5q2nyZc9gBDKXMLnONP2ex83VelDdhAOv
1dssMI94nUxOQ8kJEuSsiVmSKnwd9WGKdPCIwEhq2EWbLO6oub4DL4VMZ9K2R1eq
3zIyw/PcnIsQe4kNJre7RX+4LwLv7A==
=wuYU
-----END PGP SIGNATURE-----

--Sig_/=uLm2ThrxjEsSbDbsMPY7l3--

