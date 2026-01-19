Return-Path: <linux-next+bounces-9699-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C36D3AEBF
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 221883046404
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 15:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592AD387592;
	Mon, 19 Jan 2026 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qenAiOx+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351C63346BC;
	Mon, 19 Jan 2026 15:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835648; cv=none; b=rTzXzTADWyzMf3SrwDJk1TtAvvTJqoF174xY4mpkeBDzhM9vLIrarSVzCk+V3KTwBce1EeYOCqxPwm+0jAsIOyN+RhirwL73iCtbyvgtW/GqOakq7aZCuAUz8zApf55qvZFRHV9Mx6oFh3sF1NxEyq7AzS/e7XwNhICTsuaNeqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835648; c=relaxed/simple;
	bh=LqorXF1ufKA0SjwThBCq0ZpCV/6wIGaKT3rnzLzhqt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQqKItkhmvCwC5jf7oY5WUkXeyxsz3uiKff/aLBILm72I5Av4RHozPYm1caQRqhM0Oi8gZsAKAIXkTn63p+tJfSZsShXKeSp+TGkGkC37B0gk/qHYTN+OfzGYv/1H+Al0wmiYyV448kNLUam4XzhRS+ggdGbM7MSMNLKW2+SRbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qenAiOx+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB24C116C6;
	Mon, 19 Jan 2026 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835647;
	bh=LqorXF1ufKA0SjwThBCq0ZpCV/6wIGaKT3rnzLzhqt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qenAiOx+TapvNb/qxq5RK4IYfxC09nysxt8eqv31UFmv1aILrmM2vDLZlxLVvcX50
	 QDDlaqo4rvP8ULy+NAQL5mnnd08idcM8E3gDMYTJdETDSxnyEia3O5iQeIEMrfdA+h
	 svflqAMY3gLFGI8UW1NyO/zn7N6I/5heo/4L6TGuhnTgAxUUoMPktMnmOuTr3yU8/j
	 0IrYepdga+WaVmV+3tfcze2cMwOduOyAzUi1xS5XGFZRwKveWVTPKQneYPNA8mC2cP
	 XN3iPCCjkB+BRPfQV9XHiPE0fOvYL8PgH3cfvscK2N2DcsupNPjcxRKTLByHrstWgP
	 M0EDZ3JNsRQOQ==
Date: Mon, 19 Jan 2026 15:14:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>
Subject: Re: linux-next: manual merge of the rust-pin-init tree with the
 rust-fixes tree
Message-ID: <c2d35fbf-a1ab-406c-af0f-35ecc3ad54a2@sirena.org.uk>
References: <aW5GPwfJPrQjm-wC@sirena.org.uk>
 <CANiq72=d-U5HJjCogdYdkFsN1B_rkkc2H6zy7TEtwG4erAG_7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+5kQA/tLwz+vPegw"
Content-Disposition: inline
In-Reply-To: <CANiq72=d-U5HJjCogdYdkFsN1B_rkkc2H6zy7TEtwG4erAG_7A@mail.gmail.com>
X-Cookie: Does not include installation.


--+5kQA/tLwz+vPegw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 04:04:22PM +0100, Miguel Ojeda wrote:
> On Mon, Jan 19, 2026 at 3:57=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > diff --cc scripts/generate_rust_analyzer.py
> > index 3b645da90092c,d31d938886589..0000000000000
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py

> It seems the diff is empty :)

> I assume you kept all the union of the dependencies from both, i.e.
> just using the line from 514e4ed2c9da9?

>     ["std", "proc_macro", "proc_macro2", "quote", "syn"],

Yes, that's what git does for a noop change.

--+5kQA/tLwz+vPegw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluSjoACgkQJNaLcl1U
h9Cengf/an8wVpdNDNKR+9JKXzx8tgx1B0OeGKxQyfp17GRxtbClGerfT/+wSCST
8lPtQdOszehEuPwwaRgbA2Enav2m6mAE2adKBS4xgqQCv4CuvFiY+YZct3XfNm0P
fhs8sAZCxTpyIsXesZhpSmK+f6m3yzqWTQleEBtyWtviJ+S0lhRkV8NX/oT1qJiS
r2LA6LV6UFmPmO2A2Da/pgiiInOKpRDX7pqORuhxtDOVdI8MGmYpiAcC0GAY7afB
k5I7BYRR6nkYp2MHnqq/RPuJIlenCoOOZ40RtrY3i+atfMYBFoTPxIZfWnAxAmTZ
J/U1L4d6J6Y+HyP3vjgSTLBCcrGM8Q==
=usVm
-----END PGP SIGNATURE-----

--+5kQA/tLwz+vPegw--

