Return-Path: <linux-next+bounces-5275-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC47A1777C
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 07:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C9237A362B
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 06:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D48E19CC0A;
	Tue, 21 Jan 2025 06:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IvLg05Uv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1D2556E;
	Tue, 21 Jan 2025 06:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737442140; cv=none; b=EUI4dZz/t+Dr6PegE/kaLB+J+pDE9+qG5lelYm4GDvwwwsajPdWWKXwQTchNKH14cz/KDr+1x+wYCpIhYKjzHzniQQYCIoNkExew+yONXZSREG9d0Kwug+EhmqNegzR/5cCg1bY1kziCmQ3Qr2UdQF0J0TWC8r8ie+I/WEskpJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737442140; c=relaxed/simple;
	bh=TNNXgc5XtZlh9tGCKyESB52qKXb0ci9op1lQgExih3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CLeemXgurOwHzD6FesbNGlS9zw66TW7eLD+wnznR2LKkFSkvOLwwWvPDcV/C9qhkYgmt2JXZqgeaOxcWFNRADvnR8eFjRUNwJC4ScmQTtwQsS4N8loOB7lBBS9UWWVt+5QbZNfNZylaj2rFQf9jG2HshRVnjkKBNR0k0F4OTU8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IvLg05Uv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737442123;
	bh=kqPWT7dRJMjuPB/5uL2DCKkiKj5gUhturuHTNot7E2g=;
	h=Date:From:To:Cc:Subject:From;
	b=IvLg05UvC068ltwoY+2oFGP85hSS3Bs9J0WNPTgkvAwKhSrIYJyzzH1yU+Fnnc4U3
	 4Y2tFGEEj462vAfX+LDYZNAJjSnR8oxottSxkX88yLWkWXdvMDYfPelma4iQA+TomH
	 1gm8ZNCS0ldo9mVLIetUyk3ZwbozxAQFdjN2C0m0l3PbGvMGVwzGLmkOQ5diZ91TUh
	 gTRApBFFbEWF0tDeI0ZPKJxKk5nyvWRAyX/RmuE2tkU8HxFNV/WYbTYGqO+g6in71Z
	 XVdD9l0Eg4TwC9aS6mITcegN8obTwjPIRy6kd4CXx5zPDrau33SqNbUrOoXZpojobT
	 iiMXNWIjX/Zzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ycd8V4LSTz4x8Y;
	Tue, 21 Jan 2025 17:48:41 +1100 (AEDT)
Date: Tue, 21 Jan 2025 17:48:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bschubert@ddn.com>, Miklos Szeredi
 <mszeredi@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the fuse tree
Message-ID: <20250121174848.382cc2c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/umpOGajbHJ_SgxVDXKolL0B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/umpOGajbHJ_SgxVDXKolL0B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fuse tree, today's linux-next build (htmldocs) produced
these warnings:

/home/sfr/next/next/Documentation/filesystems/fuse-io-uring.rst:19: ERROR: =
Unexpected indentation. [docutils]
/home/sfr/next/next/Documentation/filesystems/fuse-io-uring.rst:46: WARNING=
: Inline substitution_reference start-string without end-string. [docutils]
/home/sfr/next/next/Documentation/filesystems/fuse-io-uring.rst:53: WARNING=
: Inline substitution_reference start-string without end-string. [docutils]
/home/sfr/next/next/Documentation/filesystems/fuse-io-uring.rst:65: WARNING=
: Inline substitution_reference start-string without end-string. [docutils]
/home/sfr/next/next/Documentation/filesystems/fuse-io-uring.rst:94: WARNING=
: Inline substitution_reference start-string without end-string. [docutils]
/home/sfr/next/next/Documentation/filesystems/fuse-io-uring.rst:95: WARNING=
: Inline substitution_reference start-string without end-string. [docutils]

Introduced by commit

  3d75eb0c9c67 ("fuse: Add fuse-io-uring design documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/umpOGajbHJ_SgxVDXKolL0B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmePQ1EACgkQAVBC80lX
0Gw8Cwf/ZxzBKp1cxZBrfQzKrqERPIMpe8z6NAp4STFHmV7qhvTzx1burj0yhxDN
H0gnPBYGWB62nHWhUC7hlQit6dnGbJwUOvUQ6tIlXFIUxPa6UbVmgGompFjhGgmL
sNSONTNxZB9hinZpzUQqvjDhyx9Ji1RR0TE9uf7a1hysSGStpTQbleilsXanjsQK
QVKnMmXhL1tASVihuVlenie1lAFA3CFjLns9k8EE7pIpYPOkR6zfRDnkuEDTF40h
RG4oczfm5DP2BmF6fDULa9ZZz/JiWg93Rx55WTywkTJ7s2zsZpV3ncd8+6wVxtzu
wECegfL71S5kTr7B4UyqJJH9a5e42w==
=hOEa
-----END PGP SIGNATURE-----

--Sig_/umpOGajbHJ_SgxVDXKolL0B--

