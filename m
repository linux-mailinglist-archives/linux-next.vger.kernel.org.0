Return-Path: <linux-next+bounces-8711-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F11C0BA33
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 02:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E62384E67C1
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 01:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74402BE058;
	Mon, 27 Oct 2025 01:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P04Izw5L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A8529DB86;
	Mon, 27 Oct 2025 01:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761529960; cv=none; b=INJpEBj+ZYoI1O1i4B/54Dqp7GQqJL1zNtrORC6jLhdOyymlQGpobTrDHfDsZplwMZv4UYINxz8WPJRAUVoLyM49m+FYLyJtasS0OnIV2txUYPCKny5rKUjD5S6Y0/TFIFIT+3/IJ18HwCpJkyh0YizpeHwEdFGsm+EZ6Uo9GMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761529960; c=relaxed/simple;
	bh=fLE7gr4UMk/5b/T3VCFZVC7J0Mr3rH/t/L8WdGeK9C0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lsa6t7+6kY4szxfngxZW+EIyyqRQZq+ACB8Hnfl42p3OuVMwZZxi7mxjkKdSHk5UeSV6ovR48QlFcXD8hOxz9+A4zlIJrr9C5DUwkmIWW5pk1g7WtHO6lhZh+lrcjfrpWqp5dfT6YwVldICiyavij2z3dD3Gat8rkFWDTQsLs50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P04Izw5L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761529951;
	bh=Hr08P0SnLvVNLkQjuuAQ5d5FwRde3XiBHbj4QUrwUAk=;
	h=Date:From:To:Cc:Subject:From;
	b=P04Izw5Lih7dDHDlpAnaaBEMbhCjL1FpGDq3HX34wVNSG6/C3KQKZWkmW8cttCQE7
	 morcLD905T8TKs0mGVquWOfClBxiRyglvIwXfF+wbn3gql2uYBuYlD4GZtz+qO9WKt
	 vv4DYHwpDoAG/Ue8M9maWhiSRdesZGZPSw78+TwxHlX+1/L6IiQ435ygKnkQMVXQxo
	 S/vFvaySmm06RTVK5lTtvU8BuGSjZ3/+oVTH0ZNAbKEAfGyAvYR0qRC5iY2+r8TOoP
	 wyeCUa3NM8g/C+e8roEZY7fmLIk6CH84rMsLCzH8X1F4qVx4iA2rZpY/06JplOx5YP
	 XOLM8YenJ/HAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cvxMy6khNz4w9Z;
	Mon, 27 Oct 2025 12:52:30 +1100 (AEDT)
Date: Mon, 27 Oct 2025 12:51:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Danilo Krummrich
 <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Peter Colberg <pcolberg@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pwm tree
Message-ID: <20251027125148.7f7d8ed6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q9AjUHu9ckDak5Qf2iLUM7h";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Q9AjUHu9ckDak5Qf2iLUM7h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pwm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

error[E0277]: the trait bound `core::result::Result<core::pin::Pin<Box<Th15=
20PwmPlatformDriver, Kmalloc>>, kernel::error::Error>: PinInit<Th1520PwmPla=
tformDriver, kernel::error::Error>` is not satisfied
   --> drivers/pwm/pwm_th1520.rs:331:10
    |
331 |     ) -> Result<Pin<KBox<Self>>> {
    |          ^^^^^^^^^^^^^^^^^^^^^^^ unsatisfied trait bound
    |
    =3D help: the trait `PinInit<Th1520PwmPlatformDriver, kernel::error::Er=
ror>` is not implemented for `Result<Pin<Box<Th1520PwmPlatformDriver, Kmall=
oc>>, Error>`
            but trait `PinInit<core::pin::Pin<Box<Th1520PwmPlatformDriver, =
Kmalloc>>, kernel::error::Error>` is implemented for it
    =3D help: for that trait implementation, expected `core::pin::Pin<Box<T=
h1520PwmPlatformDriver, Kmalloc>>`, found `Th1520PwmPlatformDriver`
note: required by a bound in `kernel::platform::Driver::{synthetic#0}`
   --> rust/kernel/platform.rs:196:15
    |
196 |     ) -> impl PinInit<Self, Error>;
    |               ^^^^^^^^^^^^^^^^^^^^ required by this bound in `Driver:=
:{synthetic#0}`

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0277`.

Caused by commit

  fb3957af9ec6 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")

presumably interacting with something merged earlier in my tree.
If someone could provide me with an appropriate merge resolution, I will
apply it.

I have used the pwm tree from next-20251024 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q9AjUHu9ckDak5Qf2iLUM7h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj+0DQACgkQAVBC80lX
0GygJAf/bzLHVaD9z9tJmRBDc1RORE7DwIbZ2T4TgTDLgTJNJB/5fKgwTuT08lP9
ZNDIgBwVZ/LLTXfTvbmUv25FBHf9mFQ3sYbvuc8lbLClapnGb+PQR2YfTC58j116
vRbvv91TU1K3eR8As5atPqFT7BvCiWv4ElscRJAYq1imrd7AiEjBuGzRpecyTmV2
j/9yw1AeevDB3b4EXLXJD8N8nAwUr2llrxQWN6OusPKYSINXsl2blKYQgIAbp0QJ
MW28Uml0buqXYHgoiZMjQ7+vbe31UwzaVOzKP1981IEAtsJjqV6I/xZCPamUtn7A
IjzwosXhbGcQGavWQzM7L+KknDJuMQ==
=r2db
-----END PGP SIGNATURE-----

--Sig_/Q9AjUHu9ckDak5Qf2iLUM7h--

