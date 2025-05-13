Return-Path: <linux-next+bounces-6722-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67301AB4B73
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 07:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7BB3188792E
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 05:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A72E1E9B20;
	Tue, 13 May 2025 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nyelyIEC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68A51E5B97;
	Tue, 13 May 2025 05:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115335; cv=none; b=cFW75bkroYfHr8PuWMp6/KaIXZUvNUU77t28o/lNuzg6Xl8veHyrJfOdh0E74YypP2FEYy96ZtazW/ErPletRyDO3FJzCp6vKwZ4pkrfgoO38Kz0lhXG576oUwAtbgPhRJdAXuxZnH3nXt0uJ2gyv5ZvebSraGib2F8q2gA3u8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115335; c=relaxed/simple;
	bh=l4ucZs0E4EIhZWHsiHkqKkRUcVdquxvJC9D/x/9Rdn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fKJ1QZ0iQ51W2H0XRPI3CiFuFNmyysFs7HOboDe/qZ47f38XpzdLB13tkRfl6n6I++wN7eLSbe0PBNYK+/4adCe8WdmGokZZgn2ON/g1N7Tv7rSA1c9+sf4Erwn2M/tb3wz1OSgtEFRiNLYNRpC/RfmzCOOFbZ28afpBF1jW4iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nyelyIEC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747115328;
	bh=u3mi4A7GMMKWLem3lnFI9DIHX6mi8mzz/T1eZRIJzwA=;
	h=Date:From:To:Cc:Subject:From;
	b=nyelyIECcRqvm8L88Gi385GpyQvOBAZukC1TLH9uZI0QnuL6uLzXP8t9MuBKJkrA6
	 uKk2V5GpoMpeu8zkFeTwhM3JaSHTTHP+Str65SydY93wlvzHiiz0NlJE5yerl2qWVz
	 nZBJWyS+ao78sbI49Z2czRlYSUgl4hxN3/9XMCwWTFviughBQX8lJ+IAeuT0c8it1V
	 /wsuYgDM/uln+coTtzFoefZOfxu/72eZNmwtIvh/thCyAxsRDZytW9hnW8XL2dgWJi
	 Lbpzbzex5dc5cgj6kb7PTqZyzQz8hgyVs98NI3Sf+V2ucWw6ZCoO6vOzYr5yZnolQ6
	 G7iyWt4SFKFvA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxQWg5N6mz4wj2;
	Tue, 13 May 2025 15:48:47 +1000 (AEST)
Date: Tue, 13 May 2025 15:48:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20250513154845.7c03dbe2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hMKMAxaYY+LkS9MAim51r0B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hMKMAxaYY+LkS9MAim51r0B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  Documentation/admin-guide/hw-vuln/index.rst

between commit:

  1ac116ce6468 ("Documentation: x86/bugs/its: Add ITS documentation")

from Linus' tree and commit:

  4804f5ad5d63 ("x86/cpu: Add "Old Microcode" docs to hw-vuln toctree")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/admin-guide/hw-vuln/index.rst
index ce296b8430fc,cf1511145927..000000000000
--- a/Documentation/admin-guide/hw-vuln/index.rst
+++ b/Documentation/admin-guide/hw-vuln/index.rst
@@@ -23,4 -23,4 +23,5 @@@ are configurable at compile, boot or ru
     gather_data_sampling
     reg-file-data-sampling
     rsb
 +   indirect-target-selection
+    old_microcode

--Sig_/hMKMAxaYY+LkS9MAim51r0B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgi3T4ACgkQAVBC80lX
0Gx4BQf/fYJZboocg/efLOI/QDmK2iFWmVKadbMQQ3Ax0PrPmGopcyOX9yC2mMn6
Z4M1ZYYwIwGJjTuU315Qx24qG+szZBjuwPkAuQVDGNHh5TsBa/WzygqmwDt4wUcE
EXAHryq8M+SVBzWWf8O4KYV39+IFL5X1+mSCwxarKJvR7eaSsC9pdmnN5ewCrbtU
X1rZrMtK/exSZbcZtboQ4rsIXyCZlT+vQEjUox7nkenaG9AEfRr22Z7f+c+YJqe/
UpLDeiWvMGzGh78azgdViHSeG8KCkLz0ZzfTczQLDrsTDw0MjpaYbsWyKarJBDVW
l4Ss9CVYZoeVYFV6oPhqm+eaVoY+ZQ==
=7eDF
-----END PGP SIGNATURE-----

--Sig_/hMKMAxaYY+LkS9MAim51r0B--

