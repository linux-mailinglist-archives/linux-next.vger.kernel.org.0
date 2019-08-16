Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 680B28FA2C
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 07:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbfHPFEJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 01:04:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44811 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725945AbfHPFEJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 01:04:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468rnw5xpxz9sML;
        Fri, 16 Aug 2019 15:04:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565931845;
        bh=MXM/4uOM20H8e4JxMgcLzQFXldiFxvHuQl0pDQr/Xb4=;
        h=Date:From:To:Cc:Subject:From;
        b=qsVi4xybtNijf1nCtqRlkiWbD8ot4cFQ/8srUnqgSdDclM7ezlmWS+5DB2f3nVhnm
         ds7pBlhyay5peRSegxHlys1MYUztq67NwRQmdMlumxbSV2GZ3FUVMR6H10LyR1qnUj
         +om6i7+4mypLwVnLQnU6V3Ul/tVDeLIbsLFWl7FeJ5J/6XsK+OW4y8orCw95VDFbCX
         mqNGVJ8/epjgpI27nlg7Glj9JRwsdrcRtyQ33Cjbgxw8XLi3QqYm7JZ7PSTzLkiW76
         m+IOB1vQm1lXymEP+juMWQh4pR4jzTpZ/EL6EZUJYI4zh4FPGfWyIjEZcHoJznXXSj
         UDH0roM9mtamA==
Date:   Fri, 16 Aug 2019 15:04:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Subject: linux-next: build failure after merge of the keys tree
Message-ID: <20190816150404.73560822@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H7A=./=jat.58dnJpDMRiP5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H7A=./=jat.58dnJpDMRiP5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the keys tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/md/dm-verity-verify-sig.c: In function 'verity_verify_get_sig_from_=
key':
drivers/md/dm-verity-verify-sig.c:38:8: error: too few arguments to functio=
n 'request_key'
  key =3D request_key(&key_type_user,
        ^~~~~~~~~~~
In file included from include/keys/user-type.h:11,
                 from drivers/md/dm-verity-verify-sig.c:10:
include/linux/key.h:318:27: note: declared here
 static inline struct key *request_key(struct key_type *type,
                           ^~~~~~~~~~~

Caused by commit

  f802f2b3a991 ("keys: Replace uid/gid/perm permissions checking with an AC=
L")

interacting with commit

  644332ceab35 ("dm verity: add root hash pkcs#7 signature verification")

from the device-mapper tree.

I applied the following merge resolution patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 16 Aug 2019 15:00:15 +1000
Subject: [PATCH] dm verity: merge fix for "keys: Replace uid/gid/perm
 permissions checking with an ACL"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/dm-verity-verify-sig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-verity-verify-sig.c b/drivers/md/dm-verity-verif=
y-sig.c
index 614e43db93aa..2ca162d43fe6 100644
--- a/drivers/md/dm-verity-verify-sig.c
+++ b/drivers/md/dm-verity-verify-sig.c
@@ -36,7 +36,7 @@ static int verity_verify_get_sig_from_key(const char *key=
_desc,
 	int ret =3D 0;
=20
 	key =3D request_key(&key_type_user,
-			key_desc, NULL);
+			key_desc, NULL, NULL);
 	if (IS_ERR(key))
 		return PTR_ERR(key);
=20
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/H7A=./=jat.58dnJpDMRiP5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1WOUQACgkQAVBC80lX
0GyEmgf/TZf4BNKQvrXM/ZloWCoi1HTdisNbzOVt3cjxOMRtpvabuYWt2LwK1K5A
QeiShnRJmc7bLVMmts3JMvfpL89ept592pDoGbKLKPRAELBF2XI3slPAzbNx1Yl0
ifMooYdGYsixqFXuxMqAlhrp9IcryeJ6CBI+K/1YGQP0wckeC6ulBFBEUnhM8DEQ
bguRTtfgyGbwAjI/CsOPt/DgQKyaumwNpTbelCTAzwLjmiFer+QczYWkMT4qO01o
0TDpUOWwSatD16tKowSy13qm+xr6N3WBdgHylea0ITuc1GM4d/crXEKNGStNysaq
cvoBy7JlYIldJ9FCaUmqVsSOu+heHA==
=Rjnu
-----END PGP SIGNATURE-----

--Sig_/H7A=./=jat.58dnJpDMRiP5--
