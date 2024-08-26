Return-Path: <linux-next+bounces-3413-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E892195E71F
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 05:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 275B41C2111E
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 03:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9C329408;
	Mon, 26 Aug 2024 03:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qXFDpWng"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC2CBA33;
	Mon, 26 Aug 2024 03:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724641307; cv=none; b=HDdj1aHwx1L7Pg2qDPNE9zEagG7IwpcemGwMtXIWfliFf7Ib56kKg8rFr6E0VUdM298OZZ19OFrMfPLGH6JjmmOLVuyQHycgi3ben8wYftDJvylQ18JJxIGojspdw2lJdzBl1oTpsVge4S+TGnUyZZiUQVGrZTs+P7jPHaMndWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724641307; c=relaxed/simple;
	bh=/y01yo/zY5N9ieRChRzki//xr0KDRIcFdTIxGe9DDBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WZnjZZILX2QiVgoE99Qbwse0rXXcLo3GyS+QO690XqGp9L5SoFDM4sdcO5rTUmuNxBeTFSaHUihPqrOaI3Fw+y188Yi/hMvwnZ3zqyUy5pzrJaLqmPXr+O+RXmAZsEf57cz3zWOebNxqsFNOuo3XuuKtsumQ+S/kYgg9acR5wcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qXFDpWng; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724641299;
	bh=z17UXpbZi7sJhYeEHKaxkNFP8QrjHO4W+c6fMCi+VP8=;
	h=Date:From:To:Cc:Subject:From;
	b=qXFDpWngOxLVvxUOAI12qYRrsCXlGlfluQFo1cUNinnLMXDoti0ipqtBslMKzfi0e
	 VBrGIYb3zYzAJ3AtgqfpA1rWOb9tkrORPC/xhfNQbsw3ZdulcYbPVK1rVQiIe5HGgo
	 MbHIdKLc/FmNY0E1GuNSsKaDP7EtUozTQ48fW12H75l5P6vJ9o4XCRPM2eRN3jmoKU
	 mubaYL9dCrkv8J8lLj5mhMNZ8EjSE6jBozb2wwFWxQNGa+NFtZsfdIIL1QIOlMTYwp
	 Ti/klROKS21er43aOfVsawLTmOSOzUfsXffM2dpFL2zf5VBL6t9bHIiKGLEgweOojX
	 /7KLmkBtVKQmA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wsb6p4451z4x1V;
	Mon, 26 Aug 2024 13:01:38 +1000 (AEST)
Date: Mon, 26 Aug 2024 13:01:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Chen Yufan <chenyufan@vivo.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20240826130137.631e5e31@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_KOtg6j8Xu3_49I33TI3Wx0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_KOtg6j8Xu3_49I33TI3Wx0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/bitops.h:7,
                 from include/linux/kernel.h:23,
                 from include/linux/cpumask.h:11,
                 from arch/x86/include/asm/paravirt.h:21,
                 from arch/x86/include/asm/cpuid.h:62,
                 from arch/x86/include/asm/processor.h:19,
                 from arch/x86/include/asm/timex.h:5,
                 from include/linux/timex.h:67,
                 from include/linux/clocksource.h:13,
                 from include/linux/timekeeper_internal.h:10,
                 from kernel/time/timekeeping.c:6:
kernel/time/timekeeping.c: In function 'timekeeping_check_update':
include/linux/typecheck.h:12:25: error: comparison of distinct pointer type=
s lacks a cast [-Werror]
   12 |         (void)(&__dummy =3D=3D &__dummy2); \
      |                         ^~
include/linux/jiffies.h:129:10: note: in expansion of macro 'typecheck'
  129 |          typecheck(unsigned long, b) && \
      |          ^~~~~~~~~
kernel/time/timekeeping.c:220:21: note: in expansion of macro 'time_after'
  220 |                 if (time_after(jiffies, tk->last_warning + WARNING_=
FREQ)) {
      |                     ^~~~~~~~~~
include/linux/typecheck.h:12:25: error: comparison of distinct pointer type=
s lacks a cast [-Werror]
   12 |         (void)(&__dummy =3D=3D &__dummy2); \
      |                         ^~
include/linux/jiffies.h:129:10: note: in expansion of macro 'typecheck'
  129 |          typecheck(unsigned long, b) && \
      |          ^~~~~~~~~
kernel/time/timekeeping.c:230:21: note: in expansion of macro 'time_after'
  230 |                 if (time_after(jiffies, tk->last_warning + WARNING_=
FREQ)) {
      |                     ^~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  42db2c2cb5ac ("timekeeping: Use time_after() in timekeeping_check_update(=
)")

I have used the tip tree from next-20240823 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/_KOtg6j8Xu3_49I33TI3Wx0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbL8BEACgkQAVBC80lX
0Gxr7wf+KobV6i7jlC4N4S18zhUHBYSCvP76BEQNWXYVOE1af8cWkrD53WE61N4X
QjWb0KA73Mmza0kZSgVbGtgZ8lkGVgT0vnb3zORXsCSeTBRppFjATiXSHQzj2Leh
gNzocSu2Yav9+sMHhRrUubgDL/MtWXBLxC4E8fzvAFgilXCpQQi6heyJESkUqvdQ
FOQKYYIwRQIhqQcsafBMkuMRrKxXWvWh928w6Yux1eSsbTJRJpx6BTPS7XeFaQ8e
WORqSKDGM6ewL/ZEwZQqm/Z//csM9xpZOaXtE3swGArSWG1ZkZX+WKFAYsnrf6eG
+urQ7cteH+7yuYd+sFlIcrCdv7dpvw==
=6kGm
-----END PGP SIGNATURE-----

--Sig_/_KOtg6j8Xu3_49I33TI3Wx0--

