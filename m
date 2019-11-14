Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7EFBFBE
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 06:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfKNFej (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 00:34:39 -0500
Received: from ozlabs.org ([203.11.71.1]:33101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbfKNFej (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 00:34:39 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47D9Cc3YlQz9sP6;
        Thu, 14 Nov 2019 16:34:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573709676;
        bh=J7au3t/viCe8IXQ9tcxSPzFq5sAxnt6TXtlaa5JFCik=;
        h=Date:From:To:Cc:Subject:From;
        b=t8WSXqCsXHYgJJJHFNhd8gW8/S8oXTZ0XEXunwanJFdlUrspQOlwKnHxOBsHXjjlH
         N6vyrkQ6CIYdsOCS8u3Rn/qJMYeueF5zCjAWDGhR9EZWrqF+HE2CjE0MzKXXugOBam
         FI0HWN4VdruSsaslPrRiJ0Q1GT3U/C732NXUW/IE4ytl2CNixt8dsUmaBjUBbO81Al
         btyYzt7Ir+GKwrUd7e/fsd4azJyvHxjAWbT8Vos3ttghFmfNquTwpl/UT2CryzyCEz
         Y6PwdBWXs+4ru7bK2vaFltdHS/PtDLkBhtanE4QtgV7A7PYsI91Ym1FSayK12kdQo8
         cIqIGIRw2e5PQ==
Date:   Thu, 14 Nov 2019 16:34:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the hmm tree
Message-ID: <20191114163435.6273b6a1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/akreFWQ1wi=Oo/XxHODsPFM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/akreFWQ1wi=Oo/XxHODsPFM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hmm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/infiniband/hw/hfi1/user_exp_rcv.c: In function 'set_rcvarray_entry':
drivers/infiniband/hw/hfi1/user_exp_rcv.c:768:33: warning: passing argument=
 2 of 'mmu_interval_notifier_insert' makes pointer from integer without a c=
ast [-Wint-conversion]
  768 |    &node->notifier, tbuf->vaddr + (pageidx * PAGE_SIZE),
      |                     ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
      |                                 |
      |                                 long unsigned int
In file included from include/rdma/ib_verbs.h:59,
                 from include/rdma/ib_hdrs.h:53,
                 from drivers/infiniband/hw/hfi1/hfi.h:68,
                 from drivers/infiniband/hw/hfi1/mmu_rb.h:50,
                 from drivers/infiniband/hw/hfi1/user_exp_rcv.c:50:
include/linux/mmu_notifier.h:295:24: note: expected 'struct mm_struct *' bu=
t argument is of type 'long unsigned int'
  295 |      struct mm_struct *mm, unsigned long start,
      |      ~~~~~~~~~~~~~~~~~~^~
drivers/infiniband/hw/hfi1/user_exp_rcv.c:769:26: warning: passing argument=
 4 of 'mmu_interval_notifier_insert' makes integer from pointer without a c=
ast [-Wint-conversion]
  769 |    npages * PAGE_SIZE, fd->mm);
      |                        ~~^~~~
      |                          |
      |                          struct mm_struct *
In file included from include/rdma/ib_verbs.h:59,
                 from include/rdma/ib_hdrs.h:53,
                 from drivers/infiniband/hw/hfi1/hfi.h:68,
                 from drivers/infiniband/hw/hfi1/mmu_rb.h:50,
                 from drivers/infiniband/hw/hfi1/user_exp_rcv.c:50:
include/linux/mmu_notifier.h:296:20: note: expected 'long unsigned int' but=
 argument is of type 'struct mm_struct *'
  296 |      unsigned long length,
      |      ~~~~~~~~~~~~~~^~~~~~
drivers/infiniband/hw/hfi1/user_exp_rcv.c:767:9: error: too few arguments t=
o function 'mmu_interval_notifier_insert'
  767 |   ret =3D mmu_interval_notifier_insert(
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/rdma/ib_verbs.h:59,
                 from include/rdma/ib_hdrs.h:53,
                 from drivers/infiniband/hw/hfi1/hfi.h:68,
                 from drivers/infiniband/hw/hfi1/mmu_rb.h:50,
                 from drivers/infiniband/hw/hfi1/user_exp_rcv.c:50:
include/linux/mmu_notifier.h:294:5: note: declared here
  294 | int mmu_interval_notifier_insert(struct mmu_interval_notifier *mni,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  c90dad714405 ("RDMA/hfi1: Use mmu_interval_notifier_insert for user_exp_r=
cv")

I have used the hmm tree from next-20191113 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/akreFWQ1wi=Oo/XxHODsPFM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3M52sACgkQAVBC80lX
0GyA6Qf+Nf6nekFQi3+09GBkJemfhxv0XCe3c2Wo57BvNqOrcYdAdg6n00z7XxrC
Oj0c8PiM9hrUp923jshRkCULgD36NfTdlCj9u2quS6RqYkmFGNs3SgJCJz/Dbj3L
IVk6J+y82pItAEVjFjyrZkv1tVnQtYtkVMKOwZTDHEhYIhkVVywoS5/HEBYb4SbN
12kTLNXhxiVxlXnqmMYo+eLVrn+cpfwdBe/dkCOiQEnL16DXeScWOLjRoK97vi/y
5Ra2Xm8eFhsuGd06kaECX/T5OQ3xJZ+oI87Z/zjhHgSiv6OTjB8dfQh9zAHspc+U
GOga9IAr2ae+sERCs3EIexeqChGDCw==
=OxuZ
-----END PGP SIGNATURE-----

--Sig_/akreFWQ1wi=Oo/XxHODsPFM--
