Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35AE9EF9D8
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 10:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbfKEJpb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 04:45:31 -0500
Received: from ozlabs.org ([203.11.71.1]:52069 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730454AbfKEJpb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 04:45:31 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476lCD6H6Yz9sPF;
        Tue,  5 Nov 2019 20:45:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572947129;
        bh=coQy+CT49Muq0nkg5uA0Sa9MIOkXOp12ouyavHVlxuk=;
        h=Date:From:To:Cc:Subject:From;
        b=SRPb1F/WwhzQV+MVOYa1aIKGQn946VXpRMuuqud3wPBCty5oIuFLcmgOAiswW52AL
         0exRcNLdgV3quuKCFV03x5H4tfjm/e+9MN8HImWkFSgcIhuQeI8Kxr+8c9tiTW+TJp
         bb52Yh5bOExYjtmQRRFt33y+g6EF619JPDF0DydAvavZyMViU8aOzTDVztT1U1keJt
         vAIIJ8riUOmnoRFAWVUDnuLUU92NdWDVmni9JjU2t7l0u/7ybqZDyB1+ibdgOZj2lK
         nnKSLRB2wlwNaQSXcJUM8v78aa7Axfflcd3X2Z+V8/ceQ7CRfRZ4FCiHuumL9HvRB5
         YsSfOpskGO8XA==
Date:   Tue, 5 Nov 2019 20:45:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Gow <davidgow@google.com>
Subject: linux-next: manual merge of the akpm tree with the kunit tree
Message-ID: <20191105204526.32f19975@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2k2jiWYj7og9hHLfiaivHnC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2k2jiWYj7og9hHLfiaivHnC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got conflicts in:

  MAINTAINERS
  lib/Kconfig.debug
  lib/Makefile
  lib/list-test.c

between commit:

  ea2dd7c0875e ("lib/list-test: add a test for the 'list' doubly linked lis=
t")

from the kunit tree and patch:

  "lib/list-test.c: add a test for the 'list' doubly linked list"

from the akpm tree.

I fixed it up (I just assume that these are different versions of the
same patch, so I just dropped the version in the akpm tree) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/2k2jiWYj7og9hHLfiaivHnC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3BRLYACgkQAVBC80lX
0GzKbwf9HQ0tJsQLWe9zXp0aikL4/qSprJVDg92HtnpBRKlcVwhC3zDlPKlFZfjJ
6fQndY/uPuu5eKGoLlP2h0N3x7FJWFU0+btnhhe0pn8BFdh0jrerYCMs500Uf/3Z
5x1YimFTUq1pTNn5TQ1lK+JSiggW/dsFHz06SMNUwsz1ME6mQoBV7MLtyhzXkOAY
70u/GxIB687AfZjzpbccD2QHY2QmwTTznLX+93UcXFvvkwkNkCsmE3wNKENTTqxf
clSzfy6g61gN+jkZEccTFqG3jrdmYnmLlOfJPoJ6Ij0+G4F+ivbM5b5T/6UiGfeW
LfFNWGwqPwb2syND/sa4SgR2dGrMKg==
=OLNg
-----END PGP SIGNATURE-----

--Sig_/2k2jiWYj7og9hHLfiaivHnC--
