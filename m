Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A76F3193690
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 04:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgCZDMj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 23:12:39 -0400
Received: from ozlabs.org ([203.11.71.1]:47611 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZDMj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Mar 2020 23:12:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48nqmN4jLvz9sRN;
        Thu, 26 Mar 2020 14:12:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585192357;
        bh=jPJIgISpy2X3pF2DFOmrsppQA/UlqAULA6IP+aQG/Nk=;
        h=Date:From:To:Cc:Subject:From;
        b=sWVEJ8+MguWCCp0xDbXwlVuTZA3YkRD5occ9xZnF02gOk0a6/kqbRVHWwLKhYyZM6
         fZ3/V1fGbGmx2vZ3ldSrN07qFoP/VZWUjHUGvbIjCNI4AAv/P9hOY0xQr2bjre/EIR
         YtK3ZSi/i937o/x4F0JZtNBZW++DriVlyYO+8S1cXZqYb2Dc1VA0SF9ONu85M12zHr
         m+NpRcw/2bQtRQiEy6fggkXd9zpT4aSnec4NMro/YHzvKsmhoW1HugcbupukxsENYA
         tVHFz1xLlHOkFM/0oC4tX8xq+C5VdgZbRikR3xGSiFkpzdFJBJlQ/380UQctn6F0ak
         kioVPXm8cqHyQ==
Date:   Thu, 26 Mar 2020 14:12:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>, Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: linux-next: manual merge of the rcu tree with the spdx tree
Message-ID: <20200326141235.718118af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U_+XevE1.C7d7GyvaOaxPfM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/U_+XevE1.C7d7GyvaOaxPfM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  tools/memory-model/litmus-tests/.gitignore

between commit:

  d198b34f3855 (".gitignore: add SPDX License Identifier")

from the spdx tree and commits:

  5381fb2b70e9 ("tools/memory-model: Move from .AArch64.litmus.out to .litm=
us.AArch.out")
  dafa02882066 ("tools/memory-model: Keep assembly-language litmus tests")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/memory-model/litmus-tests/.gitignore
index c492a1ddad91,848e62d2a9b3..000000000000
--- a/tools/memory-model/litmus-tests/.gitignore
+++ b/tools/memory-model/litmus-tests/.gitignore
@@@ -1,2 -1,1 +1,2 @@@
 +# SPDX-License-Identifier: GPL-2.0-only
- *.litmus.out
+ *.litmus.*

--Sig_/U_+XevE1.C7d7GyvaOaxPfM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl58HaMACgkQAVBC80lX
0GxutQf+PIavlvoaIc3NpddYuBxx4kcfCL+BIPFbTQc+UwlswmgPCSTVE+bHLYW1
Zx3C24FnD7MEq4bgmv2apfRItJ+Nuj3t4wjQZjV/EBne3JKlERAKUHMB+Pmp32BO
Reo/eB/BKYK2kwV0Mc1kEaPRY1l/PytWeFFVE/ZRjCxUnC+GGNqoaxRy2SZrLnvQ
vTwoSFIftLP2BH7iy//M5EvUNIXVPzz33Tbm85YNDqy1+oUp8YxO6iZQ54F86Lk+
bNttKwCSTIjCUsdWOvvoBEOC3/4pH1VMMHxiTTribjHuhEsJnuNbWIBfWU9uyUKh
qs0fPnPkxveQG6d6ecK/bjemuRn6xg==
=wqDK
-----END PGP SIGNATURE-----

--Sig_/U_+XevE1.C7d7GyvaOaxPfM--
