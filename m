Return-Path: <linux-next+bounces-8891-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9E2C3E454
	for <lists+linux-next@lfdr.de>; Fri, 07 Nov 2025 03:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E770C4E39C1
	for <lists+linux-next@lfdr.de>; Fri,  7 Nov 2025 02:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D112F12A3;
	Fri,  7 Nov 2025 02:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n+AUUfLb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D7D2EF654;
	Fri,  7 Nov 2025 02:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762483317; cv=none; b=KHtZAOUHswkY4pv+DaReLaQt+5Ympq2SMBbeD+Z+E8eNPVruE9wb0b2C5kksLmh2laEZofJmEyq+8UYjYQih+oG4Aqv9222f6ex46ztJzWO35jzdZXQJTzfA9OEPIqBcSD5rgo1VTtr8PBZoAOEyb3OHumwNmX3JoGfX+P/ptSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762483317; c=relaxed/simple;
	bh=FmruP6J7ngIFA2fOydOR4seJY2QbN+NMV+7QTiYajz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YOnSm3tScwY6GAbG9WMRYu/q88TNzZlgLxdu605papvn6Nk96mYHmMUOukFJQ1akRd+OYQR8ks79FLwRjKK4MOO6iaZ4LchD63rCa9UEntzIlnGEA0Hr2DXY4GwCCkBDOl3v+vTsuCb0veQWtNv/aTqssf57prIRK6Fcrf0gmV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=n+AUUfLb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762483305;
	bh=RPXZG/rFL8T2xBBHG/8KBw0So2faMzolPkqooXqMCDI=;
	h=Date:From:To:Cc:Subject:From;
	b=n+AUUfLb6HNxKt/Q4iOqFKazwGBJFY0Rl80nV8TNfdpJO073HTvU21lhbWLJ6sEul
	 IAXENSoUfpe3bQy7q8Jdvx8mSjC/WFxi4ZZJiw+82CPSe0zgN2RcPvapQa9DoHd2ej
	 +r7m8C6yd7PZALHfTAZEFVXvyKajp+R9ZzLcvAlgcRsGRj/YOWaHcN8PmGiB0qGKE/
	 DbrdJiTdj3paD52VM+gJTk0U4YMCZAkbyxNuiKd+dyKwJ5urA6LlVAGmGdxVfAcnAQ
	 sQ67IgCzuQfSCb83CDYmUr76w0SZKPEtJBpeF0hcGbhoPkPEV8jalrvouQGdTJN0JH
	 S8jj/2G5NEoBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d2jxj2LMXz4wM7;
	Fri, 07 Nov 2025 13:41:45 +1100 (AEDT)
Date: Fri, 7 Nov 2025 13:41:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20251107134144.117905bd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xwV4ge5l7_2S=LCvc7odwz/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xwV4ge5l7_2S=LCvc7odwz/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error: variable does not need to be mutable
   --> rust/kernel/debugfs/traits.rs:266:13
    |
266 |         let mut this =3D self.lock();
    |             ----^^^^
    |             |
    |             help: remove this `mut`
    |
    =3D note: `-D unused-mut` implied by `-D warnings`
    =3D help: to override `-D warnings` add `#[allow(unused_mut)]`

error[E0596]: cannot borrow data in dereference of `lock::Guard<'_, T, Mute=
xBackend>` as mutable
   --> rust/kernel/debugfs/traits.rs:268:9
    |
268 |         this.read_from_slice_mut(reader, offset)
    |         ^^^^ cannot borrow as mutable
    |
    =3D help: trait `DerefMut` is required to modify through a dereference,=
 but it is not implemented for `lock::Guard<'_, T, MutexBackend>`

error: aborting due to 2 previous errors

For more information about this error, try `rustc --explain E0596`.

Caused by commit

  a9fca8a7b2c5 ("rust: debugfs: support blobs from smart pointers")

(maybe interacting with some other change).

I have used the driver-core tree from next-20251106 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/xwV4ge5l7_2S=LCvc7odwz/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkNXGgACgkQAVBC80lX
0Gwb4Qf/brtE7UCUQSYQb+9sHcQBhpNIckaZfXM1aUs4OO9pFalmWEJEA4MKTK/w
AanCKQV9bVt4T+KV5vl37tJsBp1D2RgTeRJV0QhEAVtMabRUcDd1/yBCbd6haVic
/8nlk8Bw2Q7CZiAF3QAd5/f40NXSZiH3mA+41Vc4ZkZwqjUnETsU8eTcQl0zae9L
zmtZSMjRSr6O0p/mstqLBbcpmOgRpxg4zcfdz6OBUtE9ZM4ggOFyV9U02z2YxLzQ
oFWxNXpb0FwjPnhwHV0UTzTQj5PknrfJTnN84X7oL7kob0PC0jUFytscQfjVjr1p
sqPuAlb7EFyWREfSVh/5YAEq/Kktxw==
=xB/d
-----END PGP SIGNATURE-----

--Sig_/xwV4ge5l7_2S=LCvc7odwz/--

