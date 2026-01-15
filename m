Return-Path: <linux-next+bounces-9669-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E16D2258B
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 05:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37A64302E152
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 04:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703D02C21F6;
	Thu, 15 Jan 2026 04:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D0jqZ2gq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363E2EEA8;
	Thu, 15 Jan 2026 04:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768449905; cv=none; b=gyRL6ARdHZlxz32ljHvL6w7hUYONAyzq9z0ybWXC55uYKXsD3oJAPBzEXktwvpsMpFerYmIuHx3VJNm6g07fSRRza8gcqz+40WDtMcT8HLPUsl2Q7C9JiIVdh1zf9nqE85Sl5d1uH3k72yBtBrZi8OLfMR7ah7mqIQJcezuT7RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768449905; c=relaxed/simple;
	bh=CVDT4nfPl/YUTfnsH5tWAgcWiBsnRi+2tpnbua9lDo4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZHjlA14TWs+XzoOdXW/MK8i7JRHXqdAYPTU/4TBMYuFe20b2KW4kF7EKS0JBBkRexNtYCs+D+60QaZdNMZw4MHpI3EVfwDEDLFLJsuAkc9Uv8WN+j+Hny6hpY7yEVe4yez29XVPIvLOHFCXSv7Vz6wlPS2BLbnEVrmhmlxl5Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D0jqZ2gq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768449900;
	bh=hq+hJV8BVHJ5HmPRg4MRE3fLYZsogUOrmkN5HjE9FXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D0jqZ2gqEVG8YBzGLSt2apfiYPcBooiVt6qeYsmw7uyg34FapZUQORmF848To7Kxh
	 i3lyj0Vcj0euKfWYqpw91gHjqk5OF5GuWL1DRvRogYmyQxt1NZMAC8gJxb7rKQ/Drr
	 iFlDz2qZmY+aFVQFnXP5f1inE6+n66o0HZuLbTRAGBaX3FlRn5Bn362EXBrZEg9c97
	 zPeLs2m43i16uzPcqvHOegNDnqhR/ktbTbKIwBjJKRMSyZT/xT8DTA3aiwE61NCbsU
	 d60priJ/ndvZDCZAucqgmq3DDO3eUUwSmpFYjJqDtdHx4UzVyr66rW7MJGzTFgJiGD
	 K4cA8OfArPNrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ds8Wv5fLbz4wCG;
	Thu, 15 Jan 2026 15:04:59 +1100 (AEDT)
Date: Thu, 15 Jan 2026 15:04:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20260115150458.4ad09c28@canb.auug.org.au>
In-Reply-To: <20260115031053.GY3634291@ZenIV>
References: <20260115140132.6e0c05a0@canb.auug.org.au>
	<20260115031053.GY3634291@ZenIV>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TV3cemW3SXoIB8jsvj5ynCg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TV3cemW3SXoIB8jsvj5ynCg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Thu, 15 Jan 2026 03:10:53 +0000 Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Thu, Jan 15, 2026 at 02:01:32PM +1100, Stephen Rothwell wrote:
> >=20
> > After merging the vfs tree, today's linux-next build (htmldocs) produced
> > this warning:
> >=20
> > Documentation/filesystems/porting.rst:1348: ERROR: Unknown target name:=
 "filename". [docutils]
> >=20
> > Introduced by commit
> >=20
> >   7335480a8461 ("non-consuming variant of do_linkat()") =20
>=20
> Egads...  That's from "filename_{link,renameat2}()" in there (there's also
> "do_{link,renameat2}()" earlier in the same line, but that didn't produce
> a warning.
>=20
> Any suggestions re better way to spell it for .rst?

It eventually becomes (literally) "filename_..." so that might be the
issue.  Maybe quote it like 'function_...()'?

Maybe Jon or Mauro have a suggestion.
--=20
Cheers,
Stephen Rothwell

--Sig_/TV3cemW3SXoIB8jsvj5ynCg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmloZ2oACgkQAVBC80lX
0Gz3Mwf/aTEGYAHl37vTzIk23pdN38eRKEL4HzvpkF8bwIjo1o+k8Yq3EzEXwak2
qUsrsFenW6AcX4TKVAD3vvl5C1yERLCAcSGvr72s1ykrVvvrRcPm7EFbQ95JVW24
29X385eZ7tAeSt+0tDwYRVKY7nSiAt2kAWq8oa78H17FBoXEgLzHFsmKX8L0GHuu
kA+w2Xq29biy+ENZkUkZxZ2GgbhOZqWq4v8MCELGhaS0TmweIAdy15U2QrcyL7Pv
PZCcZVXJZnVyQWFNvSXoCglqP85HdTV2c0IAYDh8gE/MybijCGA1fZ//QExWRPDB
ClC9ackr33ifXFIEv24UmD2dgAedMA==
=uyTG
-----END PGP SIGNATURE-----

--Sig_/TV3cemW3SXoIB8jsvj5ynCg--

