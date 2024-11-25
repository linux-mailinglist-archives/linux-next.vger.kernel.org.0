Return-Path: <linux-next+bounces-4839-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DFB9D7A36
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 03:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9192C162D56
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 02:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC25D364D6;
	Mon, 25 Nov 2024 02:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hPfKyTaH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0316426;
	Mon, 25 Nov 2024 02:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732503026; cv=none; b=RrmIpTQJ5g/8pter13LCjYCDBhnkjl5p0lygOv85jUj/O9ZpKGfm8x6YRwfulyFCgzxWC0uZ5RQGV+ycm3pfsSHxe7EUmHnxNSykwykO/Q28TSeCCC6ZC2Bm5fva4e7BkqKof0mraMrSjhZnWmfnc4Z440lFx7KZRfAQscsqG7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732503026; c=relaxed/simple;
	bh=Wb7udg6f6WlWIVRznyRZ5dJaS/EB1LSznmDtXmQMjXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BYqY2ORKUEdnpBEfluu8/G4CQTNes17BU5GbfHJzMfYOnY3rtmsgFTcfvm8ciGLUA46CgWF4wTClHI+pag5TkTBhcJ0ztJLtvDE0u0FPlDP6njTfWaMIP6L87h4LrCL+4PxU8ell4jgvZG1/uyI9ghzs3l/jeMNZu1ciICPXoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hPfKyTaH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732503018;
	bh=buOGDOvkQSlB1d0liMwWjmUqiraMhq41+/X9feNo1vg=;
	h=Date:From:To:Cc:Subject:From;
	b=hPfKyTaHgw0SFsOrHPoD16gPSTWWhxa3JxxgEIL6bas70z+uai1bac4mjpjXHzYzV
	 X5AnCVOizr5a51pRt1RCYS4ill0cxrBUq0kNBf3yNlk4BSujJS44OUicgS/TiS5PvG
	 OGL40yFQzgShZJQLTQ9KMpHiEvMRcSuXNKRzd/LPo3I4AqPe807W5xbQh9/v9OxPWI
	 1WyiEQ9HLYNZMOlHWD1F6h/wjg/TSGKo19wsKKGkt9iaFjOj1SDyoE9UGS8RR9G0AS
	 jLLmBW47Q7OdFzERS8riUuCs4dFjS9Lsgu7oRYV2gGz5ZvNvAGjXQ1o3NaP42cTdtY
	 BFmCpsrxyW5jA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XxVYj2qmzz4xdL;
	Mon, 25 Nov 2024 13:50:16 +1100 (AEDT)
Date: Mon, 25 Nov 2024 13:50:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Daniel Palmer <daniel@0x0f.com>, Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rtc tree with Linus' tree
Message-ID: <20241125135019.2f2653ff@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F3JPDUXrmbqvj=F/7TpOu2p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/F3JPDUXrmbqvj=F/7TpOu2p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rtc tree got a conflict in:

  arch/m68k/mvme147/config.c

between commits:

  2a9517b6f9c4 ("m68k: mvme147: Make mvme147_sched_init() __init")
  077b33b9e283 ("m68k: mvme147: Reinstate early console")

from Linus' tree and commit:

  1ec371bab200 ("m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver")

from the rtc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/m68k/mvme147/config.c
index 824c42a302c6,2e8f41636efb..000000000000
--- a/arch/m68k/mvme147/config.c
+++ b/arch/m68k/mvme147/config.c
@@@ -32,11 -33,9 +33,10 @@@
  #include <asm/mvme147hw.h>
  #include <asm/config.h>
 =20
 +#include "mvme147.h"
 =20
  static void mvme147_get_model(char *model);
 -extern void mvme147_sched_init(void);
 +static void __init mvme147_sched_init(void);
- extern int mvme147_hwclk (int, struct rtc_time *);
  extern void mvme147_reset (void);
 =20
 =20
@@@ -162,56 -179,3 +180,31 @@@ static u64 mvme147_read_clk(struct cloc
  	return ticks;
  }
 =20
- static int bcd2int (unsigned char b)
- {
- 	return ((b>>4)*10 + (b&15));
- }
-=20
- int mvme147_hwclk(int op, struct rtc_time *t)
- {
- 	if (!op) {
- 		m147_rtc->ctrl =3D RTC_READ;
- 		t->tm_year =3D bcd2int (m147_rtc->bcd_year);
- 		t->tm_mon  =3D bcd2int(m147_rtc->bcd_mth) - 1;
- 		t->tm_mday =3D bcd2int (m147_rtc->bcd_dom);
- 		t->tm_hour =3D bcd2int (m147_rtc->bcd_hr);
- 		t->tm_min  =3D bcd2int (m147_rtc->bcd_min);
- 		t->tm_sec  =3D bcd2int (m147_rtc->bcd_sec);
- 		m147_rtc->ctrl =3D 0;
- 		if (t->tm_year < 70)
- 			t->tm_year +=3D 100;
- 	} else {
- 		/* FIXME Setting the time is not yet supported */
- 		return -EOPNOTSUPP;
- 	}
- 	return 0;
- }
-=20
 +static void scc_delay(void)
 +{
 +	__asm__ __volatile__ ("nop; nop;");
 +}
 +
 +static void scc_write(char ch)
 +{
 +	do {
 +		scc_delay();
 +	} while (!(in_8(M147_SCC_A_ADDR) & BIT(2)));
 +	scc_delay();
 +	out_8(M147_SCC_A_ADDR, 8);
 +	scc_delay();
 +	out_8(M147_SCC_A_ADDR, ch);
 +}
 +
 +void mvme147_scc_write(struct console *co, const char *str, unsigned int =
count)
 +{
 +	unsigned long flags;
 +
 +	local_irq_save(flags);
 +	while (count--)	{
 +		if (*str =3D=3D '\n')
 +			scc_write('\r');
 +		scc_write(*str++);
 +	}
 +	local_irq_restore(flags);
 +}

--Sig_/F3JPDUXrmbqvj=F/7TpOu2p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdD5esACgkQAVBC80lX
0GxqOAgAobzlvUfzm6fWmwlSt7CcC+LM4ENxgrZ1d0VRE9kjcZRX7ZgvtkswgEPO
35X6Dsp7yH3zYETEO80KJR/aS309RSFtoJEuXDyZ/D0UFyQMsnR1Qc10RXfTm4UU
0jX2p9JkaVYRKoTieaeP1dZXg6ocvpEjvCCB3TM0u7N/hgDhqK6pHCFH0v1zIaZq
Lpk+f28Z8VZmBQBkkn/M7wbTmJ9lw7hjyqMd2x7L2iqOmhJeK5ESXU0lTkkBEwzx
Kx3yMI1qTxsibJSzO9oW5XaArJyW98XRlP1bMlaiu0tj8aLUW741c/37U5xoX5U9
nF8gXgAFt5Kcs4aPJ9fdjU11ygXjAg==
=UGGq
-----END PGP SIGNATURE-----

--Sig_/F3JPDUXrmbqvj=F/7TpOu2p--

