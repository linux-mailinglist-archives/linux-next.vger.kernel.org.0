Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F19286EE0
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 08:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgJHGzp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 02:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgJHGzp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 02:55:45 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF48C061755;
        Wed,  7 Oct 2020 23:55:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6MRL4byMz9sTK;
        Thu,  8 Oct 2020 17:55:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602140142;
        bh=GSUYeyaXjavnuNWHa+CpYRwaUHsC2x849dwaFzdLqFc=;
        h=Date:From:To:Cc:Subject:From;
        b=N3mGEkFU4QBiDGt5DEdkzwAX+t9CBUgsHHD9DxAZRTvP0pLNxS7IUl+LYqTTcSrIv
         dWtmXNWq+ys4JBIqCkqQY8NNaetCgqtpJ5ikhJSgjnve4mctzMTbE1zUfDhhVg7Rj7
         4HcAGRZwGqXsqisMdAB28pMPfBInGXORtG/3LKwjuNiILnAvk5o9gGMZepMUvQqHgQ
         WOYgOMI1SO7UlGcYx+zJkUkKiMdH7fNjCAQ2rYCRx85JudJ9ySbogi+EhZ4QPrQEcN
         vN3d8C8Z2MB6jFJdb8BUsuvigXE4mImkv03XgecedLiv10M7hp3Mn+/C0/6J7q72XL
         davSWYMAXAcEA==
Date:   Thu, 8 Oct 2020 17:55:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the xarray tree
Message-ID: <20201008175540.13dc645d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/98kucMDQfETZ6npwXVCbwH9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/98kucMDQfETZ6npwXVCbwH9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xarray tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "xa_delete_node" [lib/test_xarray.ko] undefined!

Caused by commit

  e95150e70fe1 ("XArray: Add private interface for workingset node deletion=
")

I have added the following hack for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 8 Oct 2020 17:52:11 +1100
Subject: [PATCH] XArray: export xa_delete_node()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/xarray.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/xarray.c b/lib/xarray.c
index 3f0b143bfdcd..be9166b45db3 100644
--- a/lib/xarray.c
+++ b/lib/xarray.c
@@ -1993,6 +1993,7 @@ void xa_delete_node(struct xa_node *node, xa_update_n=
ode_t update)
=20
 	xas_store(&xas, NULL);
 }
+EXPORT_SYMBOL(xa_delete_node);
=20
 /**
  * xa_destroy() - Free all internal data structures.
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/98kucMDQfETZ6npwXVCbwH9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9+t+wACgkQAVBC80lX
0Gz3iggAlpzGfiU+h974Me1R9pDkRBsJ3j4OfhfHYfEst95nNazg/9yfJ0KiraRx
XqCjX03f98kwaUCuFI6lNCDRLoWFhkeiZKxRYxkrHTbsShrDKicO3n3tfV5A/Uky
O5pwT99dux0JRl3z/JlQdmKCw7T1H0XrBpntiZP7eFBhw8nHqgLSU1y5gSwMlQRb
qtoiU4Dkytu9qZW+CfiwEG0P7BM6lY9E1MsUDO26eZnyqTCvcWpfqwlgcpfIYtMo
66HX6/1bqZQJt5vNaE9m/jc/wmdMm3yJ09Y5omkSrLqVQt/QVvH0v92w1DWXKdLS
hXTXpeGcN33Punc43d+eSwvrdzZpfg==
=d62I
-----END PGP SIGNATURE-----

--Sig_/98kucMDQfETZ6npwXVCbwH9--
