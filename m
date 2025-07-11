Return-Path: <linux-next+bounces-7483-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC1CB0168D
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 10:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A76A3BEF93
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 08:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E8722331C;
	Fri, 11 Jul 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a3Tg5coT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11020225403;
	Fri, 11 Jul 2025 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752223087; cv=none; b=JIl/qbqJplzIgun5JlPmb+MNWleSzHhZ6XJOVfwyO0fmX5pAAsudEqz6IuUPhAV+GAshVyCAech4lwAmpg+o4c3ec6KXUQW/d2VJe0DFm+7gB3Ak6V4xS5vzlPGLI9UQUhaIDlDPWzKMLAuGj44E5Exd/FvqRRad9o1hSQEKCKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752223087; c=relaxed/simple;
	bh=xrqDgN2VyGkdOjANFc6phBNVGzxQuOsVWumE+RLeCI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bFPEXwhC9TbdJxo1f49KfKMeb5ympeTnGp7QtGD1Wrsqy19M6bq5+GpI1ghOR90mSGRlliGrDisZ3Ge1NlAjMhJtpqsssIiZD4WL0bmRC2zE71FvsAcMXvWlMg2VzWydo99F9xs4FdHlbvAkVLzY5o7n4NMHgFCMoIKOvg2bvAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a3Tg5coT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752223003;
	bh=lRfZeUKS0elLaQBjDpJfDlWCQ979aP3RQp5mcGJkQbo=;
	h=Date:From:To:Cc:Subject:From;
	b=a3Tg5coTi3mRAiznGoXZ05sfCi27f4bvVuJTB52OwwTyTa75EM7+3C7A/YJAI3265
	 xq7XnS1LrPKmDlX03vnoXM9t0ytOijcTGt0q8JS5Q6AKi/yGUNqICoahnpyRLMfikv
	 mYvOVTqTaQSCEKm3n9eWo08bhajfstEDgliep1pt5c3Z+tOkcNzU55Hrpq0pes4sz2
	 bx6lV+X5Hlve11HL3UwjwpI/HCWQVZtJRB5ASYsFIp4givEMzrPpyaalJkOdDsYkx/
	 RT17lArvOsnJd84ANWaUJBmgGsxsztdqLj0QD5kA0Kzs5MPtLR4M7aogpkv+F0QbAO
	 y61jTyETPEJ8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdlSC2FRgz4x6p;
	Fri, 11 Jul 2025 18:36:43 +1000 (AEST)
Date: Fri, 11 Jul 2025 18:38:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20250711183802.2d8c124d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e30ltj5Qmq7k5KC_tXo3STH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e30ltj5Qmq7k5KC_tXo3STH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (htmldocs)
produced this warning:

kernel/panic.c:366: warning: expecting prototype for panic(). Prototype was=
 for vpanic() instead

Introduced by commit

  3f045de7f557 ("panic: Add vpanic()")

--=20
Cheers,
Stephen Rothwell

--Sig_/e30ltj5Qmq7k5KC_tXo3STH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwzWoACgkQAVBC80lX
0Gzdagf+N2gA/v/+DsU5viM2gnlHUtpDwANPzbTS0FdXBZ3qQrJAKjcoWI/0/tr9
aFuhABAR4k7gyKmzW1tZCUTvXGGjrM1RUxYAh0W5B7Ho9OCCIWdz5VVNurQQlFFu
3TID393KyzZCoJWNbIzjPV2IvMg/Fy8A2URGMATe3OQ0oxdSbzdCblkeH2aNcm/O
jAON4QH6AMxZALHETI35RkKADhhbD4auO43JPuJnYZ0IJ0ykEnw5Z2Jt81k6WsEA
NW5X65Dzmzsn3+5lltuKDP/ytpEkVX3jPm3KJHwOgXlCOPXGDwjCHwHr5RIc3z8g
Fqu9nSMzhmrQUXsYfGWpNNwvA+h30g==
=Bkou
-----END PGP SIGNATURE-----

--Sig_/e30ltj5Qmq7k5KC_tXo3STH--

