Return-Path: <linux-next+bounces-5560-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E79A43230
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 02:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B37516DE7A
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 01:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E147F2571CD;
	Tue, 25 Feb 2025 01:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqP6etYg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A112571A9;
	Tue, 25 Feb 2025 01:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740445347; cv=none; b=sWVEMqBRzhZjduMYCYmeOKQLssh06xXIaPdp9uSPDIDZ5q4NsCd/Qjll3lMWnNpmw8NfcomnuQeCCvlSl/wpocMb/Af/7P5y27WLHLPf0bdkr3e4YLDIM+7AiTQb1HY4hfYP+3CF2Ok8tSPV6KNkBVyvHAAy0wRuhhiRrhOmqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740445347; c=relaxed/simple;
	bh=z3gA8G/+cbZRJr6i5y3OAGbi5KlZyfJB9qPij//8txw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nog12OGxoKswDXvT4Usg4H/V10aRA8LiM1jChqGVrtXFnbeYTVDh10AlX6YxEKfyq0PV9XfAEj6GcpFYve0JRmLNfXNSwxSOM5uL9ffTWgDmuQ526bK+mH1yrQs2Lpw+qkwLFI51QBzhGdqMzG0Oh9LzmZQZeIwI4iQM7XRU5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqP6etYg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17B2C4CED6;
	Tue, 25 Feb 2025 01:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740445347;
	bh=z3gA8G/+cbZRJr6i5y3OAGbi5KlZyfJB9qPij//8txw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqP6etYgq3wAqL90iZcCJZ3kBYG2D3bBG4lMRzhoqJmXHm+FRay5/15bv1/vC28NR
	 sQ0D/Iy2dQpRe0Nx7aYydiGqWnLa34CcmktEH1G1oWzrchXViYArvqQO23nUbzy467
	 FZLQ84xxL2TtxE1ANCl1tSGs0mQpIBD7/8F4ksM9PI933kOgGUGc58WrITFBhG2Z0e
	 aik85N0OR/h+2zxkpxJw4LaJqJYgjwWjny3TwI3L2wrw6dyqZQxomjPtXlxXOch0cm
	 h294nA04lu8pMa72eJL44fpGZFgqb28a6tQcpyYTvrj22SsCYMu39yU/gCQIFYkQrt
	 vbsQJuS8Sdpuw==
Received: by venus (Postfix, from userid 1000)
	id D780E18066E; Tue, 25 Feb 2025 02:02:24 +0100 (CET)
Date: Tue, 25 Feb 2025 02:02:24 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the gpio-intel
 tree
Message-ID: <tppj7h63bmgtnwdmf4mr6yg5g55gsfcvpdnoo5jt2ua6soiqbr@olbbul3jro7r>
References: <20250224083406.6174f821@canb.auug.org.au>
 <Z7xDmddu6TZHNAFu@smile.fi.intel.com>
 <Z7xKKW-GrD6rEpYP@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kfxr4ztylv36datk"
Content-Disposition: inline
In-Reply-To: <Z7xKKW-GrD6rEpYP@smile.fi.intel.com>


--kfxr4ztylv36datk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: Signed-off-by missing for commit in the gpio-intel
 tree
MIME-Version: 1.0

Hi,

On Mon, Feb 24, 2025 at 12:30:01PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 24, 2025 at 12:02:01PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 24, 2025 at 08:34:06AM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > Commits
> > >=20
> > >   b16e9f8547a3 ("input: ipaq-micro-keys: use devm_kmemdup_array()")
> > >   67b12cda28e1 ("input: sparse-keymap: use devm_kmemdup_array()")
> > >   5f95e8d0be63 ("iio: adc: xilinx-xadc-core: use devm_kmemdup_array()=
")
> > >   18c4aec76056 ("pinctrl: pxa2xx: use devm_kmemdup_array()")
> > >   d7f6555aec79 ("pinctrl: tangier: use devm_kmemdup_array()")
> > >   6e1bba1140a9 ("pinctrl: cherryview: use devm_kmemdup_array()")
> > >   af946f612dfe ("pinctrl: baytrail: copy communities using devm_kmemd=
up_array()")
> > >   85ab35bae5ac ("pinctrl: intel: copy communities using devm_kmemdup_=
array()")
> > >   4c176c256dd9 ("devres: Introduce devm_kmemdup_array()")
> > >   d7a76a31c46e ("err.h: move IOMEM_ERR_PTR() to err.h")
> > >=20
> > > are missing a Signed-off-by from their committer.
> >=20
> > Thanks for the report!
> >=20
> > But I dunno how to fix it now since it's most likely have been taken to=
 some
> > other repos before battery.
> >=20
> > I can issue another tag with that being addressed, nevertheless.
>=20
> Done as https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com.

Thanks, I rebased the power-supply's for-next tree to use that instead.

-- Sebastian

--kfxr4ztylv36datk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAme9FpwACgkQ2O7X88g7
+pp5FQ//bYNajbQOKNw/pPeUdNyKEtAZSHTMC2QxcSpN5J1c8eSLaS5Pl9Ev9Soo
Yo8+Lj4WTVgJqP0AnGgCk+VMwIFcWhOAXbfNnAiIeOJhCOECbfXs9iGdlK3qixn0
ZoKOXLSo8Tr0CG17cZRtruSa9QN488SYdIh4D44Ojiz8xoaSr87Z44KtRl37n72H
mceE2boXkJlbk8mv86MoDIA3bTcVY+JnxKdT4WnK7FmtPxm46YbK3ycgbZHpEZLh
aELzZURyomION4WlQ9NUuZOELJVN7VGvNIjM9n2BZOCL2FYoqqJPS2oSB2B0PuuM
TCcXdi3/Frs+8V5mSU0hnG+frXIbrJqMzPlf3OwreA0XO5RxcbBUwvx/WxVBkAjc
kRMB1DYAFXUM9p/sHOBcxKUNlhEJ3XOo+XwsXa/wgsevvdqJQZqaUOV1z36szhSy
dzqMjtOn52s+eNnElRyUItWWtYNAGLhuz3lMY73s1AX2cpXxr/f7aXbbVK0/iHbD
X0m9d2yubKYpSymdTtYEm49wqVS6zbeW9hcT9nN8fJTGXQiyQTfoEhhUToSUmm9n
+9wFQWnUmuM+tfWJ8yTG8FWyyIAxXvthRHOm/LQX/u+o3VUrzOHRRhOBya9Qjyws
Oss6MIjhJZDHa5Kgjh5BeL2zsPLeK+3BgeahJNqqE+3xVpJNrKg=
=Q2V6
-----END PGP SIGNATURE-----

--kfxr4ztylv36datk--

