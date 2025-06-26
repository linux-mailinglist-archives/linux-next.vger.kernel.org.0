Return-Path: <linux-next+bounces-7253-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA34AE9694
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 09:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9310189EE70
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 07:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90282367C4;
	Thu, 26 Jun 2025 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e3tIXIab"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636791411EB;
	Thu, 26 Jun 2025 07:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750921548; cv=none; b=h9oFaBXt9uYoLeFIAcBkGUFy+jj3ncq1W0ZZvz/OZdaWb3a+fkI0KPumUgZibwSVYEyeSmKD0ASUx6e7Bp0ymkDKGVtzP9UzDNAgwYrh7aDlr46TO6V+qKDWKWBY2rjoW5dIX97jYjfM8MDkfz0utlzEPfDYcpzBXJ22G0n/1Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750921548; c=relaxed/simple;
	bh=DsbCranEGLf3M4bGrBRu4hdiZKB6aoe7B2QDjC5oq/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+u5X+DJ9EOfFo/scf6cIoUf2n6fmDWjLU1TLg1E90ksGdrHXmlbviGf4Slsxp7RHZqfwRr2tkCRIGWbzTi2i/bsGsR2LlipUBAQEbvFwxqYHqWcwQbB4/zilaeQ/QMl1ZKV5V1JEl7KQTxVp9LJ7KrGMQNJEixbK2lFZCWzf5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e3tIXIab; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750921540;
	bh=8SeYKbv8qac5pO42Nz+KU0YBM2oD16iJ08jD6EI2JTQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e3tIXIab+uT2JSsMLBqA0zDRoHsOmBqdar+NP5uzu27qLr2Wq3xScXw06xp8XP5wg
	 3AjaMP5UZ7BKPT51y6YQ9rYoxEccMUY9RwanJaSyAzVt6ANVU+0YcsbFx+r5mHzl0P
	 tTpEmrpL67TnKhuGRBhaL1bbmGZE/V3P9Jigu/XGWWIV/1I0Gzp4zOwQEhHY7I7eZk
	 WpG9LjYJ+K8i+LuWr3Gt5aIe2dT3SZlQyDIXpN4M8We5WSaHOkXUGRA4DUV+TueZos
	 IB28l3f3djYEhRK03v5dI0oMHPWra4gdmoR2NyDA3528y6S6VbQ70kUE6ip1TC+xwq
	 cXo9KZ32BdXDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bSV842G7Lz4wcn;
	Thu, 26 Jun 2025 17:05:40 +1000 (AEST)
Date: Thu, 26 Jun 2025 17:05:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 drm-nova tree
Message-ID: <20250626170538.67e26afc@canb.auug.org.au>
In-Reply-To: <20250625161301.48264659@canb.auug.org.au>
References: <iuo4BpdTglZkpW9Xyy1ehjFspmj3ay0q7iejyeOShBG0HLZmIrhzIpi0eG_wBv71ZPPCgh2lcn2BOsrFHOegfg==@protonmail.internalid>
	<20250624195142.1050e147@canb.auug.org.au>
	<87ecv94ay9.fsf@kernel.org>
	<DAUQZ1TY9VT3.UJEFQ96157DJ@nvidia.com>
	<CeKXJWcbSngalEPTkHeRti8od7cPavN5gh1Opt1oNESUBUh8W4Kt7xnuHkD7l7dr1178GDTfqrabr9Pye6SWpw==@protonmail.internalid>
	<aFqXKKAxQp0yxUvL@pollux>
	<87ikkl2ca4.fsf@kernel.org>
	<20250625161301.48264659@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/45vukThAs+uifaaVPr.IT_B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/45vukThAs+uifaaVPr.IT_B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 25 Jun 2025 16:13:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 24 Jun 2025 21:02:43 +0200 Andreas Hindborg <a.hindborg@kernel.or=
g> wrote:
> >
> > diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util=
.rs
> > index 5cafe0797cd6..01a920085438 100644
> > --- a/drivers/gpu/nova-core/util.rs
> > +++ b/drivers/gpu/nova-core/util.rs
> > @@ -3,7 +3,7 @@
> >  use core::time::Duration;
> > =20
> >  use kernel::prelude::*;
> > -use kernel::time::Instant;
> > +use kernel::time::{Instant, Monotonic};
> > =20
> >  pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8=
; N] {
> >      let src =3D s.as_bytes();
> > @@ -35,7 +35,7 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) =
-> &str {
> >  /// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
> >  /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomon=
ori@gmail.com/)
> >  pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond=
: F) -> Result<R> {
> > -    let start_time =3D Instant::now();
> > +    let start_time =3D Instant::<Monotonic>::now();
> > =20
> >      loop {
> >          if let Some(ret) =3D cond() { =20
>=20
> I have applied that to the merge of the rust-timekeeping tree today,
> thanks.

The merge resolution now looks like this:

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 64fb13760764..76cedf3710d7 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
=20
 use kernel::prelude::*;
-use kernel::time::{Delta, Instant};
+use kernel::time::{Delta, Instant, Monotonic};
=20
 pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N]=
 {
     let src =3D s.as_bytes();
@@ -33,7 +33,7 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &=
str {
 /// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@=
gmail.com/)
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Delta, cond: F) ->=
 Result<R> {
-    let start_time =3D Instant::now();
+    let start_time =3D Instant::<Monotonic>::now();
=20
     loop {
         if let Some(ret) =3D cond() {

--=20
Cheers,
Stephen Rothwell

--Sig_/45vukThAs+uifaaVPr.IT_B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhc8UMACgkQAVBC80lX
0GwkYwf/ZKZ57yJ6rc96nxgoZ7jASEBVZ0d67OY4eMA3R4yz1uBDTq7DgOdccAoJ
cXMPk/BAgWLjZpGNCxy9qAkrOJFkSSb4LphlXZBwj6e7XllXqVaLTWFHGsyK4GIy
KlMBqc8szKiY+1hWdogmJ8FS/LUDvXD10sWubfKcQ148qs03l21rpdpX8x3ffDRz
KYeJB/erKeH3o5iR07+opGJMbXiT+mxZDXnRVLoTj1SuAszzAYOD/dWrenJnGCNJ
7bKJ7ErI4lKcEEOg7bsKN6XgK75ISeYc224Dv+xjs9cne5O5/PZw3vxDpfZIxsv6
+YgVSfl7/e/fMLlJrLALr9UjaBw8rw==
=lKPR
-----END PGP SIGNATURE-----

--Sig_/45vukThAs+uifaaVPr.IT_B--

