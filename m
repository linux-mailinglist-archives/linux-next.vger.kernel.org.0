Return-Path: <linux-next+bounces-7549-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BFEB054BA
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A8A3AE9D0
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 08:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EAE275AE9;
	Tue, 15 Jul 2025 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GePK3R0h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7611F274648;
	Tue, 15 Jul 2025 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567720; cv=none; b=RD0Hq/ED+KagPgyD+e41lWioL53JKV9jqjTXb9PdIx2l+lrWeFjsCYh1AxxDFkqbNiptCVSykeH61p+72/jvs5Ns+0xEO3vXgAtlrGtHRr6cpnvCVdWdFpkDJllrhNXkkS4l0V1orN5SMsy7iHUxeXFDR/a2It4cVnGnhAfitpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567720; c=relaxed/simple;
	bh=2qsD3tg7tnZHjedcUni9ZU8HZEvog6ja6aNLcM2kL3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=otuBMeKqQJIY8LHC2aWo7cF7+JkwLlR+BNxXBtKqYPPadxu0MaAEB7s8HSysrgH8Ir3LhRLW+TNoEtBOTFmuumUTFhzl8n7gMLgCFxcEEPW9jfltKhx7+jGi7/sa3GVfwbyILc80UmiHTlP4btg7l7Vl5iWNaPdePFiclF2WHAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GePK3R0h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752567607;
	bh=VFd+HrP/xe5bH5c/XeWxcSwjs+fKsNF7dYytOAWt4jw=;
	h=Date:From:To:Cc:Subject:From;
	b=GePK3R0hxPqkZSe519Q7i67IrR5bwGVu/yD2vOQwYsQIfZjskq41X6Ie+PGhMzvtO
	 WFMfr455VmqGvGJaguGefZPdbvo5qZhS9PSvayb00bPEFXlbI3nxzL89fxMJSU0Zo+
	 DfLESmH6NCPOkqk91eAK1CkPR4w9hVapE+I2RxU2YsWpiEqlSHW5uDJcgDxGXA2uxs
	 Z5v03ILGqlk+k63nY1j+HuglizvC//msKZUnewDzf5XvFAa3vcaAnF8eMVY7eqfW0i
	 BE0x4GtMWyqr2nMYFEN8XRcWf6wIqiTFAwaP/KvCajGl2SLkYcOdpizRDtrmR9xtHd
	 /vwGH4SdVtlxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhBvB6yTYz4x1t;
	Tue, 15 Jul 2025 18:20:06 +1000 (AEST)
Date: Tue, 15 Jul 2025 18:21:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250715182154.2cca2f58@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rxB8dB8eAjQS17CzIesGYwH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rxB8dB8eAjQS17CzIesGYwH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/pci.rs

between commit:

  4231712c8e98 ("rust: pci: use generic device drvdata accessors")

from the driver-core tree and commits:

  fcad9bbf9e1a ("rust: enable `clippy::ptr_as_ptr` lint")
  12717ebeffcf ("rust: types: add FOREIGN_ALIGN to ForeignOwnable")

from the rust tree.

I fixed it up (I just used the former version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/rxB8dB8eAjQS17CzIesGYwH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh2D6IACgkQAVBC80lX
0GzHcQf/RLEOYHt7jfpWFSdWqayIHbc8zNe0zGFtB8CN4O9Xn82/vWQKk0ycbYLx
xuLZ312BQrnMxi+RqNSLGa1wXENQFJqEVU0lO7dAeWkHPdLdjONHS488nUZSXyCF
Q9ocM8NgjyH294nWFuiPFdAELJn4Wc/D/MEseJbHsBVdULo5FEbKfUnvuVg9K0Hr
XEhCH9summE3gKTKc0Zgij0v5beFTqS4XVl8ICcQ3JozNSUpez07jY1/miTivywJ
s0vRBpp2NRbtwdsoy1AEfdkTU698f9uwzJeEa3QD0TWqSK01bhE1D/AQ5ULGRVUf
XX5Ps59JGroROWX71voBORxHqx8gfg==
=rhTS
-----END PGP SIGNATURE-----

--Sig_/rxB8dB8eAjQS17CzIesGYwH--

