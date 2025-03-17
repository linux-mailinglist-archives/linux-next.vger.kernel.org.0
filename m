Return-Path: <linux-next+bounces-5820-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8EA64B7B
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 12:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B06D3A5908
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 10:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3108C233717;
	Mon, 17 Mar 2025 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ndct4Mep"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4150A38DD8;
	Mon, 17 Mar 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209092; cv=none; b=hiC+iz2UqH4M/vu7q5p2Cv+YpcZ2PuMl85hxKBVtYYoYYOrI/0/jzFR+SB+i5Gp8CRmGbLjYPs52fsTtyuANHuHXp91g6FA45h4nGCwW1HpulNvAC1sF3hGnwfxNyof1Ff0Fregt1f/KJ2pySOmwRCWPNZr+jEUZZeCCRntxaVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209092; c=relaxed/simple;
	bh=dPw0zLDv7HGOHJw5DeqotAgUuNl5Mx/AgCHmDIdQQ3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K1pA3RWxRUCYuf/SX+BbcKk5Ov5BQZGef+jqmI4g+sIwHqntzI8eKUwImOz3gpqgrCYYhrA8EQERQpnPtSnxqItKsabnh+9bOmCP093ZcJRUy39qeGnQC7QcztI82qKTa+zOaqnnkwInpAiBvBECpC46bQWi3WSpDXobVui+Sww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ndct4Mep; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742209078;
	bh=9QSVy802gxb7lh6NczC8WxOc0sfP+hXK2U6xq0KCwTU=;
	h=Date:From:To:Cc:Subject:From;
	b=Ndct4Mep2+W8UJ2JMTj5Q9jlYWRCiLWOx4ECM7DBN50Dbhs8gA9nMd4furL6LF9Qr
	 M0tTn+PNeljmBl8tcLU+mxbju1NcOJhfQdpI0uTdRHVW05/hxS3zbh0D7difHSm+T6
	 38xXBgT5/NB2icAuc0UQxx/SL7Cj09env6+oy9K5UbOAZUCeWOuCcs8YfXQ+yEh4qs
	 Bb/WJQnfbPRXuDC/tOKlqSZY82FNZqjhhecg3rFT+wJQl94IpjlayPT5l8E0g6Biz9
	 Lcz474WukdjRh2WmydMKHtyoM8liqfyqkuYnM9oK27ISEysYfcZxD36x2CllI0Zb+o
	 fFalvCf9U/dZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGX4k3cctz4x21;
	Mon, 17 Mar 2025 21:57:58 +1100 (AEDT)
Date: Mon, 17 Mar 2025 21:57:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20250317215757.2412aef1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wz=gC/Nau+t4BBjrZEWvfEg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wz=gC/Nau+t4BBjrZEWvfEg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0603]: trait import `PinInit` is private
   --> rust/kernel/time/hrtimer.rs:71:19
    |
71  | use crate::{init::PinInit, prelude::*, time::Ktime, types::Opaque};
    |                   ^^^^^^^ private trait import
    |
note: the trait import `PinInit` is defined here...
   --> rust/kernel/init.rs:141:64
    |
141 | use pin_init::{init_from_closure, pin_init_from_closure, Init, PinIni=
t};
    |                                                                ^^^^^^^
note: ...and refers to the trait `PinInit` which is defined here
   --> rust/pin-init/src/lib.rs:1003:1
    |
    =3D note: you could import this directly
help: import `PinInit` directly
    |
71  | use crate::{pin_init::PinInit, prelude::*, time::Ktime, types::Opaque=
};
    |             ~~~~~~~~~~~~~~~~~

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0603`.

Presumably this is caused by my merge resolutions :-(  Please have a
look and let me know what te resolutions should be.

I have used the rust tree from next-20250314 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/wz=gC/Nau+t4BBjrZEWvfEg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYADUACgkQAVBC80lX
0GxJSQgAiOH7umi5/Jj48Q4voyRRjr86TEP+dd5Fa6iXfgG2f17QN/7Gi4efD7El
5/vFZBWOSY+GAS1HNr/oImMAlvJnwKgEW0fG5sxVaoR0k4AwPfHTKQLU0gzjz9+L
6xnlrPaCfftu8BuK4r0zf8jqK4obpur2x5vcqHECqpLf3heNJOmR5ELJeteMN9qa
/+2b+EKiNupR+LP2AtbfNwHK/AWlzS5YZbL7imuAzw+5m8z3WzQYHzOVaRD4aLz8
ojvSiu6oDG4GeekF61Oo350aTxHWb9wWxmAsCJ0Ll40avoVtS84kn1OrgtZNfNwk
qRr2onxj54jZW+kxBjXJCFCVuwwGjw==
=+VQx
-----END PGP SIGNATURE-----

--Sig_/wz=gC/Nau+t4BBjrZEWvfEg--

