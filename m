Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86FAD367865
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 06:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhDVEN5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 00:13:57 -0400
Received: from ozlabs.org ([203.11.71.1]:46627 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235048AbhDVELA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Apr 2021 00:11:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQkV226m0z9sRf;
        Thu, 22 Apr 2021 14:10:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619064618;
        bh=J00v65P/G1Quravu+B2tpu2sQCYDuZNR7z6M5UKWSdY=;
        h=Date:From:To:Cc:Subject:From;
        b=t5NphDRBo0HCdHFx2oIaKrD/hPxZ+Pl7WoqNkulX4T/XzydcsERNEvw54UiXU4qLz
         LvUVPGy0nbeb1LZ1PT9Ij5bliVgefWAHJzPv3iq8nfBy0xNQ+JDcnb66Frlu2EiltP
         4SVf9jWufcNW0Jlg65XqK9PM520uPDSa87coRslLby1S6GKmIsGhidRJCLX++3Tgvq
         TQ7hFWJH9eCUL50psQJ/oXVpDCfDOcHvFBYYolkhAjgUaDHyfTpV46gha7XqWsc1dW
         CnhPYj0wyaVtBjGZ03Z5vAMXO9P/Qc0Bl+LBgsNbNPrSBwrY+bjizU3ODF3Kc45hLe
         d0e4kd7cPO8JQ==
Date:   Thu, 22 Apr 2021 14:10:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20210422141016.656f50bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L=/uF/jS3p9RiyYfKrI6O/e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L=/uF/jS3p9RiyYfKrI6O/e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from kernel/rcu/update.c:584:
kernel/rcu/tasks.h:1404:20: error: static declaration of 'show_rcu_tasks_gp=
_kthreads' follows non-static declaration
 1404 | static inline void show_rcu_tasks_gp_kthreads(void) {}
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from kernel/rcu/update.c:49:
kernel/rcu/rcu.h:440:6: note: previous declaration of 'show_rcu_tasks_gp_kt=
hreads' was here
  440 | void show_rcu_tasks_gp_kthreads(void);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  4bf02dd6048d ("tasks-rcu: Make show_rcu_tasks_gp_kthreads() be static inl=
ine")

I have used the rcu tree from next-20210421 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/L=/uF/jS3p9RiyYfKrI6O/e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCA9ygACgkQAVBC80lX
0GxKigf7B2OUsKIP17p7Hl3M7Epn9RX0slYKG0Asg2pHHSw2QRuZRaXmDAMedigp
iSh/z83KGU4xtCI8py4p4QgQjl8jdmgwdWKUKw1i0l5C/Riq+RLvYwJqrIUeH0v8
OZJDgq3HQ6fvmPsGlxdmEGKls5cb6G/b5Bq52NEqHbRBI1uvPZuLbC2AwHVLHrdg
QBhq4hRL52MaKCiF0AkUE8HVKCj70G+Dvs9xmEJti9K3jJfrxVc3n8R3qA5FG9Wz
SKueznyjM7T7RbRRGG0QcrhKlL0AjRQCUxoyjNZ4KlX7jzAapEh4nWMKNUJv0mDJ
HePxc1Cxz+veLgp8xoVWjPl7eBNzaw==
=Ur5B
-----END PGP SIGNATURE-----

--Sig_/L=/uF/jS3p9RiyYfKrI6O/e--
