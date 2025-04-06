Return-Path: <linux-next+bounces-6167-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5194A7D12E
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 01:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60D103AE65E
	for <lists+linux-next@lfdr.de>; Sun,  6 Apr 2025 23:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4D71AD3F6;
	Sun,  6 Apr 2025 23:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZkJBQKQ5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C972413B2BB;
	Sun,  6 Apr 2025 23:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743982234; cv=none; b=a0lmUiIHj0eHWz+GyVyQrrRe8qXfeTyhUNcJZNre0UsSNiSyCeWIUwbRD5tMbzcFy32Gfmbz7c7h1GrG2DGYSgmYhGzP/dyZlslGEUoDkJkpBnYK9Wgtsg87UzIwhRrz2ZVqSTPhsanry+QDVb3Tyzj49pEGifI5qhecuDqZVJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743982234; c=relaxed/simple;
	bh=84wt4z1+1E8lq8J9jxUEXgxYuX1t4mv37U2UCIYuh0U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6mC6sq3jFCwWUtf4u2TDVVTw5m861r3oY00WGS3AcIDE8MXbj+FrtQ841RMWV+MTUM1tm8KCemw7Lm+tEx+v0Mz3dVTCoEIwTFBaGQbgCWico3q2jXIhA/oKqIoqfpdUhDqq5JURsXbMjWyWxdxSMkX1Teg/+FeWVZOM6D0H9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZkJBQKQ5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743982226;
	bh=84wt4z1+1E8lq8J9jxUEXgxYuX1t4mv37U2UCIYuh0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZkJBQKQ5IApzGa93ap+6E2Fc/X3N47MiQA8KmPFZu/hlQNq4OBi7+zv9bekRzT89Z
	 bznOwmWVx7on0gnTtjeSRqCxt2j6h247a520yemI7CvFwo12ucCAQZe9v79Glntkic
	 wTdYPBA3XJpFvt7nmN5JiKwh9pbXxoup3oUXUs8afT+RVbt06YDM+oOKYGH98cM3H5
	 Ej8hjUBeIK9st+1a9YRRH5P3ZqEsCSp7IfaT6weoqqRcpuOUd1A+ZrU+RXSEGWjUjR
	 +RMGvxW+bGlks+k2IYCziwga/LJlh4NQ9wtJUuQk2SFRcZd6mek7kf1FLkl1IImGq4
	 pUk5KMtvewPUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZW7qj1P6Hz4xCy;
	Mon,  7 Apr 2025 09:30:25 +1000 (AEST)
Date: Mon, 7 Apr 2025 09:30:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: failure fetching the the tip tree
Message-ID: <20250407093024.166acf4d@canb.auug.org.au>
In-Reply-To: <20250407065432.0f5a8c30@canb.auug.org.au>
References: <20250407065432.0f5a8c30@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lmlAjqn9v+c=TvnIRttiuJF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lmlAjqn9v+c=TvnIRttiuJF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 7 Apr 2025 06:54:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Fetching the tip tree
> (https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#master)
> today produces this error:
>=20
> remote: fatal: bad tree object 7bbeab06d5538bd4ae6a29ef18c9ccd2499dfaeb
> remote: aborting due to possible repository corruption on the remote side.
> fatal: protocol error: bad pack header

All good now, thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/lmlAjqn9v+c=TvnIRttiuJF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfzDpAACgkQAVBC80lX
0Gx13Af/f2JKaz6iAoQPsm7ZmtvMiN/VV5EErGXqxwvmBNTAsefvc/ajZnRO1zVO
NIJhiOxVNbWtQDeP5IY/2whPXHSFb50H1q/q1OCm28Z1bla0zX8Pe/EA0taR3GLv
2rm27dKRzf5oPIdWKSwosKuCGakyKfCUYz9mz7Z9rzJzf39rpRu1ywlBcRI0UNpA
3xgTri2HidkQ9YYiPPSPBmLap/Dm24WVJmER70hb6ZfDWvLzgKYiAKy0hqdWFnTr
RKyuBXOvVLVFxl86engs2ZT4DKlY/Ebn0RKYSUj5q+i7jMHgcIBWoJeJKWc9oHTv
V8GzwkYibk+ppjutqfkK0yZc0RtYkg==
=pIAe
-----END PGP SIGNATURE-----

--Sig_/lmlAjqn9v+c=TvnIRttiuJF--

