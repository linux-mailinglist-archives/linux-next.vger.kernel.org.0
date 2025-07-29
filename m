Return-Path: <linux-next+bounces-7733-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0891EB1457C
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 02:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C301893D45
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 00:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60BF17CA17;
	Tue, 29 Jul 2025 00:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ml6H2AT/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A511017578;
	Tue, 29 Jul 2025 00:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753750624; cv=none; b=BXKEKiXfUpIVv3WVGV/bZVs1TC+hbEtbOnHSnAYfGtaSNHW4XGFumjTVa9oaMciSv+OuWtyVGIi3siMrs44rdGi2fOwaNq61ZQ79p+BtDgDEOp6C1KWNIwb7AHpUkLSALFXKRq3KduHHwYkxlYl11VzBHtvjGz3Q8EiUZVyRmTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753750624; c=relaxed/simple;
	bh=sJxnHfWid00MWirjyyDq3Z9di88XPxdkYWN6cNbvApA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aLMUrYJVbNXedMRLpTMYcV96AkPzZrqDuBvD8XbFP4omePKn3cuXY05cKsAWwYQlM7iRKjslbmYYs/Hh1fQSQgQq/6/xGmxHBvaCg+yXYdYPJwHXqqrS9GdR4yGO0czAsgSCqSJKgMmx0FmLN+nBPOEoFe7WmpDaFM6jBQVmZhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ml6H2AT/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753750411;
	bh=dnHlYLNAI+FO7+dy0eBPh4s4qLNT6XzxZ3vk2H16Vdo=;
	h=Date:From:To:Cc:Subject:From;
	b=ml6H2AT/J9tgZhW02LJKNzKeDFQI5VPxn9DYhfL0PedmXPw9HS1nymzPi75ZJDEGP
	 tSK7JPOSqscZf/p46qTVVoC3AeDdOTZR/ESrkwL+chZdOXYU0v2tKHo5IuakYul2ps
	 LOT1HG7DuzcY9l4h8LJXMwacLHNUTM5k06y3Vtg+/VXaJm3uKDz9dMFO88jbtHl9Dz
	 wm4gVkE8zrxh4ETX96cHLu3i0e/wdywFUurTFmBIJ/vDxAux4Z4pCqIes3Ikr/0rVN
	 xugy8LCckpVDHXsFXfPD36jA14UmuSqboawy1l9TcO4PYx3dENprNlAxZfWIm4Elr5
	 ClMcK9VZQhBaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brcKP2SBsz4w2S;
	Tue, 29 Jul 2025 10:53:29 +1000 (AEST)
Date: Tue, 29 Jul 2025 10:56:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Janosch Frank
 <frankja@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: linux-next: manual merge of the kvms390 tree with the tip tree
Message-ID: <20250729105655.286c0496@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gGq5Ha+JLfCAcA+77HlDgu/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gGq5Ha+JLfCAcA+77HlDgu/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  include/linux/entry-common.h

between commit:

  a70e9f647f50 ("entry: Split generic entry into generic exception and sysc=
all entry")

from the tip tree and commit:

  ee4a2e08c101 ("entry: Add arch_in_rcu_eqs()")

from the kvms390 tree.

I fixed it up (I used the former version of this file and applied the
following merge fix patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 29 Jul 2025 10:49:47 +1000
Subject: [PATCH] fix up for "entry: Add arch_in_rcu_eqs()"

interacting with "entry: Split generic entry into generic exception and
syscall entry" from the tip tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/irq-entry-common.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-com=
mon.h
index 0cd828b4a444..d643c7c87822 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -49,6 +49,22 @@ static __always_inline void arch_enter_from_user_mode(st=
ruct pt_regs *regs);
 static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs=
) {}
 #endif
=20
+/**
+ * arch_in_rcu_eqs - Architecture specific check for RCU extended quiescent
+ * states.
+ *
+ * Returns: true if the CPU is potentially in an RCU EQS, false otherwise.
+ *
+ * Architectures only need to define this if threads other than the idle t=
hread
+ * may have an interruptible EQS. This does not need to handle idle thread=
s. It
+ * is safe to over-estimate at the cost of redundant RCU management work.
+ *
+ * Invoked from irqentry_enter()
+ */
+#ifndef arch_in_rcu_eqs
+static __always_inline bool arch_in_rcu_eqs(void) { return false; }
+#endif
+
 /**
  * enter_from_user_mode - Establish state when coming from user mode
  *
--=20
2.50.1

--=20
Cheers,
Stephen Rothwell

--Sig_/gGq5Ha+JLfCAcA+77HlDgu/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIHFcACgkQAVBC80lX
0GxYMAgAo5KjWiLR3I9lVyZsZzL+hpVUNg1Fu9DsGGXv8xDWVQQkbIKyn8B5sERQ
/RPooFJEY7QLVvuBJb81ja7lgQlk6rNDMBmCpIs6MIbSvkaoLtd78jUOSYuWzFtx
qh1iitfeLrGZWK+qMOddLvJ39IvaX6kRUNsfZ952tCbosNgCAJp6X5Pda1EZgyIi
vYN8zPJVwRC6H/pwP+ELBta+FmgjenfUfZTo18kqVwuIupBVUAbYzA5HlAC7qZqH
7xj9HM4JHf6jQQQc4WGWwr8v4rVG5W6nmlYRsMoTSBAqG/qIG7q3qCS79awHtx9k
/ceWS4z4YVAPxd1EZN2YHdYpx6wMNw==
=hXE/
-----END PGP SIGNATURE-----

--Sig_/gGq5Ha+JLfCAcA+77HlDgu/--

