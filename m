Return-Path: <linux-next+bounces-2506-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03616902B7F
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 00:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7BFD1F22A67
	for <lists+linux-next@lfdr.de>; Mon, 10 Jun 2024 22:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B32215098A;
	Mon, 10 Jun 2024 22:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b="pW2ZL601"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C18745F4;
	Mon, 10 Jun 2024 22:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.230.158.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718058082; cv=none; b=HsaZHtob1jj+4OuqGv/N3Jg4vBEawZF6qOYR/Lx8VJM3RHpG2gFcTmvnk+WuQqH86+1pEalspnuW4gqNvjpgeTGlBbRrGVMlmeNpGzphh4DtRAN2JfK1UpCs4lWL7vb/1kPE/JRwLUgnQN+8F0E8YPX+lNfYDjMa3WuMgXjWkEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718058082; c=relaxed/simple;
	bh=03Wv3iuJB/txfjVrc2YZH23gRt/Gc/3S3BTnGCY2bu8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQivhxCjN5dfqCdL38C2mpjUfxx1c7tOYOhNSRratP25wY4zF8X/an3T0LvQlSwG/w4WmqK39tqEhqFEYzW4buDDRZPmayBzPvxg5xMGI/Xp12WGkoyPli1Ode2UBYtZNBxoIpjSnj43PmKxO7K2BFFbeGM+JT0voOiATuhKW74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au; spf=pass smtp.mailfrom=rothwell.id.au; dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b=pW2ZL601; arc=none smtp.client-ip=103.230.158.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rothwell.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
	s=201702; t=1718057542;
	bh=o2WHC39aeKi1ObzdV5DagZCOhaGXixNtJPpOUV27h5A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pW2ZL601n5Y+OaMcg5Zrzjv1jlmm+MIyOCxa0crps9iaxbl84bAc28iIHLV+PbaS/
	 LXlV0PZwFnZ+RxGP+Yz+KOB2LGhP6DVFgEpSp5DvUJj6T1TeDg1N0+H6lthwEnptk9
	 EPqxjlZFeETolHVQ4GooysVJrybePWRcESHQkixsD+Ui0mSkt61KHrauhUZn+xQoxK
	 GlEOqXfru7kqTObXU2VcyQkFpUKUPD8sv0Iwb/kb574k1Ds+x/OF3V1a/KkU9hI7VT
	 NWxncEeN6B0I31Et3gfYWt0Gis7EdPtjR6eVGy8XB5MvM2mpmi8l2SGyCbH0+/PyD+
	 g9TbRDJxwOK0g==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.rothwell.id.au (Postfix) with ESMTPSA id 4VymJ51sWwz57;
	Tue, 11 Jun 2024 08:12:21 +1000 (AEST)
Date: Tue, 11 Jun 2024 08:12:17 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Whitehouse
 <swhiteho@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the gfs2 tree
Message-ID: <20240611081217.4d2147f2@oak>
In-Reply-To: <CAHc6FU66Tsg1WZcUwK641rJ-KytbBSkegzrXWFgsEuuhe+PDhQ@mail.gmail.com>
References: <20240529142455.1c68e65a@canb.auug.org.au>
	<CAHc6FU7MrnksU9vDvdAvc_tv5knukGpnxXEpqidvdfWqDf1p5Q@mail.gmail.com>
	<20240531100032.4a112093@canb.auug.org.au>
	<CAHc6FU66Tsg1WZcUwK641rJ-KytbBSkegzrXWFgsEuuhe+PDhQ@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YkyRNdiE3zdYKcMepyqZxEL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YkyRNdiE3zdYKcMepyqZxEL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Mon, 10 Jun 2024 14:53:28 +0200 Andreas Gruenbacher <agruenba@redhat.com=
> wrote:
>
> On Fri, May 31, 2024 at 2:00=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > Done.  Who should actually be the contacts for this tree, I currently
> > have only Steven Whitehouse listed. =20
>=20
> Could you please add me, as I'm the maintainer. Steven almost isn't
> active in the development of gfs2 at all anymore, but still very much
> on the management side, so it probably makes sense to keep him in the
> list as well.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/YkyRNdiE3zdYKcMepyqZxEL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZnekIACgkQAVBC80lX
0Gx2cggAgGgiYkrTLlv1dqUR/1iyuny+udpr7QOXjZfQOX9fzpPWSTK/kXBf6/qr
0sf10QPkGdXeCC04Gpb+qvEsanduelo0niPRrsOlN5KN4bwKSHaKZ/qp4sVng7VT
2WBdiVTa+WPTnclAplsMzvCJ6bQ4OmX36g8MKj+wGCnDII5ILJ3JVYGHsnYeKWRP
tzkjt/1l8GQTwAAuas4MwEvJ52GRrXYQcCuEBWcNt6VrfocMyw54RCskMQq+Yd7X
JmQ14kew64VZjfOHMvQwgQFUreMsr5VdIr78xyTeTR39DkD+mOp6o7NsmazHE4CG
vTc0m8fHrL6qo+Rc2aKry9qze/0K4g==
=5mop
-----END PGP SIGNATURE-----

--Sig_/YkyRNdiE3zdYKcMepyqZxEL--

