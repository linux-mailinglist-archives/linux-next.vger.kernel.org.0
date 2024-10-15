Return-Path: <linux-next+bounces-4281-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B120599F8BF
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 23:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6666A1F216A6
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 21:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E001F81AE;
	Tue, 15 Oct 2024 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kZAUdQC4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B611CBE8A;
	Tue, 15 Oct 2024 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026609; cv=none; b=mKZ51bKUP57IuUgMTgGAQ6+ua2lc2CluWqeeR7zRIhuodfStHzgurw6CqbPuy5rBG+wi9W2wsG63WRKirbRTrkJh58H04+NZsAgPyczmoAhzEZozXVTvFJTPkO/gvd+5uo7ogDsOUdja6LoOyyyKIz4aMSdJ+N9DXf2HfTeL/1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026609; c=relaxed/simple;
	bh=xqOa6G756NMOtetoInuJj4cWSAKwUBCQfwynNvNH9dU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dkL5EyZDq0YbBVhccCR23vmpERELm6kv/kxItnQZgVcNyYGI9Y2PNgMj/678gmZA8Nw4RJ113coeRumxUVukbywFpzeK6vkyhdYyTk39HXvrIv7nGbM5knQHzondg5f7E3PpRUVWmm/iQIuUM4uzWlXs/w28izbEhAn1UBB++gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kZAUdQC4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729026603;
	bh=qd+YMdAiJqR9qcsHpdm3fIxbZYDRFF9q0MqESabU+Hs=;
	h=Date:From:To:Cc:Subject:From;
	b=kZAUdQC4nfWGLceo2oD0aV4BP7pijotbNbP2XK6n1Ip2P+LrD9u3c7XPKmLQAr0iw
	 AQppQSiadeT9dcSix9ujZwGgei6WLx9dlC3ZG/EUe8PpgYR7DQ7HntMh4+GOYjES/5
	 3m38YYMuhwHdl76UiHHoCopKDmRvnXLVQq/6JIjGxcG6hv/iVAv2IBoGU2ikv4vBEG
	 okwvwSb0sHomc1jvr/4hOVOHrKBoAxvKv/OC7DhasXuTxbmsycuGzTLZGkYFpxaXnj
	 gh+vl+594ZNJ6a45xmaH2QmGyoe9TUTz8mo+ImqUNQkB8GjdBH5kU/B06xij1iPSS2
	 Mi8Et063EZsSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSmvb1rsVz4wd6;
	Wed, 16 Oct 2024 08:10:03 +1100 (AEDT)
Date: Wed, 16 Oct 2024 08:10:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Bill O'Donnell <bodonnel@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vfs-brauner tree
Message-ID: <20241016081003.23b90c5c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VdLj8RWdRiLdka74.CalS/6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VdLj8RWdRiLdka74.CalS/6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  51ceeb1a8142 ("efs: fix the efs new mount api implementation")

Fixes tag

  Fixes: 39a6c668e4 efs: convert efs to use the new mount api.

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").
  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

Also, please keep all the commit message tags together at the end fo
the commit message.

Thus:

Fixes: 39a6c668e4e7 ("efs: convert efs to use the new mount api")

--=20
Cheers,
Stephen Rothwell

--Sig_/VdLj8RWdRiLdka74.CalS/6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcO2isACgkQAVBC80lX
0Gx57QgApcrxkpihORwAFMjNZyCzu3QEs5rVjvEUTqUTiP81v16ivCAcEVuHXg4U
NjOhanwh5ejY9UtyT4KaNGh/MrsCI5gK8rh4VhPdQj1P6BJT7UT7scHMV+neqFcw
QdZwzeaYo5HZ9Ysb1Ds1/+LaPNDKInyV8Z2pflFs9i9WU/UF1r+XTp/vCbeSFBgu
mng9wHdEvVWG6gjVY/GOjUS3txJGP0lWqoy8f72cvtMBW1xLt/TZJa3S5qcaRZ/P
7JR/N6cSH9Whb67Q0RbPxZi1gahk4A3Di4QbLoqxvr07WpJ9GaPTdqR20PgCgHDZ
66wa4t6mCxEQRjRbbtq85sn8zyQ/yQ==
=uO8Q
-----END PGP SIGNATURE-----

--Sig_/VdLj8RWdRiLdka74.CalS/6--

