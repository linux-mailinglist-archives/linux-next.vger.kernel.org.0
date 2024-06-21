Return-Path: <linux-next+bounces-2622-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 101FF91230A
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 13:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93981B2246A
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 11:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD00172799;
	Fri, 21 Jun 2024 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFTnQvTV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C2A171679
	for <linux-next@vger.kernel.org>; Fri, 21 Jun 2024 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718968192; cv=none; b=tDG9cJ9N4VICt/JdsSI9eXREoasad5gByniS9CY0lUvUUSlajxMJpRDPWcXuYu+sR2fDA6G5I3uMaxlPfGwetWtuX6N2gS7Ehm7NWKBoMDTdr8Ucd+n/6eO6kvPCLEHhPwR96kpTTXhROXqbVu0iPe937YGU+y2EOrbVjRD+fMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718968192; c=relaxed/simple;
	bh=InnuLIw6K7I13mQ0xIvo+8UFZdulZWB/0hO2TEG2X2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQ+jkqWNFQRO4qkAYpo3W5wuhULLmRBE1WmxAw3mE3Ffv1U6RwGYmrLWtPvMzbi7E/TExtowObDywW6+BE+rsy65teCygWiEeZSTeyht0o7gbTX4Re32zknKnvK6ogjSkyk6vSXKbRdSlp6Is15E3s6FBINcHF37/O8JNNmfJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFTnQvTV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736F9C2BBFC;
	Fri, 21 Jun 2024 11:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718968191;
	bh=InnuLIw6K7I13mQ0xIvo+8UFZdulZWB/0hO2TEG2X2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFTnQvTVieVaQRIIHWY0U4zLVHbz7blgGxHihmnD4UdQHGObb6J1iPD68n8o5Ih3B
	 77JIPiMlMUwh6CNsjK6A05u1UJ6JxfGJGEBlW68YsQy1Mc4ahx419IH/+UypOgReUO
	 XjOM4OPm+3AROZP1ukWIsJ1sVIvFq5hE/GK9vyH4YDQx/cKAs4C4LVb8h36r3Ka3vE
	 ES+F3P6l7MrBzhQ79W678Qs9x+9l4fctymql/S9utM9Z3HBsbxlXLxo62EsySEYdL/
	 5ZJnOGu+gXpPnBaCg4+yYrN9+UAymDePpTGBzeY68h+Cba2stN/AeE2R45c55QG8OX
	 OSwL11M9Assxw==
Date: Fri, 21 Jun 2024 12:09:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org,
	David Vernet <dvernet@meta.com>
Subject: Re: Please include the sched_ext:for-next branch in linux-next
Message-ID: <656fdcee-dc51-4286-899d-aec4b88ab3a0@sirena.org.uk>
References: <ZnH9aHFOl4wufXkQ@slm.duckdns.org>
 <20240621154515.53aff781@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GKSD/vI08VtOhcuM"
Content-Disposition: inline
In-Reply-To: <20240621154515.53aff781@canb.auug.org.au>
X-Cookie: Androphobia:


--GKSD/vI08VtOhcuM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 03:45:15PM +1000, Stephen Rothwell wrote:
> Hi Mark,
>=20
> I received the below request from Tejun.  Please add this tree (from
> the next git repo dir) using
>=20
> ../tools/add_repo sched-ext korg:tj/sched_ext.git for-next
>=20
> then add this line to etc/control (just after the workqueues line):
>=20
> Tejun Heo <tj@kernel.org>	git	sched-ext git://git.kernel.org/pub/scm/linu=
x/kernel/git/tj/sched_ext.git	for-next	no
>=20
> Note the TABs between fields ...

Should be there tday.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--GKSD/vI08VtOhcuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1X3oACgkQJNaLcl1U
h9DlwAf/WPfZnLH0SmxNsd/QYSibNixmoo2jjtBk/iGet/3QTy1QHXngRFh3JXgD
knJCDklNZvtav1SSeEohUl5cmMgDhkYLsy8A6O5JJiZloSIRT9uJLuHNdTx0D4rz
KUSmkEtf65KhIBuHcKabRKKtuWA/+Ld1Vy1c1mblqjVPdIQxDP2FAx7BWVTWCWzs
jlp8DrORhBhsHuXziTO64I0C9KKd8Fpyhzbl9EKcFW9jN92UYqlqpGweGXsBDyNI
6KStUApipSwt+YxMT1ihtA6ajIQ1X/vtTAI8XVcvAT3V96WH6wURIstsaKWqccdk
QaG2FKaUDfp8Ytjx8g3T3ylbrKzniA==
=hwP9
-----END PGP SIGNATURE-----

--GKSD/vI08VtOhcuM--

