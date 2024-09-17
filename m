Return-Path: <linux-next+bounces-3896-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC9A97B55F
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 23:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C144AB24FA7
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 21:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70090192586;
	Tue, 17 Sep 2024 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jUN7sASg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7361922F9;
	Tue, 17 Sep 2024 21:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726610078; cv=none; b=BMj4lLBox5MhFAIwpvUB3gesGq3ZkmbRrJuTao/HVmKtBHPg2Qd2h2OsvaXRGbIn1LvbW/a3hloq6wGjcDGiWTxbV6XY7byMZ35c054jkqHbt2BR+vTmvT+CRXbnJZ8irnwuvjdkSUZu01dhAwGR+CIwb5upYMHGFHmBt34khXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726610078; c=relaxed/simple;
	bh=yayV3zbvCT1OLAy+FAo9jlszPRAhpkMTJgxsOhOXtS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a4Z26EYuSEhRtcFqPKm79Psp3Y5Zxgpd3TWnTiHJ2gymomnhse8EwCfHYYjCOcuzRSwnjLidNZr2gd9JJtGrke+pMGENDD8no21EftHjxYehoKTPZhxwOWtuT+oiOhr/VxbO1FtUSxEaez9X5ILib199VaDo18dFijxFvDb7mZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jUN7sASg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726610070;
	bh=GvnqdAZfd8iS0IM+MmoPl+fBlAD4923DgJtVaAPIBXk=;
	h=Date:From:To:Cc:Subject:From;
	b=jUN7sASgGIOAgFRWrxEVOJhQEyrGWCos/uOkGcm9UoiG2Ktxnvj1K0cGDocmt3vGY
	 w/QL5JdmmHQPastSpac9+CaeK0xbYlxIHDFUe5TSHrbln6NF0RbggT8sgImMDXJTZH
	 NaGPopwNm3c2T+hEJX57OAxLD0zVdOljWDf2pq413ZszD+/sDUYGWRSW2lSga77MTI
	 chKbb2Bg9HpjNF+SGpeD/y2N9U+n3f3vjw63CATFlpopD7H0oBJ8OtkR2Fg85J7QQA
	 yF94R2kNq0UgCIsH7LXwn80nfDEJSrjuQl1KzerYPbrH8hscXhwxdP6bSsN99288/l
	 Tgnu1/FuzCJxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7bCp6NHHz4xbt;
	Wed, 18 Sep 2024 07:54:30 +1000 (AEST)
Date: Wed, 18 Sep 2024 07:53:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20240918075327.7481c9aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AusVRSCTwnIBON.hHXP1hqM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AusVRSCTwnIBON.hHXP1hqM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  8c92c9840a6d ("btrfs: tree-checker: fix the wrong output of data backref =
objectid")
  90cee4871c72 ("btrfs: fix race setting file private on concurrent lseek u=
sing

These are commits

  b0b595e61d97 ("btrfs: tree-checker: fix the wrong output of data backref =
objectid")
  7ee85f5515e8 ("btrfs: fix race setting file private on concurrent lseek u=
sing same fd")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AusVRSCTwnIBON.hHXP1hqM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbp+lcACgkQAVBC80lX
0GxR2gf8CmCpLErx/1VJP3s9cWd2QGrKxRwm18vX7qa9ULrEJA0pQl6+RSMrFZLN
C0M+M6gxamirmbtz2wDg/xB7YK+4rd8f0F5l7cYVP1p2RKt7jg3mFDJWqUCY17mf
iJmP72ovBYkI7XwPGxH/a/M68V0c4GxQbPldN8KjdKGvn2ExtYubQi3MiDTKgTLX
xJLIC96VBE8B4NyF2NTQGtJYUqe1ANXpGBOQS3GeirQz8/yGuOtor3UHJgrUQdbF
PUihuu1Gx1Qjdm1mUmXB8gk6Iakra1Lznlr6iIhvypdI61ww5rLnlVuvQuDmRJ0g
9nhpGMZdcR3j0QbSGpBGMpRvamyJOA==
=NQPI
-----END PGP SIGNATURE-----

--Sig_/AusVRSCTwnIBON.hHXP1hqM--

