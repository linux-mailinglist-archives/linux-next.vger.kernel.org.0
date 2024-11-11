Return-Path: <linux-next+bounces-4735-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A099C38C5
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 07:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89A92B2102B
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 06:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A804B1514EE;
	Mon, 11 Nov 2024 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZMb+BLbr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801BF152517;
	Mon, 11 Nov 2024 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731308328; cv=none; b=Qm/ZHJ7MKDVA2F4l5oRh7T5ouHxVJaFpyoG3GRZUVjQPkIr9XSJQlX90U/LjYjzJ+jcKk/ULKcRHunlNGu726GuBZ4Fe4MIdb1AzkFsfjHA7GkPu5hxcqks70XOUOLR17RMQ2NtNsiM2de3R5WZwJH2kAFWtGeV09MJCb0iHWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731308328; c=relaxed/simple;
	bh=xJBWKWvA1SLVZsT9vV4tlENqlhIfdCHc2VodTBnZD5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZR6soylXl57zhr1Qn33DPkRZR6zBN2A2Mk15QmlCoeo3hqoZW/hnBj0iqq1nvyUdEQBpMZYe1f8F3kSMQIKu0D3Y7xnpRH/M44gXofQjW/K+qLCZS7SWzp4/OX3YoaLtf/H8g8dRUdKoJmDtuOH9Ne5DgVX4hJRyavEN6KB6iVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZMb+BLbr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731308320;
	bh=UbbtVivT8ZyeD9MK3JYSoH8F+Ft7GpBLyWU3CwOTE2Q=;
	h=Date:From:To:Cc:Subject:From;
	b=ZMb+BLbrMc9WvlG1hvgOHB9ZpK27Jy44zmK+AH/W8w1rrokH4S2swpW0/kBnjgUpP
	 mzryk3O6t12AFAG2Rt6LEY5PYRB71DHGb5AI1SuCEtW1fNp76IEZvXPnozYc7sk4hF
	 8lhSeHBSRl2eRWknaHAgtW2C73iyOKM8L0S7JTGB1FJ8GhSgsvLgizvkbhW41HqKwg
	 oRJ1vSc8mXoPBqarc/5kSc1nX+zK9H+qLpG9zP+XzHR5nTk7nY5g+WFQFeIRXqWIjF
	 quby4KeEoAe9+5mN9pGLcOmmkDSWLwTzBsqiziH8xzTvgjKcNogUIRzFEwvJ+bfq2g
	 Yju6r0TxhtgIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xn0km6ClKz4x8C;
	Mon, 11 Nov 2024 17:58:40 +1100 (AEDT)
Date: Mon, 11 Nov 2024 17:58:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20241111175842.550fc29d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JZ_ibQYewGk4ae=+i=jzl/D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JZ_ibQYewGk4ae=+i=jzl/D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

My first rust build error!  ;-)

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0308]: mismatched types
     --> rust/kernel/device.rs:176:17
      |
175   |             bindings::_dev_printk(
      |             --------------------- arguments to this function are in=
correct
176   |                 klevel as *const _ as *const core::ffi::c_char,
      |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expe=
cted `*const u8`, found `*const i8`
      |
      =3D note: expected raw pointer `*const u8`
                 found raw pointer `*const i8`
note: function defined here
     --> /home/sfr/next/x86_64_allmodconfig/rust/bindings/bindings_generate=
d.rs:60521:12
      |
60521 |     pub fn _dev_printk(level: *const ffi::c_char, dev: *const devic=
e, fmt: *const ffi::c_char, ...);
      |            ^^^^^^^^^^^

error[E0308]: mismatched types
   --> rust/kernel/miscdevice.rs:159:52
    |
159 |             unlocked_ioctl: maybe_fn(T::HAS_IOCTL, fops_ioctl::<T>),
    |                             --------               ^^^^^^^^^^^^^^^ ex=
pected fn pointer, found fn item
    |                             |
    |                             arguments to this function are incorrect
    |
    =3D note: expected fn pointer `unsafe extern "C" fn(_, _, usize) -> isi=
ze`
                  found fn item `unsafe extern "C" fn(_, _, u64) -> i64 {fo=
ps_ioctl::<T>}`
help: the return type of this call is `unsafe extern "C" fn(*mut bindings::=
file, u32, u64) -> i64 {fops_ioctl::<T>}` due to the type of the argument p=
assed
   --> rust/kernel/miscdevice.rs:159:29
    |
159 |             unlocked_ioctl: maybe_fn(T::HAS_IOCTL, fops_ioctl::<T>),
    |                             ^^^^^^^^^^^^^^^^^^^^^^^---------------^
    |                                                    |
    |                                                    this argument infl=
uences the return type of `maybe_fn`
note: function defined here
   --> rust/kernel/miscdevice.rs:144:14
    |
144 |     const fn maybe_fn<T: Copy>(check: bool, func: T) -> Option<T> {
    |              ^^^^^^^^                       -------

error[E0308]: mismatched types
   --> rust/kernel/miscdevice.rs:162:22
    |
162 |                 Some(fops_compat_ioctl::<T>)
    |                 ---- ^^^^^^^^^^^^^^^^^^^^^^ expected fn pointer, foun=
d fn item
    |                 |
    |                 arguments to this enum variant are incorrect
    |
    =3D note: expected fn pointer `unsafe extern "C" fn(_, _, usize) -> isi=
ze`
                  found fn item `unsafe extern "C" fn(_, _, u64) -> i64 {fo=
ps_compat_ioctl::<T>}`
help: the type constructed contains `unsafe extern "C" fn(*mut bindings::fi=
le, u32, u64) -> i64 {fops_compat_ioctl::<T>}` due to the type of the argum=
ent passed
   --> rust/kernel/miscdevice.rs:162:17
    |
162 |                 Some(fops_compat_ioctl::<T>)
    |                 ^^^^^----------------------^
    |                      |
    |                      this argument influences the type of `Some`
note: tuple variant defined here
   --> /usr/lib/rustlib/src/rust/library/core/src/option.rs:579:5
    |
579 |     Some(#[stable(feature =3D "rust1", since =3D "1.0.0")] T),
    |     ^^^^

error[E0308]: mismatched types
  --> rust/kernel/security.rs:36:13
   |
32 |         to_result(unsafe { bindings::security_secid_to_secctx(secid, &=
mut secdata, &mut seclen) })?;
   |                                                                       =
    ------- here the type of `secdata` is inferred to be `*mut u8`
...
36 |             secdata,
   |             ^^^^^^^ expected `*mut i8`, found `*mut u8`
   |
   =3D note: expected raw pointer `*mut i8`
              found raw pointer `*mut u8`

error[E0308]: mismatched types
     --> rust/kernel/security.rs:72:52
      |
72    |         unsafe { bindings::security_release_secctx(self.secdata, se=
lf.seclen as u32) };
      |                  --------------------------------- ^^^^^^^^^^^^ exp=
ected `*mut u8`, found `*mut i8`
      |                  |
      |                  arguments to this function are incorrect
      |
      =3D note: expected raw pointer `*mut u8`
                 found raw pointer `*mut i8`
note: function defined here
     --> /home/sfr/next/x86_64_allmodconfig/rust/bindings/bindings_generate=
d.rs:87586:12
      |
87586 |     pub fn security_release_secctx(secdata: *mut ffi::c_char, secle=
n: u32_);
      |            ^^^^^^^^^^^^^^^^^^^^^^^

error: aborting due to 5 previous errors

For more information about this error, try `rustc --explain E0308`.

Presumably caused by my merge resolutions involving commit

  d072acda4862 ("rust: use custom FFI integer types")

I have used the rust tree from next-20241108 for today.

Any help with the merge resolutions would be much appreciated.

--=20
Cheers,
Stephen Rothwell

--Sig_/JZ_ibQYewGk4ae=+i=jzl/D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcxqyIACgkQAVBC80lX
0GxbAAf7BbgYMeepLMtlI47lPDFScPNpw7Pl22i9i3cCetVPKd3ANGdr1je7jK0Y
S9S5wibRqNOI/FaTXbFuIfY5x00FqLOJlzSWLI8XAEZ0e3qsgI/5GTD1eZudoYfc
xrs8R6rNE32A0edqrySYA+Je0xQEz0sAG6AAFdOeFIqO9xXuKH+0uGViltfLFZeR
d8GpUEqwjUBTc2L/kCypEsxlNKesmATdqLksNWG+k4FR1tSIzEepNIvpykbgamcc
ShwVu91WBLMuqjvihleX9r5OtAMoiIi6N4hMNj8IOyeLUr/mTFU/ypQLV86A/mPq
WY0FsNjVTPwsssnaOaGKBwLtWocePA==
=vYRK
-----END PGP SIGNATURE-----

--Sig_/JZ_ibQYewGk4ae=+i=jzl/D--

