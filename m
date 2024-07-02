Return-Path: <linux-next+bounces-2805-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358A7924437
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 19:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E731B2889C7
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 17:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D534F1BD51A;
	Tue,  2 Jul 2024 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UUwn6WqT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41971BE22F;
	Tue,  2 Jul 2024 17:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719940057; cv=none; b=WkVucKnBSc/QY3c8sz843MaIvgRonKQxGaxqMt/lKsae9vu711+n6NnSLx/GTaTxn3CuKZ/C1DVauV5BdUJ2byXWKcxmNddZyzT94ge3S3Bh8WUfKgOJayqRm3IHoovsX2UBHMK1PM6nDXhU1ooSt7YopCiJ7ehwcsLJNyxZ+7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719940057; c=relaxed/simple;
	bh=KRJLrCPjzuN7NDtqiPxJzD1CO4i8+5KGuuBlOvBG/O8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cZh/B0zXVJZq4fVKaBNxNnG4iNvwjQtWuhd8/33MiX0U3C7Ko3JdyYH7oQWE/Gz9v6Jx4F7j89U71cpXd0H7E5c6ILbjRTOeDJ6Hla2mDTBYsmOZTLIQWBfI/AP0x3Zsv4698lfmg0EJEAi6InvlMes7k+pdZlO9ZqEqluik5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UUwn6WqT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719940054;
	bh=Nihxo7JoZbhpabmyLPfq0ndYP15PexXP6QmKs2usb1k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UUwn6WqTR2y7ZooRbgmkI6g/rfU4fXSFYvwfL0Sk9bzxtDKXR30BCO2Bwj+u1CQy3
	 X9kABXpTkSdHyw/9L4MSYlrRREFTdPIJh6QW5xPK71NUaGkNzxLbA9A/q7gLi8q9Hf
	 ivaUjTueW8nRaLgO/dq2rDRpl4Xbbv916U0nAp4MunN+hoR+MFGJUi5bkqVMJ6DNvj
	 9Yue/2SJsUmOy+9XCMMZbzcboQAk7bvvcfthmrjoWzHYwZLqQ7/WgoTXgK5Df4npn9
	 c/BI2yyYKKbf+for5oUu/yckkzi85X2RnFQ8e1meBF7L+lASqQjlsqP0/nyXYm17nQ
	 v5UZrZOmWZhDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WD8VF1bjdz4x0w;
	Wed,  3 Jul 2024 03:07:32 +1000 (AEST)
Date: Wed, 3 Jul 2024 03:07:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Christian Brauner <brauner@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Christian =?UTF-8?B?R8O2dHRzY2hl?=
 <cgzones@googlemail.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the random tree with the
 vfs-brauner, ftrace trees
Message-ID: <20240703030732.02b5dda7@canb.auug.org.au>
In-Reply-To: <CAHmME9rYfTtO9CPGi1nB=ohZ_SBMFocxpB=Ga3cqA54EF8F7Og@mail.gmail.com>
References: <20240702165601.08bb4545@canb.auug.org.au>
	<CAHmME9rYfTtO9CPGi1nB=ohZ_SBMFocxpB=Ga3cqA54EF8F7Og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jkRpFIQ=X40U3SC9Ft6_h26";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jkRpFIQ=X40U3SC9Ft6_h26
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Tue, 2 Jul 2024 16:43:17 +0200 "Jason A. Donenfeld" <Jason@zx2c4.com> wr=
ote:
>
> Hi Stephen,
>=20
> On Tue, Jul 2, 2024 at 8:56=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> >  +466   n32     removexattrat                   sys_removexattrat
> > ++468   n32     vgetrandom_alloc                sys_vgetrandom_alloc =20
>=20
> Wondering why 467 was skipped.

It is being used by the uretprobe system call on x86 and asm-generic.

> Also, any chance you can let me keep 463 and shift the others (unless
> Christian objects)? Or does it not really matter anyway because Linus
> is gonna merge this how he wants, separately from what you do in
> -next?

Well, the other new syscalls have been in -next for some time, so I
don't really want to move them (and it would make more work for me :-)).

As you say, Linus will just merge these depending on his own ordering.
However, if you switch to 468/568, then he will probably not change it.
I was also hoping that the uretprobe syscall would change to 467 for
the same reason.
--=20
Cheers,
Stephen Rothwell

--Sig_/jkRpFIQ=X40U3SC9Ft6_h26
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEM9QACgkQAVBC80lX
0GyGRwf/VYeAa1VP+lRm4iV+SXiUZogWIwMoA22tI0CMgX580JO8ktJs48YWFZY6
d5HWSzT6FdwJ2mfMe2M+iryPIH610rRoiW9CKomzjFZw/3ANPp/8+AzdIf7ntKas
VqPZCcNT0X5KOJx6+7cmY+6Jobe6gmlmOxPId3fvqvW8JpjioEgXuQQA/RWTR0gV
wztHlYJWwWkVd7cq0bMPa0HGchNdfKAgNr80lI3cqg8g+KCQqTTZvVVp657oLake
ISWzYcwaAFia2RpgpRpGt+LuLcfa7eF9geYU6yJ8BCnxpQruAhrCniXWJo+Q8vd+
ko0VX6lAJZxRxudio6SIfowjP6yfhg==
=Meqh
-----END PGP SIGNATURE-----

--Sig_/jkRpFIQ=X40U3SC9Ft6_h26--

