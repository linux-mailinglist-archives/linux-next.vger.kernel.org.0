Return-Path: <linux-next+bounces-6433-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A5AA0663
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 10:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AACB1A8816D
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 08:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F48829DB92;
	Tue, 29 Apr 2025 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MycuiMEn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB61D29DB69;
	Tue, 29 Apr 2025 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917063; cv=none; b=ayPy1em6XpATR/khnvhTcLmFtUh6HLdF0W9Jt9/q7PzYZjtnIcY5TJcq6nkG8KjhFUPPLQeKeUdXD0a2ALj9S6o2JZBqeEKp9ekG32mfbhUWUAJR32FY+BmI7qBF6lp3Nh7hNjaEpdik5vEnr+slaoYR3TfO3S2/jtOkwBP2vwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917063; c=relaxed/simple;
	bh=9gUiOLR4Ub5pq2kdE0tVZmECzcIQ2qnzk/kE0Q2tlYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hx6xxzB4PLYfevyv1r6bgcxlpMhURXMKR5VOV8yKeXI9D1Dpr0rpbcHDYBEHeTwh8dd+VsxkEv3bqjtwGGouxQISy7254dsStdKkotoiDNOd/TIVDsm1U6qEydHZ9Y3dzp2WTuQ0ideAvqhpbXklEvQhnbiuO6Q2a7r3B4EI4gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MycuiMEn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745917056;
	bh=ZMnqol9b7L6ELEKe7hfrlsdsRW7rIxKvx54BuTFo/Dc=;
	h=Date:From:To:Cc:Subject:From;
	b=MycuiMEnnNmmyK0uWAdp4N2vf3AdO0t0PXNQ2B/e9Re/n9yFyqFdTXr3JeJnJdmLC
	 21lTXIHyXcjr6wsjCyWxUqFKPm59N7+klUYHGFP6TjZhbCmm1Abu0cbDlXwOj010IE
	 ujqGDWtuzD6e0S9+EDi5AvPzt/CKyiFb3aSVBItIIobK+N9vAVxGJNK3NZNubsEKsj
	 ULp1RQzQCmK0K73V1Xz4E421Frkw/TvE5TZem0FhLR1kibinWFNxYGB+dXHPTxQXts
	 oEqfqIxt0gWlIKnz2lancLQWXfZYHl4yaM/V/aGhJfgybBnXX7nSfSoxdfnvj8IhjY
	 M0GmWxk4K3u9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmvN02yjLz4wcd;
	Tue, 29 Apr 2025 18:57:36 +1000 (AEST)
Date: Tue, 29 Apr 2025 18:57:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Haren Myneni <haren@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250429185735.034ba678@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//N6AO2owJxb3GsK2hxv6UU1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//N6AO2owJxb3GsK2hxv6UU1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type with=
out #include <linux/types.h>

Introduced by commit

  8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver f=
or dump retrieval")

--=20
Cheers,
Stephen Rothwell

--Sig_//N6AO2owJxb3GsK2hxv6UU1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQlH8ACgkQAVBC80lX
0Gx/0gf/Yy9h/2ZxLOZuig8KsLaudX9eCxKcCBh0VWk6h3B0AV/cxaNfihM5wtfk
+IWiW8EfWs32fmvFp7swLiUGZwYcaU6RRZcmHqhKlDsgSigGL98/yROPnNOhksWv
kfNiMSgC3vWJIATPsyCdsTUc2gQDOBybyxUIXOvALixuh54j444eiLy0WRP5ACnP
08k4QLpXzs25OerPT0yHHtclwGFL0s85jdTA/I5JO3tpgCsy5caLiPp8xls6agO3
JkU0NUswLg5Ci7fT3C+tzcIV/NU7EZo3Y2bJ9QLbrrore4D5wjjd0WSpEvuajDlJ
JwPQaxdYnI4PG9ClNNeM1C7YouMIPA==
=AcDN
-----END PGP SIGNATURE-----

--Sig_//N6AO2owJxb3GsK2hxv6UU1--

