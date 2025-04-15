Return-Path: <linux-next+bounces-6243-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56918A892B0
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 06:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F4EF17AC86
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 04:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AB76FC5;
	Tue, 15 Apr 2025 04:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ku5IoKx5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81A32DFA24;
	Tue, 15 Apr 2025 04:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744689684; cv=none; b=qZ61pbwc1d66d7Om67xFihVPpAHPn5szjVtYIwYd/fSks6jb3caQrPbWpV2kLkBFCafP6TPyyf8wQZ0wHGsw2uN1rwrGc34LeX5tVp0SMGRcRBzzp029+mSHzJCe4i+iplLfDUcnchw87mMl+wfIDfMB4NrKimLJbdyENzPnkZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744689684; c=relaxed/simple;
	bh=Cd27p6e5+DxALqVmbQjHz0b+JAdPJCpC5x1NC6XYTU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=diGZmVB8MvTJWdA87fFM4n7XlIAkM0JWtW3RBg2N2TuFE/AffgyyobEAgQ7lJK3Cr0kbbuc1NOe3nxXXj+7ZnSnTlip6w++xHsc5iqi1ZHuaH/7840wNQkGTD1Vg6DoetaUy2PJeou1FJD/UISJqeLFwj/1qqNfufRXwp60MP3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ku5IoKx5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744689677;
	bh=tA9QKFq722kIEtFpTFO8bBX/kak8Infi5qK0zrKPtXs=;
	h=Date:From:To:Cc:Subject:From;
	b=Ku5IoKx51C6b31JOonLanRlQKkah7n0yktN14S8W01ddijLW8oplojAqEIo5NMkQO
	 MBhcG8i5T3SjD7rcDkAvsEmQ0ZRdTs52/DVib1JpsA560V6CWGbvMOMLJfvq1QETtb
	 wJoJG3c+NAUMNo7CVw4dGK0ny+k0o+mmj7yMErZTZFd6Ki/qL8ntKwfCMpXCR2SULM
	 C7Mm32YAxHDmzBfnLPmxqa8r+PiTZQlxtfeK43YQfZg+5VWCryTXywDhJZshJjS41f
	 Y5BHk+aLQfZXnNxnf0jmxU4SSfGYb0N39gELCkCdgB3gNph2fjpckSbIyREKugPy81
	 f+h9nM1DDq1Kg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zc9SX6FsMz4xFb;
	Tue, 15 Apr 2025 14:01:16 +1000 (AEST)
Date: Tue, 15 Apr 2025 14:01:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the workqueues tree
Message-ID: <20250415140116.13544ac6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CDcVZdAuuHqb3M33qX0P8+z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CDcVZdAuuHqb3M33qX0P8+z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the workqueues tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0308]: mismatched types
   --> rust/kernel/lib.rs:204:9
    |
204 |           ptr.sub(offset) as *const $type
    |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ types differ in mutability
    |
   ::: rust/kernel/workqueue.rs:495:18
    |
495 |               ) -> *mut Self {
    |                    --------- expected `*mut ClosureWork<T>` because o=
f return type
...
505 | / impl_has_work! {
506 | |     impl{T} HasWork<Self> for ClosureWork<T> { self.work }
507 | | }
    | |_- in this macro invocation
    |
    =3D note: expected raw pointer `*mut ClosureWork<T>`
               found raw pointer `*const ClosureWork<T>`
    =3D note: this error originates in the macro `$crate::container_of` whi=
ch comes from the expansion of the macro `impl_has_work` (in Nightly builds=
, run with -Z macro-backtrace for more info)

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0308`.

Caused by commit

  345e029b561e ("rust: workqueue: remove HasWork::OFFSET")

I have used the workqueues tree from next-20250414 for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/CDcVZdAuuHqb3M33qX0P8+z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf92gwACgkQAVBC80lX
0GwmaAf8Dsixzyse4NYMeHcBBXz1yhbLq/MpxWxUABAJGFHo84iDsaGb4EPpfQbY
EEUZ4QitfUWEFYhn3Vi3/YBI/YbUXJcnka10sqdArpE1uTMzQsLaHBLO4ClyLJm6
rGVVuCkZds7Z6BgALv50bRa7j/4276LV5LT7VxVxAuFFC65IRxKCk885g7cJPc9n
lBbaIXMnfhcj14gOEMspXe1oi51RuXScVKCzF5kd0z85kcySzgTOgpRWxHHCUwCh
iJW0545AzaBxoZ+l+IdiZFlOt59io4OTi8s0OqfemRdIJFMdiaVvo5kTFSCRHNCg
CBXK1+mOowe3dm4GvinqHC+gYjeBXA==
=iv8+
-----END PGP SIGNATURE-----

--Sig_/CDcVZdAuuHqb3M33qX0P8+z--

