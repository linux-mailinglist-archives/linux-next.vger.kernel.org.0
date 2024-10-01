Return-Path: <linux-next+bounces-4029-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 085C098B2D1
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 05:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C4231C22005
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 03:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B891ABEAA;
	Tue,  1 Oct 2024 03:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PcUXv35d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1891ABED3;
	Tue,  1 Oct 2024 03:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727754454; cv=none; b=JFwgwB9O8/95VT9xPEO4fTG+XsauwSJoI8v00jwZ6hgx8pczPmtR7K2movOiriMVoWg8JgGbIWi/l8ECgtQKC6YG1MC1DSrldabM6PAuA49PWh53P73H7A6WGjISxQOyt+twJu4NEb4G/2SzAYIUtpNN07Q0jHVYx6Tj5JJS97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727754454; c=relaxed/simple;
	bh=Y1gMld5qjzUzoSGMXOjl+CeAxF9rEAegxnHi1UMAyNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G9egSq6JwA4wHmIsxfOQYlVCWxJgvn0/IE9lrpZhJr3n5IgYC+hZVe3aeO+41/rkdfUkSko3jTrmRVwEe2rc8ISehD9IcZq9r36/+owpoFyjHEZKj7u8mNjPYwbPWBGz/2udBt7O5plkcSucPbgGAy7Fp3jGHQx4MyQTLkS8xvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PcUXv35d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727754450;
	bh=elT3ya+Sw0aODB99ycLSHVem7FoUGa3QnlFGc4unDtM=;
	h=Date:From:To:Cc:Subject:From;
	b=PcUXv35d8jXHOle4vKz3dt6zhiJcwExtUUOuBNXHAcMqZ6SaM2Uq3SGQdal40aWBr
	 6KR+rOug1Xv3s2DDI7zY9YoLbbt+o6whHzd4pWkt14izlf52KGApmkv7EZkg916i1d
	 HP29tgnOZjJoQ7vVccIImXeEQsm/1j/R4YiV1sUIUPxjbHGlI8b0KoRgNfe6yKaZtE
	 HUSj7k2NDOzfFNIHqETACF+PjAyLcbsWH7s3CXfNgBYvb/KWcnKDgoD2KDxA+iBBZH
	 eotiPxwGcG7xACZup5VPIssI3zOFyQRS/oYVEcu90Okx6vITHgtehCua/xIPfx9DAQ
	 96vby/l80UtlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHkR60nlFz4wbx;
	Tue,  1 Oct 2024 13:47:30 +1000 (AEST)
Date: Tue, 1 Oct 2024 13:47:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of Linus' tree
Message-ID: <20241001134729.3f65ae78@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eSkYhJjfUSXRaUcGOcvLFAC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eSkYhJjfUSXRaUcGOcvLFAC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging Linus' tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/folio_queue.h:91: warning: expecting prototype for folioq_cou=
nt(). Prototype was for folioq_full() instead

Introduced by commit

  28e8c5c095ec ("netfs: Add folio_queue API documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/eSkYhJjfUSXRaUcGOcvLFAC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7cNEACgkQAVBC80lX
0Gwq9gf+IWDuSP2sFSZE+DayeV1VP+ydpelE7rFuzOb83PEdeUZoZZL2EEAprBnx
gByii4jCqEb+ATc9Vttz3U+0AHsHhM/gOwJbvdptBjh63a9YWUmZDjsJnlqPuXrE
Nm1n+pKFafLxe091guaKtEy8/vI2HGQ6771Vy0Wa0a2HCT/N+55paouZFiQ67YtH
+0jd4WHSH+EaMNlfHdYp4HA4jFaGN49Vyn39pkdq3/FqcHvPAZm3xftFACUnXA9o
/MWqTZ8TyYXXc5JXGECEHCQHL0qdofyTh4A+7HSPHt+Yg0tCX/RD8WNqyXNyyaca
oRmUEhaOeVeK/Xy9Xqsvh3uxOylSYw==
=F2KN
-----END PGP SIGNATURE-----

--Sig_/eSkYhJjfUSXRaUcGOcvLFAC--

