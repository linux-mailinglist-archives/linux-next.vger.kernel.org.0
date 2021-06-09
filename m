Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280883A0AE1
	for <lists+linux-next@lfdr.de>; Wed,  9 Jun 2021 05:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhFIDyf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 23:54:35 -0400
Received: from ozlabs.org ([203.11.71.1]:38895 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233178AbhFIDyf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Jun 2021 23:54:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G0CqW2hRFz9sRf;
        Wed,  9 Jun 2021 13:52:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623210759;
        bh=Ixxlk4f9RnT+NGh0m5LtrOpLTMheHQfUZK2vc4J4JbM=;
        h=Date:From:To:Cc:Subject:From;
        b=sAh42AsR5sZjNPSWHkHcRA58uQVQc2vZXBqwKdBp4gDpmEXyFgkUtDX7ognui0oRi
         +GxG+ZMpcCkaMXlE0GuJC89O+oICtUBSvQ2BCE2mTLv4BbbKgegk009PbmU5d2Kh5Q
         TMsklbRa/XVoJm8iq8aBbVKS6CNJ0Rp7NSx19Ij+GSUKn7BfSqMbzt+PCcWgrvmP4M
         TCfO4KtF3lJL4hsBl7bI+qSDA/9VMeU46pk+j8enpGFv1t9+moJtKVbuCj+pswo5uK
         hw7cIbV+gKWDtee5XIIX+4ZQ1FVcj+unZfQAgE5O0mZ2MEz+HXNFqHRdHBNRH6nvkK
         W6iwG8A7qBJHQ==
Date:   Wed, 9 Jun 2021 13:52:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20210609135237.22bde319@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ef.7qwvqW6+PxY.+o2M/7ry";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ef.7qwvqW6+PxY.+o2M/7ry
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/nvdimm/pmem.c: In function 'pmem_pagemap_cleanup':
drivers/nvdimm/pmem.c:338:24: warning: unused variable 'q' [-Wunused-variab=
le]
  338 |  struct request_queue *q =3D
      |                        ^

Introduced by commit

  80b58f4e9f4a ("libnvdimm/pmem: Fix blk_cleanup_disk() usage")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ef.7qwvqW6+PxY.+o2M/7ry
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDAOwUACgkQAVBC80lX
0GzEiwf9Fn/ucGeVR4M70N3L7oPgoXXf4PpiwIcXdS2hb53j4uU39tnyLlw+sfrr
Ar8I/PE40Wq16oWA/M2GILGUusrJ4nOiPaPZfq2DYYrZKbbuCDCXaq1S7NjSrs+n
f7itIQ5at2rwG0GUCjUF/Ot+/D7n3Gm1QuR0oGrC5LNVbI3m7wu8jy4nnGgNoMPu
cmysJxtxq3ePwLb1iUXKpZ7RzpsN+ys8aXqEwwTfPPyZ54nrfk22rg+mV107gUbz
IEU8eAtu4DLaxzbjPxkcwYr5uNm+NOhELWxa1fsR1Lnc1QGoWpLF5Z/flu6cW8YL
YwF7xum2YA/D6htN/lfMKTK/1COf/g==
=1aZH
-----END PGP SIGNATURE-----

--Sig_/Ef.7qwvqW6+PxY.+o2M/7ry--
