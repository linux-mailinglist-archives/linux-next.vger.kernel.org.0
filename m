Return-Path: <linux-next+bounces-5461-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BD7A37403
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 12:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98C53A56CD
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 11:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9766018DB34;
	Sun, 16 Feb 2025 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CtagqkxN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B867118DB28;
	Sun, 16 Feb 2025 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739706128; cv=none; b=pz/db+ElgNuAWKns1uKcKGaACcy3JyrAmR6aGQuIXq6lfaa6CIJHAbbY6wmpSRsnzZEd2JULYyKn0abcYM0Na4R9SZs0MdHGvTDryD2zhC39GpNzGNnw5CZssGWLJtH+7rdFMKh+9eW10/XnvTIgULwX+fpKpdZ0ATPaqlzoa1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739706128; c=relaxed/simple;
	bh=XqwOI8y99cwJzv1rKKhU1DblINCFVyfT0uqOCYw2rZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BKGlX8tY+5WX5BM9wcBFWYtgx51EhBIveEYwlwVf4A9wjNraJc9JtQg0qbMynTWKqPWVqMDfd1vhkSdXtH6cjizqfBnThYy5uYenlBlVq9tipKwDEVwzbouxrJH2Vrw9II/USdz67jznkWRHl4gzGtzrV7v70xJSJKBk9gRnzHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CtagqkxN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739706122;
	bh=Zi1V8fNPQGS0siVzlt7NiDcecy0vStvM3PWsN+6LX24=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CtagqkxNYoNgpdsXOwreW7PW+++vFw49W0qzvr5UYrEi3NLjmb/3slbf+6GOIpDzf
	 pgGlBoGooGyFFY7gegJHZMWsyHfOC21wON/5VsGBNqDSd+ybfFpjEFjoiInIpn4plA
	 wzLIX5yFoF8on3cHQHUUfUA/lknnFueqWHXPKJLKLpAJ9f8CX18DP9py2Q75056lDb
	 FJYTe5+kZIR9i2u6bKdNIRum2BNXRCafoHYp8gGd1qDaSIosULFtylOWI69ugD8y5b
	 2C+BsrWXh1qZLRbTwccI1P4xfNR+cavEEpXUfyXSc5WML6J0PhKMhHdM3/gbdel7mt
	 vbk8rG9ziqEBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YwkQy3Tlkz4wvg;
	Sun, 16 Feb 2025 22:42:01 +1100 (AEDT)
Date: Sun, 16 Feb 2025 22:42:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, Kent Overstreet <kent.overstreet@linux.dev>, Linus
 Walleij <linus.walleij@linaro.org>, Nick Terrell <terrelln@fb.com>, Vineet
 Gupta <vgupta@kernel.org>
Subject: Re: linux-next: trees being removed
Message-ID: <20250216224200.50b9dd6a@canb.auug.org.au>
In-Reply-To: <20250212095632.6bdd50d7@canb.auug.org.au>
References: <20250212095632.6bdd50d7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j5R8t8iEuqK6H1oKeKLT4cD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j5R8t8iEuqK6H1oKeKLT4cD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 12 Feb 2025 09:56:32 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Tree			Last commit date
>   URL
>   comits (if any)
> ----			----------------
> file-locks		2023-09-01 08:09:48 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git#locks-n=
ext
> fsi			2023-12-14 19:44:11 +1030
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/fsi.git#next
>   ec084e4ec314 ("fsi: sbefifo: Bump up user write cmd length")
>   f7236a0c919e ("fsi: sbefifo: Handle pending write command")
>   c5eeb63edac9 ("fsi: Fix panic on scom file read")
> gpio			2023-09-10 16:28:41 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for=
-next
> header_cleanup		2024-01-15 15:52:12 -0500
>   git://evilpiepirate.org/bcachefs.git#header_cleanup
> kspp-gustavo		2024-01-21 14:11:32 -0800
>   git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git#for-=
next/kspp
> tsm			2023-10-19 18:12:00 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux#tsm-next
> zstd			2023-11-20 14:49:34 -0800
>   https://github.com/terrelln/linux.git#zstd-next
>   98988fc8e9ed ("zstd: import upstream v1.5.5")
>   40eb0e915deb ("zstd: Backport Huffman speed improvement from upstream")
>   3f832dfb8a8e ("zstd: fix g_debuglevel export warning")
> zstd-fixes		2023-11-14 17:12:52 -0800
>   https://github.com/terrelln/linux.git#zstd-linus

All the above trees have been removed.  Give me a yell if you want one
back.

> arc			2023-09-10 16:28:41 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git#for-next

This one is still pending.

--=20
Cheers,
Stephen Rothwell

--Sig_/j5R8t8iEuqK6H1oKeKLT4cD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmexzwgACgkQAVBC80lX
0GzpDgf9GxN7FzDwxGC9RmL/bI70U6NJWRBcnARDZ1OcNIllG6puSOg5uCkggaVY
w6gnVUvFWepmwhqzZ4YmE5gOd6/j6TRpu6pcc5s/P3ShPAmw1AdV20ULhvQHlJkG
Pvfjlp3gtzQ2QdJNAEpceNHBm5i3HAt55BUnTdohQp3hQWEIe1uYQaiNQYUjKDcz
6s7CvTKaPqekLGcLRwEa+PgC3Po3V6kKXZzid8LF6Rg/CsHxNED9SBtit3hy2DMZ
223VraX+JwJ1OdbEVYub0lY5OYpL+/mAnLaBSogMRSl25O09SKKDF6w0qjCy6hod
EW7xYjr29VkexE3ykfGmgqzclUJZwQ==
=eKZj
-----END PGP SIGNATURE-----

--Sig_/j5R8t8iEuqK6H1oKeKLT4cD--

