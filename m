Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0231DA2A51
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 00:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbfH2Wwc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 18:52:32 -0400
Received: from ozlabs.org ([203.11.71.1]:52091 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727686AbfH2Wwc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 18:52:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46KHtj1PNdz9sBp;
        Fri, 30 Aug 2019 08:52:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567119149;
        bh=SzjVO7RDps2DIIsrc1J/jnZpaYyW/yVJ02e6Oz+0270=;
        h=Date:From:To:Cc:Subject:From;
        b=VzanuXRCwXmBYakKwNiKUayCSciDd7HnFbcJ1nTkeNMVd5lohY5UIaVfCH8S6UYJo
         8fl9tPnjd9cf/PFtSPezJ+daAXA9AkWlV95pRcYtxGevBykeq5qiqDxolvWVym8nGo
         +HKME791DLAHdnj4js793gHBWJbKB5HGBSCtQQhUYuaFhy+gcdfIPOp+HPuzwZkP3F
         UWcfdtyKFE57C8FH+ZZ3Eq/XEYKZK85ZqrskDg9UhQYejx9uZYCN0egZeYw3QCYt9h
         4CLez2uklS9QWOrF2NrsewGaT9oKVXRNGRv3ZGI9PMEfHa42RxdRcRMfL8jmaxvcW7
         KN8VxRLM50Nzw==
Date:   Fri, 30 Aug 2019 08:52:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: linux-next: build failure after merge of the compiler-attributes
 tree
Message-ID: <20190830085227.01676c93@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z6gSYUZMpv79iMiZeUczXGB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z6gSYUZMpv79iMiZeUczXGB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the compiler-attributes tree, today's linux-next build
(powerpc ppc64_defconfig) failed like this:

arch/powerpc/boot/main.c:153:45: error: expected '=3D', ',', ';', 'asm' or =
'__attribute__' before '__section'
  153 | static char cmdline[BOOT_COMMAND_LINE_SIZE] __section(__builtin_cmd=
line);
      |                                             ^~~~~~~~~
arch/powerpc/boot/main.c: In function 'prep_cmdline':
arch/powerpc/boot/main.c:166:6: error: 'cmdline' undeclared (first use in t=
his function)
  166 |  if (cmdline[0] =3D=3D '\0')
      |      ^~~~~~~
arch/powerpc/boot/main.c:166:6: note: each undeclared identifier is reporte=
d only once for each function it appears in
arch/powerpc/boot/main.c: In function 'start':
arch/powerpc/boot/main.c:196:40: error: 'cmdline' undeclared (first use in =
this function)
  196 |  if ((loader_info.cmdline_len > 0) && (cmdline[0] =3D=3D '\0'))
      |                                        ^~~~~~~

Caused by commit

  e81c903fb9e2 ("powerpc: prefer __section and __printf from compiler_attri=
butes.h")

I have reverted that commit for today.

gcc v9.2.1 (in case that matters)

The above error is from the PowerPC boot wrapper that is built without
the kernel headers (mainly, I think).

--=20
Cheers,
Stephen Rothwell

--Sig_/z6gSYUZMpv79iMiZeUczXGB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1oVysACgkQAVBC80lX
0GxvZQf9Flt5KYIddNbfV+8PnQOG65pTNV5EPAjb6PzfA8i4YikjmYlEZ5dziQLu
stfSsVjKW8UE3lqoHAB41pdTH3WKLQho3w+OM60qMupeL1pFPIephCfyrCFASq/c
cA913STHw/pDLRo1OWk5oDJ0XDaULdcB0vk/Ig9kClG+/iEEdIk0F0MVx69H6tY6
MGnBmMpus3x+fcaYwGV57dmOhCP/6U8ikaAL3ZyQRN+8+6A4M1doNPvWpPmXLl1g
owDtOOZhr4059gUHYVm2Ot63dHt1Afes4jPt8DIsqo5zIQ3z38tRf6IUi/cA4cUs
bzH8x1ip5U+OTAM9XPD4n4gdYfE5uQ==
=377T
-----END PGP SIGNATURE-----

--Sig_/z6gSYUZMpv79iMiZeUczXGB--
