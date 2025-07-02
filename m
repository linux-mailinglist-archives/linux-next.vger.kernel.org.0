Return-Path: <linux-next+bounces-7300-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B979AAF0843
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 04:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 380A31C046C4
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 02:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D98151991;
	Wed,  2 Jul 2025 02:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YfTowk+D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2CA28691
	for <linux-next@vger.kernel.org>; Wed,  2 Jul 2025 02:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751421967; cv=none; b=rRgyjFcpxq99T+ijrol3EOpmRFqAECSXPKEHIn2E3icn/stgWAjxitlXddIkjLTbyph8vbeAAeAIq8ivUP4zKYFXdg0dz7gMIEGnE863hI9QV3S05UzbAyEWzq1lA4h9tVxZD9ymMDuvEcQ27Un4lbIjlvZweC/W2menLYuExmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751421967; c=relaxed/simple;
	bh=osEO7WxU20AF1JgjqA/tqxkauLRQ0UPpE7bib6KZj4g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BAbHJsyc5/3tm1GssF8WzghAKEOfmLnb+6e1/x58OQ9DIMABEygLpIweYTJRfX1ENAls4Yco48Q4pEK5IE0M7aUeBTehB69hWRpqLR0HRjEjhBYTljRJ1j7BADyztvjZBOV4VSw+ufJ/WyqyhFVhI3M04x46822rCXs6JUGo/4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YfTowk+D; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751421947;
	bh=+o9xo3ux0g9p/58C8pQqVfWYisjOvGF7KUvBPEyDqm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YfTowk+DvnG5yPaTyjRTIUi75q2iuBhxAUtH0egkYGmQ/LyHVD2NL4fZ1TPplSZup
	 HT7HmowUyutxgpuJmKN1MAZZoY6mEgqJe/wN6XeiII6pmssSFUEq5zNP9gX3tupHOu
	 Nva/S4nUjQ+PhkzbjUBwCV3gIQ0cqJ7z1iK0SeqJSSc5sELJDLCGD46lHHjNpJwQ9j
	 vBA7w1M5S5CaQx8OtJika7HToUdMF5wYZdLofeU9iWc/bGzgLElnaly9NDrnNIPl7K
	 +Fmcb0dOJbQslxWRMhN11Kw+vSjOcEiS37hzUacKliCXe1I4KlEzziJgUcUgr0lvoC
	 VWUlx+r0Pr5DA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX3CH5Y1Bz4wyV;
	Wed,  2 Jul 2025 12:05:47 +1000 (AEST)
Date: Wed, 2 Jul 2025 12:06:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: Add bmc/linux for-next to linux-next
Message-ID: <20250702120600.33f3d49d@canb.auug.org.au>
In-Reply-To: <8b035557ad025d31ab347349ebf9b91ff668498a.camel@codeconstruct.com.au>
References: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
	<20250702114941.5bfe1e5a@canb.auug.org.au>
	<8b035557ad025d31ab347349ebf9b91ff668498a.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v2D4X2v2d3y9CSJdoymqTvQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/v2D4X2v2d3y9CSJdoymqTvQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 02 Jul 2025 11:28:06 +0930 Andrew Jeffery <andrew@codeconstruct.com=
.au> wrote:
>
> On Wed, 2025-07-02 at 11:49 +1000, Stephen Rothwell wrote:
> >=20
> > On Wed, 02 Jul 2025 11:01:54 +0930 Andrew Jeffery <andrew@codeconstruct=
.com.au> wrote: =20
> > >=20
> > > Could you add the following to linux-next?
> > >=20
> > > =C2=A0=C2=A0 Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bm=
c/linux.git
> > > =C2=A0=C2=A0 Branch: for-next
> > >=20
> > > This aligns with the recent patch to MAINTAINERS for the ASPEED tree:
> > >=20
> > > https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0a=
b@codeconstruct.com.au/ =20
> >=20
> > So, does this replace the aspeed tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git branch
> > for-next)?=C2=A0 Or sit along side it? =20
>=20
> It can replace joel/bmc.git, however, it should be fine to sit along-
> side until Joel confirms removal of his tree with you. I've been doing
> the BMC SoC patch wrangling recently, and he hasn't been updating his
> tree with the branches I put together until I poke him about it. In
> this case I'll just hassling him to update his tree, which should
> remove any opportunity for conflicts or the like.
>=20
> > Either way, who should be the contact(s) for this tree?
>=20
> Both myself and Joel.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/v2D4X2v2d3y9CSJdoymqTvQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhklAgACgkQAVBC80lX
0GzIXggAh4jofNHSLz7BOgy43fcczmnnsLSdxlrK6LJLuJV/CzVT6zzstte7DFIN
ajfzeg2+5fQOJcY7STGmZCCUl3ylvCwlDtMAJgSpuMKoLsN50VhGmpCPqSXjPeLH
A4twqQ5MagEgSSLzMjfj+nZBDL4x1Xg68F5r35hUORxgJWXBoBdp6q+1+Thotes0
LmenhRYqwNlQR6N0V2LAbj26JJUWcQGYzglY1H6xKFNr8vaf8s5blOsfYjTCEz+5
iqSGc9EUl1k31+Nw0vVbid3A7Rux0Yxwsz1ISFmCgDy2I3+wUCt3sjI1OmvowNVk
DlRZLBTcCBXA9BryPdwHjkKEA3O0LA==
=VPNz
-----END PGP SIGNATURE-----

--Sig_/v2D4X2v2d3y9CSJdoymqTvQ--

