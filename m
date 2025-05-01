Return-Path: <linux-next+bounces-6491-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5162AA5E49
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 14:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7464B3BA62C
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 12:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741491F03C5;
	Thu,  1 May 2025 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XOY8vm+d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B132A19A297;
	Thu,  1 May 2025 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102006; cv=none; b=uwZgTAHwb4oRq6auk21UojxrrfaSjvZ0IzrCpp7t8zM0XJBSOPXgNj0AGEbO5MSGdb0JzsTD1iCPtumV46IUFXKL2shn46fX03nnz6jLf8YwmPoYyNw9knzuWiELh+Y/HbmNC69FLrS9LDGQApPfyt+sw+mlEZ4Q53tHF3/o/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102006; c=relaxed/simple;
	bh=60c+pQ6r6f+Wq3lh6SDLNhyioqjLH3NhDUCZ1hf7iWc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gifkncxb0rhmqnswzZ2l8WWAUvxDK68urU90viJ/fKb08qAKk9uQrzMkvdcOF+/9yOZYcgaMKHtck2ZlSqK1k5cX56Hpymwq8adtPC9IndR5ZXJR6wRi2aBM+dDkffYwIVsC9RZyRa+8sPZebaSeGuJUPbrKEX/uP5adurHxvvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XOY8vm+d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746102000;
	bh=60c+pQ6r6f+Wq3lh6SDLNhyioqjLH3NhDUCZ1hf7iWc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XOY8vm+daAKgPc7R8RM86F5vBOBMVuRmS+1dRHDNZDu4wfZ0ln9VlSm0xAEyYfLcL
	 bCJvMMXvtHhZbtzK3RUUPQ4JNeiWxassAJL28BQJ9Q+uinOGLkiFjiilzXI4VxEyKZ
	 oRA91fg0FbHSrbIKgUHG8BoDlE0wlwW73C/2nIbSYsl+6XPr7fPz0HOutx7xFOFEuf
	 R31LTw9MDmCPzOd3p6wsxN8Pcggpfr3+3vtfYjEUh6ND5rMP4mGEIi6bLhh774ie+v
	 gIIVxMGnp8OKR5gxVRah8qrX008bCTz3piAinaxkRC3MsdBxkzVKvjoKUygt1kecin
	 xRrdN4RmpW2/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZpCmc0Sh4z4wbX;
	Thu,  1 May 2025 22:20:00 +1000 (AEST)
Date: Thu, 1 May 2025 22:19:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Tamir Duberstein
 <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250501221958.00788306@canb.auug.org.au>
In-Reply-To: <CAKohponC_E9Ah4wXNNg0YVSo0UuRn+hNq+hxjrccbjeNKWH6Rw@mail.gmail.com>
References: <20250430202315.62bb1c1b@canb.auug.org.au>
	<2xUHqc3nyQdHW2SNbAQvQwy1mR4qz-vdR0UF8fVwFvm-rDtaJmhOUqJJvNWkneTh1XD58UlvoBT3umKbMjNlYw==@protonmail.internalid>
	<20250430104234.dmwnn5ih232kfk4z@vireshk-i7>
	<87selo1xdh.fsf@kernel.org>
	<CAKohponC_E9Ah4wXNNg0YVSo0UuRn+hNq+hxjrccbjeNKWH6Rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5y3UajIK3eaGjWOkZUeL+M=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5y3UajIK3eaGjWOkZUeL+M=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

On Thu, 1 May 2025 15:54:01 +0530 Viresh Kumar <viresh.kumar@linaro.org> wr=
ote:
>
> On Thu, 1 May 2025 at 15:45, Andreas Hindborg <a.hindborg@kernel.org> wro=
te:
>=20
> > I might add tags. =20
>=20
> That won't change the SHA for the commits, so I can safely rebase over
> your patches.

Tags like "Acked-by" etc in the commit message will change the SHA.

--=20
Cheers,
Stephen Rothwell

--Sig_/5y3UajIK3eaGjWOkZUeL+M=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgTZu4ACgkQAVBC80lX
0GzFFwf8DpM34EgWwCJB1MFelIO0FKsEAK/Tg1l3KYlCdWirgKD/Azzbzmd9drJ2
5765PqvnH1yoGL4sRuuVu6Sr1tBFCr+9xTKbHcEFqw6oHNwRFwID1ey6cXuKZ+YC
YtTLflRKFcULZclwl8p8VUiY66uZnhTiz0T0l9SvRHvmZAU7i8B93lRzjWR7Rf10
eWK7JkLq/2tWq+wWLbFPu/eF+5Q8Ztq/5Afkox9ofnZjt6iK6YpyVqx7r4Da5n5k
M5+Z4j1LQ9cpkMjKK+t6cbcGvff34Tdi3iAdqBSddxY0Bwv/ix8sdZHjuGn1HnU/
OhOYyueXyEHoI0sYoZuvUHYk1sEjEw==
=+2Iz
-----END PGP SIGNATURE-----

--Sig_/5y3UajIK3eaGjWOkZUeL+M=--

