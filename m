Return-Path: <linux-next+bounces-6892-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7CCAC007D
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 01:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 226721BC54DC
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 23:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC0B23BD1D;
	Wed, 21 May 2025 23:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aVK+Ksii"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18123C4FB;
	Wed, 21 May 2025 23:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747869255; cv=none; b=bH0Ac4tKqfrTwB2mFmcMXAUzSaTroVHiW6pAL31LHieft2FMBoSv/Vm6B9SL4EnwNRfmsE5RWJxtLm5fpmtVJQwKp/F/jp0yPmUF9sjrSMpUvA8H3x9v3YXtxl3B3CElFlxtQgbFcaOv9Z0IMIYCbaI5ObOB9IJbzn/PrCKsqA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747869255; c=relaxed/simple;
	bh=AXrtJyfzH8zeyzEKpj+QK/ICY3QuHlFZ+jMuRox3qlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jc5ew9/+Yli4euLkMKZE0RNiwC2BXrdAlL6L8aCnHQ4+jc32vpxREe3BC+zysSJLv59krZ0p2HIdyh7tFQAGgFG6je2+dlWTzQYWWx5Jz68DIZ3bzJMV16S9a7Di+w2qPzaIHqNbXqqoOiaToVI4MuUYSPk7lVGVCv7kP8SEogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aVK+Ksii; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747869246;
	bh=tUgEHG5P6OlWnzieM/4K0SpqjRVOc9oQyc40O0y1Wm4=;
	h=Date:From:To:Cc:Subject:From;
	b=aVK+KsiikOMdb+UaUTGx6dgHHBZua3Vzlo6LkBz4YL28QjpRGwKehOfiVnxkUWM5L
	 3555mYPsxq6+CyDuySIRXCxnHYXxnIgDrWPxWtH7F7lqp8nmiCF/f6pkEIV4rSp0zI
	 wF1N8eOHG833IcN1IPRiNeUlk+IByDIJSlSld8zN2spXh/e9AuqgVjV66B9Ss8bqD4
	 rfzp0LJp/fE8RlM9aArCJ6GiZu9ONS2w3X+xZ3A2BaUExH6MdEgiKhaMJqyBmiZPdx
	 em5gtwNptqMDKrqJLuheSj1ZINou3wOSVtRRsDCrMVyjt1wkBEbgJyw2Wny2sCfajL
	 hZAPpskVtMx/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2nL62QBGz4xdS;
	Thu, 22 May 2025 09:14:05 +1000 (AEST)
Date: Thu, 22 May 2025 09:14:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20250522091404.66a92136@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YBqOyQqLhUFFxIItP_QYdeX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YBqOyQqLhUFFxIItP_QYdeX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/bcachefs/inode.c: In function 'bch2_inode_set_casefold':
fs/bcachefs/inode.c:1261:24: error: unused variable 'c' [-Werror=3Dunused-v=
ariable]
 1261 |         struct bch_fs *c =3D trans->c;
      |                        ^
cc1: all warnings being treated as errors

Caused by commit

  524fd5dc5c00 ("bcachefs: Fix casefold opt via xattr interface")

I have used the bcachefs tree from next-20250521 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/YBqOyQqLhUFFxIItP_QYdeX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmguXjwACgkQAVBC80lX
0GxYHQgApBt2+0Igw8JzgBBuovIdeHeBKbSKNNQxV8J9bQCMJQqZfRwKaKV4oQcd
urlMR9EOTyzlh64xBmGrQFgrAK+MPU8eEngRxImTtuWzlVujiLROmqh8vfgBnJed
AquniTYO61zOVlXVHGqxzqx9Yu3qCcOczV6zfQ7q2QmU2NwWBJdaoo0OlNPqKCSN
CXTt2iGODJNNe2VX6eqcWqu82QKAgyeCzSGnw6nujkANRvejL7264RWO9qPkGGkl
tFvRXaHULKqCwtiwW0KbkXFng6EZb/9csoGJ2kaMIgiJ0xjeyIvwxUjYVFGZ0Icf
0Nti+tHjrQaAW2YarqMJdxUH/GZhVg==
=qVVg
-----END PGP SIGNATURE-----

--Sig_/YBqOyQqLhUFFxIItP_QYdeX--

