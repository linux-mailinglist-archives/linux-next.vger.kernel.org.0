Return-Path: <linux-next+bounces-8253-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137ADB524BA
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 01:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C04E31635E0
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 23:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E63305954;
	Wed, 10 Sep 2025 23:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R3HsBAO9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8283F303C85;
	Wed, 10 Sep 2025 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757547362; cv=none; b=GADHxHlFXObEUWM82d9vnU36KJIXEdnIkf9mS4x/93hLJSV4miEcW+hLWUxBYN1ZNEH+NveGHD96sNOEvUKUormmKut03kybNiV3n3fmejJxclhM6bcerE54Ug7qk94Hm1R6WaT+aFRYi0IXUvmWGWoyiZlHZ7br76Z8wAf6WeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757547362; c=relaxed/simple;
	bh=COCftBxOnSX0BkrEej1pO9OWUgxO7Uzxua1VEK7JlyU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KBp6Q9A3wZOF1D93U7ztrIRq/jh90EOopfx5q7OM+VVxD3M5go3Fd+iCjRMs9bHbfu1lFcN0qcqryCpbVFBH8i2lqSiPRrsWLcX2xs2Wi2drG+J+m+3eYRWJefuHlzPNzeQyY/L2iv+Oc/wlScB1CjKiKQy1d2gYo0YbElYKgik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R3HsBAO9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757547356;
	bh=lr94aX+Q7laEM9WVzRffJBmYDfOeI1H8ZifEcvqx1Yo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R3HsBAO9RgphCiPG1l729cgMc39OaG+Wf7cmkJhANsFnO94C4da0CLFskC45GX5t6
	 1bU7PvWg7yNerg0K/VL3bXYrOv3lvlD9/cjyyfn4oy3fqdzXt1K3IodOuM2UMQXhqW
	 TVoZeeJs4+rHnhG0+ZGSZ34CdnyXA2y6fidAeeBlZAuPeroFfQZO6YZLnrWIQPQCV5
	 ikwpk5WsFJxEQ/WtMJRNvJ13xy/+FW5CHkUsV34zGnbU/bhk0ks3aLlNpsV7Yki705
	 gP3J6gsOnnG1BXQiUF7DYRXvEKYRbkopaQmmoObGiAkHl0kB1y1mVOg8ZAwFE6b4aA
	 /D+rEqXCk84cA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMcWb59m7z4w2Q;
	Thu, 11 Sep 2025 09:35:55 +1000 (AEST)
Date: Thu, 11 Sep 2025 09:35:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Rakuram Eswaran <rakuram.e96@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the cxl tree
Message-ID: <20250911093554.0ce45f3b@canb.auug.org.au>
In-Reply-To: <20250822091206.7d0d57be@canb.auug.org.au>
References: <20250822091206.7d0d57be@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EWg/HNXMBihab6uycFII0Pg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EWg/HNXMBihab6uycFII0Pg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 22 Aug 2025 09:12:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Commit
>=20
>   561c4e30bff9 ("Documentation/driver-api: Fix typo error in cxl")

This is now commit a414408126d1

> is missing a Signed-off-by from its author.
>=20
> There is a SoB line in the original mail, but it is after the '---'
> separator.

--=20
Cheers,
Stephen Rothwell

--Sig_/EWg/HNXMBihab6uycFII0Pg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjCC1oACgkQAVBC80lX
0GybKAf9GfWVq9fQZcrU2u/r5uDIDmOto4xbUYp1/fvpXiHv/0V8u6xGa2H2vQQc
MExrbzu6J87oe1SeMJLR6h3cW3puRuh0l07Gtwx7LggCwvZ+knjAr6PfTHMz2L3H
PpfrCgimS1jc86f+RDUTTdTg2Ie8aD5xVZ0CEK/7j8Mt3+/MAN6VgUfU/2gRwloS
MugHrPX041bv1i/WD0VYqlm8rhEDK9hbYyGbdSoPtIfqtvSbu0IE1vSPBr45Ftq/
DQx7HMUIQHVBXBtrjeub/FdkIkTg3lqCgiRUCdezhRPGt14+XRKmhxhbiQy/D1wm
BastZ28hELzBWSMBPcDXUN3iAZIZ4g==
=yhsm
-----END PGP SIGNATURE-----

--Sig_/EWg/HNXMBihab6uycFII0Pg--

