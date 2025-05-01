Return-Path: <linux-next+bounces-6484-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A27AA5C25
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 10:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 471427ABDC2
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 08:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9DC19E98B;
	Thu,  1 May 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Kcf5ZiFJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2711E9B1F;
	Thu,  1 May 2025 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746088207; cv=none; b=VW15QuxtptgkPNb9GDdCCqQ0Si9S4t/L9W9bjRwoqCVIHuIpYaS8uwSeNgc39RJJTmObFzOPNh3yXQWl6spYdwEElBzwbpM2foBaalFBNNMzT869YzOMwytbY/GP5Wv0t8IoxEX5HuhFi+XyY+xyEbZSP4BECgXPoF5BtaKACXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746088207; c=relaxed/simple;
	bh=R6eIpa2lZf15T2N49GWLTpKxSvaPSgfPxYQcLuZpIIE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tq3bI7nzMMPAXrUWn4pxuaK3BYwRKY9FsdHjeQ/MDgBYtFm5DlItmlEnZgrfYPe13G6FHFCM3y/N7Ku6rRHJM1dzJaklRYwlV92PQ1FlG9nkVD+IJ4SyOVC++Cx++HLiqaR65+kO6g5EC/wUloriwLJgED4q0GIiohAe9/Z6vFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Kcf5ZiFJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746088201;
	bh=kvA22Nl85FWKJNReOuWUe6xaTzhaLKDDqM5V++hK/3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Kcf5ZiFJUcj5UqWKzpD2pmySYQ9Gvou0zqkQt2A4JXoimyoNYqKxB6ip6ZJXJJHDy
	 CLmzdkIwxL91Sz9eY+yhAHckpB13k3Ag50jI+nMnt4k6UiE7DKwqQ3VoUNMz0woAe4
	 HXpv6p2iKXlCmq3OpJhC9yAAiA1Imxk8WA3P3qs3MKPTWGnft1PH1CNshuHMWqUwWT
	 EEnYrKXA8tZ6smYwO22HQS/ZmoZoMa0XQ9GqI+XBHiVowkEgoJRZlzumK+tk1AfpMq
	 ZJRfsTY/aQrOyTHfichG27Mwe36ANYeAJbF1nl3w2VxT+wvrYCKij1mmN7OfatOc8g
	 CsIWnY/wDB+UA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zp6gD6qdwz4wcj;
	Thu,  1 May 2025 18:30:00 +1000 (AEST)
Date: Thu, 1 May 2025 18:29:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Tamir Duberstein
 <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250501182958.110abc0b@canb.auug.org.au>
In-Reply-To: <20250430104234.dmwnn5ih232kfk4z@vireshk-i7>
References: <20250430202315.62bb1c1b@canb.auug.org.au>
	<20250430104234.dmwnn5ih232kfk4z@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vzDzLMEci=oePFLw=JnP7qC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vzDzLMEci=oePFLw=JnP7qC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

On Wed, 30 Apr 2025 16:12:34 +0530 Viresh Kumar <viresh.kumar@linaro.org> w=
rote:
>
> On 30-04-25, 20:23, Stephen Rothwell wrote:
> > Caused by commit
> >=20
> >   a68f46e83747 ("rust: types: add `ForeignOwnable::PointedTo`")
> >=20
> > interacting with commit
> >=20
> >   254df142ab42 ("rust: cpufreq: Add initial abstractions for cpufreq fr=
amework")
> >=20
> > from the cpufreq-arm tree.
> >=20
> > I don't know how to fix this up, so I have dropped the rust-xarray tree
> > for today. =20
>=20
> Probably this:
>=20
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index 49246e50f67e..82d20b999e6c 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -630,7 +630,7 @@ pub fn data<T: ForeignOwnable>(&mut self) -> Option<<=
T>::Borrowed<'_>> {
>              None
>          } else {
>              // SAFETY: The data is earlier set from [`set_data`].
> -            Some(unsafe { T::borrow(self.as_ref().driver_data) })
> +            Some(unsafe { T::borrow(self.as_ref().driver_data.cast()) })
>          }
>      }
>=20
> @@ -657,7 +657,7 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option=
<T> {
>              let data =3D Some(
>                  // SAFETY: The data is earlier set by us from [`set_data=
`]. It is safe to take
>                  // back the ownership of the data from the foreign inter=
face.
> -                unsafe { <T as ForeignOwnable>::from_foreign(self.as_ref=
().driver_data) },
> +                unsafe { <T as ForeignOwnable>::from_foreign(self.as_ref=
().driver_data.cast()) },
>              );
>              self.as_mut_ref().driver_data =3D ptr::null_mut();
>              data
>=20
>=20
> Andreas, is your xarray-next branch immmutable ? I can rebase over the
> change then.

I have applied that as a merge fix up for the rust-xarray tree merge
from today.  (This time running "make rustftmcheck" :-))
--=20
Cheers,
Stephen Rothwell

--Sig_/vzDzLMEci=oePFLw=JnP7qC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgTMQcACgkQAVBC80lX
0GzgxwgAkSp5GY7NLlWJrtiNANxA9ea0VEVBmRDu7OeBJ277gnOlathV299Z2Y0Z
m2oIB74SgSxyS64zI8IbdKostQp5YTI2n5CG5VsmEonGZpRGUzO41pX8baLna/Rp
Jo+cm5Sf7Z6V8ZZGdhPi8VhVZCCLlAOyXGObLKXWGfALuphiX60U7bvumG9rng8B
Z2esIwKq91NjJi81qTIwMGGFbj260c3vpA8wcP50V92GJ7J8lKSfv5OZ1VzSKdaP
Utws2OsFCvHlPX0e9N2WjFR4r/BSKEsZTotZIbfSPyGNrwF3wUn1w1hkEp/vNSyt
9Eikspib4XQSO9qyZ3NCaXcC1s32iA==
=Z4RL
-----END PGP SIGNATURE-----

--Sig_/vzDzLMEci=oePFLw=JnP7qC--

