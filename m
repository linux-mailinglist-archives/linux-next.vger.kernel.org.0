Return-Path: <linux-next+bounces-4068-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66498E72C
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 01:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B5A11C23E36
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 23:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB831991C9;
	Wed,  2 Oct 2024 23:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YCu+7fQk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD42194A6C
	for <linux-next@vger.kernel.org>; Wed,  2 Oct 2024 23:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727912365; cv=none; b=u/VReI00qDWFZ3QfhkZ5QpqBkl+QBHVppcwfSO2aZvvNKdHYDsuFEG60Ksbe6DDu6+NxFBeoEW12wvAT2F24AuFLE1NgFbAL7p69DrX9for+WXHXFQPEiPyiAmsp9Nk1iO+j2CV+vuTHfzogkfnzZv2AWE/lESiFcegVXY52H28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727912365; c=relaxed/simple;
	bh=9WOiI1Ikx6zC3ew+fxtcn0CeuVoH9xobZzZqVjfec+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DVyMvAgucY64NCXxbig0FSVsMMnX4nE9OiLEyPdnkKJNKlb6px18+RSb8slEpiBXQS/9W4yrzhHa1Brc494DsqXgHLn8ohXhO7Zb6jPSx8wmTh7+aAzzzSRhdwGmIBQJ6v+qyogOVEmh0HDz5bA3Zk3i94VANS4WqJB02/v8Lw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YCu+7fQk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727912359;
	bh=WAtkAAiCUXL8AEZ3EyA82sp+aXmb8Z6/RzA+IdwR3MQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YCu+7fQku702zfbYwbSu+qBlrns4aPhEfjoddSnL2w23OtQ5fewL2fhuJYfrIpQrY
	 RJbtEAaMDKp2vN53IGJJmqIFyDTggSGezJQzrBbuiy5VDU094RO0UTDycLFbhmKdXj
	 HODBF/rCPxLny7uM7I17dTQtndXgGll0Pxk+7Btx3JD4KnTP8vIjwJznXMHR1IFtfr
	 0mX9Ywd46/N0IP16AdavSv8Oz0JBA7ufZ2MrclBWNBfg8lW9s4OsybNJqFtjXqiU1e
	 Tbpqpb+vN5xgNcOshi8Kds2HWuH7sjhHNQedTtvS9JPJlLHY89+fGQ7f9xdKMCDx33
	 8iUm58b5fKIBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJrqq4YBDz4wcy;
	Thu,  3 Oct 2024 09:39:19 +1000 (AEST)
Date: Thu, 3 Oct 2024 09:39:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brahmajit Das <brahmajit.xyz@gmail.com>, david@redhat.com,
 gorcunov@openvz.org, linux-next@vger.kernel.org
Subject: Re: [PATCH v2 1/1] fs: proc: Fix build with GCC 15 due to
 -Werror=unterminated-string-initialization
Message-ID: <20241003093919.7ac17f98@canb.auug.org.au>
In-Reply-To: <20241002144806.255d62115286e173bbf42655@linux-foundation.org>
References: <20241002080534.835250-1-brahmajit.xyz@gmail.com>
	<20241002080914.841071-1-brahmajit.xyz@gmail.com>
	<20241002144806.255d62115286e173bbf42655@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H6YUNQkd.WQquB/tcxi3qnw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H6YUNQkd.WQquB/tcxi3qnw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 2 Oct 2024 14:48:06 -0700 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> If we want to preserve the party trick then perhaps we can use
>=20
> -                [0 ... (BITS_PER_LONG-1)] =3D { "??" },
> +                [0 ... (BITS_PER_LONG-1)] =3D { '?', '?' },
>=20
> and this will shut gcc up?

But we would probably also have to fix up the other following 2 letter
initializers as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/H6YUNQkd.WQquB/tcxi3qnw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb92acACgkQAVBC80lX
0Gz+0ggApZHoWLDo7T6jgd4LecViQNVO4tplg55JvRX2H5nGF7X81mHgiryymabp
w2KY2HYUxHhPCnAay5FFb+Z8fcVpD0Em6aW3GH/jIYzuZax+JHrrIV0ggwiIot6B
3DtjycBfIjlbkXSbqhB+astaui/czGV+HjmOZFg1fM6uGUW3+ckwSRdpQiq1AZ1D
yKG2ImLL02EWjSErqvSeca4gxDImpN7QowriTaTkjzWxlAihNrId5ThEo53oT6SC
zZdXyzaqC3yrh16Ei7TlYqNv6tYmuxfAO/Bdt27zfKv1Nh6qkBNim+DBTGMCahQX
4e6lFnH04GsjujqgW3jiNazL6H2qaw==
=/x/P
-----END PGP SIGNATURE-----

--Sig_/H6YUNQkd.WQquB/tcxi3qnw--

