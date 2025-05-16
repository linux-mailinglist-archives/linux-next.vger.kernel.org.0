Return-Path: <linux-next+bounces-6805-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F1AB95DD
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 08:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4656C4E74AE
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 06:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16FB224898;
	Fri, 16 May 2025 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UVV403ZC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F6F22370C;
	Fri, 16 May 2025 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747376147; cv=none; b=HYOwiA04FW/Y5jvMTdX3KGJIRvZ8X9V32IBhmidt9K/BUVdCAp3fDwsOF9ICtv51K2g7IZMTkBG8yv4a144oB2UL+0XjJBLbtlenMyiKzDC6+6+/dBIKp1PY/okUq+X/T+8jJb6zs3OKMf2cvC9NfaDzZ5Y66r3G0+TO+yAMTVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747376147; c=relaxed/simple;
	bh=o7sl/eKMHWRQLpUyjjDcnK4KRSihAngeYfy95qtlTjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WitHRWNvw/T7lg+XWkQNp8tl4GnqQtZWL3cmTn3zeXUxZAzzhu4NztvoL6AJp6VCU45qeQf6amMBYkiFpH6fz/qOThgKSEUAKdwYWoFqRnEMDfLxr0kNWsKReOnUzFZqKnzpeV9/dGoSCL6LJS7v1mn17WuN9Ia2nMhX7O99sII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UVV403ZC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747376143;
	bh=edUTfuj96/EiihfYwnhVHK6EawxU3y9iZFpYsfs+cpc=;
	h=Date:From:To:Cc:Subject:From;
	b=UVV403ZCJfVb9OL1/f4HEhbtEXini6DSFCHSpEA5hwBSs7C+2PiRRRYW7LqxzIGwK
	 KqsqryE8inLLPO2WmMqLlTt/1B+1L0M1oeuELuRS+sUgWImftdzSrwxLlZDWgZVW6H
	 wFUYCFN6kNztb3s9rU36f4RvBhLFRQ+kLo4FaGttd3kdNItxdHVbwXXcDfKEXJlp/5
	 RJIUYSnmOru9OjisqtJXnkjMbHtVFoKx4le6XTJzkYA+kq/p8PBraMAYvBE/9+ECn/
	 s1gPtn56nVrq5xXmBYagRSi3cWRrPpvkIgss5rQZIqdcfIPu82s2gn6Oia/PMhRigT
	 wLCh2ehVGZq5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzGzL0229z4wyR;
	Fri, 16 May 2025 16:15:41 +1000 (AEST)
Date: Fri, 16 May 2025 16:15:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20250516161541.0cff29b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PkQzNwqZ9vflZOL5na_rhzX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PkQzNwqZ9vflZOL5na_rhzX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/idle/intel_idle.c

between commit:

  6138f3451516 ("intel_idle: Add C1 demotion on/off sysfs knob")

from the pm tree and commit:

  968e30006807 ("x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header")

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

diff --cc drivers/idle/intel_idle.c
index 3292bf74e3c2,433d858b7be1..000000000000
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@@ -52,8 -51,7 +52,8 @@@
  #include <linux/notifier.h>
  #include <linux/cpu.h>
  #include <linux/moduleparam.h>
 +#include <linux/sysfs.h>
- #include <asm/cpuid.h>
+ #include <asm/cpuid/api.h>
  #include <asm/cpu_device_id.h>
  #include <asm/intel-family.h>
  #include <asm/mwait.h>

--Sig_/PkQzNwqZ9vflZOL5na_rhzX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgm2A0ACgkQAVBC80lX
0Gxz8wf/bRW2I7R4SlmS9Ra42fkZF67DasMT6To8uIJLDppw1GuldO0MmuFVPUKW
S594cc8YGS92/3Kazh4splJ1koG4RWde6vTIVSrB+4k6fW2E0bTbh0nQGNmbQQ2D
3K9NR7tKzPVc8pClKjCQ4WrGkGmKRHtM8NTtIIztGtJMEPZBUBix/x4ZLjJAHvpS
Wv4Q6kATvr2sZay5O1YjadPhmG/mZ2c+FgDaCvvqQjtLnNMLF5+rNuSeZR+5V2Th
RB6GQJFy6uCiKSXDFPVg2UZAx4D3JysDLv4CiWn4CAdAEkWQ1j/TBE7AxKBgnsS7
hpfgO5ZgjFiQISQzLs3rusX1sfW66Q==
=7Rwr
-----END PGP SIGNATURE-----

--Sig_/PkQzNwqZ9vflZOL5na_rhzX--

