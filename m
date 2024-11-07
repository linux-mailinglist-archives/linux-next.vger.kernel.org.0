Return-Path: <linux-next+bounces-4652-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7DD9C002B
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 09:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EDB91C20D35
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 08:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4515198A19;
	Thu,  7 Nov 2024 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R57p6vT1"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A13C2ED;
	Thu,  7 Nov 2024 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730968840; cv=none; b=sWWsT6vq8LtySHcwzdFhKqYjofRp8RJNXTFh+cdTmk1/cipWDkNSUeW5s2MFFvGFmOubsCCc0pq0Mro1N8aMivzKx4fbTg/aoFLXUhakvE/ZOM5aPFHeD1W2NfpID2R8VZ9wRJCn5aqNgFDxgHipF+t040ckawJQXfIoPOjDEGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730968840; c=relaxed/simple;
	bh=MG4Rm+Y4VCSow2W3JDacNzUN8/CTj4MBRMYqZf98WSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r95Qh2PjiuMAcRujnZJeR/7EU8z3yRw8MuNBHbk3dyqozKPBqRSJE4j7VBvkIxBjYUXSbdRuAOe8DbBu+Z2nhOX2Nvhi6kKxVr9D6RTraE3GaUAd6/4yyJDWnHyIXCImyEqDB281TXFEwIrC8VWwjxtuuvbJE7jn6NP97I0IrZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R57p6vT1; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PYWoDctJg9qDKDuY/xECsdHfkepwWbrcBdIvGKAEmao=; b=R57p6vT1NaE0dbjBpWpLKMU+n1
	HOVs97AIIqkBp3HZnTC5HQBk/mmgNkUsNH4USTpzgai5e3jtgHzhVHOlXL2BuxdVE5EIHaquJWgUI
	LZ09x7WwGCihRLrGq6j713K84CvESZK00t+CoLZOTeiC11my3V/NAyEb2nFJr0rBBdPomdhzDiuZ3
	P/kbWDcCO8YNCXToWLk0/mlLilrnaa1m3ZMljxtSYMC4y3Ru8hfm/XnhDe4oWCB+ZmoKehFZzgg9O
	VmGy35XNLOTwvnvBeCWKApnd7hH9MbVgZSYi9IBRXwWDRZn41JpTSmbyFAFhPLyD+RM9npQH9Qr9I
	SyyCeOrA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t8y49-0000000C5et-1DM8;
	Thu, 07 Nov 2024 08:40:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6DF703006AB; Thu,  7 Nov 2024 09:40:32 +0100 (CET)
Date: Thu, 7 Nov 2024 09:40:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20241107084032.GS10375@noisy.programming.kicks-ass.net>
References: <20241107182411.57e2b418@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Bw9BZU6wN0a9j70"
Content-Disposition: inline
In-Reply-To: <20241107182411.57e2b418@canb.auug.org.au>


--4Bw9BZU6wN0a9j70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 06:24:11PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from rust/helpers/helpers.c:26:
> rust/helpers/spinlock.c: In function 'rust_helper___spin_lock_init':
> rust/helpers/spinlock.c:10:30: error: implicit declaration of function 's=
pinlock_check'; did you mean 'spin_lock_bh'? [-Wimplicit-function-declarati=
on]
>    10 |         __raw_spin_lock_init(spinlock_check(lock), name, key, LD_=
WAIT_CONFIG);
>       |                              ^~~~~~~~~~~~~~
>       |                              spin_lock_bh
> rust/helpers/spinlock.c:10:30: error: passing argument 1 of '__raw_spin_l=
ock_init' makes pointer from integer without a cast [-Wint-conversion]
>    10 |         __raw_spin_lock_init(spinlock_check(lock), name, key, LD_=
WAIT_CONFIG);
>       |                              ^~~~~~~~~~~~~~~~~~~~
>       |                              |
>       |                              int
> In file included from include/linux/wait.h:9,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from include/linux/highmem.h:5,
>                  from include/linux/bvec.h:10,
>                  from include/linux/blk_types.h:10,
>                  from include/linux/blkdev.h:9,
>                  from include/linux/blk-mq.h:5,
>                  from rust/helpers/blk.c:3,
>                  from rust/helpers/helpers.c:10:
> include/linux/spinlock.h:101:52: note: expected 'raw_spinlock_t *' {aka '=
struct raw_spinlock *'} but argument is of type 'int'
>   101 |   extern void __raw_spin_lock_init(raw_spinlock_t *lock, const ch=
ar *name,
>       |                                    ~~~~~~~~~~~~~~~~^~~~
>=20

Urgh, these commits have been exposed to the build robot for weeks :-(

Oh well, let met go figure out how to build this rust crap again and see
what's what.

Thanks!

--4Bw9BZU6wN0a9j70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmcsfPsACgkQdkfhpEvA
5LrYBA//bIAb3pjk0z0e7tNzMgrPsx4MEey08BumOFae4h5Q1wbh+vi4N2gLUHef
BYhY4yZyGd4EpBFPBrqdQwTY0C6dus39xtwxmiAWR2p9BrpEMJHlig0ofyU47Hw7
48SoO9Ns35cykFCF7aPq9XBXBBwoD13Fsh2hSDvOZp+L4zceGQYjiyM4ZLE5ad5l
OJAdLOB+CNmvOxsXkFSd6bPqoNdVXZm2keOzIAQ4/zo2naO2BFz3c3GlDwvE4UFC
cXYBTmTO4PHCGfM5iL4eE4PoGmcmoMjlroupXeWlP3RobXb7wAptkmJRlE1LjeQf
4XmKZwsgVUxCxuWtu+N6RlEyIjK3GCKKtah5nOgRsQ6iV0sRXMnc1C9WEfMpzgmF
UWO9Y/8AjGNE/xtfMFvAL7QOwuCjCx6TGM3eiqEkMQE7HQPZ/KcsUiwSlnJnuZ2y
YfxPZp6H+MRTJnIQ/PRn+NVe1MdJAhk9iksA1LrC0gmFiOITY9Q8ejCePuXWCwWl
4v5HC0RkJcyahZ1H7virsr85X7a7EaarXO7MKb0s6hTZW2cxgRQ+OsoUC96I3u1K
umfE8gQdw0QlQCMKTLuro2jYj3YWVDdWHkgfZxJeYYAxk/5wFlvAErfiWB68syKh
yQQ2YBvMr6QrFBBFZckp0g9VCwp8c3VzSnJuRzP0a+Uf3KvovRI=
=ajw7
-----END PGP SIGNATURE-----

--4Bw9BZU6wN0a9j70--

