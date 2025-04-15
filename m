Return-Path: <linux-next+bounces-6254-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B230FA89E17
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 14:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A5FC19017D2
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 12:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35A5207641;
	Tue, 15 Apr 2025 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fN1PhwVV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B65120469E
	for <linux-next@vger.kernel.org>; Tue, 15 Apr 2025 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720163; cv=none; b=mlVtKOTJ/tDse/z3iNqSOQpTcTJQBpUBfYSbfHXVT3gCOXF09ZO7Vx+2FNpYqNERByMQtA4YH4lViIA/5cq7WSkl7bse755DwFxf0WpvoXQiHP1oeHygnvqqtpEXKhu4SjnbiWqgxAaF/DZRrmJNUxCwTIsUh7mhrXbjypzCUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720163; c=relaxed/simple;
	bh=fhmmobFYP952d2wcHYryatx4JXoZzUKCO0H9NsvWRHY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFjQTkQUlon57wdntyOCMWrI5xi9Zu4P7mJHvKZHJPzhh7Ve8aX09jmvENJ1OxCpHuS+EB0bCpWs2WYaZ7gceGaWhX40418moYAdUeraGgigGstxM0bpptKt8LqMc0GD9CYoXTo8yrXzaHbEvIpMSx0fAAoMcBxJxKNnNYAILHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fN1PhwVV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744720157;
	bh=fyVrjmc/muUEd4uIAjl6Ksg+oImYsoqTyL2p5hpcRG0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fN1PhwVVfbxImWOusXAOfrRNYrhU5v7XPpXpInwgRB8uEuOdfAsT4xWZ2Kv8M+hud
	 9x7nVYOls1hr5hqjInVDFwR3XQB974WyDdbJVAe3Fwvl0/xUPRhAXzCmzywU1rragI
	 mQe/+pHcOnWiykB5gbWQUH26UJKdmks9gCqxYLFShRhi60Pk2KimKLJPfKvbBXkbvP
	 vBgZ+sCVtQNamfO9CFKIXdh/e63qEFJys1G7Dh77vMtXzVsv7x22bThSzio8XYUZhi
	 tlO63X90v4cHyE+rHXtpX90e8kY0hZqiKt+8zR1F9EDP+9hNayhoY4Nlw803HaqzIm
	 wiTTlEoS28M4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZcNkj1RxYz4wbp;
	Tue, 15 Apr 2025 22:29:17 +1000 (AEST)
Date: Tue, 15 Apr 2025 22:29:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>, linux-next@vger.kernel.org
Subject: Re: The driver-core.git tree has moved.
Message-ID: <20250415222915.486449fa@canb.auug.org.au>
In-Reply-To: <2025041512-darling-erupt-4545@gregkh>
References: <2025041512-darling-erupt-4545@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cTOQ_GBbmKc0lCbpTkQLsWW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cTOQ_GBbmKc0lCbpTkQLsWW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, 15 Apr 2025 14:00:17 +0200 Greg Kroah-Hartman <gregkh@linuxfoundati=
on.org> wrote:
>
> The driver-core.git tree has moved from:
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
> to
> 	git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
>=20
> So can you adjust this in the linux-next and 0-day bot scripts so that
> you can pull in the updated stuff?

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/cTOQ_GBbmKc0lCbpTkQLsWW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf+URsACgkQAVBC80lX
0Gx96Qf/dIfdI4NlMqe3cdM1z2dPgDygcEjZdbLTFjSTEX766nRS2OCRmNq0WoK0
uFvxcihMjXdajd35C0tAjW1IG0dhIDfisGFEbT/cu02bse5mtz4Ak/RZpQexwI95
iWeGiqdame++PXYLuJtBfDSGR0F9w6e+XiXH/GJ+4n5KkaQQE7K+lWjuGsnNTYoA
asv6VfMQuuh6Tk4u23vEsd4FpNHAKKPpCeVdboyWR+Ln+Dix88+cWdR9xQsARCa9
o9q+vhXYSprIgVL8jKIrDeytjRB4jYKAVgRJNY3EYAYg0mDVncMb9OtTfGc+0J9W
Aq9LAGvHS4h/N/UCVCs/guajfx2J2A==
=FrRP
-----END PGP SIGNATURE-----

--Sig_/cTOQ_GBbmKc0lCbpTkQLsWW--

