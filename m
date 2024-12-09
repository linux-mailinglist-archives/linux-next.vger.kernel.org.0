Return-Path: <linux-next+bounces-4920-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B205A9E91CD
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 12:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C682163139
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 11:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41ED21764C;
	Mon,  9 Dec 2024 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SihzJ6yg"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E82217727;
	Mon,  9 Dec 2024 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742528; cv=none; b=o//L5D5qcZVxk5YbDKit8+vmB1oSIQy9f5MqhoM6IoSugqGy9RDEQMhBU2Mjdj8a7WTJPxzTmbF+tgCKVyhu4FepnfykGSlNnZ5isZh6o8BZJSckroLx5cqAoU4I1c2vgdT6mD/PkAlokV9kjXOWW4pksF0AfPgvm9w7022tdK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742528; c=relaxed/simple;
	bh=I3CIcJyKa6kZw0XPl/T2ouRMk5c9LOiAGIJfJNfuVkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCcDN/Z0ICcqSkXPTH7ICZ0SvW8Mb1PPUKsVrh2RNE6kHIRagahwM18cuwRuHxyycw5DQAEvM2Q/rXWeeRDtKGY0Ns3FzFbY10jiz9CqEt90c0shjXG/QSyvxuTqOGXOymPDNmlMERfFHjrQvdmV14GN69s6MZzJEFtEIaM00mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SihzJ6yg; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Dit6XQpX5hNbxuykLD6cmHXwsZMWonMwHYvTD2H/wdk=; b=SihzJ6ygM0GMqwoLq5xHPiTZRp
	lfy5sU5XNdP2S08DWZoPLbL8EAyGM427EBL7vkiUKkN+lzRhshLFLQtV8pbZGcFtb8f6PwK1GCRRI
	c+EBkkHAIPZ9i5pYmN58HBq/AO4EH+vk5eSj4PWS3gskmFVpIjlkMZGfWKo/iewcsHD/7cw1nQy/N
	LJdH+jnKVEecIkl0lt8Y3qQpOXqiUC4RZow+IBMqQSkrjfYLnu1dJsqPyuuJWpGnECLMEqtby8nQS
	Da5HcaK/KTiV6g/VJ79QuSBHvn7Dv5CPmPRkmvg6lnWt/XA/rLb2Dt5HW65PDo78+r03BvHe60ajU
	Dq7BMRrQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbd4-00000001VRQ-3cVC;
	Mon, 09 Dec 2024 11:08:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 629CA3003FF; Mon,  9 Dec 2024 12:08:42 +0100 (CET)
Date: Mon, 9 Dec 2024 12:08:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	surenb@google.com
Subject: Re: linux-next: duplicate patches in the tip tree
Message-ID: <20241209110842.GM21636@noisy.programming.kicks-ass.net>
References: <20241209132941.58021bb7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HlpXWwTCF2liH3gN"
Content-Disposition: inline
In-Reply-To: <20241209132941.58021bb7@canb.auug.org.au>


--HlpXWwTCF2liH3gN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2024 at 01:29:41PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commits are also in the mm tree as different commits
> (but the same patches):
>=20
>   96450ead1652 ("seqlock: add raw_seqcount_try_begin")
>   eb449bd96954 ("mm: convert mm_lock_seq to a proper seqcount")
>=20
> These are commits
>=20
>   46dbe8ab1205 ("seqlock: add raw_seqcount_try_begin")
>   5f0d64389e1f ("mm: convert mm_lock_seq to a proper seqcount")
>=20
> from the mm-unstable branch of the mm tree.  The latter ones are already
> causing conflicts.

Why is this in -mm ? I agreed with Suren I'd take them through
tip/perf/core to go along with Andrii's uprobe patch that relies on
them.

--HlpXWwTCF2liH3gN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmdWz7QACgkQdkfhpEvA
5LrTLRAAirA1c2DN/HKgAYoFdTZYqH0AsX+fXdCLD9D1KlLXqHHZoH+L3UwssvJu
bf2OXYt9sritouta+XCkEAAs6i/A14s6PqJXay4KzS0ZIL3P8Z1SwAdI+U0/n8Ec
Ur5LjnJLMpienKdcKHoWJdFWZkGuFTy1J65g34HzeOp5wA/5+vlrvSz14vXj9PNV
vJf+8aqePz2IcykvoAwMqUNfoFQlUECJK/hDmyxsBOLSxAkZeQ40c3JFbv3vc88T
xH5BL4/Md3sm8uARBlarZL04wUTVgoNdNkXmriCxftQUTaZ1Xxw0WiKqNhJf5Fkn
nN3lkg/O2L41ZQC5h64XNiQZNn9oNsAZvLQ2PXXtvoTXfb28LyDaAoc8kK90nIxt
FnfTEANvb3ko/irE76XtssqU/fnh391TwsiwY+bjErEuTJ/MRpY6Gj5Qj74DAOCk
SeCMmIRvfGXq76cgq4TMdKjAv/5KXdTfRRHnNJ4ArhYL20hDqiwNs1z2s3CvQbFz
JWAsdF0MmMHemS3eG8q78NxnF3NKojdDAvLsflB+igjF9oZ97GOk6QzQd6IOjMnQ
BPALjYWOhn0lEz5B6C8TcJ/nDjRm5wVKlLcATdIUP/RQjh4/3UdgLHeWjt8Xq66n
TaXbq6k4vP6rmzLSCIEPIPITCI9YVpteUFC3d8pUG0psOON2GWA=
=F9ye
-----END PGP SIGNATURE-----

--HlpXWwTCF2liH3gN--

