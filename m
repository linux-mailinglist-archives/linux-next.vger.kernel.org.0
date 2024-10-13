Return-Path: <linux-next+bounces-4248-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E0199B8F1
	for <lists+linux-next@lfdr.de>; Sun, 13 Oct 2024 11:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6241F1F214AF
	for <lists+linux-next@lfdr.de>; Sun, 13 Oct 2024 09:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29B084D34;
	Sun, 13 Oct 2024 09:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NZ0/EhHJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295781742;
	Sun, 13 Oct 2024 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728811816; cv=none; b=HGwQGyDhY7OW1lPvu7k9yMft5YlChAFDoNgLCHzlWzCM439r3/jbhq+qv6Yy6tAm/k7t08GlRwSW9dkvHztpfIT/0cGB5bz8U4QWhm1BQx1HI4Dn69Wn24+YuFdjVBYC6SB2DhWIlIitdJweiehFzUFyXkcBzQ/VYXuFr/euJRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728811816; c=relaxed/simple;
	bh=rnVBMfLkJ/5+OaoRAsTc4xGBbOekviQUwGUt9EUejnw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pXjenchYRXTwb/O93af9/rSzpO717OBVW7DCNY06FwURgFfbk5w5vbB5vCQbpdWldRzGgVL2UpwaOKubW/y7effPU4bcOk6ObGX2NyoWYDc9/A0evuJwdQWhL5weMN7BISa0CCztMwbqA7z+JWa+3BzM4jN2UAyP4OtRQbq9YvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NZ0/EhHJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728811809;
	bh=3u4OtcyNblTpacAoKt9ZuttTi7UG/amEqZrR8ZCu5qc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NZ0/EhHJMki2m87OCv7K5FuDYK+65rLF17QFT0zkTEJnJO/p1iLAjvc43vnkG3vgT
	 J4wqs19CXjWyihkLjT6iub7HunRMGB8EqyAGRK151UNzU8KPehT/jZm/6qPOqWgq4G
	 hu6xAy+MJmCTpqPJSnGrpZV049Tt4SrVpM4HobWzaGlApfODrNFT6fyKAg3nFlB9+N
	 rCuMoqa42RxuTHg2CKA4RNnafDzErq3bgTzxSq8TA8lGPuxcVRAh9MZg0tD4XA/Kpp
	 SXmoq1pTZpn+Ez+l7XTRVtYF/Ft78RkUwKK+WmVjqVVuyZo8g62ZRcQVAaVc5pEbNF
	 lGsbcewVzPgbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XRFSx48m9z4x8c;
	Sun, 13 Oct 2024 20:30:09 +1100 (AEDT)
Date: Sun, 13 Oct 2024 20:29:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ian Rogers <irogers@google.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-next@vger.kernel.org
Subject: Re: [PATCH] perf tools: Fix build failures on ppc64le
Message-ID: <20241013202925.69aa2314@oak>
In-Reply-To: <CAP-5=fWm86UcwX+B_XjFSLFJF54QP2trYzJgJF0927h-AzSV_Q@mail.gmail.com>
References: <20241011102330.02bece12@canb.auug.org.au>
	<20241010235743.1356168-1-namhyung@kernel.org>
	<20241011114858.61ff252b@canb.auug.org.au>
	<ZwjG_ZpqV4h3HifQ@google.com>
	<CAP-5=fWm86UcwX+B_XjFSLFJF54QP2trYzJgJF0927h-AzSV_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C4G2hLin1RLrVaYc_J0TJsO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C4G2hLin1RLrVaYc_J0TJsO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Fri, 11 Oct 2024 00:05:21 -0700 Ian Rogers <irogers@google.com> wrote:
>
> Elsewhere for PPC we carry:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/perf/tests/bp_account.c#n3
> ```
> /*
>  * Powerpc needs __SANE_USERSPACE_TYPES__ before <linux/types.h> to select
>  * 'int-ll64.h' and avoid compile warnings when printing __u64 with %llu.
>  */
> #define __SANE_USERSPACE_TYPES__
> ```
> Given the comment I suspect we need to do similar to fix this.
> Stephen, could you test?

I added that to the start of tools/perf/util/evsel.c and it builds fine.

Thanks
--=20
Cheers,
Stephen Rothwell

--Sig_/C4G2hLin1RLrVaYc_J0TJsO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcLkwgACgkQAVBC80lX
0Gw5IAf/R6wI9WaE+CGhPnEQau459CjjMAxlD1pE0jvc3kXN2/xN8tqPuxmPTIJJ
ts4Z+6uL5RSv5x3GEyq0O1RgIUuo+Gp5wYoe0eLilHnzjxi2CEyLJC78KnVmd+q3
VCtz+n9LOGOLJWS1QVeGYExGGdNgKIxRRIz8v6LnLA0NlsvUCSJQfM5IFijQzrJT
l1s9T6v5beE5Z+vOlDhHZ+sIbRyU9TX051ltRKAHg2cjCq6KQj76JCfyPueMuBAe
dlHtHWcNF/vzJ08n3yu/ZRueq0I9Oe2gPc2ua22OgvJuEhlS9TskFVjRGMgrbotV
uWxzqwDYsOlT0VDwsagnFYE8WmUUBg==
=FAfA
-----END PGP SIGNATURE-----

--Sig_/C4G2hLin1RLrVaYc_J0TJsO--

