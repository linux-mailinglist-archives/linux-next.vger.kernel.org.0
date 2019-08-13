Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEC4D8AEBA
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 07:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbfHMFZQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 01:25:16 -0400
Received: from ozlabs.org ([203.11.71.1]:37433 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbfHMFZP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 01:25:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4671Pj2zxkz9sNm;
        Tue, 13 Aug 2019 15:25:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565673913;
        bh=W1t92lLc1O2p0zeHcTydEI3caUnIYahKMT+GH5evFfk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O3P3oy4F4QFyoFmHRybQfvaaUN1NSNHHGYaNtHHQWDaUjQZG8fuU8T2T5yurhu8Z/
         SM59FEqTCh3ajNWV0PHHfrNB8RnolZCWd4fhZcEQT1El8gKlTylfUTpc3gVcKgMej+
         c0H1nP2OEKqORhriZd/aQGKzuX5E3/f8x6s6PKW4DGpKwfmWJc4/Ry7dH/SU/EeTK6
         lY3+5lphjz7AQJWAGMGW9hvaVpa/wlHXoAWjCPH9ZJpoTo9NocjL99358xc/NCRdjU
         FTIt2zu2K6udlCQjbRQpwRgSq7eYKidW1taLNszg3qBg6uU9CL8koAQEcWu8VrGIBJ
         18j0sGNbrCv1Q==
Date:   Tue, 13 Aug 2019 15:25:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20190813152511.21737e32@canb.auug.org.au>
In-Reply-To: <20190812161934.GJ28441@linux.ibm.com>
References: <20190812161236.21defb17@canb.auug.org.au>
        <20190812161934.GJ28441@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UwbxNLX_LFaFu4/j.HNGJrh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UwbxNLX_LFaFu4/j.HNGJrh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, 12 Aug 2019 09:19:34 -0700 "Paul E. McKenney" <paulmck@linux.ibm.co=
m> wrote:
>
> Huh.  "It has been building fine for me."  I added
>=20
> 	#include <uapi/asm-generic/types.h>
> 	#include <asm-generic/atomic-long.h>
>=20
> to include/linux/rcu_segcblist.h, which hopefully fixes it at your end.

That did not work as I got a lot of errors from
include/asm-generic/atomic-long.h.  I have added the following patch
for today (which does build).  These errors come from having
CONFIG_{,KERNEL_,UAPI_}HEADER_TEST set (which allmodconfig a should do).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Aug 2019 15:12:00 +1000
Subject: [PATCH] rcu: use the correct includes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/rcu_segcblist.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/rcu_segcblist.h b/include/linux/rcu_segcblist.h
index 43e2935e8966..646759042333 100644
--- a/include/linux/rcu_segcblist.h
+++ b/include/linux/rcu_segcblist.h
@@ -14,8 +14,8 @@
 #ifndef __INCLUDE_LINUX_RCU_SEGCBLIST_H
 #define __INCLUDE_LINUX_RCU_SEGCBLIST_H
=20
-#include <uapi/asm-generic/types.h>
-#include <asm-generic/atomic-long.h>
+#include <linux/types.h>
+#include <linux/atomic.h>
=20
 /* Simple unsegmented callback lists. */
 struct rcu_cblist {
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/UwbxNLX_LFaFu4/j.HNGJrh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1SSbcACgkQAVBC80lX
0GxI5wf+I4uBSHd2YmYlAxuZYMf94oAllzGJ0e/WZjCWF+PuF4tYdeVCdRYoLnjq
sKFekiPfgCgSDy3uOSDaWE7mib+vO039YJJExerzQ3HbdGWsKS0wi7jOOq7R6W+O
rjstgjYOpxX83mGKp4eySSGup/B6WOU9YL+QnciFWMQ0Tc4sxQCARUlA9cT4aRr+
xBPYXhOA/LeelRe8htaloknDMbaUPXeicEjE66pda0jo/cQyVMLkzi/OK1Wre9K+
gihnZyVF6eNAZdmPkoCS+8iyfuEGOG7j0Ta7OYeUFZKGpzt+47xwf5ykKLx77gpj
T3nfrkZORs8JuxkorCESqlYA02e69w==
=qZKm
-----END PGP SIGNATURE-----

--Sig_/UwbxNLX_LFaFu4/j.HNGJrh--
