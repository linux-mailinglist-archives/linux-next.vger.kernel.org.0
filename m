Return-Path: <linux-next+bounces-4316-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 199179A1B96
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 09:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5F0A1F22B5B
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 07:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792751BAECA;
	Thu, 17 Oct 2024 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nWlgbTMm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989EC17965E;
	Thu, 17 Oct 2024 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729149812; cv=none; b=dbvn1Soz3x6sU7McVxr5gidDFwVTACwxAGQ5Rmh7v8t747oLD6Tu4GxpOrF09FaepVJTl8HO9Wb5usOymbf9vEq9XbIhoB8RQi6wtKpqqz9e1gjDus7m+hqWQUj1fLCvc4SMnaQQ3cPo/jMJjLfYGHXr6npNj+TDXbDEm0LsYhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729149812; c=relaxed/simple;
	bh=gaNYT1wbbBvCgWZZlW9y2ETIwJkjkGkLYpUVia7y7Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z1Mv6U+ufbQox2EdEOPLEaKGVbeKNcUObZ79TdAwvPLRWWKxeEH0yUbXxiDIoARnvDfp5/OWeypZ2Kdd7hCMFC/P6SGd0ym4R1/6NH8XXo7ExExU6zPcGejU7YD/eU0+f1brjYPGbrXMtizLa8RANy9cYJyEyQS2BMkDWyX236Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nWlgbTMm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729149807;
	bh=fUleCvwvUcKBwI2BLE4hJsaayNqsBIfT1om49ufLz2E=;
	h=Date:From:To:Cc:Subject:From;
	b=nWlgbTMm9pV8iO2O0xPY907NLO6M0EhhaQSPSrvoWWNX4pjiMvbGOOCibtWkzzLk7
	 H0+tT0S4iS/1nJTfKt1Ck1ulUEWSNI5hrzkEJUIjwek4Er+yoHDFXm5Vm3NNRnNJfq
	 75E+Vytpt0PNzM/jzrVR7P8Ejq9OWWUETh+FRYaQC9N+zwp+8CDG/WlsfaM+cjxoGg
	 xv4DaW8ACNRRCQpJdoH7K8OyEihhk1p3VqAxj8IFPSc+dA5Y15+9ISo/rqFLy4TrIc
	 lbRzpBdLreII9K5fkbwDcUHk230gR73Fe0oUTJKQNWxHqOW4RL++r1QnGqsM3OvId3
	 gFO/9zEI8kZ0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XTfSv3Fv3z4wc1;
	Thu, 17 Oct 2024 18:23:26 +1100 (AEDT)
Date: Thu, 17 Oct 2024 18:23:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Vineet Gupta
 <vgupta@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the paulmck tree
Message-ID: <20241017182326.12d8a854@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z78Lrj0mE6nHvW9/itpVush";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z78Lrj0mE6nHvW9/itpVush
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arc-current tree as a different commit
(but the same patch):

  8b5e6986360f ("ARC: Use __force to suppress per-CPU cmpxchg complaints")

This is commit

  bb5d272ed94d ("ARC: build: Use __force to suppress per-CPU cmpxchg warnin=
gs")

in the arc-current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z78Lrj0mE6nHvW9/itpVush
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcQu24ACgkQAVBC80lX
0GwX0Qf/SZKXYncC+n4808Vtuq24Pgb1mcwJfDUgptBhAVARRpdxZbnfn9kp7nta
xERwsco6iJ1Igd/VqOiyXsEu3fbY1C+W9Mkk6AbQtxhTtb3cQ5atCOdNyhvgiQBr
/Qq7GVqMUbaJonZ67WzAH0lTOxOj1EutNF3BqDrvT3+xYOzXFqQF/HJJqMo0kvMS
oKLqp9NtFrOGeWtaDLlKEIeJ9LCqtxTlEd4fsGdtbx3N5J5XNIFTOwOIVNW9OjDh
ZBwRg8/UmB2bXq1eAoJ5eTiHXoIxVNkN7RDRyFQrn2kBvXhDshGQ/8PNUTUPgYYu
4z+IQ3nYJElYBI5Ii3hcnckZ0LDiqA==
=vFCl
-----END PGP SIGNATURE-----

--Sig_/Z78Lrj0mE6nHvW9/itpVush--

