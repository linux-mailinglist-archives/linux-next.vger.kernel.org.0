Return-Path: <linux-next+bounces-9726-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74BD3BAE3
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 23:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AB453009294
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 22:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0D41E32A2;
	Mon, 19 Jan 2026 22:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LniVvSB2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA91CBEB9;
	Mon, 19 Jan 2026 22:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768861825; cv=none; b=MZHRcM0JvQMlJ8iVy8H7i+xjoXSIU4IHqEf2xIBxG2yMCQIC0/3wzf3VnoYxkXLEqDj2+2yj4ecuvu70bDM0uH5ZsQgtV2cIhYDkPxv8xf6lDVhCMnwjPKT2OJBgewWLd0zKMY0GSXiczLfw47EUCgpmIkQNa5yhNVM52ydzNEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768861825; c=relaxed/simple;
	bh=vqobzR/qbWjcrjyRqa6SkkLI9tSkG4eDhsuvZojmKKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sDvj1kMxp97fsiDboFsCvCM3S9YJYCoBYF/ATgRUDZ1p3M6IRrz9sztUjrrLdl/+YMntJEgLbg8q5BwiexzGnzOBAi7ecPQ7BWBDyDXTV3t2moGwBjAJM5RwsQeGN+k08vHOl69F5P0UIZKOlitEJxnRfEt189OtORHG8u+qB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LniVvSB2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB39C116C6;
	Mon, 19 Jan 2026 22:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768861824;
	bh=vqobzR/qbWjcrjyRqa6SkkLI9tSkG4eDhsuvZojmKKg=;
	h=Date:From:To:Cc:Subject:From;
	b=LniVvSB2GvwdJb5zqest9oogshFnDowhySf/9KK/JoxHIse0pS8ngbv62UwOTqvL1
	 NUN4NlX2g6acIKk1ZCGTtbGgo5ky0xb60CXzQTMgv1E6wDBpcKgBmwf0HetG93Ez+K
	 03Gehu+WWc/hnjo8C298GWKWcMrDE8s01cJcmqfqGp2BB4CQsY0oyT16NwrDnT+Bt9
	 1hsOMaHgFl78jLVoOxQZ8a8VxKUe8oBOh6yJaAhUwTtt4d2+DACFFSzTTOykvAaJqX
	 VoqR35yhY5HrBUUtYlfWMV+aqWi/Njq4fpxSvTtLEWJflTcbDHKZflLq++3lJwxhd2
	 hSkTl7eftMxVw==
Date: Mon, 19 Jan 2026 22:30:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Deborah Brouwer <deborah.brouwer@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <aW6wfOjd17D5tUC5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v+y0wOKD1zshv057"
Content-Disposition: inline


--v+y0wOKD1zshv057
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging all trees, today's final linux-next build (arm64
allyesconfig) failed like this:

error[E0560]: struct `drm_panthor_gpu_info` has no field named `pad0`
  --> /tmp/next/build/drivers/gpu/drm/tyr/gpu.rs:75:13
   |
75 |             pad0: 0,
   |             ^^^^ `drm_panthor_gpu_info` does not have this field
   |
   = note: available fields are: `selected_coherency`

Caused by commit

   8304c44631c37 (drm/tyr: use generated bindings for GpuInfo)

I tried reverting that but got several other build errors:

error: field `device` is never read
  --> /tmp/next/build/drivers/gpu/drm/tyr/driver.rs:36:5
   |
35 | pub(crate) struct TyrDriver {
   |                   --------- field in this struct
36 |     device: ARef<TyrDevice>,
   |     ^^^^^^
   |
   = note: `-D dead-code` implied by `-D warnings`
   = help: to override `-D warnings` add `#[allow(dead_code)]`

error: fields `mali` and `sram` are never read
   --> /tmp/next/build/drivers/gpu/drm/tyr/driver.rs:202:5
    |
201 | struct Regulators {
    |        ---------- fields in this struct
202 |     mali: Regulator<regulator::Enabled>,
    |     ^^^^
203 |     sram: Regulator<regulator::Enabled>,
    |     ^^^^

at which point I gave up and marked the driver as BROKEN for today, I
might take another look tomorrow.

I note that the dependency that the rust DRM drivers have on DRM=y means
that they evade allmodconfig build coverage which is not playing well
here.  I will move the drm-rust and drm-nova trees to be the last trees
merged to mitigate this issue, their fixes trees will still be affected.

--v+y0wOKD1zshv057
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlusHsACgkQJNaLcl1U
h9CjIAf9FvE2tZfaThc1HowkSSyizOIf2Do/Hc/uFJAfSqXV8gN9E+Imw/6qtqDI
aBjmQ/pI34f8+S9yfQ4G/brVVSpbkkmUOHLsR8lg9dikUicyjSgK7PBCD66Rxa+/
91GxIz7qRamwyZL1xdK3sD+hU1DmDc8S/8b7sl2+S6Me5e0IZSEEznEh7M8v47kH
Cua5JMmW6+V8MiLVXWFVH2Gx9mLaDL6SoWJusFWe9ryrIDoU3aLF3ky2Zxanu3co
09HYD+Ictbtve3p6XEoIRq2pJGIPMIV3EoguOEJNdPpgREY+xx24WPjGJjUuH5HE
T4bvR/6Q1OZ+TpYs7yH+/VGjU53XIA==
=POS6
-----END PGP SIGNATURE-----

--v+y0wOKD1zshv057--

