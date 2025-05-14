Return-Path: <linux-next+bounces-6767-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D129AB6491
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 09:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DF567B5FEB
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 07:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842841946AA;
	Wed, 14 May 2025 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="buhjN1K7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED16DDD3;
	Wed, 14 May 2025 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208223; cv=none; b=nuSq8vBtjEF/69Q0zkFhci2kRw9yh0w4Y8QMWsOHcG5b70to7UTL6q4ters3G7youCmqwNZmXdxGmcdc8pjmaRI6bvDfLzl1S/4k8p+FF7lI4JeHY8j+iwdaqAjRm/QmbbMHmm17WyKsY3Ltj5ek95VXyCVjV9kZtKmzx7siNGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208223; c=relaxed/simple;
	bh=ue9x3OhtscKWrs8Ymm0VLxQDnqFOP/7ucYx5r21GZTk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+Mof2KOzcEFtKUOX707NhDoxpgOD9ASHpHTxrU/Kojn+ur9sSyFporc+Yi1ShLwpEBBHA9DJ75CjumjjvJ8YZfcWsskLW1jVgtmGtXt7dWPspk2pKTA2xNMw+DdIgo25HZp/LtEm9OalWZ3QGfIVlp+dp5woLwSfrPgY//g+wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=buhjN1K7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747208219;
	bh=ue9x3OhtscKWrs8Ymm0VLxQDnqFOP/7ucYx5r21GZTk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=buhjN1K7vUkaE1CVzDPSH/Fypeupmu/d3lo8Nuofa0RTsxQAUFx50EQljn28LlvYk
	 dIAj7U8J/YB3z2Bm9cM0Si52BDX9QUqj/V/rmC9ie99UDnnI42UmKk6sv5iaRqD5Rh
	 cLQCEbCB81NDDNMAUoSTrhMmxZg+0nLGg030/HXxs+hafyAsu9hAuKNFi0EvMYa0C+
	 LelRG388u3NI6Nj/6xQVFfEjb5BQ4JTjJLk73AVYxrFcRgprnUCiuYFFscNGgY4XJD
	 5N2gVEASecvox2lYlRRZdW5id3w2e6c9TIclhOgWLK6mmraErZLAXFk3iq7hV/HZeI
	 VWnoVikseyIEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zy4t33x9lz4x3d;
	Wed, 14 May 2025 17:36:59 +1000 (AEST)
Date: Wed, 14 May 2025 17:36:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iwlwifi-next tree with Linus'
 tree
Message-ID: <20250514173658.47303e24@canb.auug.org.au>
In-Reply-To: <958ec4672d9263d23b1f47d8acd1047037e7ff25.camel@sipsolutions.net>
References: <20250506114402.2f440664@canb.auug.org.au>
	<f53576b21774ab6ba8294c5d1954f0528764f2fb.camel@sipsolutions.net>
	<20250507111026.4700e392@canb.auug.org.au>
	<3d5761da40d0ddf4109d10d6f3c3d2538c4d89d4.camel@sipsolutions.net>
	<20250508132459.04bd8e70@canb.auug.org.au>
	<20250514124131.15d0117f@canb.auug.org.au>
	<20250514125524.1528467f@canb.auug.org.au>
	<958ec4672d9263d23b1f47d8acd1047037e7ff25.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f391BSf7yV5=A1G7qPB0Q=M";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f391BSf7yV5=A1G7qPB0Q=M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

On Wed, 14 May 2025 08:41:35 +0200 Johannes Berg <johannes@sipsolutions.net=
> wrote:
>
> Yes, should be really soon now, though into wireless-next. But that's
> up-to-date with net, so would resolve all of these issues. In fact that
> was the plan all along, it's just been taking a bit longer than
> expected, sorry about that.

OK, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/f391BSf7yV5=A1G7qPB0Q=M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgkSBoACgkQAVBC80lX
0GywOwf/YZp3O+5fdxAFIlCZ6TEgjjlw++s3xHnD8TnGR3SBCE4FqtVxh/c3u3dq
gLlsdyi1uBREcvUdRmAnul7saLwQYLrCt+ghXqBoBKBYddFHXfcVaef3d7AI2KJU
WCDXe+zq7CyZ59DKIMSWA2TE9zcVDKm6M0ANsBKa6vgovNFmA2lALcPER7j5/6Jn
1AvYg0cmzjcc4YQOukvUZUtA7QI46i9XyAGgtp3dTbkNFbnl9cQcIgZf4+QQ1iuP
EvKy+1uCq//xY+omIL/fv7hTSYs8YHkS6JhaBWHx2qXIrgHBB/EPg2rkeQfzUQIE
IeiLmDHwjK8lcliL+GbtmMhzLdALvw==
=I0Uh
-----END PGP SIGNATURE-----

--Sig_/f391BSf7yV5=A1G7qPB0Q=M--

