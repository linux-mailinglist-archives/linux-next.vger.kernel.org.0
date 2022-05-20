Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98AB252E46F
	for <lists+linux-next@lfdr.de>; Fri, 20 May 2022 07:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345576AbiETFlG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 May 2022 01:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244469AbiETFlA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 May 2022 01:41:00 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3BB6596;
        Thu, 19 May 2022 22:40:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4L4FvD4Mklz4xD3;
        Fri, 20 May 2022 15:40:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1653025257;
        bh=UONhc8eOK/71SNVc91VCVNl1YuVFpgEjRpX1+7pNizk=;
        h=Date:From:To:Cc:Subject:From;
        b=pkRBMsur2B3BhsBaN/fhKRM0jls04iK8jbzxf5ky4TlnmVl8ySkWieIodaQIuNLeK
         9Di2bppIXcMNTZenLp0MCJGYTeBbLPmGBLvzC+B36hu6jwJcjICINk9vd37gM7P3LS
         UduvBuMm+Bm7i/7ilYM2qoN+5vo8Axr17pe+B8DsD+RKuGVaGfDXP/3bw/AlxJAhBT
         98spG6oQreMQndjr2+WeyBVBFnwVUjKtXVcgQ+IctYWSfo9Fw7Y238EAWb2vO3s5Ys
         vnXejexnSNdmsl8L/6K9ZnVcZCqJo6f8J2lqZCXbJizQ+osn0Pp64dwPF2eCvSbCqi
         aTkOVArxreMiw==
Date:   Fri, 20 May 2022 15:40:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Daniel Axtens <dja@axtens.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>
Subject: linux-next: manual merge of the modules tree with the powerpc tree
Message-ID: <20220520154055.7f964b76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ml1LI=C+bnA21TFNLpzgu/Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ml1LI=C+bnA21TFNLpzgu/Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the modules tree got a conflict in:

  arch/powerpc/Kconfig

between commit:

  b91d4eea5bff ("powerpc: Book3S 64-bit outline-only KASAN support")

from the powerpc tree and commit:

  eeaec7801c42 ("powerpc: Select ARCH_WANTS_MODULES_DATA_IN_VMALLOC on book=
3s/32 and 8xx")

from the modules tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/Kconfig
index dddace39d005,0b7bcfa63d0d..000000000000
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@@ -158,7 -157,7 +158,8 @@@ config PP
  	select ARCH_WANT_IPC_PARSE_VERSION
  	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
  	select ARCH_WANT_LD_ORPHAN_WARN
+ 	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
 +	select ARCH_WANTS_NO_INSTR
  	select ARCH_WEAK_RELEASE_ACQUIRE
  	select BINFMT_ELF
  	select BUILDTIME_TABLE_SORT

--Sig_/Ml1LI=C+bnA21TFNLpzgu/Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKHKecACgkQAVBC80lX
0GwlHQf/S3qRdP5k+dcQG+Yj3WvfJImJHURFgwIL9uouwq5sUADT8/nApe2iMiH3
XW54r6Owe8pl44NMShLjbMp/joGenxif+5Um8cdBK1zodt4/ZpyGc8iEiRH0wSRt
JuuzQ4C0MiKojlfs/5WVZbShfjA/PD469e24fmrHChRCcOTHhG0ucFcacltGcdpn
qM6oolDxo1Rcgof3MiGoN9HqqKCpHPGBOmujZrCQA+jZT2E5w2QAHBUOCoG+gwxM
HAZVBzavS2HcqSwfT8BURCDM6sgmHDF8Ydrw1YvkV4kq8G8mhMnKJaMF7/gW42ID
k75uDMR3ywGjK4yrw+pFYPId2JDrIg==
=vU84
-----END PGP SIGNATURE-----

--Sig_/Ml1LI=C+bnA21TFNLpzgu/Z--
