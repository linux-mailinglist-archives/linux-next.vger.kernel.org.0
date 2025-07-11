Return-Path: <linux-next+bounces-7478-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3FEB01558
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 10:04:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD0A316D80D
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 08:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3324D1F4261;
	Fri, 11 Jul 2025 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m4aQwh2t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07EC1E9B08;
	Fri, 11 Jul 2025 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752221055; cv=none; b=ejJ8lVaqggpJSNrfQrmVHdxbE6rguR1ruDVOW3JZ8uUrLWhf0FbmhADNKXt9t52eAZJRIU8S3D8iU4A0J8uOuAfkRnwj0ftWBrKkFxIzKgHx7t/OJGp223OCWFHnisY5hxDZ/zNdaKEkTKQH1qd68zJfZdBYmzGuLmStF2cNs/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752221055; c=relaxed/simple;
	bh=W13Eh3p0fD+FZpJHwZLaDVtmpMtHAwgyRvwAkOewTlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U08SrOla/81Rskx9vIooL6sNQm37svZHyuz7jQstzE4n+qej85Bqo+p0F8hLDaEJEGOfuo1aTzqRKorG0JwQzahvMlxjQD96DzYVt9zhu+w+iSn8ifF78dPZpfm+cBiZzeKwanRzvDQK2/CCFE9POJmXfJakjfUVYR4qPm7FCrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m4aQwh2t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752220971;
	bh=lcrwFkses+84QRxvWAhaY+4VmW29ock18pG153pFf30=;
	h=Date:From:To:Cc:Subject:From;
	b=m4aQwh2tdpiAz0UrzriDG6aMM+K/ZXgyj1xulhzyrg6yXtNiP/DfpBMn8QzX2SFeT
	 h0MqBv0slvwgJv1f8wxW3GAXAE/h9L46JeIIq/wVxqG4OT4N6tGVtCbMnPgu69N067
	 v0+p8iGp0MxDIFCDzXggRIBt4ZQCiN5qK0hOrMFtYJyuDPOyPRBgGLGrb2Qf+T9yY/
	 Cy/4zQNuIr8OgqZhOIpEXIFL2eXy4tDLK/Y6QaTkWSgZ8EaGhKQJguNMhHGPpmxZE6
	 yP5dFDXrG8oDuTzt4WAXz0yg022Mc6/LLESnL4TP3pvtXRqvRr+8qtKXwbMMRJd8z8
	 VerTJQc5AJFjw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdkj71zz0z4wbb;
	Fri, 11 Jul 2025 18:02:51 +1000 (AEST)
Date: Fri, 11 Jul 2025 18:04:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250711180410.49f64e9d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5.rDgEPjW1g2Hhgb3nf=yzg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5.rDgEPjW1g2Hhgb3nf=yzg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/platform.rs

between commit:

  f0a68a912c67 ("rust: platform: use generic device drvdata accessors")

from the driver-core tree and commit:

  fcad9bbf9e1a ("rust: enable `clippy::ptr_as_ptr` lint")

from the rust tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/5.rDgEPjW1g2Hhgb3nf=yzg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwxXoACgkQAVBC80lX
0GxTKAf/a3+OetYs7LZowzIW8p8xG0+hbC1STeZBm4FnIjI0NystXuOICrUYsYxL
2b/RUNsSWbaRjmw3Ju/8/PFf4GT+rkx2mpwf5+dLeyZitCxOBH9tGDRAzmejKEGi
vsUfz/FhJ4pL5nMjH1Owd9wPCreUEPFH6uSlXHi0JcFhmsbSsq9T7ykzRbXoH/0Y
qAUQLEgGYHnNGFEtMTHu3uFwoI6do0mJrm+AcYYT8hQ96Kw76N3XW4NAEyWnSj3i
c81Kp8a5M7xUciDr39l1p/aKJ1X8pdD41TezgSn5Y7t+gBuSY3FFAncweHrHk6fa
AGfKLkeQ2gpSsC5Eas1Q7kb0WRNl2A==
=ztHh
-----END PGP SIGNATURE-----

--Sig_/5.rDgEPjW1g2Hhgb3nf=yzg--

