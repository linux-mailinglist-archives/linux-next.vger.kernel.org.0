Return-Path: <linux-next+bounces-7777-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03DB162DC
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 16:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEBF616DBBC
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 14:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E2E22539D;
	Wed, 30 Jul 2025 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HmSkARWA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007822343C7;
	Wed, 30 Jul 2025 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753885916; cv=none; b=SLVkIBXFnoeh6SNvzJ5bAbdmPc3P8mAApc0OvgZEHCISb6XFJaq+U6smBIYdkpRHFoLCPATiHolaOz2DtHKEcUu3plP2nTUxPx/pPgxfiaqQbsTUYGJ5SInqUK/A9EP6dEKG2180kldFc8ciEW3de647ACpYK3JK+HKcLOAcFWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753885916; c=relaxed/simple;
	bh=3nakqcQLdo4b6fdx7x/jSt4n6vGC5mPdKboWPGw6N1U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4YPxdcqo4YguDZ1gKdooto20uA2VYbzvt0YfhgVblxuy/ESTtuPK3OLqugw/nr9hNaMLe9JtgskjZ2/XwSOTE+JXi5FbwIA9lGNn7FHyKOEJoL3V9bAIYIWyPtoeXUt0pokgXnnEqDhLwK4wYRELFcVG1lv6dWGMi7IxqVscr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HmSkARWA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753885693;
	bh=kLrwclfc8DAyKhc5QwmGDJFM1rT+vOw8cAV0CK2t0ck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HmSkARWA8cjqdgTiRSIMn9jPI5i6vhF9cgTtNKGSS0hLHzS/kTaYdkg67BEh5Lrfl
	 /lXeHSJTNhVY3iSaWjUkit63o4xSLdxFqCxOK+0mDINTWYWyXWwemq/wUau3pGNstu
	 mT9AzjafCKXyxm6o1/AYU46mX8f2ucve2e1Tbp0IRFP5+jncEOjqEMzRHUo5os4Mqp
	 gPf4tylysTZistakmtGvCUXQYQuHFlkqa+usPVWfbV11DjgLUJ/wkfBHMxKfVq/CEv
	 zxihRUFIuTTGIo7Xcpag/JmM9iDzk1PxzT0wYJDPbG4YHLsvnzAuNbBxvU1tnC3oW3
	 dzE8fhGShIZOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsZM12TVBz4x4m;
	Thu, 31 Jul 2025 00:28:12 +1000 (AEST)
Date: Thu, 31 Jul 2025 00:31:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Vishal
 Parmar <vishistriker@gmail.com>, Brigham Campbell <me@brighamcampbell.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20250731003149.3fa05f7f@canb.auug.org.au>
In-Reply-To: <87cy9hx272.fsf@trenco.lwn.net>
References: <20250730102931.6334022c@canb.auug.org.au>
	<87cy9hx272.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vUeU2YtpEMwmihA3.3V/gBH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vUeU2YtpEMwmihA3.3V/gBH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Wed, 30 Jul 2025 07:01:21 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>=20
> > Hi all,
> >
> > After merging the jc_docs tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > Documentation/arch/powerpc/index.rst:7: WARNING: duplicated entry found=
 in toctree: arch/powerpc/htm
> >
> > Introduced by commit
> >
> >   c361f76da696 ("docs: powerpc: Add htm.rst to table of contents")
> >
> > interacting with commit
> >
> >   19122a7c28ed ("docs: powerpc: add htm.rst to toctree")
> >
> > from the powerpc tree. =20
>=20
> Did that just get added there?  I've had that fix since early June...I'd
> rather not drop it (and have to redo my 6.17 pull request) now if
> possible...

Yeah, it was added to the powerpc tree last night (or yesterday).  Just
tell Linus to take your version (I think) when he merges the 2 trees.

Or a fix patch could be sent after both are merged.
--=20
Cheers,
Stephen Rothwell

--Sig_/vUeU2YtpEMwmihA3.3V/gBH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiKLNUACgkQAVBC80lX
0GyCTQf/ce5bU85QuQzMnMJ2JXqNVsue0OnGeTYvqrDZXbGvUAlKdtcTZeTT3Enm
p6F2fzNQVSyjtEYOnHhAxZuV2hu2SRxgCf6koPqttan09BZ+7b/b+IfRMFVngwrr
/eLdqSIDxa8MuT15imMXwBFSOYDuhehrrd8QtMn5Mw4m3jI6622oM1Od7zzM/6On
ooIP78j0KxrBRK+n9xYPBx8YCWBJStefBqE3WwR9YT8L/lwXEXtTwAgR675vmBar
UH/OqHDtBZg8hbogENY9kuWG3sOwxoznoUlLBGIm5QHEC0E4CnMPQ809lFlM5dPs
XsMMfr2LMiPNscb4PJsjeWAm9mQP1g==
=uJID
-----END PGP SIGNATURE-----

--Sig_/vUeU2YtpEMwmihA3.3V/gBH--

