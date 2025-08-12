Return-Path: <linux-next+bounces-7919-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B377DB23B40
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 23:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C05E2189097D
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 21:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AB32D73B9;
	Tue, 12 Aug 2025 21:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mlf2Nm/t"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B051C5D46;
	Tue, 12 Aug 2025 21:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035505; cv=none; b=Ktauveb2ZviFl6EZmEycDexDyXy46S0TQXBGeQS7DsDnRPJTne/4lYQc5BpJfVaqlPDhLWPKxEDMfJVCGla1IyS30dMp5xsvRvROanzpNd9vN/nkEhOBCzf54+ROLD50skpQyXvz2gHOtm/5ZM5Q2a2WSkBrVa4wtIOiQOsQUhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035505; c=relaxed/simple;
	bh=Z4ijmhSJ5feAb5Ma0SBHCLw/eXb/BjN8yXCucChNEy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7qwUpdU/XY8x34U4mh6XJNHmVbtC0P5PU58b2lrFq7eb8OQZMSexRxxwuK8KeCM45u0nFRBidnbjKE77RzWnp1PIb3s9kycvo57SM48gMhe3q+cuFzFFAFXcjjXKdGCNZRwYtBRo3vbrF6c4Ad0g9EDIreL/C9U4yFWOBooIRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mlf2Nm/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1990C4CEF0;
	Tue, 12 Aug 2025 21:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755035504;
	bh=Z4ijmhSJ5feAb5Ma0SBHCLw/eXb/BjN8yXCucChNEy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mlf2Nm/t2H9sUUM3klO4UsrAhlNCpq9FM20FEBzSh3qetyeBGP60a4/8TDG8PU35i
	 IObGKAQct2IPoqdyr6xV75wmQwGONRb5XVif5jTg5jel1/3KkbzCut6kAckqR/Cwe5
	 2LXqhPVplz2BtpV2F6AMy91zFGhdftcubGRko34CkdpHelQiN8PqldF4Jdfr9uwwQ+
	 Ut31UMjCWxIpl+UAikgLnpk08/7rKMC3qcjGmgPjVE47uyfi1g5+a8xe+3lvj+4VhZ
	 gE+Y42SzZB+sNX9NOaotVVvPXdlNPoSC9IG9UFYOVrE6Bfm2R0jIQjxWkdto0MRMXY
	 3fhUS0v+o7ZHw==
Date: Tue, 12 Aug 2025 23:51:40 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <aJu3bEAge1uOO8wO@example.org>
References: <20250730161223.63783458@canb.auug.org.au>
 <20250804112540.6b8ed4b9@canb.auug.org.au>
 <aJBcn9jb2RseRwS3@example.org>
 <20250805081749.3be45c9a@canb.auug.org.au>
 <20250805133349.4339e693@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6TZ3juglqoHlKtJY"
Content-Disposition: inline
In-Reply-To: <20250805133349.4339e693@canb.auug.org.au>


--6TZ3juglqoHlKtJY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2025 at 01:33:49PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Tue, 5 Aug 2025 08:17:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > On Mon, 4 Aug 2025 09:09:19 +0200 Alexey Gladkov <legion@kernel.org> wr=
ote:
> > >
> > > On Mon, Aug 04, 2025 at 11:25:40AM +1000, Stephen Rothwell wrote: =20
> > > > Hi all,
> > > >=20
> > > > On Wed, 30 Jul 2025 16:12:23 +1000 Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:   =20
> > > > >
> > > > > After merging the kbuild tree, today's linux-next build (i386 def=
config)
> > > > > failed like this:
> > > > >=20
> > > > > ld: .vmlinux.export.o: in function `__ksymtab___builtin_memcmp':
> > > > > .vmlinux.export.c:(___ksymtab+__builtin_memcmp+0x0): undefined re=
ference to `__builtin_memcmp'
> > > > >=20
> > > > > Caused by commit
> > > > >=20
> > > > >   c4b487ddc51f ("modpost: Create modalias for builtin modules")
> > > > >=20
> > > > > I have reverted that commit, along with its parent and child, for
> > > > > today.  It's parent commit
> > > > >=20
> > > > >   66ef3890c628 ("modpost: Add modname to mod_device_table alias")
> > > > >=20
> > > > > generated this warning in the i386 defconfig build:
> > > > >=20
> > > > > scripts/mod/file2alias.c: In function =E2=80=98handle_moddevtable=
=E2=80=99:
> > > > > scripts/mod/file2alias.c:1480:25: warning: variable =E2=80=98modn=
amelen=E2=80=99 set but not used [-Wunused-but-set-variable]
> > > > >  1480 |         size_t typelen, modnamelen;
> > > > >       |                         ^~~~~~~~~~   =20
> > > >=20
> > > > I am still reverting those commits.   =20
> > >=20
> > > I do not have my tree. Can you apply my fix for original commit inste=
ad of
> > > revert ?
> > >=20
> > > https://lore.kernel.org/all/20250730090025.2402129-1-legion@kernel.or=
g/ =20
> >=20
> > I did wonder why this patch has not been applied to the kbuild tree?
> >=20
> > I will apply that today to the linux-next merge, but it is presumably
> > delaying the kbuild tree being merged by Linus ...
>=20
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build test

I noticed that this patchset is not in the tree. I somehow missed when and
why it was excluded. I thought I had submitted a fix and it had been
accepted.

Do I need to resend it to the mailing list?

--=20
Rgrds, legion


--6TZ3juglqoHlKtJY
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEfyo9BymBSaB5PJpOpFq6VEz/1DQFAmibt2wACgkQpFq6VEz/
1DRTqw//X0iMZSWoiIsrS3Xj90NCf4863Odaxmnv5UWPvYhiD4rCwlY0LXpuKPlJ
k2Bvk1P5aLUWJn1xIFAUbC2RmfqT7/TijUEd3rAIW0VNz/uyH1U26RoBVxyyS96H
z1k127D9pAWQzM2VrqOWzHwadx8j+uDpUUUCpHf4qaqpnUhgM9yW4G/y5xKQv8D+
pzEhHi99Axi3yIpR8D67AKGCdP2YxtYLZeoxKoyBLI+mzmnQROqi9GTGeIC4BX+A
QaPZwrG9nVkA9LhiFN56llQFwDqP3bUKsILP9s7OulWE5drTgug5c+z33ZwNL/q+
1gH94GpJUCosNPBwsAEgxJwZ7GMGnKknSDMsb3kqvKFnkEcL8EvWFInqEJsrVpVB
ZBVZw9bFqzUJnPn4AbGGrL1NZbNkOwaUyP+ziD5W2ZaT+mHJ6LlvrxgdfEfJBY+u
q5Si3sg+DrU81N5lEaZoibw2fWrN5j6tKcbRwfwOx4r5TN7PnQJbgnSy5D+tfvz8
1lA7ppqBDhoSUsAPgevS+bGfYlqsoqs+8W+9F7FGPquaWghy7P8XNg4VW1juMrh2
Qhihj6lP/M7GxvyoIREJiDe1R4UJZlAlTDHAxZEEUDPNvb94LwPgW8tfuAv6hxnj
PaMbKxnfJwVPl4lPl0hnxt0SP1HLtxhIhkZ7EywKN4quFX4aHzA=
=97eJ
-----END PGP SIGNATURE-----

--6TZ3juglqoHlKtJY--

