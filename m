Return-Path: <linux-next+bounces-4523-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D1E9B47EA
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 12:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC20282236
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 11:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17073204F86;
	Tue, 29 Oct 2024 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E2ltJocP"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70615204F7E;
	Tue, 29 Oct 2024 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200123; cv=none; b=LC9W4fBmwcd2WANOOYA8CLFc0qKJzaqJPhUzBr+wCgtnAljzrCzZvS+pBX+u6uY1SJ3RLkFMevVfzJvV+YUg7UT3UtzNEUH94IHWndWocYwk76rhJPOeIuauSzfz65F6xD/XMHdRXYhr5qZ6POrSJMY/qVcif2S/C+C7tSxg4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200123; c=relaxed/simple;
	bh=iHJpLZ6ueeaD5ZZzjPgrWxvvvCIFbjhVKvYaVmU2LY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuQpmChgC3QQ/mQ6j49WJ0/xi4HIaBeBzgmZn+QYMEpKvTtJg9UykJrzwHDNHX4NpH74MdNvqEUX+lWputFcqd7LCoI0Pd2QnWWr+Al7PlrGVaMb7xs5UxL6UTB1c9wEipCzPmkWUc8oK1wMQ6K/+ikY9i1LOlml1dq2NqLFAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E2ltJocP; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uQVAhZ+wFsT9DsLSM0pt2JZ5L7D4X3gucHuXu9bLqcg=; b=E2ltJocPkAyUVhYRi4tl8xOD7r
	qXJlZpXbZPqmDaWks3qFumnRCBBdCnsCykwiloR1hBe6UHajhcmm2/aJ1hMu5WU83BodyOcvS5Ae1
	EnmE3uvkaV6E12N+OGr1HHu8GoxsXX+paWB+/ns2/4MkEoOGv5sVNMuiKCGQEHCDb0X5vL4AaoDvR
	9j4yMuhJX/isKRhl328TuTn3gxjPeGmNB36ZGhYaPKENzjvL2oc1ao+W+ki8OYR9xTS3IbiOt/0MS
	WG5MR+yWnP+9iuPzELHQDT7tMOWQdi1+OyOHxzJ1wHR/5fy7Jk2JnAmTc/peRjMhjUePus00v2y8A
	yp9c0pSg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t5k5P-00000009sjH-00aB;
	Tue, 29 Oct 2024 11:08:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 14F25300399; Tue, 29 Oct 2024 12:08:30 +0100 (CET)
Date: Tue, 29 Oct 2024 12:08:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@rothwell.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-ID: <20241029110830.GR14555@noisy.programming.kicks-ass.net>
References: <20241029133407.3580be1a@canb.auug.org.au>
 <20241028213040.e5d72b2f56971ceb5c80395b@linux-foundation.org>
 <20241029170533.5592ab42@oak>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7WqrdzUGEUr8imR8"
Content-Disposition: inline
In-Reply-To: <20241029170533.5592ab42@oak>


--7WqrdzUGEUr8imR8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 05:05:33PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
>=20
> On Mon, 28 Oct 2024 21:30:40 -0700 Andrew Morton <akpm@linux-foundation.o=
rg> wrote:
> >
> > On Tue, 29 Oct 2024 13:34:07 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> >=20
> > > The following commit is also in the mm-hotfixes tree as a different c=
ommit
> > > (but the same patch):
> > >=20
> > >   9c70b2a33cd2 ("sched/numa: Fix the potential null pointer dereferen=
ce in task_numa_work()")
> > >=20
> > > This is commit
> > >=20
> > >   82c4d6b6dace ("sched/numa: fix the potential null pointer dereferen=
ce in task_numa_work()")
> > >=20
> > > in the mm-hotfixes-unstable branch of the mm-hotfixes tree. =20
> >=20
> > Thanks, but...  What tip branch is it in?  Matters because: is that
> > branch destined for 6.12.x?
>=20
> Its in the sched/urgent branch, so probably destined for Linus fairly
> soon.  But the tip guys would know better than I.

Yeah, tip/sched/urgent, which is supposed to go to Linus on Sunday
before he cuts the next -rc or so.

--7WqrdzUGEUr8imR8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmcgwigACgkQdkfhpEvA
5Lol9w//d8Ovs/YN9LWs3pTg2eqTNb3fvfHAhOfKzUWbHpbcppYg7U2pQZSLJAhh
o9dPQtH/d60UOxec7E9AZzoh0lEiRJ/HXhkx+29f588HQHnndFB2MButNjpMy0zy
QTnr7ciELXg+JxUogiyYTcyyIh2U7SGNwbotMt++195P5QEpaN2zCCSVd8E3Hyrs
zeYi1BlADXa2IsteT1RCk0lAjdGnnKGbVbbYmsvoQV/dOaDUWZzMUlAFnsiLSPKL
QatgINoF7bDf24cTC4jP10BQA+IIBBPSguEoPeCc6Qo++pSTqUDZLUA7TO0TUJol
N6RK0bgsoYYUHcviR+3CfMvZH68/CVcfHYvmDkZ0CNLvM5dsFko5UAmwNReGIrut
GqcZbI3L71ZgjYGNd4dWBbMYv2jvJngCYm3H1+WAy7cyKUzuIRkd2yZ9ghUKPZD7
OlcjRp9+sJSzoeT6G89yNXzW8oTzONd+WPy100VItwEuqaQR9d/EG9pXkKrXAEvG
nWpk8p/DSRemQZa0scwyvCOwhfeAUnZ9Q9gwCUQqXdDMkH50FHRvjr4EhisVON85
GK+QodM//+KHNaHF3O3nKy5zQwetTtC5acYtabttaPiNlhNbE902Ouz0IpGViaqA
NCHbO8Kq9lapwAkU2Dpts25g7a4LnPhHA1tPg6AUGKudWc4IvDw=
=rYS0
-----END PGP SIGNATURE-----

--7WqrdzUGEUr8imR8--

