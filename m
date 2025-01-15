Return-Path: <linux-next+bounces-5214-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 686B8A11AF5
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 08:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F2483A144E
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 07:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3313F1DB157;
	Wed, 15 Jan 2025 07:32:46 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B99F1DB12F;
	Wed, 15 Jan 2025 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736926366; cv=none; b=oMfRrDXz9i8yKBz/S90ngrqETHWfHdVRhog0gN4q3y2p7yODpa+1TSIpgJ4N95KvTSwu1liVkyorq07qF1RvmQw798Fx3kQxZHQel9yZj4u+SglGPh0AcxvVqFYv9PVP1yBAWJ+LW/KGFGKklNN0fyX9UVAeNqPpvZ5ippCy/Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736926366; c=relaxed/simple;
	bh=4UJ4PSIFcKXcpXf0omCTBWNBTt3OVMinLQFspgB8VjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpL5OC711MfXEW/LA1cuKZ49n8Gyw7W1feypeees+5tjrr91+j9Nyqjj2gBwJg0KAelPPgoKkzeAUf1KCfHjKZttKgv/KWNOpH6F16HKitHJbxnNNIhvVp8jbTJSQLY+uayjx16AvO6h9Mc3ZjJRc+YkL04UeeOfH4qPGAvwjTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de; spf=pass smtp.mailfrom=the-dreams.de; arc=none smtp.client-ip=135.181.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=the-dreams.de
Received: from localhost (173-123-142-46.pool.kielnet.net [46.142.123.173])
	by pokefinder.org (Postfix) with ESMTPSA id 82F4FA4CC98;
	Wed, 15 Jan 2025 08:32:39 +0100 (CET)
Date: Wed, 15 Jan 2025 08:32:38 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the i2c tree
Message-ID: <Z4dklgyWcDFA33sm@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250115163146.6c48f066@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1HOa+GN/r8yznvbq"
Content-Disposition: inline
In-Reply-To: <20250115163146.6c48f066@canb.auug.org.au>


--1HOa+GN/r8yznvbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> After merging the i2c tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> include/linux/i2c.h:351: warning: Function parameter or struct member 'de=
bugfs' not described in 'i2c_client'

Thank you! I will send a fix in some minutes.


--1HOa+GN/r8yznvbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeHZJMACgkQFA3kzBSg
KbbMkhAAqVaFb6g5sp5gS7rEvCuj1X3NO3ajicpbd6KELR2xNb4UPqUvdA/5oeBf
BlD2vsvpxoOeRJq4LBqYqEuTgLh5M6ccjIvp+ZHcQGwn0f6RsXgsQekT6fhSJ9lx
4B97b9CLpRq5rlYOqxvjx+71D10fYnBt8lNj84ikoBsqh1v+xwFHFjx6jF5Cs64Q
dEbEL8DKKJ0amfKQLhFGjXWAvHBs3SKTtkFfd2rzzG90l6S1HUT8TlZEFN4IZpFc
fNq2UNuqoUvL6gAArF55nIBb67DBU7tPxxwjgRfCnW1uhClu6jqA5w2gB4BoGpPe
18IYvpGGPpmoHOSrVEd0/VgKQDbiHBGlsDI9FU7+43KsPptx6aosZYu3KlUtv04g
ZZYLWXhbKkvS9YjGYZoyY7DL3FHKbd+SvKJObRQHKgKu2u9SoTLfBHcbluIhzJJz
837ILHdtpavQqFO8XCjx0tibq4w7+GW6UeNN75h5bJvRN8fjW+CM2TB9kLDREr4j
wQ3iiaVN0Jl8PePpRrPgk12YSEZ+25o1GAt6xFb9vI8mdI3oC0OFJcRy3E9wWRTr
Vb/fN9TY8vSTrvBsG0WP9/u5te1QjDtkfX5XxH5PxjQWXqeewPNclFL/+eB8Ol6l
hASZkcliHBfQhb8+eO7KSC7lwdHL0PyufqIyRci1xOnl1Nq+LUI=
=R2aH
-----END PGP SIGNATURE-----

--1HOa+GN/r8yznvbq--

