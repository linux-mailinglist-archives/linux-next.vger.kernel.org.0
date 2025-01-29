Return-Path: <linux-next+bounces-5340-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99145A215E9
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2025 02:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4DC3A7856
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2025 00:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F9B183CCA;
	Wed, 29 Jan 2025 00:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aLvC7GOy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E214F132;
	Wed, 29 Jan 2025 00:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738112397; cv=none; b=SYLIelcEiwY3CxWHYTIPe9s+mnHHtPH82lMix733ELw0lvcw2yYjoUjPb9t4n+Qfc//oBm8CddUgr+wDM1x13NwL6pb64wqaN3KlkbIGHJZHVWoxgkaOTzn9pV62VU6pqYRnX5HQNSdZ7rqCpwoU3cilwo5W9BqeReH+RJ1Q0qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738112397; c=relaxed/simple;
	bh=O9XvG5zyyzzxwO2lnd5g+4naa02Ju8CubAz8SLfeeVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IFbL/h5u59xG9+c1ODpmVg0VxB1BTOnNCcl50ip4p3pIGIIkRp7RUZeWbWNkCXYTXEcy7D40xEDRG1qG52F5opMw/U2gDt24q6ADkAvjDTfiV7CWuF4QOQpRRKVeyIw2Je2a81faZa+GC1DmkBnPTb2bKz7Bc8/ebjrAg2tJndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aLvC7GOy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738112380;
	bh=lyXJ/ET2PO+cSI/F4tCQMvLdBWeOiVJCfLJMR4UzX1A=;
	h=Date:From:To:Cc:Subject:From;
	b=aLvC7GOyFbvE9Af+tjebSNvnxEdEZm334Yn2TbJTUm7tc8u4SQQ3Ed7We4WNHHKmm
	 uqPn7MzL3xbaPMg2CY0kU8ytRk9Ut0DLNsjl/j5NjE3tiR3vOoY/UCHbBIfaQpFvA/
	 IbouoXASvoSKPS6pV0kJfu83idCNdL/q8+VOaIyBGNFVvfEQVBB7CH2fOExv9BFl+9
	 mye6GAZr1Plx8M1H1VyHM7leFggB3Bgg75Zsf8CUd1qMEVIEQrWYE27v0Co5SD6KTk
	 Iv2KK6sko0B+Rd57kznIUcRqawwaY7wxwuGi9JENj+bL7BetemfLm3sjIN4H+SDFs4
	 KAMD9Tp8xYsRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YjP235Mk2z4wby;
	Wed, 29 Jan 2025 11:59:39 +1100 (AEDT)
Date: Wed, 29 Jan 2025 11:59:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Eric Biggers
 <ebiggers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the s390 tree with Linus' tree
Message-ID: <20250129115932.7950d88d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OTCHQ._dGg12YJMQic+aItH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OTCHQ._dGg12YJMQic+aItH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/Kconfig

between commit:

  008071917dfc ("s390/crc32: expose CRC32 functions through lib")

from Linus' tree and commit:

  3bcc8a1af581 ("s390/sclp: Initialize sclp subsystem via arch_cpu_finalize=
_init()")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/Kconfig
index 6e9545d8b0c7,f49ca2b485f6..000000000000
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@@ -72,7 -78,7 +78,8 @@@ config S39
  	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM
  	select ARCH_ENABLE_MEMORY_HOTREMOVE
  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
+ 	select ARCH_HAS_CPU_FINALIZE_INIT
 +	select ARCH_HAS_CRC32
  	select ARCH_HAS_CURRENT_STACK_POINTER
  	select ARCH_HAS_DEBUG_VIRTUAL
  	select ARCH_HAS_DEBUG_VM_PGTABLE

--Sig_/OTCHQ._dGg12YJMQic+aItH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeZfXQACgkQAVBC80lX
0GyzcQf7B5XBNLek3FQkmu4F+apwdIEksPSTES0sa8tnC4WzU5dsOF7lgNjYRM91
zGYeXe4Gv8BqWyxLVt983QArQGc4VTTA6lNDdZ2Wn5127vtl7AKewcjDVcI4yEXS
rPAsUmw+KFwqPx34fItL+gBbpX2FaiDguhGm8w6oblANHkkPpvIMN12/xnEg7QSD
yJqkbRdhf1obxk2/hBmzIcExuSi0OzTowAOrifpT710JvCp8ZnzfdjCCTTbf6G7n
pK4hXTdmZCj/FUkSivJ7GjxwoJ9DooEHuP+zsUypW0I0O3Fs624VMzfabgxv77eH
MMlVMlpFylOLvXYE2V5zqnPoQ70jWA==
=HMRR
-----END PGP SIGNATURE-----

--Sig_/OTCHQ._dGg12YJMQic+aItH--

