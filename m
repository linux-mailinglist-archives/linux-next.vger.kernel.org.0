Return-Path: <linux-next+bounces-6232-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 295C7A88EE2
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 00:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63D657AA984
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 22:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16FB1F4639;
	Mon, 14 Apr 2025 22:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j6ctk9rb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318FA1F4190;
	Mon, 14 Apr 2025 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744668523; cv=none; b=MIFx0dxxYqYv2GgnsABv8qAIT8jp3vYi8wRSQa3Zq9ZfKVa6taHG89LF6KCqKs0CNNHOYnALEldTAiyLfZWiPicvFZc8k9gEZgwKplwWxhIj7NbuNaX2rA7Dr6hMvMWeps1zp7skPAhQEisKZ5uMsGzqO+2iOCG093wjdcYpx4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744668523; c=relaxed/simple;
	bh=9Yo0VnBx72SR6fTR3rO+jIcqF/jg1UP0MC6aWN4pb10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gKI2DsFsKtfvJJ7cfClgxryF75Pvv8CGbgZzd0Ib4zGBw4LDeBYm70Bq/D2U5uwEnkqfowKCZkQE7YEQR9Vz0+YB+ibJQ0iuIxg1KUv4H13Gz/QPcolG2uhfQRSjpqN25abH/dtSzRiQin6wfETlFNrhaNCz0RflV1ifyAqcM4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j6ctk9rb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744668518;
	bh=kDu+BlNi+UHbmYwJ6hWzHVjUNjd/te1W25WFCYyPpPQ=;
	h=Date:From:To:Cc:Subject:From;
	b=j6ctk9rbUwaN5gPspCV4MwhiOWzktdkMPfRJiK0MpquNtemMBaJ0TcKMICfyWD/Bz
	 ID6lLw8YTVtzivstA6oWA4W2yMRRPeUub+AeGC/w7LsUQgZVaA91ip7WYamn9+1qq6
	 jl7tuVOfhq3jv851vyNFt53y/5vcVq2m8vV9hnbZoHWiOzCkkhqlWFu7Z60iKImng9
	 dXj+nQTROZDbmBO8BACOpDz/sltMdFVt01KzElD44DYakEGjXIyIF1gINBj6omzsdT
	 B7LmX73b3Cv+ZRM2g+pP48w7F+SbvDu0dcLF9UWOF0gT6xPUNcjW8b6cLJ0Nb6FXy5
	 0CWuUpGe9Q+NQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zc1df2TsGz4wcy;
	Tue, 15 Apr 2025 08:08:37 +1000 (AEST)
Date: Tue, 15 Apr 2025 08:08:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Filipe Manana <fdmanana@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the btrfs tree
Message-ID: <20250415080837.477fd5a9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CC3AWSz0vs6WylPUwgyQX1B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CC3AWSz0vs6WylPUwgyQX1B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  fb1f2fdbcf36 ("btrfs: fix invalid inode pointer after failure to create r=
eloc inode")

Fixes tag

  Fixes: 00aad5080c51 ("btrfs: make btrfs_iget() return a btrfs inode inste=
ad")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: b204e5c7d4dc ("btrfs: make btrfs_iget() return a btrfs inode instead=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/CC3AWSz0vs6WylPUwgyQX1B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf9h2UACgkQAVBC80lX
0Gxr4Qf/TOlQWvxxWQQqsDBqj9ZgxOTJqaSOX0iKcqpH9HlvvJF1kzNZHevk1ir1
C+D3TWLr9vbR1kvsj0vBMQxrhi25UEQ9iNxsu0BxDgegg9W6gl157Viw9FU0vKYU
gMFas+Qh1x6jaGv8S9xtu7nRrbEqi6P80f+UaAkLE7pQeA+CE2KndH6Ie/FnXsXH
ymfB4XlKRfOHRWaBj5lSNQcs61ivEr5n9POGgEQBvUMtzlDrgJHRp4TQ+IJu6s18
yLiwNnoIQd7oPF3c6hbfSMgPRKqdIUYKoUvZgkcg6Ae5fEwbqrurL4wOn9lsZUce
d5ap0QW8HaxT6Hghe8xqNz5vA4/bFQ==
=sx+e
-----END PGP SIGNATURE-----

--Sig_/CC3AWSz0vs6WylPUwgyQX1B--

