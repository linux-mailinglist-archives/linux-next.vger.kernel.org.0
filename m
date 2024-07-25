Return-Path: <linux-next+bounces-3130-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C4993CA63
	for <lists+linux-next@lfdr.de>; Thu, 25 Jul 2024 23:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12B7CB21B44
	for <lists+linux-next@lfdr.de>; Thu, 25 Jul 2024 21:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A8813D8B6;
	Thu, 25 Jul 2024 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kQh5A/ky"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB9F11711;
	Thu, 25 Jul 2024 21:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721944780; cv=none; b=CdKou36ReA0FBohkz0GYz7mP9swwFqNQTS5XyAIrescflTuKN0LbiGus0xvhnfcUn7rWxuT8MM9fwS+gZ0+Oxi6knW97mL1wmbqE8Yoj6HyeVR+1bav8uKAKEhjYV6ni7uyUyTjGagUx+LPFgxLBYt3XytT4+J5y4x6CKHf/x6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721944780; c=relaxed/simple;
	bh=pc/Tose9tAVxXnF9i6k52DZCWCrD0e4T1Od8CAHzgIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f2nbzf/HK9H8Dt740ubhi8pX0P+j2VD7HRv8hSqCLGoytCGxiXkBu1WxW0tBQluzV0jh/MVbKwqu0use2PpMC1w/AAJys5lt7NruN9KKHnNQpiTulNGu5XEzp05AoEMh4E7j5xREk4N5y2h4uvdfT/4IUI5x1v1gLIPf2W5MgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kQh5A/ky; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721944764;
	bh=H7qCZQjbG94SK7nannv4e8pmfaSPuhzsad4zOedrZEQ=;
	h=Date:From:To:Cc:Subject:From;
	b=kQh5A/kyocxBUkuA6n+a7D8vOaJlFygSUSTj07VqFWWMgT3Wzfz2Q8pScrBXr9UIL
	 OLpGsEATdaHWLW7yM8wd6ZZhxCOl68H+hLKllfTNC6Qd4V9c93dWoxgG+nknNECxaY
	 ZJkhNcpnQgbnkN3ppdZMaKGz31DVfwzZSZmeK7YSAD2b9XBFstDwA7CwlIBD5airbJ
	 ouJVQyf0vWGOYMbeIsg7YKfBoa/m0UpjgQjacvQJkN+v3mZ6txqj8fKdX21jh6ITIA
	 2h2A3LAEoB2qoYaVkKO+0ByjoWXHSIQrDfrtK1cv8cJn/20wFAlUxroKnZ5Q27zdqj
	 dh7MvGSCsOgVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WVPtM4XkHz4w2L;
	Fri, 26 Jul 2024 07:59:23 +1000 (AEST)
Date: Fri, 26 Jul 2024 07:59:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the risc-v tree
Message-ID: <20240726075921.4e7719d9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8oJQiWieVqgqt+qTPSHGk5p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8oJQiWieVqgqt+qTPSHGk5p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  96333a020615 ("irqchip/riscv-intc: Remove asmlinkage")

--=20
Cheers,
Stephen Rothwell

--Sig_/8oJQiWieVqgqt+qTPSHGk5p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaiyrkACgkQAVBC80lX
0GwDogf/Xjpx6nNYEz+9W8B1vSi+eNH5OvImkI049kgF8PjHRpIUwi5Omv2Z4Npl
GqU2/aU9NgPVbLg7ZmaQh3CVxUU3jn4tSgMBmEjnP0ytQGFumTVG2SxvCJP+t0y9
ixpwr4BLkNIOXnaG8T4ueGjYg65Q/INMC1TkIZ1dlRQPqiUoCE/pvUOm/3EkiMpo
wJ6+bRddscwvT9tampRVdGoCKOplZP98drhcj3vAqH4i8SJl+Zp0rcrE5OtaJSWo
0kD8jSMppvGpJfxN//5qM5q3YH/YZlay119pi1Rm7QkXfk4yb/Qc6Rcnu+MJHa2N
tTGpo2Jc3wb3CZp8yk7R4aSp1xBfZA==
=LI9t
-----END PGP SIGNATURE-----

--Sig_/8oJQiWieVqgqt+qTPSHGk5p--

