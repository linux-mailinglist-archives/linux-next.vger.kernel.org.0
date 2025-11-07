Return-Path: <linux-next+bounces-8897-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C3C40E9B
	for <lists+linux-next@lfdr.de>; Fri, 07 Nov 2025 17:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89753B749C
	for <lists+linux-next@lfdr.de>; Fri,  7 Nov 2025 16:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C3C331A6E;
	Fri,  7 Nov 2025 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="croOijXs"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26F2D0C7F;
	Fri,  7 Nov 2025 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762533864; cv=none; b=o3xiRU46w3YfMF1DI4vm0JPPNWpmu3eapRK8c9sYuU5h2r5Jk1gECmJrjcrX9NJk3jakkVf5xnJhOT8R+KWOT79fZ+HSg863FPxVOsD9/3w8ugOBLQIjfoNKgmCDnc8+rlvnfe0c9v/0/3dwtabkfmPZ8ztqOy1hMbBarunmXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762533864; c=relaxed/simple;
	bh=uN5A0nfxCBtgRmilzRno1RSWZ+t8ZYSS8FZKDPXJoc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZM2apvGYSMvs2I2UCstOYopBlbv0EAjfjtLpU0u2uSJXF0poLHTLTCO2uMaa3UlsqrBhE2v7Jhau9EPVYtHKVDGWBX6ekLErTK5pDd1f0EuL8RGlTAIajr6gT35i46cl3CWg4vIa62kILJ850yBJPGI8lTFKeF8lwGKM7b330wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=croOijXs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0F1C19422;
	Fri,  7 Nov 2025 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762533864;
	bh=uN5A0nfxCBtgRmilzRno1RSWZ+t8ZYSS8FZKDPXJoc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=croOijXsOaCmraSCWpta1rmINCRaCuf5KW5aJJU5atJfo0PR9mbFiaLvL8CWXQMIn
	 opjlUvQx0rRojJxT7nat/CcUPcV95JVwKC/c7v9S0UPtJQETb+NZDs+FDsIJxwJ6eU
	 uRf4DVTquyXfH8W9aXd4NJ4uvyfyPoBvapIndYIRGaj8z/jPSPm2UJOJiAnpbopcQd
	 JS0Wm/a01aO6B9yqNqtQibaKTFuf56emg7oT2WFssR1nLs8wFvSgcX+5EyLSKaat/q
	 5jRZi1woXrmtsJyyxfGtSlOsVOpdYFEj3e3QWDpEorKb17sRkKn+T4f/iimf+4W5Ef
	 9uZ2njDc9KaaQ==
Date: Fri, 7 Nov 2025 17:44:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Sami Tolvanen <samitolvanen@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
Message-ID: <f374sh5rsbxvboowft6xpiimxlzw264i32txgiok53on2vxxu7@lpetaklaofzb>
References: <20251104104827.1de36ea0@canb.auug.org.au>
 <20251104105415.68bfb090@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="djey23n36i4u7ctk"
Content-Disposition: inline
In-Reply-To: <20251104105415.68bfb090@canb.auug.org.au>


--djey23n36i4u7ctk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
MIME-Version: 1.0

Hi Daniel,

On Tue, Nov 04, 2025 at 10:54:15AM +1100, Stephen Rothwell wrote:
> [adding the modules tree contacts]
>=20
> On Tue, 4 Nov 2025 10:48:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the pwm tree got a conflict in:
> >=20
> >   rust/macros/module.rs
> >=20
> > between commits:
> >=20
> >   3809d7a89fe5 ("rust: module: use a reference in macros::module::modul=
e")
> >   0b24f9740f26 ("rust: module: update the module macro with module para=
meter support")
> >=20
> > from the modules tree and commit:
> >=20
> >   927687809649 ("rust: macros: Add support for 'imports_ns' to module!")

I reshuffled my tree such that the import_ns commit sits directly on top
of 6.18-rc1. The new commit-id is 739ad9be61e5.

> > from the pwm tree.
> > [...]
> >  -    if let Some(imports) =3D info.imports_ns {
> > ++    if let Some(imports) =3D &info.imports_ns {
> > +         for ns in imports {
> > +             modinfo.emit("import_ns", &ns);
> > +         }
> > +     }

Given that the conflict resolution is non-trivial and we already know
what to do, I suggest you merge my commit into the modules tree.

I created a signed tag for that:

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git tags/r=
ust-module-namespace

for you to fetch changes up to 739ad9be61e5f53dbd8d7d7e80723d0799ff077c:

  rust: macros: Add support for 'imports_ns' to module! (2025-11-07 10:01:5=
3 +0100)

----------------------------------------------------------------
immutable branch containing module namespace support for Rust

----------------------------------------------------------------
Michal Wilczynski (1):
      rust: macros: Add support for 'imports_ns' to module!

 rust/macros/module.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

Thanks
Uwe

--djey23n36i4u7ctk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkOIeIACgkQj4D7WH0S
/k48Dwf/XwTQyOW10DFqp/toUtUVKYM5NnP6sLsp4aJdbAiHGLES5Yy3G5sFiW45
5sgiUx10f4mWugPng7agkY8N3uI+YA2iLyP49i8mM3nynnxHWhw4B8v8f8OUyaar
xBKbAaNhobqlbi54vLKfzOAKWmxV0bUUs+ORtZuoBqN4KPcEvp2FpcLOJ5MFAeAn
DGljgdJn6dpN7GEeXduGZruz48aDTdRpXW2c3E6cF2XIE194y/hDRe/Wbl2BkG7I
MCqBBBMAbce5XP6NNiuENbwx2H5dWSG1oGVxM7kAjAJ81/JGeiuQFyy6th/Hmihj
PLhYLgBbpoZlkngCPPg7zuUf7/0ASw==
=ZI6z
-----END PGP SIGNATURE-----

--djey23n36i4u7ctk--

