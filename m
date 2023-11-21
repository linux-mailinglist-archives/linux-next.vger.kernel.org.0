Return-Path: <linux-next+bounces-8-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D557F396E
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 23:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEDA2B21419
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 22:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2144204B;
	Tue, 21 Nov 2023 22:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SIw+QDAG"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AF16191;
	Tue, 21 Nov 2023 14:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700606861;
	bh=NmYq8sL4TNyl8WY1NT+pGuV/gukMxS55GaraCq7CimA=;
	h=Date:From:To:Cc:Subject:From;
	b=SIw+QDAGozeYgDDRrx3E5wLtTgzBF6sY9g9N0Fy46VMxrni/d4xypOqFUSS36zwWd
	 cgi6x1SPM58p1+ImPOVxHQK2RmdZpvr4SE4Cjc3mvi3+odn6opzEHiFiimDVQwSifS
	 CcHixpL5xftIltp3siEZm1JHhT0q+FThAL7d+BJ0LWYzCIlN/GuaSvwtV0c2Bj74pb
	 E+Q0pHRNaTXrKWj5M+xa3bUzc57NJiKeIc5Vp88vcfjFZzCXjMQdvWHzQRUvcHOhUO
	 9nJM05auzcLeTwYYnHAlzQIMfls80037SmrJqL/YQWw50j/Toujgpyx6elef5UfTDP
	 A3S6DTCd9Avfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZff54ysNz4wy1;
	Wed, 22 Nov 2023 09:47:41 +1100 (AEDT)
Date: Wed, 22 Nov 2023 09:47:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kspp-gustavo tree
Message-ID: <20231122094739.38465ed3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fULB/bM7sL6gr_XWM7tBq3a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fULB/bM7sL6gr_XWM7tBq3a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp-gustavo tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/string.h:295,
                 from include/linux/bitmap.h:12,
                 from include/linux/cpumask.h:12,
                 from arch/x86/include/asm/paravirt.h:17,
                 from arch/x86/include/asm/cpuid.h:62,
                 from arch/x86/include/asm/processor.h:19,
                 from arch/x86/include/asm/cpufeature.h:5,
                 from arch/x86/include/asm/thread_info.h:53,
                 from include/linux/thread_info.h:60,
                 from arch/x86/include/asm/preempt.h:9,
                 from include/linux/preempt.h:79,
                 from include/linux/spinlock.h:56,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:7,
                 from include/linux/firmware.h:7,
                 from drivers/net/wireless/realtek/rtw89/core.h:10,
                 from drivers/net/wireless/realtek/rtw89/coex.h:8,
                 from drivers/net/wireless/realtek/rtw89/coex.c:5:
drivers/net/wireless/realtek/rtw89/coex.c: In function '_append_tdma':
include/linux/fortify-string.h:57:33: warning: writing 8 bytes into a regio=
n of size 0 [-Wstringop-overflow=3D]
   57 | #define __underlying_memcpy     __builtin_memcpy
      |                                 ^
include/linux/fortify-string.h:644:9: note: in expansion of macro '__underl=
ying_memcpy'
  644 |         __underlying_##op(p, q, __fortify_size);                   =
     \
      |         ^~~~~~~~~~~~~
include/linux/fortify-string.h:689:26: note: in expansion of macro '__forti=
fy_memcpy_chk'
  689 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,             =
     \
      |                          ^~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/realtek/rtw89/coex.c:1585:17: note: in expansion of ma=
cro 'memcpy'
 1585 |                 memcpy(&v3->tdma, &dm->tdma, sizeof(v3->tdma));
      |                 ^~~~~~
drivers/net/wireless/realtek/rtw89/core.h:2703:37: note: at offset [5714, 7=
1249] into destination object 'ver' of size 8
 2703 |         const struct rtw89_btc_ver *ver;
      |                                     ^~~
include/linux/fortify-string.h:57:33: warning: writing 8 bytes into a regio=
n of size 0 [-Wstringop-overflow=3D]
   57 | #define __underlying_memcpy     __builtin_memcpy
      |                                 ^
include/linux/fortify-string.h:644:9: note: in expansion of macro '__underl=
ying_memcpy'
  644 |         __underlying_##op(p, q, __fortify_size);                   =
     \
      |         ^~~~~~~~~~~~~
include/linux/fortify-string.h:689:26: note: in expansion of macro '__forti=
fy_memcpy_chk'
  689 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,             =
     \
      |                          ^~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/realtek/rtw89/coex.c:1579:17: note: in expansion of ma=
cro 'memcpy'
 1579 |                 memcpy(v, &dm->tdma, sizeof(*v));
      |                 ^~~~~~
drivers/net/wireless/realtek/rtw89/core.h:2703:37: note: at offset [5710, 7=
1245] into destination object 'ver' of size 8
 2703 |         const struct rtw89_btc_ver *ver;
      |                                     ^~~

Exposed by commit

  1b56c90018f0 ("Makefile: Enable -Wstringop-overflow globally")

This is with your tree on top of Linus' tree (and some fix patches but
nothing that obviously touches anything relevent) and CONFIG_WERROR
not set.

--=20
Cheers,
Stephen Rothwell

--Sig_/fULB/bM7sL6gr_XWM7tBq3a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVdM4sACgkQAVBC80lX
0GwEhggAmmje/pPzfhu99sAeO/7k4VUlavWHIqM4NS4fpyegkXjWSK6tNhDd1M10
0U55hxcxjvs/N3ettK7Pq5bu7ptc6Utlfq2sFVEAYNi2TBHMee3HrFCU7c6Vks87
ahdNFTlWA3AxqfZ692gUaVlTCie/yUoCecTnA6n9U4wQfH1tJZmc0YFuSZf5X2iT
bsT+CGN8jbafJr+20xFrTtBoIswXDrT3geXYy4Vl7y2b2lCj1+faha6H084DGoiY
NXd253hgpW1Bs7RJ+1qm4udieXceOCucqvNRAkktvqImO3f6RwBd8nLEYMC6sP1W
/CDzovN8kx+HkNdVeZuhUcCpTaqO9A==
=5qAR
-----END PGP SIGNATURE-----

--Sig_/fULB/bM7sL6gr_XWM7tBq3a--

