Return-Path: <linux-next+bounces-7244-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3497AE76CE
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 08:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07C7817150C
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 06:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F471EB193;
	Wed, 25 Jun 2025 06:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pActrePS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF25307498;
	Wed, 25 Jun 2025 06:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831990; cv=none; b=mJKIU9QWiub5iAB+l1XQ/DZCx6FStWWzUOO8b1m9gXgTAvsRK1/wLLEy+Gz0HPTwpHmdeFsvRXcUTrY7yaEQzsyE/90Dt/MC1TQEDflsoJTRaefD9bur/cVKmJ4cpwja+kp2w+R9JVQj+87iqbSuySVb48gIaTrNXPknb6on2ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831990; c=relaxed/simple;
	bh=y0brSKUV4SsIuFqNMO0VsFl94vOeYflmbSbh90CxtdY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ar4ChNdCK2XpD/UCE7c3cWkS2fIDL2PwB5cTrVnTnyCN+64ocobz33dHuxGnffNQXEGxtX3h/fsUJ4fuV0MB8BsRhv5r5G8dhVsFidAjTuB8pfiWP7kvx9781IUNtqW6pwBIxYGJoFPgPJmKx3Tu3i1B04ruXGMR8ZEQV5R4S+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pActrePS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750831982;
	bh=s+85x0ygzu3N2ASkoZVgkazaR+1uFLxlfi0sJn6YsJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pActrePS/Dh7MAnDkC8F0BliyOuKmPrNpMLqHsLk8R7HqdmJo2zxRovM3PasEoiUK
	 FW6+PpV4lqJz4vr7yqsTMTqDrzPuvxg2ojrSofyBFCNql6/I5+L5c+1kGYVldv1zRL
	 nvxxtsRIduIWpjkseowSBsuBM85k/C43GSLdFn1qslxhIcUtfJxykXHn1P9N5gAU0z
	 OSLWkXZXt2tbXHEos1G5Whdl94PZWPSjUy+KSY8+UWoU/+lEWGJhGUnbuSeQkRBsPd
	 Rj5Eczkf2dIZEOPq6D9GSxY/iK2rShboHnfX4mWiagLfUXlRl+KH5rJNU+Xa3yxeaI
	 Er5bTuXqVO3/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bRs1p5cqmz4wj2;
	Wed, 25 Jun 2025 16:13:02 +1000 (AEST)
Date: Wed, 25 Jun 2025 16:13:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 drm-nova tree
Message-ID: <20250625161301.48264659@canb.auug.org.au>
In-Reply-To: <87ikkl2ca4.fsf@kernel.org>
References: <iuo4BpdTglZkpW9Xyy1ehjFspmj3ay0q7iejyeOShBG0HLZmIrhzIpi0eG_wBv71ZPPCgh2lcn2BOsrFHOegfg==@protonmail.internalid>
	<20250624195142.1050e147@canb.auug.org.au>
	<87ecv94ay9.fsf@kernel.org>
	<DAUQZ1TY9VT3.UJEFQ96157DJ@nvidia.com>
	<CeKXJWcbSngalEPTkHeRti8od7cPavN5gh1Opt1oNESUBUh8W4Kt7xnuHkD7l7dr1178GDTfqrabr9Pye6SWpw==@protonmail.internalid>
	<aFqXKKAxQp0yxUvL@pollux>
	<87ikkl2ca4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UVAYDw9ciuOrU=ESLYfgJaS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UVAYDw9ciuOrU=ESLYfgJaS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Tue, 24 Jun 2025 21:02:43 +0200 Andreas Hindborg <a.hindborg@kernel.org>=
 wrote:
>
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
> index 5cafe0797cd6..01a920085438 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -3,7 +3,7 @@
>  use core::time::Duration;
> =20
>  use kernel::prelude::*;
> -use kernel::time::Instant;
> +use kernel::time::{Instant, Monotonic};
> =20
>  pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; =
N] {
>      let src =3D s.as_bytes();
> @@ -35,7 +35,7 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) ->=
 &str {
>  /// TODO[DLAY]: replace with `read_poll_timeout` once it is available.
>  /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonor=
i@gmail.com/)
>  pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: =
F) -> Result<R> {
> -    let start_time =3D Instant::now();
> +    let start_time =3D Instant::<Monotonic>::now();
> =20
>      loop {
>          if let Some(ret) =3D cond() {

I have applied that to the merge of the rust-timekeeping tree today,
thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/UVAYDw9ciuOrU=ESLYfgJaS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhbk20ACgkQAVBC80lX
0GwiEwf+OiiBOFrlY8aOTBV0/MvwEXnWmUEOWvfCaVEaLy4g1WPiStRd5uUtxKaE
bf0bB3JweFBE2y0jddDn7JIxCrOfsD9vsB5p2eXQbAb3TE1Wv6JN4MEsRjC52Ytg
j7qXygrcO8JrB9ZR2PpHQM6IoXIXO+Ohjg+OKShfjjvPUPvbTKIfDzGxL4YN/k4q
b8prfTNfhsQyn8V/3HnFzXal7yBfhOjqe+dwnQin1tvnZ99BRvaJbEpF5DKqUPHi
MIwzsMprAswfhxzmCJ+UwIwRqPL3qbKEc5vmzacKMw4mWUJik5dyaz80JMPw19fx
fv7ZSPJCOQqHCAmEU8yEolY/1RMtvQ==
=CJ6E
-----END PGP SIGNATURE-----

--Sig_/UVAYDw9ciuOrU=ESLYfgJaS--

