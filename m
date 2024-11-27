Return-Path: <linux-next+bounces-4850-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9899DA20F
	for <lists+linux-next@lfdr.de>; Wed, 27 Nov 2024 07:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC263B21171
	for <lists+linux-next@lfdr.de>; Wed, 27 Nov 2024 06:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B7B13D61B;
	Wed, 27 Nov 2024 06:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fcdn3ZbH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8204913A888;
	Wed, 27 Nov 2024 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732688227; cv=none; b=OMpgL88E9jqYIdr9kg3/EnVEZo+2T8goBFfPi48ijOAYZlrkmNfyGnrFr1pKmrNTpnpWDralvk1/XoAwzjeHilX5JxKe0RISdsK7pAKJeNvi/HdVJvhxcel9ezADVkWcnQ9AN3fV3JLBV/vMwTb+rrcC92ELuuMnkvAENBWcO58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732688227; c=relaxed/simple;
	bh=sw8UATenxkcpeWx+B4ytuYhAFUr4chvZ3QbTmCMiKy8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=bex1grzPZSkpFde8+hdOPpSRH/eliHDOVI57T+aG873fsQ75eLyUgC0xCM0gZM4XQj23/weVOJn7SQrNK6LDJcT6IJbaSuwAT+W/mHKzqTtPFhgQDEq3MiPkFXrK6p6gzNumCfNJdeitxnx66bhhg1v2Skjh5qwCcT/ff9ikQ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fcdn3ZbH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732688216;
	bh=sw8UATenxkcpeWx+B4ytuYhAFUr4chvZ3QbTmCMiKy8=;
	h=Date:From:To:Subject:From;
	b=fcdn3ZbHelhd2t1Go7indg8MY+2PUrru9EIQgY/A9iMiW5rDp1EzoBtrH5UoW0yUQ
	 1nSdU2qstBazcj+Jk7hTR+Ii3LGS/NQRlyprz5icAppYwEV8585rdc13iXAcW7dfNN
	 dr47vnwnaqe5Sb69jRpBjprcB+rXD/+xvxq+ZRF25MGtlewCryecykKhr7q9tS6pOe
	 TlePixAEjR1UQWx5qvn8xTDkiL85LOovB85YTAdZ5s8b6avQmK5kxIEgZaq10MbbXw
	 zSbfgyHvvV5Cj4hauF3ud3VDtuefPFUgALksuGUrXt9WODu1dO422JOOds4g8VKWdo
	 15EJMIY/04Hcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xyq3D0jyZz4xfq;
	Wed, 27 Nov 2024 17:16:56 +1100 (AEDT)
Date: Wed, 27 Nov 2024 17:16:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List  <linux-next@vger.kernel.org>, Linux Kernel 
 Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: taking a short break
Message-ID: <20241127171657.0fd5f86b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z_hcHkEMIGE4+q0z6UJuqJa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z_hcHkEMIGE4+q0z6UJuqJa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release on Friday or all next week.

--=20
Cheers,
Stephen Rothwell

--Sig_/z_hcHkEMIGE4+q0z6UJuqJa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdGuVkACgkQAVBC80lX
0Gy7ZggAhESo1uiR4WcRLc7SFVx9bIDopHyRbYt+1b3Ta2gLgG4KsH7NtZxBbcuu
PT68L1IPy19u8svGsq3nt2rmbbQFiKFG0+mQyP1RHRmovrAkWtK6T6pX/vWIKSPH
0Zd/tPtZ2YcfC7UZLNHCPCFk+Z+tNoWrmDyfpREaYj2yaWoQCjLAMCbEJe/v2t2y
g+u/HAISWjql39SNrN1CmNM+iMHkRPE4C5mx4NyNr1bMNM+m+zIquMYhAueT8sH7
ho8hcBov9xvaCsKQChlo9LsqBmiDhBAWdjx2tSVwILQnQBra2Gln+5CHDJKOugGd
+vNlVHuCU/QGYzrTLNqeQH42ZQrYlA==
=wzVd
-----END PGP SIGNATURE-----

--Sig_/z_hcHkEMIGE4+q0z6UJuqJa--

