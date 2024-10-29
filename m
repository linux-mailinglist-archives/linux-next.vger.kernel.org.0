Return-Path: <linux-next+bounces-4511-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067A9B422F
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 07:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B75CD28360A
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 06:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9635201005;
	Tue, 29 Oct 2024 06:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b="lJ3Go5Gn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6D7464;
	Tue, 29 Oct 2024 06:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.230.158.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730182386; cv=none; b=p5l7o8meIVPJqRxsNwquTHCJoqKwcnZagcpidjBEApXgFQ7WbLiaU9IXBdfS35mHz4f2fQiJw+3i6DWBrrBXfGosGVbyoexjtERhb76NpEfoQT4C4OEYjOOWWemaz+qY6rlrpKljtIu8sazF0RrMGMFABUtLPcLFm/5dj9rN9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730182386; c=relaxed/simple;
	bh=ch844stOOcYt++jDmvHi7Q1K19GvVMurzsLZBKno57U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V2UhjI2xo7Lw3U5jGy3IDw5vV5YSj3LQWuIv/UGpFI3Z8OCyC8vqBTDshYlEjllWt2r9DSWGVtLPrWCvFl/9qUU1OuNe3Cv6WeGzeLbFTperE8PUf5Y2D2Af5g0Q0A02Lw4ifTCaxjb7YDHFG8a2ZZS+ToRjZn6CAEJsTl9Jt7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au; spf=pass smtp.mailfrom=rothwell.id.au; dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b=lJ3Go5Gn; arc=none smtp.client-ip=103.230.158.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rothwell.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
	s=201702; t=1730181937;
	bh=ese/ICA2Vd7ZwEi5Vtpit6xyLjkPxy2lWxF4PC/6sJY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lJ3Go5GnR47ldvd+Uyr1lHlAnX0Sw05bo6hOODee822i/u0Fnppwn2wyxQYzCypV5
	 ggTwN4Y2agIuBXTAPNIaGoLaT4SLwcMSaDQRnhr8REdI0H0YjV9lK4RENgRdzsgq98
	 gIuOvJmqy8OjqqMhR6GwNUaL0dNo+quV2U1Efz/jUEr+K8x5NDIlJqE0EEF8tFSqwj
	 s0PGwr/pR20/2tXXyP81fayzos7vFfvudoOqTqYIVT/eYFNmdHjg0WcCpCIr1ZUt2m
	 3yjbhc3KGrcNsk5fBk2//6R5q4tOWE820bakUYIKuDn5DzOs6jiZPPUjrSaZcZeiEy
	 xlOrBsMOWplaw==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.rothwell.id.au (Postfix) with ESMTPSA id 4Xd09W0XXQz6M;
	Tue, 29 Oct 2024 17:05:35 +1100 (AEDT)
Date: Tue, 29 Oct 2024 17:05:33 +1100
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-ID: <20241029170533.5592ab42@oak>
In-Reply-To: <20241028213040.e5d72b2f56971ceb5c80395b@linux-foundation.org>
References: <20241029133407.3580be1a@canb.auug.org.au>
	<20241028213040.e5d72b2f56971ceb5c80395b@linux-foundation.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7psVxqKYd=1bKJnYCTBwJxq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7psVxqKYd=1bKJnYCTBwJxq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, 28 Oct 2024 21:30:40 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> On Tue, 29 Oct 2024 13:34:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
>=20
> > The following commit is also in the mm-hotfixes tree as a different com=
mit
> > (but the same patch):
> >=20
> >   9c70b2a33cd2 ("sched/numa: Fix the potential null pointer dereference=
 in task_numa_work()")
> >=20
> > This is commit
> >=20
> >   82c4d6b6dace ("sched/numa: fix the potential null pointer dereference=
 in task_numa_work()")
> >=20
> > in the mm-hotfixes-unstable branch of the mm-hotfixes tree. =20
>=20
> Thanks, but...  What tip branch is it in?  Matters because: is that
> branch destined for 6.12.x?

Its in the sched/urgent branch, so probably destined for Linus fairly
soon.  But the tip guys would know better than I.

--=20
Cheers,
Stephen Rothwell

--Sig_/7psVxqKYd=1bKJnYCTBwJxq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcgey0ACgkQAVBC80lX
0GytDwf/aS8kX6z2isQPahD9pxomMZcAjCSiSnBwuM0/78hvomVK9QEL8IzLA2YB
vgD2iKwlG6HYbRGzqhiBIx/RJyurZPICffSfc2T4/VZF98OlTKH1j9GdrPvA+CiT
e+ZctoeSZ2s7YOo4HHtVbIMapTuswKROxm8lWZ+aCrr6/+oB10M8oesHKLo9qpD1
MInrwUK3fDuKOHTtxgCnS+sLBR5lKQMflgURZOFhZsl2Ynct6ljTkLkwCAHUroD5
jQGZq+tlwFV7MqDm/hploc5LEV2FrbWICVbMsTlMXW7fsKyn4Je8NhXRBBs07Omz
7BDewUOtf3XpccNhu+n2SKGEAu0vVQ==
=nSse
-----END PGP SIGNATURE-----

--Sig_/7psVxqKYd=1bKJnYCTBwJxq--

