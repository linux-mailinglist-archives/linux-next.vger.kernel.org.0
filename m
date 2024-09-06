Return-Path: <linux-next+bounces-3630-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3772996E739
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 03:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E899D288630
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 01:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD71175AD;
	Fri,  6 Sep 2024 01:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Te66+8XS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9866722F19;
	Fri,  6 Sep 2024 01:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725585497; cv=none; b=m809XT/KOKm7E0fptvvYCsgOXoPEEornedB+CpA0Y6MwFW47Bwc25SL5K4yCcZSgDbMVFKChQM2IzPKsA2d0qxq75ZyM+I4rF9TwvLUhCSZoDtpEu/Hza/Pfq0PAUMeEWxTBTYkI0ffd9EzFqBVL58uExv54JB59/aDVYw8HhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725585497; c=relaxed/simple;
	bh=EYmEWkWDHTjX0JxwAqZHGCoB1JkGR220Q103WTROmUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YbT0NaPgRp+ujCYYScxc3U19+/aDE6n1FS7Jr1xAzFdd1AA62QRCJuYguYOYDPOWXpg9PsGXfgIETaZvdrxSoaZT3gLm5ko/QDWfYErfAIjyU0aZ0bXgj49o+8Ezcaj77RbnukMRd+/epGdNRBD4z2ZXuN2NS5K4W8tukVcwKhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Te66+8XS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725585491;
	bh=5L+Et8hy7qqMS/kurKRG2velrBxfOvts9xgByks5lUY=;
	h=Date:From:To:Cc:Subject:From;
	b=Te66+8XS0EibWqPKsaaVUhf3OtvLRGZYE+j0uQHTKsapWD67t9tvc1NK80PkhC0HG
	 pDzO+y24CKjNMahHv+RpdE+AJI5s+UMBqSb4UDHlmfgZRJ2Ce1VLr563jNTbKrI494
	 fQbnaLhYt4mabeqZPOt+4Uhc8YWsGTmhyvhfnqncZyfqzqdAwBZhca8JRvm2GVjNhQ
	 gou6i/TdLl2eiA2V8uo7OtPYj6UMxCR/rDwi1fl/BNWygdV3KKcMe0mDKnYvFuAcY2
	 3FB+xmrHovPQUO8hvtgEjNSGQQyWf9CIonqNZHyBOtYGh8kD8QueSbtMslrKjygUSm
	 s3RMRRkK5iDaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0JJL5fVtz4wcl;
	Fri,  6 Sep 2024 11:18:10 +1000 (AEST)
Date: Fri, 6 Sep 2024 11:18:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Steve French
 <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>, CIFS <linux-cifs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Steve French
 <stfrench@microsoft.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the cifs tree
Message-ID: <20240906111810.5dd846b5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AZJAJgd06+t4aqx1/HvTBam";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AZJAJgd06+t4aqx1/HvTBam
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/netfs/io.c

between commit:

  ab8521891072 ("netfs, cifs: Improve some debugging bits")

from the cifs tree and commit:

  550bc501ff91 ("netfs: Remove fs/netfs/io.c")

from the vfs-brauner tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/AZJAJgd06+t4aqx1/HvTBam
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaWFIACgkQAVBC80lX
0GzBqgf/VB+LG+gL7hrc99w6s5kTnCOAyF3AVrn4/QwKFGC8h3deO/fW7BBECZps
9eV5VPettnYrJtwO2TkwjcM+E9jxoo6lrtE+52ziz5oC4w0IbSY+G+o9TSCbM9+9
CO8YAfOdcaF9YklLdIs/wDMFlzk8f+CcuCRWm0YznR8o4XIxHSfiBLHEL9hldc+d
LhDJJD6fOnkdsAfPTWAgBbyj8zOVg2xzL0iELJZImipLgbP4sX3spn+iO/YNp9uF
e2UsjKM6VxXl3eLCz2+rL27Vmw28EiNQeabc9XJ2VroQ/FqYdYpuNKHkVYQItrTT
HqK5Z3Kgow8jN2amTjNmHlbBxkqHqw==
=b584
-----END PGP SIGNATURE-----

--Sig_/AZJAJgd06+t4aqx1/HvTBam--

