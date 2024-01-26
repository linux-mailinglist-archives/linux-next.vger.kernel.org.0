Return-Path: <linux-next+bounces-868-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB3C83D60A
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 10:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B29A21F27CBD
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 09:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551EA18E00;
	Fri, 26 Jan 2024 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HW8bD6w8"
X-Original-To: linux-next@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5DC13FED
	for <linux-next@vger.kernel.org>; Fri, 26 Jan 2024 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706258536; cv=none; b=MOXXFEk41vtmwP9BtD3R02/HZv7EN9BYpjhfcMJqDv5/I2prwPWEeyryMi7oQ4+hxWvTGpfxNZsn8b46n+0wBC0m5kHAEvTB30CSz2XxKo+khu9UhxsHu5CyDfpacln00XlWU5gs1xOioGMw0nmMWkV7bwri+Xj3ecxInVa6yP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706258536; c=relaxed/simple;
	bh=W9Rwv5GFaBRGDhQarsAE23ZqwNDEq9m93pCqEBo6keY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACvKh4IygPi/9zSG1fEMk1nInBIl/VEkiUbnauzujCC/zo/GGunWMMZUFofR3vpDVmfDp9HfapkrPFUTUNVKfHwJEfVk7pDKyStBF5ZzmjrwNuBNqT0axqe57m7KZEf91Kecm5MYQY+mVL5EIUkg3ir2imR2x46ceaZ/jHs29cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HW8bD6w8; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1706258533; x=1737794533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W9Rwv5GFaBRGDhQarsAE23ZqwNDEq9m93pCqEBo6keY=;
  b=HW8bD6w8gJxH9F7DATceNjmFNcu5BlFg7slv6F0ISr7nlwMEJCPFREgx
   e4OJfF7zZ4vU6TFburkzWgrbtcBsvLRYgKazgo8DqW4LKRYBE73fTlXKz
   gcDnEYS7UAaarm8Ke9pjwlsnbK2IBqmdaTQUGti8HD87+dQquZwYYsHKi
   wgXJJYGKBwpkM+H8/JN49VZp9XOXSYw++v2DFnDMGYfKLWtcqJjuxP3oq
   znfETO0p4yNiiSW7xTj3aG8MpaiQ7V4XdexcCFKL5+jukuv2kmvr3b7vt
   dcgec+6D9NnZAMiu8Wn2wABo3MTYmNWtHPIlV3JKDxX6+d+m4FNaNs0Vk
   w==;
X-CSE-ConnectionGUID: YA4LoIVXTuaNyrk6QJdxcw==
X-CSE-MsgGUID: X7HGDQEOT0aaxblqbp+C/Q==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; 
   d="asc'?scan'208";a="182579584"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jan 2024 01:42:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 01:41:32 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Jan 2024 01:41:31 -0700
Date: Fri, 26 Jan 2024 08:40:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Wolfram Sang <wsa@kernel.org>,
	linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <20240126-prevail-laboring-3335bb5bfabc@wendy>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240126115011.55da6838@canb.auug.org.au>
 <zgjyz7kdovuesyu4s6lfshrsktfozid6hho7xn5ckc4ux54bxj@lkhx4qbdpcki>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bLW6a4NZrs+OUOML"
Content-Disposition: inline
In-Reply-To: <zgjyz7kdovuesyu4s6lfshrsktfozid6hho7xn5ckc4ux54bxj@lkhx4qbdpcki>

--bLW6a4NZrs+OUOML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 07:53:58AM +0100, Andi Shyti wrote:
> Hi Stephen,
>=20
> > > could you please include in the linux-next i2c related branches
> > > from my repository:
> > >=20
> > > https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/l=
inux.git
> > >=20
> > > the following branches:
> > >=20
> > > for next:       i2c/for-next
> > > fixes:          i2c/for-current
> > >=20
> > > I have requested this branch to be the main repository for
> > > collecting i2c host patches[*].
> > >=20
> > > Thank you,
> > > Andi
> > >=20
> > > [*] https://lore.kernel.org/all/20240124225031.3152667-1-andi.shyti@k=
ernel.org/
> >=20
> > OK, I currently have an i2c tree from Wolfram who is listed as the
> > maintainer, so I need to hear from him (and do you meant to replace his
> > tree, or add another one?).=20
>=20
> Yes, I'm going to replace Wolfram's tree. We've been agreeing
> together on this change.

Passing meddler, this tree is just for host controllers and separate
=66rom the i2c subsystem tree, right?

There seems to only be one tree in Next/Trees for the whole subsystem,
rather than one for the subsystem and one for host controllers.

--bLW6a4NZrs+OUOML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbNwEgAKCRB4tDGHoIJi
0oL9AP9zl7+zz2Kjip+cCGhJkYokiPZ21AwTIwUFF3quW1aPZgEAsMiEfZecdHCq
fPIP4vqwvylX4cwDZ3/Zy+vu7hsbKgw=
=RB8o
-----END PGP SIGNATURE-----

--bLW6a4NZrs+OUOML--

