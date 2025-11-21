Return-Path: <linux-next+bounces-9133-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 886C7C7741A
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 05:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BC71B35F8DE
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 04:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCD72E613A;
	Fri, 21 Nov 2025 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z8uwAjtZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4822327A130;
	Fri, 21 Nov 2025 04:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763699953; cv=none; b=Nxnjoe90LL8xhktR9jt4ww7MkBHkbgFW32ydVlO989b8InD9t8Hr7Youa++GTyxxDJCd77q6bvt/TYhOMAgFrf0te8sbo7uCCteVdnn4gAolWihfiZD7OpYEIf//tmrtUpuopQgx+b+gfnMx0PYPXBGzPdAoZZwEQ8DZz11eRCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763699953; c=relaxed/simple;
	bh=D9SuUc1y2YR4Wy8SCD6hGSRNZHEKuCUKVNaQyyuiR3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGUyvHgy0iiPhebu4bPBh+rQhIZSdyAmwcB+5aWmkMMpMmuDxnZ/AWyyfDRNcdrwTNsZODSV1J23Vs9AxqPATdPUCSvnXEmmXQ8wcme2YWYbcKRyjrrqbcAUw79RMdwnYsoVAVVbpy83Dzm+5aNfOQt2w264lqrxRyFkpY2S6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z8uwAjtZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763699947;
	bh=hN9Whf/wFvaMWXZ9xqGudrzW0SEcyT27nAq4qK86Pvo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z8uwAjtZHlsYJwP96SaDkh8YPX5eZj9OS7GXkn6LMYstqd/VtI7yx4Otk0vIzYdXU
	 ReCf70Qwohje5/C2zt82FvQPOgBaRz4xSE3h9J7asg+Dz1popxQhvOneVhvv0JRboY
	 lryI0SMym5YasyhvrvekIDktE0i8uquPCkf3BXn7p5eE9Hf+goP+fO+GWetD1lBGBL
	 XmR4rXM4OjubOBQz99GjMaFExHs46T96tmzuSGecz7+ZsBDX2K5a5l4GgmFn3iT6y9
	 GBG3we38evCsoyp7u786zXVUtQt71j2Hxw6W0/uhp0Bl7rmg/lEHXFXt1zKJc0ePIo
	 ybNTcqTR8+okA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCMtf4jzPz4wHV;
	Fri, 21 Nov 2025 15:39:06 +1100 (AEDT)
Date: Fri, 21 Nov 2025 15:39:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Igor Korotin
 <igor.korotin.linux@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Greg KH
 <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <20251121153906.1d306ad1@canb.auug.org.au>
In-Reply-To: <CAJ-ks9=LxO8zTy7rQCiXrZGuwwN5d0gqVkQVE_S2QZnXTdu-Ug@mail.gmail.com>
References: <20251120181111.65ce75a0@canb.auug.org.au>
	<CANiq72mW=zMbt2W2Omn4PnMDDJfqz3tDtrneMOFz2ysQ34T8zg@mail.gmail.com>
	<CAJ-ks9=LxO8zTy7rQCiXrZGuwwN5d0gqVkQVE_S2QZnXTdu-Ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L=0ojFw18XY1/KjWNTB+h_R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L=0ojFw18XY1/KjWNTB+h_R
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 20 Nov 2025 06:27:13 -0500 Tamir Duberstein <tamird@gmail.com> wrot=
e:
>
> On Thu, Nov 20, 2025 at 4:15=E2=80=AFAM Miguel Ojeda <miguel.ojeda.sandon=
is@gmail.com> wrote:
> >
> > On Thu, Nov 20, 2025 at 8:11=E2=80=AFAM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote: =20
> > >
> > > I have applied the following (hack) merge resolution for today. =20
> >
> > Thanks a lot Stephen for taking the time to do that instead of dropping=
 it.
> >
> > We should be able to do the same as Tamir did in commit 657403637f7d
> > ("rust: acpi: use `core::ffi::CStr` method names"), i.e. move the
> > build assert below to then be able to use `len()` instead:
> >
> > diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> > index aea1b44d189b..f67c355c988e 100644
> > --- a/rust/kernel/i2c.rs
> > +++ b/rust/kernel/i2c.rs
> > @@ -43,11 +43,8 @@ impl DeviceId {
> >      /// Create a new device id from an I2C 'id' string.
> >      #[inline(always)]
> >      pub const fn new(id: &'static CStr) -> Self {
> > -        build_assert!(
> > -            id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
> > -            "ID exceeds 20 bytes"
> > -        );
> > -        let src =3D id.as_bytes_with_nul();
> > +        let src =3D id.to_bytes_with_nul();
> > +        build_assert!(src.len() <=3D Self::I2C_NAME_SIZE, "ID exceeds =
20 bytes");
> >          let mut i2c: bindings::i2c_device_id =3D pin_init::zeroed();
> >          let mut i =3D 0;
> >          while i < src.len() {
> > @@ -433,11 +430,8 @@ impl I2cBoardInfo {
> >      /// Create a new [`I2cBoardInfo`] for a kernel driver.
> >      #[inline(always)]
> >      pub const fn new(type_: &'static CStr, addr: u16) -> Self {
> > -        build_assert!(
> > -            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
> > -            "Type exceeds 20 bytes"
> > -        );
> > -        let src =3D type_.as_bytes_with_nul();
> > +        let src =3D type_.to_bytes_with_nul();
> > +        build_assert!(src.len() <=3D Self::I2C_TYPE_SIZE, "Type exceeds
> > 20 bytes");
> >          let mut i2c_board_info: bindings::i2c_board_info =3D pin_init:=
:zeroed();
> >          let mut i: usize =3D 0;
> >          while i < src.len() {
> >
> > Igor/Tamir? =20
>=20
> Yep, looks correct to me!

OK, I have used that from today.

Could that fix just be applied to the driver-core tree now?  Or does it
depend on changes in the rust tree?

--=20
Cheers,
Stephen Rothwell

--Sig_/L=0ojFw18XY1/KjWNTB+h_R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkf7OoACgkQAVBC80lX
0GwBNwf/Yt6oCT5RpWGEPNihUFbya2qpXCKveM5TmlatThQyBIeGa1qzKoCqzPc5
guxrLxZbqOm5cvkLTKznkAHzNp9jbbBe9WL/txa6kWxJC0UqVJup4GcFg/NUc2I8
O5O7drhYD4tPAjmh96KksH37m6+CwV2/4D9MzT3oNkB2DcfTqKUjBsn1B94RFd2m
Z9i7wGJnqMM5Pae6nv63LQePJxxKvaUdBAP3LU1kdPX122rwuy4aJYXGV/vNEF/n
EDkeFcnVbeTZ9VbmKzvmAwRP5FBSylQ6z0HGAFKLeZ4d8xsLY9Xk9PUhbR56nRIA
qIYqIQ7inVvaX0HwPWVp5t4/EOvxuQ==
=JUBu
-----END PGP SIGNATURE-----

--Sig_/L=0ojFw18XY1/KjWNTB+h_R--

