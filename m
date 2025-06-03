Return-Path: <linux-next+bounces-7036-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A98ACCF00
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 23:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 672C2188BD75
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 21:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30D9221FBE;
	Tue,  3 Jun 2025 21:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MaZ9vsL0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D961A8405;
	Tue,  3 Jun 2025 21:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748986330; cv=none; b=oUXDhl18JIzdQe7V5JfJjU5Fyg0I1Vj6pIBAcdxYPNpNpR2zjOArufWTBsyn6xZoAJCUPG4kQlrcquAo56LTHvV+W7ncjFVdOljNQ41bYsQuKxUboN7Ug1h3R1lFcTxow0W6B0R+d0anPUJaGissD1BX1QJp41ozsgyBuTvBkw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748986330; c=relaxed/simple;
	bh=Jss5g9npedZTDFWuPuZqcGQ4qelof1pkUcNtSIxUI0k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIP9ERolD6R952Rod/tV7x4LigJN59ivieF2E/wrBLXWrsgazY6feACCcw08v5mfXj2jQ+2w/EuYRmXe9MzEQ5Buz4Xk55mx58HrMwOjmK/O1jh/HAa1MzvvvcwtNO+f7d29Te2YhnPyFx828scKnDH/1VltonUcGKS/z4i9VqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MaZ9vsL0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748986318;
	bh=YXJifQgVfyCRhkpdle8Kp435xD880whtOSxBMS0Ih54=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MaZ9vsL0X5Kk30mYEXscfWDBSLxk7pcYzbNsWk1HwMt3Cbzgh0kTYkC4cVKBv28Qf
	 nBASVGshjDK8uuA0+Cldej6g3xXG8l/ONznix5GNJ6pvC6LrbHS2weVTJIGhlAXR85
	 Tzj+sabj2CISLq4u+i9sxM2u93RNiv5OdB+8OSgiuqvEF60fKscd4WpMuRdTCX/npe
	 Ss4H1p6SO0DY8RqhAeN0Z5zcKEkYQV0hZUVdy1eni9wBefl5yFSfUANt/8bE+Mjlbo
	 B/4DK6vAnt8xAMEZ1yepyUCuPhV7ATBKLezYaHu+1i41i9nR/Ity9stxmjCFKLpnL8
	 H6xGRuynGTazQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBkSG1l9rz4xc6;
	Wed,  4 Jun 2025 07:31:58 +1000 (AEST)
Date: Wed, 4 Jun 2025 07:31:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: REGRESSION: armv7 build mismatched types
Message-ID: <20250604073118.4205f303@canb.auug.org.au>
In-Reply-To: <CANiq72=+qUNJu5j+uoveMrTbngwA89+ScwjUPd9OyVGqps54aw@mail.gmail.com>
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
	<CANiq72mFL4dn+0JppLLfxyKnM+xYwKeduFw2j07hUfxWVVHdUw@mail.gmail.com>
	<f5d5b84c-0850-4df9-bad7-61fff12c4248@leemhuis.info>
	<CANiq72=+qUNJu5j+uoveMrTbngwA89+ScwjUPd9OyVGqps54aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lh=kQjAukULzSZZYDl2ICpu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lh=kQjAukULzSZZYDl2ICpu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Tue, 3 Jun 2025 15:04:02 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gmail=
.com> wrote:
>
> On Tue, Jun 3, 2025 at 2:51=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.=
info> wrote:
> >
> > Or is this heading towards mainline really soon now anyway? =20
>=20
> The Rust PR is, but it would be nice to have the fix in -next before
> sending the PR (I will give Linus a test merge anyway, but it is nice
> to know everything is OK in -next too, and to have another reference
> point for Linus).

Damn!  I knew I would forget.  Sorry about that, it will be applied
today.
--=20
Cheers,
Stephen Rothwell

--Sig_/lh=kQjAukULzSZZYDl2ICpu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg/aaYACgkQAVBC80lX
0GxoSgf/bawM8QgK3MOoFaT2gHDO8PiXvv5971lHtGpy2qhxliT5XDXWZCAEbKJm
BzuZfZJ6EXxwJG06fT1eB3mNRuQngFRzHNXjKWrCEYjq2cK7zlCIMhxlmk6bP2nH
glcgix+v71OSXD6hI2TD5qywlsnVzOB/wCFCkLOOcBjfgsDBYIMdp5jqpGAyYbhW
cqWDZ2ERGt5DaumVPVxtn4gHrunLD5TlWApKTPRVfxXeNa2O2fhkCr95O8OhsALP
kmmOeGYByTB5QSd+cRo3/Kpc8cl86+tfVqankyCVOaV3QOr147IViitWfPkpHdTE
qr9dAZBIRMwu9Zv37JQwIlbPro4s1A==
=BbwS
-----END PGP SIGNATURE-----

--Sig_/lh=kQjAukULzSZZYDl2ICpu--

