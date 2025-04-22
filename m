Return-Path: <linux-next+bounces-6314-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19323A964CD
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 11:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E53483AEE85
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 09:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB411F1313;
	Tue, 22 Apr 2025 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DBuOcqoA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111431F4C8B;
	Tue, 22 Apr 2025 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315108; cv=none; b=kXzRqFVV7oqgx8wX2aCzlgD2aOYlWS1qt4c46zYG18HZyjKIOtoDtpBFBzm7MhbS5ToyMLsMFn8T7JrgiVqzcm+rwBnyR2yaP0kg7U3gHfDYIkcFlfNVCr4x6f5+aFtffSphgBBZ/g7oocdWJPTjPHS1Lnx0y1Fc78gU9ghrauE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315108; c=relaxed/simple;
	bh=hH0dreYNum7mKNpFtt6wjx9Vm8e8L0GFW+jPB+vVQto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZJYzEB7++AHgLW977AKOjofO5ijWpe7w7UmDPq9+1GsPjeLh1oe70iw3Xy9akBy7StkFr57pKHUds5bfxkS36vOcBO9i4f2YsHcOwKxCWFhc4oM1Kap1HKZQIidq+0JYkcVTaAwQwqhalzeErVIBq4RKciSq6/eYuMAcnCGG6dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DBuOcqoA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745315101;
	bh=Deqanv33ljMC6VXBWZg7FJFey5jcrqITvw4fQTXM7Rk=;
	h=Date:From:To:Cc:Subject:From;
	b=DBuOcqoAhh9/b15AH9O9zf/coPp3CedAQL/+7qP44AAJMEizlOG/PV/yi+9TmR66v
	 f8qMFK1ApbAmL3DiOqN71BZk2kTHFOWlSndSUAZZdHviECOK19pzQlQfKO3zeKxmN5
	 Y+dC+QhaTJInW8Hzw1s/k2Ov2I7MVoyI62Aosoj1SqDdxZ72Ot3us94OcXEuR6ljpW
	 FncauT3l14TkhQ8/pDkfC9jhZnRj/F0GPZQdOTXBoAmbjSOvPoz1dd2lX02T70TvS6
	 vZBWlDDTOT58GO9YyJm7fg64aYKBMH6xbhiCJb/PmHmxgxc1xXCL0K2SSU274BPilT
	 GTVZi5rSQexug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhclw3nXNz4wcr;
	Tue, 22 Apr 2025 19:45:00 +1000 (AEST)
Date: Tue, 22 Apr 2025 19:44:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kspp tree
Message-ID: <20250422194458.074ed355@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tLWYzblcTwYeVc+oS5sIuw6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tLWYzblcTwYeVc+oS5sIuw6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc tree as a different commit
(but the same patch):

  e166ec7e7164 ("misc: bcm-vk: avoid -Wflex-array-member-not-at-end warning=
")

This is commit

  e1ee28b12675 ("misc: bcm-vk: avoid -Wflex-array-member-not-at-end warning=
")

in the char-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tLWYzblcTwYeVc+oS5sIuw6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHZRoACgkQAVBC80lX
0GyiSQf/TimI1Wx2g5ZwOQHSXhbWU2UQM9qXaKXWLguMxZAW8bNhSxkwbFSZPyju
MLA8c0v2Vi9FwJ8QWYFjIq3MwBFQAahlG+RtYW7i7Z62nYX02t8KoRwJhUUKii3t
g83o+tLfp7qCabAHoeeuhraMHQjh1DvdYdS1UevJv6mchqg+82ZjxIdZja2O/OdB
hq0jECa1fKtc+qJj3M+Z1325HC+OZimV9dvSLO1jWVzwOh2vjLzRCQmVcGJja73T
ZJwvdyvucCB3+VJN4V8wbLRzIjJcDhNhOHj045+VyeJQ7EoHswEFI+bMwdq4aBOg
A1pxt+6xtWlK9gS+w8H9pbQ3mB1CdA==
=VkOE
-----END PGP SIGNATURE-----

--Sig_/tLWYzblcTwYeVc+oS5sIuw6--

