Return-Path: <linux-next+bounces-8553-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FF8BB68B4
	for <lists+linux-next@lfdr.de>; Fri, 03 Oct 2025 13:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D235D19C4625
	for <lists+linux-next@lfdr.de>; Fri,  3 Oct 2025 11:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9812ECD22;
	Fri,  3 Oct 2025 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naaJQGon"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8613D2ECD14;
	Fri,  3 Oct 2025 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759491222; cv=none; b=baGpigZoUGqXehEr+Eu3ap0WXdd6Z4wuFZUw6j4KSwLF655NoAXh9Ov7EOqE0LpwlVZb0TZpTfH2HBSXYAauJy0CXknHKx7uIUM/Pngc/f8NbO5XP1HBuSDXH6ZUVNjmmbh5ePLCeCLSY7MI+T7knqWK9t/OVfnoXc3m8Xz65WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759491222; c=relaxed/simple;
	bh=e4huhCDvJQzfjkemjQQobRMwyyw893+Vcw/28A3nyT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UiNPxN+zvpgcCxEet7UwzhzgrAE0n8gqJcyRHwVgsoIdsOCy5Y6aCZD7cdNba8Hvo8iN1KPDu5ao6lgUKxqEGpTnINfWkWyf1pURd1L3rzQ1vjGR4CfVUUVKgPA2qsp5pqvvh8wGOwFOOxsSBMg3wrdBE5+AB10DUrBAF9NWmpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naaJQGon; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194B2C4AF0F;
	Fri,  3 Oct 2025 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759491222;
	bh=e4huhCDvJQzfjkemjQQobRMwyyw893+Vcw/28A3nyT0=;
	h=Date:From:To:Cc:Subject:From;
	b=naaJQGon3GZcjVwIo1GlxHXvH19AfXS6I7ukFwfFyH1l7IMsDcuxMgQ8iixjkS+/1
	 gYWIHOYiIt/fPaFvoBC3pvqLwuG1yWm/BTp9LrUlfDcXt7VvkKunCFyMrKGiJD2931
	 KGKISfZKwjZjYc44rzKM8aUoHgJ0+WqJXxwWYryZhRt/OhEDpYpKZ1d3ZhGHkuMZLz
	 JZNCV/mURi7tLO8aJnjhAFIbcW0xsN3o4YFb73H6ZmCKrRz8w3CWMW91vN2On7s5Lz
	 NmA8SUwLCNsgI8BhXNw+Zl7xZQ/iidWmBSbrddiHZLpOybjWemRz3eG0xTZUKBm/H/
	 o7vXJE2qtBH5w==
Date: Fri, 3 Oct 2025 12:33:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: linux-next: manual merge of the char-misc tree with the mm-hotfixes
 tree
Message-ID: <aN-0kfb7trsHUoVS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4NyPxVHtTlLV108x"
Content-Disposition: inline


--4NyPxVHtTlLV108x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got conflicts in:

  rust/bindings/bindings_helper.h

between commit:

  081d032d08eac ("mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise-fix")

=66rom the mm-hotfixes tree and commit:

  eafedbc7c050c ("rust_binder: add Rust Binder driver")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

[Sorry, forgot to grab the diff - was a trivial add/add conflict]

--4NyPxVHtTlLV108x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjftJAACgkQJNaLcl1U
h9Cj3Af9FRwrAcEEGODAnjDEK0tHTumDOYN55LvRGJ7+CVlN7ZiP3Rk8aPrQGlCF
nvFEoQcRGhPppRPMulAGPGKtjE6LLltqfr1ef7hrec3uzbaDjE2vGIn9hHI4WP2i
z9/jUAn9cPv9kyrpBVyn2WlDOPVhMnRJ/J3G4FKW5vlKKPMrbuBIKVXasQHNVfmt
UY58FnQOCq/nmjHiUMvaoy/l9+RqGCUauP3nqHHgB3i8V476QQiix/N2PlFMPA06
sBRvl6MyMh5vnaQLTumTGddG5kItuvXp2zVrlrK5IunM6uPM2RKm42q4ZxiQ16xy
UhAv6qdQmMZGaP9fKXdEQxzJG/BJjg==
=7Ef1
-----END PGP SIGNATURE-----

--4NyPxVHtTlLV108x--

