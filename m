Return-Path: <linux-next+bounces-9355-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3842CA6035
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 04:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FD803197A8E
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 03:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5CB18DB1E;
	Fri,  5 Dec 2025 03:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZlZ3YrCV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93861398FAE;
	Fri,  5 Dec 2025 03:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764905591; cv=none; b=lVC7wovJqcFz6UWuEA0C0qYh1wHyrygVKkwWcktH9kmbz18PTM4Ge6vsgMga1fEsHs0+R2ySxPuBEF4zWyQNmeoPi4GJE6KZc0qJ/bKpSOheUs4PPNc5NxRLEXzwnrjzPis4+/Ah8PzQw0hSQ+Jt2LdwBLZjuG4lgS7UbTCA6Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764905591; c=relaxed/simple;
	bh=kppJNINLZDybwdPJJix2Spjz4ARjO65ou5VBoD21taY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBQqafH5MLMsmNBQT+v4GttjKcDP4VzV9/0NU6aGsTmJmCvEFdk7ULy6wKavNjd+uJWZ6lxU82XBKXyt15LVrUYFcbEf8o2lrG8B5MlV1127gm+TJihGW9Xi5d24iDPYLZIYajcXjqeJeQ8F5cAabxUC46qYoG8Kvr/lKMROuhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZlZ3YrCV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764905585;
	bh=YkaaugAtprD3XoHOg9uTkF3Aq7dcDn/XTFmpc3lupXo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZlZ3YrCV875+axqSxM8x+2Rx15cvF8sE8Tv/kd5V5G/EtbRHREjzDgWwEHY7Ad55H
	 7tnCjXLgv5RfnYQySIW26RlP50ZYX3uE29/f8GNr4uQZkmLjr+xnnemyzf36tqgsRR
	 vbOVWl8kH9TIMFc+J+VH6BlGwslMhujpZCqUvXGgd4tObZTFYxic0gTRUCfuUBTkW6
	 lyPaSgsTWBBGmpLqcXzHu4yqxX8boNRwuwv8xmK6eFmBua92ooOlPeXNUgqkgG6K9+
	 E8AKjrGlZeNl9c5pcOBiepYzvHTKaesokpRemuC91FBFh2yvsKcv46BtS4AFIhh0fg
	 rrIL3mONWReYQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMxm00tV4z4wGX;
	Fri, 05 Dec 2025 14:33:04 +1100 (AEDT)
Date: Fri, 5 Dec 2025 14:33:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Michal Wilczynski"
 <m.wilczynski@samsung.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Peter Colberg"
 <pcolberg@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: linux-next: build failure after merge of the pwm tree
Message-ID: <20251205143303.696dd64f@canb.auug.org.au>
In-Reply-To: <20251028125142.01a32039@canb.auug.org.au>
References: <20251027125148.7f7d8ed6@canb.auug.org.au>
	<22fl35khmbf6ufyjzbfvxor7b6nohqakqovjoya3v4mmlenz5c@6wbdednrd2pb>
	<DDT05KLECH04.37PKIHQQ4K3MX@kernel.org>
	<20251028125142.01a32039@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ko4yq+X8sdLejEw9AknKUp5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ko4yq+X8sdLejEw9AknKUp5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 28 Oct 2025 12:51:42 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 27 Oct 2025 10:38:05 +0100 "Danilo Krummrich" <dakr@kernel.org> w=
rote:
> >
> > On Mon Oct 27, 2025 at 9:11 AM CET, Uwe Kleine-K=C3=B6nig wrote: =20
> > > Translating the changes that commit does to
> > > drivers/gpu/drm/nova/driver.rs for drivers/pwm/pwm_th1520.rs results =
in:
> > >
> > > diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> > > index 0ad38b78be85..dd554574adc8 100644
> > > --- a/drivers/pwm/pwm_th1520.rs
> > > +++ b/drivers/pwm/pwm_th1520.rs
> > > @@ -328,7 +328,7 @@ impl platform::Driver for Th1520PwmPlatformDriver=
 {
> > >      fn probe(
> > >          pdev: &platform::Device<Core>,
> > >          _id_info: Option<&Self::IdInfo>,
> > > -    ) -> Result<Pin<KBox<Self>>> {
> > > +    ) -> impl PinInit<Self, Error> {
> > >          let dev =3D pdev.as_ref();
> > >          let request =3D pdev.io_request_by_index(0).ok_or(ENODEV)?;
> > > =20
> > > @@ -365,7 +365,7 @@ fn probe(
> > > =20
> > >          pwm::Registration::register(dev, chip)?;
> > > =20
> > > -        Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
> > > +        Ok(Th1520PwmPlatformDriver)
> > >      }
> > >  }   =20
> >=20
> > Yes, this looks good. =20
>=20
> OK, I have applied that to linux-next from today.

This now needs to be applied to the merge of the modules tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ko4yq+X8sdLejEw9AknKUp5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyUm8ACgkQAVBC80lX
0GwPtAf/TsUTpO/W0G/lbhUIbqMD3VqCffX51rSJbyv2TibXR3svbN5WUs7XXxv3
MJR/BuQLG3EDMml+oYwaXx0vUx0/aYvtkn5ErHyB0HxN2PXGIfk0jF8hpDHEdfH6
A7Mc0XM6gtXPGEGqQHc2ydQqCxrNT3cwrmKuFyFvf8isqhY5UYyrV5fs7GzRGdDt
sTqqygnTGHI1K8gDtmDXH1YmNMC8oAvxvGGMgKnnG0wXbWiHoOjTcUUesaVbcxo4
JBUlZKQCJMEQWWzZAitS+OsV/I5emIyDQbJkM2kjEFlw1vVgaeFuBfd4tj3T4liO
rKtik2+QaiQnlBa/2iQYGl1+d9Kypg==
=6gAj
-----END PGP SIGNATURE-----

--Sig_/Ko4yq+X8sdLejEw9AknKUp5--

