Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3702D451783
	for <lists+linux-next@lfdr.de>; Mon, 15 Nov 2021 23:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbhKOWcz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Nov 2021 17:32:55 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:34893 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350231AbhKOWUZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Nov 2021 17:20:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HtNpQ6gV0z4xcC;
        Tue, 16 Nov 2021 09:17:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637014623;
        bh=7cUctgxZBS6/N20u0anh9V5IsZ0iPrrFRpTs8tw8GJ4=;
        h=Date:From:To:Cc:Subject:From;
        b=lQNjYrO1cE2hBfL3itZQIwpriLdB+rpfaz+5EXAXeaoqEivXgsXImGHgyJjCNPzz1
         IHH3C1fH34NRln8SfYADIwvwWGZRpzF4DJ15hRAaZApb3Vv660GuL8IAx5EIXHU7rE
         PdwD2U2gUMQgZO0y2HtUbm6K3nEL8JwPid/R7AD3u6n4qZax8vExQjfN5xyfI12FWS
         Kp2R13RkU3L1HgE+VNRI+w9k37DdSmJtZkG/TH//8j/ooKl/CXBOny5z4FEDl+xBro
         SCgvtN78HmCdRzxQUyhTOp8FOpMXpvqb+i9opMWq1azJ2WeeDBmfcUmmJ1MfbS6zDr
         BT6pFSd7jjEpw==
Date:   Tue, 16 Nov 2021 09:17:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     chiminghao <chi.minghao@zte.com.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cifs tree
Message-ID: <20211116091702.3e2c4550@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8OU1EBP8FYM4_smUQbePUaG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8OU1EBP8FYM4_smUQbePUaG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from fs/cifs/dns_resolve.c:18:
fs/cifs/cifsglob.h: In function 'cifs_get_tlink':
fs/cifs/cifsglob.h:1169:14: error: passing argument 1 of 'atomic_inc' from =
incompatible pointer type [-Werror=3Dincompatible-pointer-types]
 1169 |   atomic_inc(&tlink->tl_count);
      |              ^~~~~~~~~~~~~~~~
      |              |
      |              refcount_t * {aka struct refcount_struct *}
In file included from include/linux/atomic.h:82,
                 from include/linux/cpumask.h:13,
                 from include/linux/smp.h:13,
                 from include/linux/lockdep.h:14,
                 from include/linux/spinlock.h:62,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from include/linux/slab.h:15,
                 from fs/cifs/dns_resolve.c:15:
include/linux/atomic/atomic-instrumented.h:179:22: note: expected 'atomic_t=
 *' but argument is of type 'refcount_t *' {aka 'struct refcount_struct *'}
  179 | atomic_inc(atomic_t *v)
      |            ~~~~~~~~~~^

and lots more similar ...

Caused by commit

  ef242296e441 ("fs:cifs: convert from atomic_t to refcount_t on tlink->tl_=
count")

Please write, review, test (repeat) and, only then, publish. :-(

I have used the cifs tree from next-20211115 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/8OU1EBP8FYM4_smUQbePUaG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGS3F4ACgkQAVBC80lX
0Gwl7wf/fkkYyUfQl2BCCbBUhVHjlIigMz/u91Z+nugFkijukO6d00ef5TcemlM+
HwTZWmsakV0AdtwBa3tIGY+4NFy1xpSMsGoBjhbcS9pQAXnkVzxa1OTtync2nGUZ
8M5z4LrKd+FmVZYqA3w3ekvDCQBZkbchrwBVEU+hurl8XUVrOFrFo7eO7KfFR74s
kGzIRVf/wrKD4RI0f0pDTyEjUKWyxX4O6YKDhPDHzPBQVs2VWaUSYuDOyAmlfmOZ
pIA5EcPW1C56c7ntFPvw+U9tP6jsKpzP3ajVmal9UcVk0+LAezAK74llJlSDHd9F
Wla1vfjpLmqsTnwqPHlsQw4IJsjp+g==
=xtMQ
-----END PGP SIGNATURE-----

--Sig_/8OU1EBP8FYM4_smUQbePUaG--
