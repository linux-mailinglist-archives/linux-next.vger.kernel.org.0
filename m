Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0E1F247BF5
	for <lists+linux-next@lfdr.de>; Tue, 18 Aug 2020 03:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgHRBn7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Aug 2020 21:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgHRBn6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2020 21:43:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F78C061389;
        Mon, 17 Aug 2020 18:43:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BVtx74Tbyz9sPB;
        Tue, 18 Aug 2020 11:43:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597715035;
        bh=BC50kTHL9CPxdNN21OfK0OBaUpj5koSVlJa5nkQ2Ung=;
        h=Date:From:To:Cc:Subject:From;
        b=dZvmfWDVeR4+vtE7k8NxwqkhwdmNFcG4rmD3mVbsNrORech5oWymsWgNTLzR51OP7
         xcPkRD8/vb8/U33RGvc7rVMskaGDj+SNWeMy9JlAIhFr7adbMpOCXTG882zVzydQ9y
         ZncSwa0VvBDodiCFJbVaWShsA0te+90ESKvzotRAQqCfXogbpvTxQdeFU2DCO2eukq
         Qqgb3t4SaqmRkuowIDSE8IIxFZMMa8M0LyRrCDe588qr8fC60ual4ednucz6nVp+Ya
         cMmO9HgSPTUHjjsNukBZGRjNhVQ+IqnvG3aBr2wpuYg/KejKmaUynMqTbuC05abXuZ
         Xl0WQkDL3krtg==
Date:   Tue, 18 Aug 2020 11:43:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20200818114354.6c7c2142@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZwXrR1NPUIJrQH+pmTf6CBW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZwXrR1NPUIJrQH+pmTf6CBW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/kernel.h:15,
                 from kernel/rcu/rcuscale.c:13:
kernel/rcu/rcuscale.c: In function 'rcu_scale_writer':
kernel/rcu/rcuscale.c:430:6: error: 'perf_type' undeclared (first use in th=
is function); did you mean 'kernfs_type'?
  430 |      perf_type, PERF_FLAG, me, MIN_MEAS);
      |      ^~~~~~~~~
include/linux/printk.h:319:35: note: in definition of macro 'pr_alert'
  319 |  printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
      |                                   ^~~~~~~~~~~
kernel/rcu/rcuscale.c:430:6: note: each undeclared identifier is reported o=
nly once for each function it appears in
  430 |      perf_type, PERF_FLAG, me, MIN_MEAS);
      |      ^~~~~~~~~
include/linux/printk.h:319:35: note: in definition of macro 'pr_alert'
  319 |  printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
      |                                   ^~~~~~~~~~~
kernel/rcu/rcuscale.c:430:17: error: 'PERF_FLAG' undeclared (first use in t=
his function)
  430 |      perf_type, PERF_FLAG, me, MIN_MEAS);
      |                 ^~~~~~~~~
include/linux/printk.h:319:35: note: in definition of macro 'pr_alert'
  319 |  printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
      |                                   ^~~~~~~~~~~
kernel/rcu/rcuscale.c:431:27: error: 'n_rcu_perf_writer_finished' undeclare=
d (first use in this function); did you mean 'n_rcu_scale_writer_finished'?
  431 |    if (atomic_inc_return(&n_rcu_perf_writer_finished) >=3D
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                           n_rcu_scale_writer_finished

Caused by commit

  a20b5bd09813 ("rcuperf: Change rcuperf to rcuscale")

I have used the rcu tree from next-20200817 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZwXrR1NPUIJrQH+pmTf6CBW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl87MloACgkQAVBC80lX
0Gz8tggAir8/K3MV+I8lCQkvFoiNE0Iv5TPu5+dcHdqClGWwbZMPQh3lqCIxwK2e
mDVYmEF6+gPQYLFfoa76ZL9RQ6HMcZeDeD8QV8oBla2s/MT0aiqcpDSHdRvlIXuP
VNdtoG1IKlpsNnBAxepsB1H1ZTexDzgaCnkeOkK/Vu+Zj+aFr+mvOXbQVbov/BJa
v9cW3etVib8KJ1WVDzOLkX8GYpQ6C6qQq6qHvMRXyApe7wKtAabN3GocWYWv55//
MPI/YnYriNTst+ArMVnqLynUx2fDeemjOvVpPfNKzZKWekgb6/QNXXQTsqPxnmOI
6PY88sn9Ib6yop/4uFXXh6IrsmnJ+g==
=7oRP
-----END PGP SIGNATURE-----

--Sig_/ZwXrR1NPUIJrQH+pmTf6CBW--
