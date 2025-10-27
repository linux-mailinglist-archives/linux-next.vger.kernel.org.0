Return-Path: <linux-next+bounces-8714-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE3C0C3F0
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 09:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FFDD3AAE01
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 08:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B11D2E5B21;
	Mon, 27 Oct 2025 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7oZVPKG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F6F2DF706;
	Mon, 27 Oct 2025 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761552695; cv=none; b=XVAKnPtnOApfnQ5qkt1PQGo2VDvQuKrP2IYtIhGnoJngAJiOU9yMHJ2pnS7sHCKoVwusZWFAnevP1BqT5mo38WFZeI0NYlM3liPVVg3BaKWGxMwFeEZfOb0M74/NhX1zNCVC2aG42rpEd6jbeGDJTZIXAGH4Sjo0oqh5+RdeXLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761552695; c=relaxed/simple;
	bh=S2kesE2CPmL5w4UG7wIR5tLRwgyhQgeo4xLNlKAHzfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rY6TtA1KWtCwz7uobGej+7wMYedYtViBXR+PpQZrTC5nbDhtoQyXvEaiFUL80xTK9WFuuUzmtibFjhVycRqjgwAqbpPadEI3TfBeNH4y6ppKLKg1gRAu9DLeqVpgSivtlThZFjLw5LZ7N/1L0YHfZYiVXdfYr6ThPG5j90e2pi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7oZVPKG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18919C4CEF1;
	Mon, 27 Oct 2025 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761552695;
	bh=S2kesE2CPmL5w4UG7wIR5tLRwgyhQgeo4xLNlKAHzfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7oZVPKGzUXfB/h3HcMueBaU9YUIXRghqI1PyundCNg6bxtwa9IUfsKHIVaDKjUiu
	 RWcZcHggXxCAcoLwDlUs3D8gf4YGUDMddjH44c2XXXx2mdvffzbpgn8F6NEUO+o/dS
	 2hmgFWb6kK0OHH9qDQQaajlNQPyA9LU8SutiK/0ReAK/iBA/DgD/q5+X8jnxrHQfgz
	 7looz/dmh0lAvLcoaz65eQn1eDX4uUbbN0Vfmj3MGdmNuohabRWLJL1qMWsVyd66Cm
	 +ndYD6Cg96GQPdnMjjeQ6DVIOe32aF0tfWWOzEGnGIgeaoydfMzcewqqFGEpakhFbT
	 mwdVBCiWMimww==
Date: Mon, 27 Oct 2025 09:11:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Peter Colberg <pcolberg@redhat.com>, 
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the pwm tree
Message-ID: <22fl35khmbf6ufyjzbfvxor7b6nohqakqovjoya3v4mmlenz5c@6wbdednrd2pb>
References: <20251027125148.7f7d8ed6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4qthniw2576jrrej"
Content-Disposition: inline
In-Reply-To: <20251027125148.7f7d8ed6@canb.auug.org.au>


--4qthniw2576jrrej
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the pwm tree
MIME-Version: 1.0

Hello Stephen,

thanks for your report (and creating next each day!)

On Mon, Oct 27, 2025 at 12:51:48PM +1100, Stephen Rothwell wrote:
> After merging the pwm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> error[E0277]: the trait bound `core::result::Result<core::pin::Pin<Box<Th=
1520PwmPlatformDriver, Kmalloc>>, kernel::error::Error>: PinInit<Th1520PwmP=
latformDriver, kernel::error::Error>` is not satisfied
>    --> drivers/pwm/pwm_th1520.rs:331:10
>     |
> 331 |     ) -> Result<Pin<KBox<Self>>> {
>     |          ^^^^^^^^^^^^^^^^^^^^^^^ unsatisfied trait bound
>     |
>     =3D help: the trait `PinInit<Th1520PwmPlatformDriver, kernel::error::=
Error>` is not implemented for `Result<Pin<Box<Th1520PwmPlatformDriver, Kma=
lloc>>, Error>`
>             but trait `PinInit<core::pin::Pin<Box<Th1520PwmPlatformDriver=
, Kmalloc>>, kernel::error::Error>` is implemented for it
>     =3D help: for that trait implementation, expected `core::pin::Pin<Box=
<Th1520PwmPlatformDriver, Kmalloc>>`, found `Th1520PwmPlatformDriver`
> note: required by a bound in `kernel::platform::Driver::{synthetic#0}`
>    --> rust/kernel/platform.rs:196:15
>     |
> 196 |     ) -> impl PinInit<Self, Error>;
>     |               ^^^^^^^^^^^^^^^^^^^^ required by this bound in `Drive=
r::{synthetic#0}`
>=20
> error: aborting due to 1 previous error
>=20
> For more information about this error, try `rustc --explain E0277`.
>=20
> Caused by commit
>=20
>   fb3957af9ec6 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
>=20
> presumably interacting with something merged earlier in my tree.
> If someone could provide me with an appropriate merge resolution, I will
> apply it.

Having no relevant clue about Rust, I bisected that. The bisection points to
0242623384c7 ("rust: driver: let probe() return impl PinInit<Self, Error>").

Translating the changes that commit does to
drivers/gpu/drm/nova/driver.rs for drivers/pwm/pwm_th1520.rs results in:

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 0ad38b78be85..dd554574adc8 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -328,7 +328,7 @@ impl platform::Driver for Th1520PwmPlatformDriver {
     fn probe(
         pdev: &platform::Device<Core>,
         _id_info: Option<&Self::IdInfo>,
-    ) -> Result<Pin<KBox<Self>>> {
+    ) -> impl PinInit<Self, Error> {
         let dev =3D pdev.as_ref();
         let request =3D pdev.io_request_by_index(0).ok_or(ENODEV)?;
=20
@@ -365,7 +365,7 @@ fn probe(
=20
         pwm::Registration::register(dev, chip)?;
=20
-        Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
+        Ok(Th1520PwmPlatformDriver)
     }
 }
=20
which builds again.

Best regards
Uwe

--4qthniw2576jrrej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj/KTAACgkQj4D7WH0S
/k4/DQf9HF0l+WfiUJ80xVvublUyDd9KIbNKYkZvQeLSwPMWIFa+Vhil6MH4AFXl
a7qBB7dyow2nUHc3u1Sf8GuzLIokUFLtCyKNmARvY3KFBsuYjWvAkR8MiUMlZfnL
W0g0RdaWeUw53XoxL1BDp589p47i4i6OR62QUeFTBIWJ5C0VtweX680oeR42w6jc
oD7Rhm/S95cOuaieNXHKBQmlrrFrfsex+QqnyXxwwO3K01A2Lc1HAnp49IlfHRuq
kHKtbGuL/aobkFLs1o2fBf8ojCr23tZZYuZ8x1nHtuilpbKez0XpRIvp4aAkMsOe
1w8yXsMan8KCH018aQ4sBIdp/nlUvw==
=i/va
-----END PGP SIGNATURE-----

--4qthniw2576jrrej--

