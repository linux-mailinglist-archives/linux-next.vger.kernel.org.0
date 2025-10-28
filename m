Return-Path: <linux-next+bounces-8729-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C903C12973
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 02:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C13F500630
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 01:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40EB257841;
	Tue, 28 Oct 2025 01:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="We9MTdBx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D9316F288;
	Tue, 28 Oct 2025 01:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761616310; cv=none; b=RIpKbLLyA3bgJkT0lGOqkOKR+YN0PiyOkpAjeCUKYJVdiJ/+LhAiXVllSVPpCjUps2yYG8h4oZU2Bk8fdvUm5ZYs+Nzz2TSTjSpNArJ6Hc/0bu6NiobO5qqW+u2JrBvj5QDxOy4X3OK5UtoV7V0glsJJ4E7CiagA4jj5Wy6OgDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761616310; c=relaxed/simple;
	bh=Hdcmonauq1UQrJeJkRK9OcxLmaBkB1a8SCYWp4aotd0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCFaFr91ojN4eBoFPCSocl6VINskunQKjoMOwnv9MTsMTEkN5fCt+XSIjrYXMicvwhx7CcyhTR4J9Y6+gzf4U0fRUIT9DyDYDKx/+jfvEDNfFIfIYINaJudFHa7MO09kkNUO1JtZ5D1khvaan/46NVN8RZhmJXXJ9ARfDHVIaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=We9MTdBx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761616304;
	bh=EXGkxCzISUK4Z047COz0deGKs8c/Xj/XbyOZARODuKw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=We9MTdBxZdvuRdZ6awYl7BCBwKPIhyBYOzNfhMVrKh/3vesmzUl1KRoNJMcP79iOC
	 DctAtL/BTGOpOhzYczqtdpZJzmzaQ20wR91y7YJ3V5hu5bFr3Vtx7lQFPeUFvvKgQv
	 o0oxgh8QZymNac93raMxeXVFUYy3JEFJ7ICEA942ktdu8KV3vZtMxAfM8GpHd8oLGH
	 VRGDTnGDe6K+ereaG8nn8/8IP5b9L+WfjFZrplsM/LvKhQFhkmk+Y18jc7Exmdo1R/
	 tiQqyYhlbLdZ1C49k47N/GXLhPNcStSgEnjvoelhLEilatlQr/GuplCdQZpCseht1U
	 h3xohRq9gKXUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwYJb2FBfz4w9w;
	Tue, 28 Oct 2025 12:51:43 +1100 (AEDT)
Date: Tue, 28 Oct 2025 12:51:42 +1100
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
Message-ID: <20251028125142.01a32039@canb.auug.org.au>
In-Reply-To: <DDT05KLECH04.37PKIHQQ4K3MX@kernel.org>
References: <20251027125148.7f7d8ed6@canb.auug.org.au>
	<22fl35khmbf6ufyjzbfvxor7b6nohqakqovjoya3v4mmlenz5c@6wbdednrd2pb>
	<DDT05KLECH04.37PKIHQQ4K3MX@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+pX0/Gm5.DwGVWB9ZmDNeDR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+pX0/Gm5.DwGVWB9ZmDNeDR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 27 Oct 2025 10:38:05 +0100 "Danilo Krummrich" <dakr@kernel.org> wro=
te:
>
> On Mon Oct 27, 2025 at 9:11 AM CET, Uwe Kleine-K=C3=B6nig wrote:
> > Translating the changes that commit does to
> > drivers/gpu/drm/nova/driver.rs for drivers/pwm/pwm_th1520.rs results in:
> >
> > diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> > index 0ad38b78be85..dd554574adc8 100644
> > --- a/drivers/pwm/pwm_th1520.rs
> > +++ b/drivers/pwm/pwm_th1520.rs
> > @@ -328,7 +328,7 @@ impl platform::Driver for Th1520PwmPlatformDriver {
> >      fn probe(
> >          pdev: &platform::Device<Core>,
> >          _id_info: Option<&Self::IdInfo>,
> > -    ) -> Result<Pin<KBox<Self>>> {
> > +    ) -> impl PinInit<Self, Error> {
> >          let dev =3D pdev.as_ref();
> >          let request =3D pdev.io_request_by_index(0).ok_or(ENODEV)?;
> > =20
> > @@ -365,7 +365,7 @@ fn probe(
> > =20
> >          pwm::Registration::register(dev, chip)?;
> > =20
> > -        Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
> > +        Ok(Th1520PwmPlatformDriver)
> >      }
> >  } =20
>=20
> Yes, this looks good.

OK, I have applied that to linux-next from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+pX0/Gm5.DwGVWB9ZmDNeDR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkAIa4ACgkQAVBC80lX
0GxCMQf+IA4Zj3fPiMiNAgnJm37uJDx86hP1sd4KBBGjStgXzYVi3pPg5NtME88D
o/nAfgLWxMccgt21iw33eZontRCj5VJVx8v72PLG3vWtVairSRPX8yOrwGXZtLVV
sGs1ZRP5CFFBOfdZOCh3PoA8p3OGV67FiLJlgN/G5t+ephZHDnyC7aqmA2lNTKKU
WmUnmBVk5YJsukFzVrPGVbKzBSLYjFbO/CE/DAdR8ct6ixjdN2jAjahcNrcd8phv
ku+k4awhkzHPp8S8spMGqzZ5WqQbfimtqzcKVeTFWIlfXGqBDxpMe4/Ckr8H1eOm
JjwtsCkvOfMsB73fnEXxgLy3Kt+6Yg==
=Lm9L
-----END PGP SIGNATURE-----

--Sig_/+pX0/Gm5.DwGVWB9ZmDNeDR--

