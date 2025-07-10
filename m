Return-Path: <linux-next+bounces-7453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A1AAFFB6C
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 09:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A044189D715
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 07:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DFD28BA85;
	Thu, 10 Jul 2025 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SPjOyLyy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C610028983E;
	Thu, 10 Jul 2025 07:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752134091; cv=none; b=UtBjcdpcfndTU2Fq+lAJKiNrwhaVJ03GIUBxD0sChoq0kvLWTOz0gvTsbiA9rlDOwexYYNqKdoviIvOcOBwbptUxu0hQqOiD4i7EaitZ5bm5A7+PULRLPG2yfMdaV0mDezK3wB+IQ9sL4LWpl73wJs5sv9GGgVvCRNUDVbmpkQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752134091; c=relaxed/simple;
	bh=Wa97E7jx6HGr2nGcY13J1tcaMyazOyevedATuMSAQWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HYNrWjec5t2Ql8Tl3SeVTfQysPuPDBEIW4p5NeCNjANVKlgw3t8ga+F0TyYrvNIYTUrfgc6POuygEE+NrIRSw2Sb00Qsb6GBnYeCXB9m1T5EnGAwZYSRDdWdbg/+1hviurG5262kvx+qFKNhdTC5+r9ZjT/Ln7oDKUfqP/N9wsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SPjOyLyy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752134014;
	bh=iD5FHPBsVNVumquIVQkVDtIGMzDzI6IXAsyaAoTk5rk=;
	h=Date:From:To:Cc:Subject:From;
	b=SPjOyLyydJgyon87w2lO6iCCWb0ORaIcnVofjYwINx1InOJwNkRrHagzvqfmjGBj2
	 kXayPL2OoOuSBi9HJU2ItU8xzXbYugsKylEWO0SRs0wNjyeEpMfW0qcX/go6sYH9jX
	 pUNHKwQff/lnjQEvDSZ2uHqAZOUb39md4JMYYeBrDdpCZlCZIjLtlHFRQ9ptCZ1bo/
	 Hq+ZJ7zp7miD+LbjI53lrLlqD6DLWS7A/OgmBXWcWNmuoeXFT6dSlr4qR7+FOjVHcF
	 3ZdPI24UGkOrjtPdIu7YVAJGf/O/OZWat71Rr8kJmr807wWzRkTNzeA9ZrKdLZ7GTi
	 MaLqTHbCF4LDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bd6Xt37bLz4wbb;
	Thu, 10 Jul 2025 17:53:34 +1000 (AEST)
Date: Thu, 10 Jul 2025 17:54:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20250710175446.128c7def@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N2NzHOSIXDk9QXF5wi+c7c=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N2NzHOSIXDk9QXF5wi+c7c=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (htmldocs)
produced this warning:

mm/migrate.c:215: warning: Function parameter or struct member 'dst' not de=
scribed in 'migrate_movable_ops_page'
mm/migrate.c:215: warning: Function parameter or struct member 'src' not de=
scribed in 'migrate_movable_ops_page'
mm/migrate.c:215: warning: Function parameter or struct member 'mode' not d=
escribed in 'migrate_movable_ops_page'
mm/migrate.c:215: warning: Excess function parameter 'page' description in =
'migrate_movable_ops_page'

Introduced by commit

  d5967fb0bf8e ("mm/migrate: factor out movable_ops page handling into migr=
ate_movable_ops_page()")

--=20
Cheers,
Stephen Rothwell

--Sig_/N2NzHOSIXDk9QXF5wi+c7c=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhvccYACgkQAVBC80lX
0Gw3Ngf/c6wZ6c5pt+EryxtPelO4AAVuPCehrO4/3/dBj/5a1fIqKNvtPKNPFgB5
3R1CZYtbh0pLm9gRGbgb91TWwuVT+oJZFTR1EhjAsBYMr2ReR6EvRFTG6126oGgc
6VoG4reuN93hFoy0wOj1DN1BiaTd32HWAS5s2jINRX0G8DQTUkDtFZ+UMAK4WU5R
F0Ueb35pEP5h+ky7ke1Nra7v6FyMaM9ns/QIoUYrxpd85yEx80xZUgi9oftZ20qr
MV7ja9sKQIzlTZ/UU/cFIbdqtNDCO7lGovVyGZdLWsTguCBYmv1JerI49n+5x0WB
Ws7jerOaa83N4YmvCXpMSAjKCgYIvg==
=wrKr
-----END PGP SIGNATURE-----

--Sig_/N2NzHOSIXDk9QXF5wi+c7c=--

