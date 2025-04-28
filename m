Return-Path: <linux-next+bounces-6414-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0AEA9EE1F
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 12:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32DDB3AF928
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 10:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C9B25DCF5;
	Mon, 28 Apr 2025 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NfuYgoI+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F3238F9C;
	Mon, 28 Apr 2025 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745836865; cv=none; b=RPUQ3+MpOFLjDqxjT3gl4rkpt49imw8Fye7W+Tw2Bsqw85sO9hZPl85PdJS4/j8hidEIqMqZ3Vndo8ApQTVGH/Zhp0XDr3WLkgURuq6wNlEqWdZg+Amk3TTQ94VRnL3cPNiYWx3bRFb0J2hnpfoxXwVNUcAnzPMG1prLhooTZes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745836865; c=relaxed/simple;
	bh=PMBvLS3NVHJ/ZDWYVnxFM6aJG4Z0dOe09lzY9xEGW68=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eXXCz9itaJkzxL80dDVJZ4eG/eh5OvtzL27F7TO+KbMJnptUjMwCLBQLDUd083rWlH0087EeUVnTG5KeHIlfCmVr4RR0nbRO2zH6ZIfwZ4pDfj/8c585XIZLXi3ViCPH5KesRWGGSpOiFXyvTJ1e7JnXh7J9dOlwyN1RqZh0Ejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NfuYgoI+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745836862;
	bh=LN6OprujhlffQ3dP86stsT+uKyfbXf3NGXxVcRnucAU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NfuYgoI+FIrT2eX6FEIfLPjYm2iN1snmlNQ4krOQVSdg4IHZhTCfddERXeK5LY8Lp
	 Y5aufoiikI/R7srV6jTq6xrJSdgdbIERW3bxdjTUtPsmgdsPoVZgXPsjufnKWM7chw
	 bD5F52UC1sxynHRqM/MJb4YGDQVPPxslzDqAkqgeI6pCVj0z28ETqg1Jabmvmhbv+L
	 skdcfA12kdCPldJjx+if412iY4hmAnb6k1vC08/KLhbjmzwXUS6STTU45C6CJ4q9du
	 LQjPPUs6uUCO9gfSul+PiTmyNbfIa6AtSiZKAXaWB4BnsXoFi32ppV6oYaJqPbRfpB
	 mz7p3BikUSgSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmKjp13cSz4wbv;
	Mon, 28 Apr 2025 20:41:02 +1000 (AEST)
Date: Mon, 28 Apr 2025 20:41:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250428204101.40a35c07@canb.auug.org.au>
In-Reply-To: <20250428203943.51dd39d5@canb.auug.org.au>
References: <20250428203943.51dd39d5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s=muqbsDHtO+QuD2OBv2cc1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s=muqbsDHtO+QuD2OBv2cc1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 28 Apr 2025 20:39:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the rust-xarray tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

error[E0308]: mismatched types
  --> rust/kernel/auxiliary.rs:76:73
   |
55 | impl<T: Driver + 'static> Adapter<T> {
   |      - found this type parameter
...
76 |                 unsafe { bindings::auxiliary_set_drvdata(adev.as_raw()=
, data.into_foreign()) };
   |                          -------------------------------              =
  ^^^^^^^^^^^^^^^^^^^ expected `*mut c_void`, found `*mut T`
   |                          |
   |                          arguments to this function are incorrect
   |
   =3D note: expected raw pointer `*mut c_void`
              found raw pointer `*mut T`
note: function defined here
  --> rust/bindings/bindings_helpers_generated.rs:5:12
   |
5  |     pub fn auxiliary_set_drvdata(adev: *mut auxiliary_device, data: *m=
ut ffi::c_void);
   |            ^^^^^^^^^^^^^^^^^^^^^

error[E0308]: mismatched types
  --> rust/kernel/auxiliary.rs:92:47
   |
55 | impl<T: Driver + 'static> Adapter<T> {
   |      - expected this type parameter
...
92 |         drop(unsafe { KBox::<T>::from_foreign(ptr) });
   |                       ----------------------- ^^^ expected `*mut T`, f=
ound `*mut c_void`
   |                       |
   |                       arguments to this function are incorrect
   |
   =3D note: expected raw pointer `*mut T`
              found raw pointer `*mut c_void`
note: associated function defined here
  --> rust/kernel/types.rs:63:15
   |
63 |     unsafe fn from_foreign(ptr: *mut Self::PointedTo) -> Self;
   |               ^^^^^^^^^^^^

error[E0308]: mismatched types
   --> rust/kernel/miscdevice.rs:256:66
    |
256 |         let device =3D unsafe { <T::Ptr as ForeignOwnable>::borrow(pr=
ivate) };
    |                               ---------------------------------- ^^^^=
^^^ expected `*mut <... as ForeignOwnable>::PointedTo`, found `*mut c_void`
    |                               |
    |                               arguments to this function are incorrect
    |
    =3D note: expected raw pointer `*mut <<T as MiscDevice>::Ptr as Foreign=
Ownable>::PointedTo`
               found raw pointer `*mut c_void`
    =3D help: consider constraining the associated type `<<T as MiscDevice>=
::Ptr as ForeignOwnable>::PointedTo` to `c_void` or calling a method that r=
eturns `<<T as MiscDevice>::Ptr as ForeignOwnable>::PointedTo`
    =3D note: for more information, visit https://doc.rust-lang.org/book/ch=
19-03-advanced-traits.html
note: associated function defined here
   --> rust/kernel/types.rs:98:15
    |
98  |     unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> Self::Borrowed=
<'a>;
    |               ^^^^^^

error: aborting due to 3 previous errors

For more information about this error, try `rustc --explain E0308`.

> I don't know what caused this, but it is presumably an interaction
> between this tree and the mm-unstable and drm-nova trees.
>=20
> I have dropped the rust-xarray tree for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/s=muqbsDHtO+QuD2OBv2cc1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPWz0ACgkQAVBC80lX
0GzSWggAoBG9ti+FfCoaqjh6jm57n/bqlzeOpqqJJceruvYLIPY+oFr2HSKn07T4
MJ1+lliggTO2N1U9VBHyD5Ko3b/X7CZqaMsOrQipYZPwUbXR/+xgfmawQqM9O2Rq
y9b81viLQkMmK2zamJKaRouovLSDrBoqlVcidBW69QURAcLvTDpHzgFZkzseLW8a
0TvBw6FEwoCmDyCczOgi9ZQWiy5b47f4izA7BD8VeA+JeTzIOOvhf6tEnoihi+xE
956YOVTNToWhZm6mMhbmhRf8yvNtFXt4QURVUh6XfwfFsXI/1/INezAtGK9UveIs
InY19LJTD835+KDDBSYV7TPmMe81oQ==
=iSoR
-----END PGP SIGNATURE-----

--Sig_/s=muqbsDHtO+QuD2OBv2cc1--

