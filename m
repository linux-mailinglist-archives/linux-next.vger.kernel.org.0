Return-Path: <linux-next+bounces-3077-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6AD93713E
	for <lists+linux-next@lfdr.de>; Fri, 19 Jul 2024 01:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62A2EB21A1E
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 23:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BCF14600D;
	Thu, 18 Jul 2024 23:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EQcdblRb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647B78C9E;
	Thu, 18 Jul 2024 23:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721346339; cv=none; b=dvycaNuNGpZqohF2IKkOj1kmZp6OptCZL7M/+XDoz6mth/Xm1cgWnLOpDXx/JMtBVfiTb+ymjaLXgd5fb138rR8hkRXm+m2ZTcfdSxOfLp5j7YTE1uzn6a4mSMjWS1nmobMwDikSLkaPqY2UzVfmDnxHZrHq1my2kY8zpEGTr3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721346339; c=relaxed/simple;
	bh=z5qtEUIN7adnSsQXLunxrEAjIOeyZD8thTkUpbH6OZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sfh5gS2nKjK49Qgxyh9MWKHnCgbUJZgpk5cjCk7khaCMfYIt81RFyrcAuIpWn2CjgyzZIEP9TTKvchVZsyUZHp/6SD4MYVlbSCMIGBsfa+y1JHmtW9kN5NdJ867H+tHS3H/+5Cxtxk0UFARLeXYrRoYsgoDGiAvrCvmUSn3YTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EQcdblRb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721346333;
	bh=BemwD+FZk6gdaWxxCrGiD9ZmPOQsLmDLH5YFQA8T8tw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EQcdblRb3ALTCyRuyy/26wfBlAlIdWWXovACTqLtO6Ppv/5bW4KYcrtywb7rqwN4u
	 ANTXzwvnOyajrwpU3hqGdxWnLw2vdh5GcGg2dz6tPvnoub0OeLZGxd98gAZd8WdvN4
	 27TZgTXcawpU8YZTSNcBIyXFJHi1zlJwBqQgURjctRgdWML7aG3lY0s3Ooa1sB2Mst
	 t29n++heGRSbi8UY7OS7FJvZDsBunci4Bl6t9AlRnUO9owlS7M66cvmq2dRi+kDo8o
	 I0cPJ+Cf1NEswmOaCBZagARoFDq8CIqFRQDgARIvgP3BN6C8OEzRQV0qvtJZsYSYYL
	 uIeXr3j435G4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WQ8Z52SS0z4wbr;
	Fri, 19 Jul 2024 09:45:33 +1000 (AEST)
Date: Fri, 19 Jul 2024 09:45:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: linux-next: manual merge of the hid tree with the mm tree
Message-ID: <20240719094532.20fd065d@canb.auug.org.au>
In-Reply-To: <20240709112544.190ffda4@canb.auug.org.au>
References: <20240709112544.190ffda4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vt/OvPY5il/CYRPHOHRwjYD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vt/OvPY5il/CYRPHOHRwjYD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2024 11:25:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the hid tree got a conflict in:
>=20
>   include/linux/hid_bpf.h
>=20
> between commit:
>=20
>   bad8443fbbca ("mm: add comments for allocation helpers explaining why t=
hey are macros")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   6cd735f0e57a ("HID: bpf: protect HID-BPF prog_list access by a SRCU")
>=20
> from the hid tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/hid_bpf.h
> index 99a3edb6cf07,9ca96fc90449..000000000000
> --- a/include/linux/hid_bpf.h
> +++ b/include/linux/hid_bpf.h
> @@@ -151,12 -227,7 +227,12 @@@ static inline int dispatch_hid_bpf_outp
>   static inline int hid_bpf_connect_device(struct hid_device *hdev) { ret=
urn 0; }
>   static inline void hid_bpf_disconnect_device(struct hid_device *hdev) {}
>   static inline void hid_bpf_destroy_device(struct hid_device *hid) {}
> - static inline void hid_bpf_device_init(struct hid_device *hid) {}
> + static inline int hid_bpf_device_init(struct hid_device *hid) { return =
0; }
>  +/*
>  + * This specialized allocator has to be a macro for its allocations to =
be
>  + * accounted separately (to have a separate alloc_tag). The typecast is
>  + * intentional to enforce typesafety.
>  + */
>   #define call_hid_bpf_rdesc_fixup(_hdev, _rdesc, _size)	\
>   		((u8 *)kmemdup(_rdesc, *(_size), GFP_KERNEL))
>  =20

This is now a conflict between the mm-stable branch of the mm tree
and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/vt/OvPY5il/CYRPHOHRwjYD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaZqRwACgkQAVBC80lX
0Gyd5Qf9Ee4QsV38/4rOyx3rhsqajcWq9FxLXwHU9vmufpJeEOg+zVJxjyFnS/8K
3mOaLwAvbRACjSZ4QmFvS66L2FmY1PhQNxqo+/9gCpcNzPHSQpB7JsCjFS5J7oFc
uHrpVmoyqWwpOWx0GBoI5E66IGvA5ezHELlPrFy72j35mbWTIDrtXzktPfvcMcJT
u1ml7PxZ+LKb22Yso2iRogE4tWS7y5Gy7ri/lD/hxE8Pn/f2WTeFU9eTkHMOduo0
83pFVqwIJpdX0TwKV22PBWdU+rBJC7g0PmNGPvE2o/PGAHOATQsqwK/TQ398LyhE
VnwYLDjfVQ1xZlsaQxGY/B9/OZJITA==
=Gjr1
-----END PGP SIGNATURE-----

--Sig_/vt/OvPY5il/CYRPHOHRwjYD--

