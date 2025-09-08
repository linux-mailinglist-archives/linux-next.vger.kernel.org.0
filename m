Return-Path: <linux-next+bounces-8226-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BBCB48653
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 10:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BEA53AD2EA
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 08:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC59C2E92BB;
	Mon,  8 Sep 2025 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Lcd1NydD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA2B1DA4E;
	Mon,  8 Sep 2025 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757318650; cv=none; b=t8zLH2EF6dBmjDWTWqCi287Zkb1KX1us9fv0AL3DCH6XjPbTnl2gzijxygDWawNvfHaT8G+C+w73BVsqZ6dp7lIryitwDzljmmKAI8gccjJ+NpaMN1/htl6FdXm3Z0kFpRt+N6xOV4HOHebCnl+MgHLtm8AsoXbVzv0CEpNImEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757318650; c=relaxed/simple;
	bh=8I8BEQe22FQhmPZwjcLEncsTKcA07/HbEAELpGAikv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l05ek3uD5feRFwOLi/7oCqAgMcuGYVEpi/7z4/W2MzhEQY4IYqt5BEYVNmpEa0lLwEbGry8p1QBvPAuiI29/f8wnw4RSanFusvgb/0nOTBQs16J7UXyWZT9Rviuiat84lBzfVt6XiKH9EQkge8gJJ8l9iJgUY8drmDp5BxxJ7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Lcd1NydD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757318647;
	bh=gilcZW3LQ5UHWEK7e4mcAIbr3gAjNGWqMMZJyVdnPcc=;
	h=Date:From:To:Cc:Subject:From;
	b=Lcd1NydDOV4V8x2Se9LLSLdn7zTNYvywCHqEH8TLRxgIUulVJ2FaRe3lKiS8v01F2
	 OelbXlqEWcpIoGqGXHuw61nhktxBaZCPq8aYvUt/KvsL29ZEhjSLmZ+MQnzy3sgiXa
	 8YbwBb0tH9BA06S8+P3IrkxmBA2dyiZNBCHTBYVxcJtCV6LGp/HDKq4CKRyCAyRzng
	 HojYA0K6Ysvw0X+bzCC8nY7jLxnwoqoqb6fJ36Q8Rls+8GVSM+a0TOjWjJa9Z66EEZ
	 wLVR766rsUGwOgwyAd4cqC4U8+TWgYMPgIkmxa9u+Fa+S0d68OXtaCpr1GOIqLo5Ca
	 xuKsM0K34DZzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKzxM1h1kz4wBC;
	Mon,  8 Sep 2025 18:04:07 +1000 (AEST)
Date: Mon, 8 Sep 2025 18:04:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>,
 <linux-xfs@vger.kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the xfs tree
Message-ID: <20250908180406.32124fb7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y/fgxec43_fxxxkFyJV6tTB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y/fgxec43_fxxxkFyJV6tTB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/xfs.rst:365: ERROR: Malformed table.
Text in column margin in table line 8.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D
  Name                          Removed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D
  fs.xfs.xfsbufd_centisec       v4.0
  fs.xfs.age_buffer_centisecs   v4.0
  fs.xfs.irix_symlink_mode      v6.18
  fs.xfs.irix_sgid_inherit      v6.18
  fs.xfs.speculative_cow_prealloc_lifetime      v6.18
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D [docutils]

Introduced by commit

  21d59d00221e ("xfs: remove deprecated sysctl knobs")

--=20
Cheers,
Stephen Rothwell

--Sig_/y/fgxec43_fxxxkFyJV6tTB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+jfYACgkQAVBC80lX
0GzlHggAmHts8c7Mcip8lDbsxhfapjyWMqBpxaQWuvUgZJViW5iZ24pi1A0excyv
oxB9Kin2ga9Dk8VJQ18q4kbFk269rZytpO9nN5/uL1AcFslAJJZXE/NpR+o9viEt
/7pKP4lZvO5wrS2HwgVU7zuGyRqX3fAyJKSJrr4BHC2IGfVM/uk1b8hR+jcYYmv9
zlEipAWUna1g4uXUIwelN6agmJcZzWHjuH4Gn/KEbek0xmLfKZjktd2ymHgSmmI3
wTZOKo15dsOomQA9BrwWj201bIWqRGS1Kz3TGvvyiuXXSBYyUCB9CTTpau1gbPtt
/moEcYPpudmYgvHc1SfAyJ/qqodjRw==
=wpKr
-----END PGP SIGNATURE-----

--Sig_/y/fgxec43_fxxxkFyJV6tTB--

