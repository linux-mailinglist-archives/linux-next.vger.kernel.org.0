Return-Path: <linux-next+bounces-9174-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C9BC806FA
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 13:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 04409348DB8
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 12:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077122FDC52;
	Mon, 24 Nov 2025 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LbWOYqI7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B781E2FD69E;
	Mon, 24 Nov 2025 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763986634; cv=none; b=tCYA5UGORstJ4jMym9DnAFeIQcG5FDGGdvt1QEKCVgObM4+FbTURmQpKglRviPiz8rXoYoyCWAy2R258Z8Q41bdpHw/u8tHznwTICF671ksRI0RHe2wPTMgb83Ef/pdObDoHhjS0W140DIx62P/X6+yn38qR3hkbfrYuS5EIUPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763986634; c=relaxed/simple;
	bh=KocH8L2CA+THxJcd46M/ejaRVVYt0WGSxqpR7jatHpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y+KqrKkB1SWo8R1MnjVqXv7GfSbz8VIQZaxVNF/38P/bbA2MQgULz+B2GoJLGN1Ier6KpNAELOpaaTnPLqb2bncecmD0y0aoC7sPvrhfOQ6qY3jAGESM2JVH61wWzFtffvuy6kFuDV5jcqUsAs1NHtKnqrKx0E7rdJdQbKgOVBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LbWOYqI7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763986625;
	bh=httVC0uX2JdNZc3Lb8ggCSKtqxQthKjI+9bA7mTCDFg=;
	h=Date:From:To:Cc:Subject:From;
	b=LbWOYqI7Yel+Pb0sZQKE9NiZE0Aa5YIETLojMTzwm0mihQO9e9y1lpisZXQOg1/Hv
	 Gw8ur4fBzV4ELlO8/meDUWfNBAeD8VAXdzZUMRDAKCFssyZEjflL6nmyr+n161lz3q
	 tjrYgzdMtlT6+9MiXUJLr6BtL2CWN5pinYVmzMtph3H6+vwH3TPGIBoGsZUC+lL7IN
	 bZLWiFupH9LGPyV91IGHmET1qY4onPaxpTZ+J3bRSD8PRt8ncclAdPTJzcHGCrfcUH
	 AOoXT0LWwB26QvM4snP9T8l+7JJBS1+Uygqt2RLkyrblyuzzH1OVcdTuhg9qrX7kCg
	 EyWNIeDlh4XVg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFPvj0jfgz4w1j;
	Mon, 24 Nov 2025 23:17:05 +1100 (AEDT)
Date: Mon, 24 Nov 2025 23:16:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20251124231644.38d0303b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BXhgrn5=dv6C79km7rv/SjU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BXhgrn5=dv6C79km7rv/SjU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: "NULL" [drivers/gpu/nova-core/nova_core.ko] undefined!

Caused by commit

  c5d913fabb57 ("x86/bug: Add BUG_FORMAT basics")

I have used the tip tree from next-20251121 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/BXhgrn5=dv6C79km7rv/SjU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkkTKwACgkQAVBC80lX
0Gwh6gf+PBhl8QiaCVA6E8H/IySJ48ohNfB+ritxfAxEvhvzwmBE7JHmuU9ThEfq
yndN3AsqM4wVs1dkXh0SUxsm2DaINKrVmiCF9LJdSy3qQD5G4tY2AcWq/44hkykS
hO1it640ZVER1eZWW39QFQWX+ci4sLvPB3Qdt/hfC/BVsQMM244yYElUj2hZdRUM
cFCOGie5ceAbj2m7Z9gzGv96d6Wbeuf1fI2NVQfTvvd1WUQ6V+8poMRgjuiIs7hz
yZ+Nv5JZOtxB7JBhZvI9uIZqpEEbcdOf+HBYPSbMOInlIJtq9XvnlywJQuyUI+eC
PA25ED/5vnbOyDlH2AtpxiYhLYwnDw==
=HIGy
-----END PGP SIGNATURE-----

--Sig_/BXhgrn5=dv6C79km7rv/SjU--

