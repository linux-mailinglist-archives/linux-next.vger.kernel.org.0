Return-Path: <linux-next+bounces-8717-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0EC0E275
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 14:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1E34279BD
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 13:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AF13019D9;
	Mon, 27 Oct 2025 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA1jVO7e"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C04D289811;
	Mon, 27 Oct 2025 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572451; cv=none; b=jA/yVWrdztG4d8WQ8Nm39WJ4MISLjk6fl5bg1UhFMoIHZ1trWN0At11/oltdf48rFGTkVzvmHXvM0PG2WaKkw8RXuzyZ4mALxi5v6QhQvH57bH1qK2muD+RY3VEmbOlKfp+zuHMCGSOeW2N+FtYACbn5pCYl4/BLjLncGtS8gEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572451; c=relaxed/simple;
	bh=Y+7SSZgnKZ07J6Q/SJBfYgKHTxDl5CM35nIpP66DbZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBqpw36x82ljcwBmmV1csnQC8aFLXAwcAazJrw98fpNXfCg5CU7Vjgfabdu+WvPJLWUEEdnxIJN4ozLX1fMNa8HaCu8EPhqxlS9VasyNb0ZmXqDT/YqD4xYDNs8ne5cYubBNbhlZJmxSz/Yehvgdarxbx2A6syyWZII0F3Q86Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA1jVO7e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC16C4CEFF;
	Mon, 27 Oct 2025 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761572450;
	bh=Y+7SSZgnKZ07J6Q/SJBfYgKHTxDl5CM35nIpP66DbZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dA1jVO7efgWNhaV3stveVBFEuShCY9Zrn7hKuzOVRydTYrJi2LqfHSwKDweKqbZsp
	 qElBLXs7HOFi6rWaoK/mzsPtPvqWasT2YW4cyvu0JZ0yhO2gV3xpI/vYfUnthf5cz7
	 nzAh4DNitzrt/lpWOL2vyBe6F0+xiZ+2ygHkTr9l4SIhVVrQAwhYc8HcyrhTW81hwp
	 YqJEWjvzgCv6a916uqwXszYejJiCG63mQcJKAfaRh6iISBT95c/z4kh3H2HvO3kU8r
	 0XD5N0iM0ntdxSiq1fyCjG25GZCCltyYIAbpELjEEUHWiKTk57wp9/Qfg279cVl2DE
	 f8dF8ZeBuw/EQ==
Date: Mon, 27 Oct 2025 14:40:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Peter Colberg <pcolberg@redhat.com>, 
	Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pwm tree
Message-ID: <yohdkizrcgfyspfj5a4zarcu5b327aiskwwjth2k42q5q7p76l@qspcmydjnxk6>
References: <20251027125148.7f7d8ed6@canb.auug.org.au>
 <22fl35khmbf6ufyjzbfvxor7b6nohqakqovjoya3v4mmlenz5c@6wbdednrd2pb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4tiarnnz4isoujso"
Content-Disposition: inline
In-Reply-To: <22fl35khmbf6ufyjzbfvxor7b6nohqakqovjoya3v4mmlenz5c@6wbdednrd2pb>


--4tiarnnz4isoujso
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: build failure after merge of the pwm tree
MIME-Version: 1.0

Hello Greg,

On Mon, Oct 27, 2025 at 09:11:35AM +0100, Uwe Kleine-K=F6nig wrote:
> On Mon, Oct 27, 2025 at 12:51:48PM +1100, Stephen Rothwell wrote:
> > After merging the pwm tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > error[E0277]: the trait bound `core::result::Result<core::pin::Pin<Box<=
Th1520PwmPlatformDriver, Kmalloc>>, kernel::error::Error>: PinInit<Th1520Pw=
mPlatformDriver, kernel::error::Error>` is not satisfied
> >    --> drivers/pwm/pwm_th1520.rs:331:10
> >     |
> > 331 |     ) -> Result<Pin<KBox<Self>>> {
> >     |          ^^^^^^^^^^^^^^^^^^^^^^^ unsatisfied trait bound
> >     |
> >     =3D help: the trait `PinInit<Th1520PwmPlatformDriver, kernel::error=
::Error>` is not implemented for `Result<Pin<Box<Th1520PwmPlatformDriver, K=
malloc>>, Error>`
> >             but trait `PinInit<core::pin::Pin<Box<Th1520PwmPlatformDriv=
er, Kmalloc>>, kernel::error::Error>` is implemented for it
> >     =3D help: for that trait implementation, expected `core::pin::Pin<B=
ox<Th1520PwmPlatformDriver, Kmalloc>>`, found `Th1520PwmPlatformDriver`
> > note: required by a bound in `kernel::platform::Driver::{synthetic#0}`
> >    --> rust/kernel/platform.rs:196:15
> >     |
> > 196 |     ) -> impl PinInit<Self, Error>;
> >     |               ^^^^^^^^^^^^^^^^^^^^ required by this bound in `Dri=
ver::{synthetic#0}`
> >=20
> > error: aborting due to 1 previous error
> >=20
> > For more information about this error, try `rustc --explain E0277`.
> >=20
> > Caused by commit
> >=20
> >   fb3957af9ec6 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
> >=20
> > presumably interacting with something merged earlier in my tree.
> > If someone could provide me with an appropriate merge resolution, I will
> > apply it.
>=20
> Having no relevant clue about Rust, I bisected that. The bisection points=
 to
> 0242623384c7 ("rust: driver: let probe() return impl PinInit<Self, Error>=
").

To make it easy for Linus to merge my pwm tree during the next merge
window, it would be great if it could contain the conflict resolution.
Can I assume that this commit is stable, will be part of your next MR
and are you ok if I merge it into my tree with the fix for the conflict?

Best regards
Uwe

--4tiarnnz4isoujso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj/dlwACgkQj4D7WH0S
/k6ojggAopMSGo3ounDtSKl0k/U6kBNTNPmc2KJaylTX3nlmmqX1QcO1DPYNTWue
PZzrfD1BIC0NYqOU0LPcmtjye/9zJnGZzVHUWxOCTxLUWKwJgQ/89u/U6NTRbkMA
LvqK1IuWdAclJipotuhbL8fwkIiinmhN4shSIEemn3YUhml9eeEmF9834nChqvOI
4+fe95IwP19eqJleDfvkpWw3YqeGpZhjonmtL/DeFDmIOCJE2k229RSZRFAbUsxD
6JaOcZaqiHAAddZM78niOX69sZgvqhB2lf2Ud735bdRwNYXmsgVXDGS0z9qgN850
wWdkfNQgHFI8tTKAL/Tw0SR8QYHq4w==
=A+OE
-----END PGP SIGNATURE-----

--4tiarnnz4isoujso--

