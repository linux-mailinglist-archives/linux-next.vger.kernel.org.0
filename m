Return-Path: <linux-next+bounces-6370-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43416A99A95
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 23:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F6283A3B7B
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 21:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B9428CF64;
	Wed, 23 Apr 2025 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X1SdpnOq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2825127F4F5;
	Wed, 23 Apr 2025 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442869; cv=none; b=D/MyU0olEYYbEmLr1JlPVTBm4cyG9K/ygw7K8OeTCzu1BjdD0XCqFay0kyADNd3W38OpiwWpsAtZwwvLRW6vvN+xQa2mDJbmUNNFL4VgIar6HxlTM87n2ohaDZN2qV79XHiGLP0sJiD8QiDGcN8yfCEJhBimsXnhCl9CZ2wZ59M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442869; c=relaxed/simple;
	bh=JgrOAtM8sm0Y8lelu/afNLjNl6qirTNkThEw60o30VE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lDlG7LGwaxaCvPK/TJBcrWr0de9uffAbob5iaTIR4LQifsOa9n1VkvYyceX7l0+Feuf5t8AC/hKtsma08qku01goVYoJTbxEAyxbyKeK/Be6YCOl5Z8SInMVg/cMWkibvaX+QFIv1iEXZoNwkl+tTMgGd4z2nzbNmvPBYEV/gHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X1SdpnOq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745442861;
	bh=4oPMDUDfNZ9bJB/KL/CWTJHJyHgla9E3XWiQFHh38us=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X1SdpnOq+rDfN1ZSy6DMOD4n4cKcVlCs+ObmiI9jJUJMv4z8UNe/xdsMSkyl+UVF4
	 +zYpfOteEmHbRM1YRrQA8eoTQGnYIIfKVlgKvYsQhmH1xKE00GFwAhMm/MY7Fz3idh
	 wg0vYboGzQ+TAojQcckbVyYuZxoWWbzniRBPoDJzyjc2R/4XM7WTdYWIuAvP4lTswq
	 zru9YY4esQiCJKn2+N9b+e5jbu5aJul8Sd8RcQY/rLZ3tcvOuiYUO+p43DgRPmwglF
	 edt6sezzUuzWSG5jP4xlJ8RBfLqNSiCo9iLIniZ7/jlO4FcfoWSE6ZN6tyQJN4lMT6
	 a39EvtISeKYLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZjX0s0DMhz4wyk;
	Thu, 24 Apr 2025 07:14:20 +1000 (AEST)
Date: Thu, 24 Apr 2025 07:14:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Gruenbacher <agruenba@redhat.com>, Steven Whitehouse
 <swhiteho@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the gfs2 tree
Message-ID: <20250424071419.29a1b93e@canb.auug.org.au>
In-Reply-To: <20250422092250.71bd2347@canb.auug.org.au>
References: <20250422092250.71bd2347@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w4l88pKN9gaXzCIDe=hEox/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w4l88pKN9gaXzCIDe=hEox/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 22 Apr 2025 09:22:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> In commit
>=20
>   ae1d809fd0f0 ("gfs2: deallocate inode in gfs2_create_inode")

The above is now commit 2ba70fb39555.

> Fixes tag
>=20
>   Fixes: f1046a472b70 ("gfs2: gl_object races fix")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Mayeb you meant
>=20
> Fixes: 9ffa18884cce ("gfs2: gl_object races fix")

--=20
Cheers,
Stephen Rothwell

--Sig_/w4l88pKN9gaXzCIDe=hEox/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgJWCsACgkQAVBC80lX
0GyEEAf/WbyceNKLy8iuZbwJFRKb1unJgsxYZ0MhGNo4wwMrmv3JG0OZyYQIl9kc
ttqMGgSJoAv3bIWqKIX3gb0h4lUxQln/2ZA8Sj2jqRc216D+9Gq4YkOhUUeNGPJV
wHpojlHI7rALbKT+TfXVad03ktRLniwYx7UaynZlkdQBhm4JVcHpwaBP2YoeZK5T
L0kPr41hCS//ZbkC+W1VJYXabHP7isqe29DlGcxX1aN+BjPHcBNz399oEmU/5DME
5ynlUZE2sFN7PUKhkHVPLExFazB8XDSZ/nbDI2DkllbUt/hh0Dw0MDzejsywc5BH
7WffF5fKD5FahmNVIsicJk4/i2Q8xg==
=A1dp
-----END PGP SIGNATURE-----

--Sig_/w4l88pKN9gaXzCIDe=hEox/--

