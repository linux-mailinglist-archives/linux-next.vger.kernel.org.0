Return-Path: <linux-next+bounces-6406-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2E3A9E90B
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 09:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF0777AB4CC
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 07:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7521DE2DE;
	Mon, 28 Apr 2025 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PF0WiXgd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0824BE67;
	Mon, 28 Apr 2025 07:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824771; cv=none; b=Qcru2GqNW1fS91Q6IWwc2rjPf6jHXmQHbEcYsnvSwzAj9jGUezb7dqEOlbw8d3hBh3TpT/yafuZQTaemIDra90PGnDcRzrWoiF8WEB0+Is6QXd8L2mXwxt8VK3j+0Q3JrSqlsL/w3CJRq1LdITmz89A2lfVBvaxEZAZ3z1UZ520=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824771; c=relaxed/simple;
	bh=SK4ddA8HzYC+KUfP2k0/WCmcI111NkEGUqOsBHoq1Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cQilZcCiuyaZH02c9imMF29cLsdXho/eFfx5+3ZGXkQ369CrBE8CNXQkp2ww4qKAFx9edkf9yPYnQvDgtSNvTV/DiaUGI7SRX04/wuKwD2MbEgoAV/2+KBB3gEB/T6y/edQBbwu51cDUOLDN4yct+FI6AudnYeS8bxrGq2pIXKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PF0WiXgd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745824764;
	bh=p5S7r+9+LrTkJDSOqXTMk9hxb/ouo5NJ7kDZBb+ZTeY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PF0WiXgdfX9wZkNfUwDzNXtb0R4B0QqwqGxor9KYF6QR87o2XdiDft+bW571PaZof
	 8ok3jwqukcmSVAaBIgIQz8tQ4QlG2B/vrmA7OfmCKOlM7hklEQI2bn+WtjxtlVy9Ya
	 +AfcggWWBqVcvXyowQxR9UIhG9ZJQKMrifXxh+y4f54NPhddXVKCCRxeg7M34Q10XU
	 o3ufXmQR8yMoesGUftV4CDD9GbAxdqrjpI6r9sNTS131HQowvUc1oHA5pvkPL0jHS6
	 54xG8Riu13GG11Vq2+pLa7hZAVTl4rISEvLS5dvDTScQImV0ao2UYcyenIHyxfvKEJ
	 +skbepmE+aPjw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmFF7648tz4wcy;
	Mon, 28 Apr 2025 17:19:23 +1000 (AEST)
Date: Mon, 28 Apr 2025 17:18:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, Shrikanth Hegde
 <sshegde@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>, Namhyung Kim <namhyung@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250428171852.36d8533a@canb.auug.org.au>
In-Reply-To: <F5AD4FED-338E-4DC6-97BF-396F7EB73CA1@linux.ibm.com>
References: <20250415133518.2c8d4325@canb.auug.org.au>
	<20250417134959.37204d48@canb.auug.org.au>
	<20250422163502.02ceeb0d@canb.auug.org.au>
	<bb1f2928-617f-4943-bdd0-dfa74904ffb3@linux.ibm.com>
	<D66D1529-714C-4700-BD74-AC6AFA7C97A8@linux.ibm.com>
	<F5AD4FED-338E-4DC6-97BF-396F7EB73CA1@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SEQCxJKfbwLlfkhccXJJfVY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SEQCxJKfbwLlfkhccXJJfVY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 24 Apr 2025 22:03:05 +0530 Athira Rajeev <atrajeev@linux.ibm.com> w=
rote:
>
> > On 24 Apr 2025, at 8:07=E2=80=AFPM, Athira Rajeev <atrajeev@linux.ibm.c=
om> wrote:
> >  =20
> >> On 22 Apr 2025, at 3:26=E2=80=AFPM, Shrikanth Hegde <sshegde@linux.ibm=
.com> wrote:
> >>=20
> >> On 4/22/25 12:05, Stephen Rothwell wrote: =20
> >>  =20
> >>> On Thu, 17 Apr 2025 13:49:59 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote: =20
> >>>>=20
> >>>> On Tue, 15 Apr 2025 13:35:18 +1000 Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote: =20
> >>>>>=20
> >>>>> After merging the tip tree, today's linux-next build (native perf)
> >>>>> failed like this:
> >>>>>=20
> >>>>> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directo=
ry
> >>>>> In file included from util/amd-sample-raw.c:12:
> >>>>> tools/include/../../arch/x86/include/asm/amd/ibs.h:10:10: fatal err=
or: asm/msr-index.h: No such file or directory
> >>>>>   10 | #include <asm/msr-index.h>
> >>>>>      |          ^~~~~~~~~~~~~~~~~
> >>>>> compilation terminated.
> >>>>>=20
> >>>>> Maybe caused by commit
> >>>>>=20
> >>>>>  3846389c03a8 ("x86/platform/amd: Move the <asm/amd-ibs.h> header t=
o <asm/amd/ibs.h>")
> >>>>> or associated commits?
>
> Posted the fix in mailing here: https://lore.kernel.org/linux-perf-users/=
20250424163033.6601-1-atrajeev@linux.ibm.com/T/#u
> Please share feedback if it fixes the compilation issue.

OK, so to progress things ...

Just reverting the changes to tools/perf in commit

  3846389c03a8 ("x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/=
amd/ibs.h>")

Allows perf to build again on ppc64el (and gets rid of the warning), so
is that a reasonable thing to do - and leave the tools perf update to
the perf guys?

If so, can that partial revert be added to the tip tree, please?
--=20
Cheers,
Stephen Rothwell

--Sig_/SEQCxJKfbwLlfkhccXJJfVY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPK9wACgkQAVBC80lX
0GyBGgf8CvhUQl3Kd6I66RwI6x0BE4JTj41gBzuuE2A6hPKHypSEBIutoPTgruxK
mp/TTcZHd027eDMCnyhsooovrwOZkhWNQ6zfZ4jHH9ZfpiryMXhwlsFzi3wvxQJa
W3CQbLyPMnUGCGXdStheqoLWriK/RjzkiZurPBrg+5BapTAC5c4hHZ/EXbNKtG5C
TMKRZOGyxzeg3J9HWXsLcPEMIANMmQp1TI7lC9c5svEvBYOOZQsSLJh16WXW9sbv
gXv+YaLhsVflcdFkhxKeJhIjCXcITfNWLSozgqWCaJlEvTKRuOsuB9zxBtdxZymR
OzQ08Vdvoam2ugQg4+6oWAtwCuXw5w==
=4/IE
-----END PGP SIGNATURE-----

--Sig_/SEQCxJKfbwLlfkhccXJJfVY--

