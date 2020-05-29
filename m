Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455931E712A
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 02:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438070AbgE2AKy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 20:10:54 -0400
Received: from ozlabs.org ([203.11.71.1]:38345 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438066AbgE2AKu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 20:10:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Y4j44cMKz9sRK;
        Fri, 29 May 2020 10:10:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590711048;
        bh=LZgOsp0XUU33oZTraKo3sk7ax+cxuzbN2+v9ZC82AwQ=;
        h=Date:From:To:Cc:Subject:From;
        b=MCYoBSY/eiNPf2Vsou8D8OBDzYC7iGeeyqsK9Ds4y/Cs5J9rL5qvG5t+BB2wCR+J7
         6BEQuUTDQ7L1eG7FCnvSwaNi+M5kwzbGtDgT3tFsqdAwIjTjfm+eXv/jfufIX2IhDP
         gCnzlrL/G1ZYjyrSuReZHW2Z6f8rwp5PPP8BFm8u9eIyKCB+XpuaTHbTlms53IYxX7
         eAvUmJFUrsondscCS/wJqQNjZPqzrP8hPQgSDHpIic/44vFVjAMjPZ8LuwrIIGAD8j
         GM2Cc3oESHaPjjbJX2u/jjqn/ZwqzSno3zpZJWBEGFSEF2eRLCVe8BuV70JwRhnrYF
         CBHvgybrN6qCw==
Date:   Fri, 29 May 2020 10:10:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Philipp Rudo <prudo@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>
Subject: linux-next: manual merge of the s390 tree with Linus' tree
Message-ID: <20200529101047.017c57e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IAYDse4X7IM=8zswSdFpRNb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IAYDse4X7IM=8zswSdFpRNb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/kernel/smp.c

between commit:

  8ebf6da9db1b ("s390/ftrace: fix potential crashes when switching tracers")

from Linus' tree and commit:

  11886c199d8d ("s390: add machine check SIGP")

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

diff --cc arch/s390/kernel/smp.c
index 10dbb12eb14d,fc1041257c60..000000000000
--- a/arch/s390/kernel/smp.c
+++ b/arch/s390/kernel/smp.c
@@@ -403,7 -404,12 +404,12 @@@ int smp_find_processor_id(u16 address
  	return -1;
  }
 =20
+ void schedule_mcck_handler(void)
+ {
+ 	pcpu_ec_call(pcpu_devices + smp_processor_id(), ec_mcck_pending);
+ }
+=20
 -bool arch_vcpu_is_preempted(int cpu)
 +bool notrace arch_vcpu_is_preempted(int cpu)
  {
  	if (test_cpu_flag_of(CIF_ENABLED_WAIT, cpu))
  		return false;

--Sig_/IAYDse4X7IM=8zswSdFpRNb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7QUwcACgkQAVBC80lX
0GwrMQgAnR7gII4DZl6PFSUKdLM1xsk1A07XEOlSHPFh5dOtT+bbbXfQhbwm/LDi
9vqXANzKz32WO3DrSJWAnc7eyJRXmjAsNvMyTH3utDJE5LNtVlhmMqksx5IRL9NS
eKqeu4dJl3vXGelPZ9ovKLQgJInL84y/xS+4G7idNjkuaS+p7BzQ6/zNMYYFXhhb
ES6MOgNjt8VuNT6OpiHiguu4Mz1lS32EcghPoT0Or6uM7IoRHO30Kv0PEv137hJS
VXNBfGDSCrSMF1OKoNfeMdcRd5VlVLEuGHJzArW90yu0M5u+ULo+MyyqZwejtD+c
ZqUGEAgsFcGjTWjTiFalS2afgjjzdA==
=6zvz
-----END PGP SIGNATURE-----

--Sig_/IAYDse4X7IM=8zswSdFpRNb--
