Return-Path: <linux-next+bounces-7109-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB795AD2951
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 00:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1385F3B4E21
	for <lists+linux-next@lfdr.de>; Mon,  9 Jun 2025 22:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA14A21D3F4;
	Mon,  9 Jun 2025 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h6IOgBGn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E618E218593;
	Mon,  9 Jun 2025 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507485; cv=none; b=HhcjTNS62n+g7QgpTNIShSfv+1QOpiadafKVsM2U+wu0Tybz9hnGQJqHKPftCG1yEZOLhBtWrTNwXwq3Sa0yOdYNldr8rr50WfgCFEk48Edw/bBBmFCvsf650O5wGieHGSsIvp5mzKQ5rwGapowcQ6A/HIbOYZYZngNC7T8skd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507485; c=relaxed/simple;
	bh=Th8HxwgW2K4z3J2VframdFcC5IggHD8woDVqgSAc4fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lO0K2pip9G8cHiajZXkzUyByTrA6W6bfJCTMgC7YFyIGEslbI6h3XW7wYk6TfiMk2d3PgG65+CSEzSJj497nKyzQX0doYOCjJg3k4B25ogE/VsxkClbzvbzioiHqc+E0oHYSHiojxZNhH+Pgq9rlLDWq4/9D5Srb2SsFazx4KTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h6IOgBGn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749507480;
	bh=LzI2gtNg6EiAZ+NDcdzGZaZAooCCSKtJKOS34B51E/o=;
	h=Date:From:To:Cc:Subject:From;
	b=h6IOgBGnnZ6xNkKBgr+w0/zR+L6No1Z/bVGsMDS+biylXPaGkHTAzwsLgsRqqT7hH
	 8E9StBlV4CXFbV3LJnVWAjFUWUvUxfmZacxx/0UP0p6nopoFeI2cJPvn+GBIASMWl5
	 mPpeVvDVuoLEAcbzh4O4CNCOvmuNyTYvJLecD76dm7SuqbIUK5pF0fv1dhZULWNZzo
	 mQp8VRqiFnDc9Zw95RvnhT99UQMpKfnUOXsWMzJoh8qcq2x2VpkJZvOrDdXMA5Jr7L
	 3AoTc5/HQvacClmBmpuwv1sbDK8qsOSzwIqkDkWAH8xKZNHQ8gctwf7wExTNx1ynFk
	 3Hhq+w6qqxwgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGRBc2jPZz4wbr;
	Tue, 10 Jun 2025 08:18:00 +1000 (AEST)
Date: Tue, 10 Jun 2025 08:17:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shouye Liu <shouyeliu@tencent.com>, shouyeliu <shouyeliu@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the jc_docs tree
Message-ID: <20250610081759.185e7982@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.9Tn1uu88HKiyZWEQrYgVly";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.9Tn1uu88HKiyZWEQrYgVly
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  47cbe79dedbe ("Documentation: amd-pstate:fix minimum performance state la=
bel error")

is missing a Signed-off-by from its author.

Actually it looks like 2 different email addresses have been used.

--=20
Cheers,
Stephen Rothwell

--Sig_/.9Tn1uu88HKiyZWEQrYgVly
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHXZcACgkQAVBC80lX
0GzOkgf+MgeN4hALLHZFTCYRTJZLB/bb57gt3UNYSPd5TI5NtLR6eu47rVLElfqW
zf9y//py0q6fBVhy0b32xVdxSIN657D5dCDHqNPUkDVGOnK71vP/4MNv+nueZ7ii
x3sDa4J2huGcgeVxf50rZspmpbqpzV8fJ3ZSTWI3mRVMf3eLFInxul5icKtRskF/
bvBqvRekcd3bSFyJNiLavitzt95ojwkcdgf+ue0tK/01VkA+6GwQpNN4R0Fxr1v7
UIgrZUDCJVCF+T+7vDtBpqXGTcqpdsmBlrHj+l2YrFhSOihWu90i7h4Y2sDIUAeB
2Q5yrSTmfjy/u9LvGiXZrLLaJKFwLA==
=htFf
-----END PGP SIGNATURE-----

--Sig_/.9Tn1uu88HKiyZWEQrYgVly--

