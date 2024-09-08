Return-Path: <linux-next+bounces-3658-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B108D970A2B
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 23:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFBAC1C20A63
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 21:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5C8175548;
	Sun,  8 Sep 2024 21:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p2d7BhfS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE05B1C01;
	Sun,  8 Sep 2024 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725831949; cv=none; b=NcEdu6Zc35DtIAmL60e5fUc5gm8VjpHDyjGTv9HosFFYnpS33OtNSV1GCfXbh4iU7FQ/HBjZwAUjwpi+FKAv6jKzrDlKyPj8LeYfJn0yeQkyBPyRj3o2bb2IyT4EMcD9zU+HMVsLZ1/M3lbEmInTZ0sSosHA9OrGCXjr+rEwsaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725831949; c=relaxed/simple;
	bh=uFbTZ8rCLMeyJmuzwiJ+FJLw6nsBMyOUqolkKRCG0tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ADiorZkgJfJ4Xz7ovb/zH20/rrp91QunpkMk7xVuaFV+zgx3dPmjOMky6S/RDK8BDEH/hDnsfZMsPtUlJyP4WjaBvrmYmbslao3J951w8MjzmuKzHKzGFT0bo1kOVqf+ERFH8mDG2DNJBKVDnZBmYeaE+hLojl9QcHD4TTaL1Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p2d7BhfS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725831943;
	bh=gnieCGxkX7sucHFlTE01Uglj+XF3Jr3DEnCXNTJDaM4=;
	h=Date:From:To:Cc:Subject:From;
	b=p2d7BhfSv49E4LG6ej8ZEM7t9YKNkDGU+mzK7zX9wgGlXVqx6lhrC83N8ekx5J14V
	 kuUdBKlMDBvZEWTMqPPTDtoql80ghnUv0uEywTzGDY+nHWPRkxSiBid8uO5+ydIwiK
	 rFEQ8R9hA4+kYwecoDKIuLF/UjHyRUgN4GAfUqPErxrtGLP+GI1kodL3Akbn+0oagP
	 EJ1O337vE2dI4xvLRdNY9eJvmeIrJC30PyXO9UjpzK9XNZ7LxU0zjb9kFwm6tlQKcw
	 FK9k/gjj/Gebf4QXpM6SJ42+Xlb5u1AHFfJYdGCVNXnkECtIK1ftGTGwkCbnaUzv3X
	 QsWttuzFvy8lg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X23Rq5BrRz4wb5;
	Mon,  9 Sep 2024 07:45:43 +1000 (AEST)
Date: Mon, 9 Sep 2024 07:45:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vfs-brauner tree
Message-ID: <20240909074543.39073215@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sURfN6DVNARdQ0LfUC5a.x6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sURfN6DVNARdQ0LfUC5a.x6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  785de7deb1e5 ("9p: Fix missing set of NETFS_SREQ_HIT_EOF")

Fixes tag

  Fixes: 7e23bc911449 ("netfs: Speed up buffered reading")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 0fda1f8c6bf8 ("netfs: Speed up buffered reading")

--=20
Cheers,
Stephen Rothwell

--Sig_/sURfN6DVNARdQ0LfUC5a.x6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeGwcACgkQAVBC80lX
0GyGbAf/fsAbwFjl4qcSFZyY+CiHXSaoPO9N0tSoSirTVoXHPw459M09RYwJOqDH
Zjrg6uOJi0SKyIBaQCEpZe6wg6OVaT0/SJKjVCzEp/FjSC1cH3aHj5BLQkzae5Qj
fAlhUdoxp7IWyL5b4CyDsZgFqR2D30uZMP0R8bHd7TtA/xAvirOijHiDhhZEp3CM
TsoQsVjnNEmQo5PzW5uwsjhMdsU1RnCq6i4JnNNyvd6U8oS/YRDIev9U0D76Ds1H
F4H/bo9J6DuRLk9n+pfQMJjZUzCKwwP1RJDiBEybwLhluiMIxobtYKeKI57D4Dkb
NHzIGwUhUXpvANbXLLm4VND8mtH2dw==
=vhbG
-----END PGP SIGNATURE-----

--Sig_/sURfN6DVNARdQ0LfUC5a.x6--

