Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF90A2CE981
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 09:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbgLDI0N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 03:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbgLDI0N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Dec 2020 03:26:13 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B57C061A4F;
        Fri,  4 Dec 2020 00:25:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CnQkd4hnhz9s0b;
        Fri,  4 Dec 2020 19:25:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607070329;
        bh=RKQ/0KSALkz92r6pcBPR62y4zwCSR2/gn2uxYc4+cr8=;
        h=Date:From:To:Cc:Subject:From;
        b=Ww69xVGbUUdia/X5JR/nsFVtRzhtL+uW/jVN3WhBfkRzFgGZ0nNeufcfbydnn7H9n
         2GJ6chRzrQEL55H17mgQKtRg/I2zFaGzU8I0td8jOrn2i/WjAqYRa8Hmev4sK66HJE
         aFQQa9LqGowpVbyP/aLwYyAOtLwLB/oKIP4st/gzERNYWOg0OjMYigsfpY81OC32UD
         qczYbVRiEr6rhC67sMeWv3AEW4EMpHyp51gu66Z0b5n26nlj0/ms1YxOXxQ2lcnoCT
         Xxi9JkLuX0O9mZ7WBuICc6ZevoFrQYouLD7lHMOvSl9gTXMvrkxT+ZpNWlYcLGD5V3
         03nO/6qaPy8WA==
Date:   Fri, 4 Dec 2020 19:25:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20201204192526.0b38fb02@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i/_kt//s4/F7sxLnsqyqfNO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i/_kt//s4/F7sxLnsqyqfNO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (sparc defconfig)
failed like this:

mm/slab_common.o: In function `kmem_last_alloc':
slab_common.c:(.text+0xc4): undefined reference to `kmem_cache_last_alloc'

Caused by commit

  f7c3fb4fc476 ("mm: Add kmem_last_alloc() to return last allocation for me=
mory block")

in mm/slab.c, kmem_cache_last_alloc() is only defined when CONFIG_NUMA
is set - which is not for this build.

I applied the following hack fix patch for today.

=46rom ac5dcf78be1e6da530302966369a3bd63007cf81 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 4 Dec 2020 19:11:01 +1100
Subject: [PATCH] fixup for "mm: Add kmem_last_alloc() to return last
 allocation for memory block"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/slab.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/slab.c b/mm/slab.c
index 1f3b263f81ee..064707ac9f54 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -3650,6 +3650,11 @@ void *__kmalloc_node_track_caller(size_t size, gfp_t=
 flags,
 	return __do_kmalloc_node(size, flags, node, caller);
 }
 EXPORT_SYMBOL(__kmalloc_node_track_caller);
+#else
+void *kmem_cache_last_alloc(struct kmem_cache *cachep, void *object)
+{
+	return NULL;
+}
 #endif /* CONFIG_NUMA */
=20
 /**
--=20
2.29.2

--=20
Cheers,
Stephen Rothwell

--Sig_/i/_kt//s4/F7sxLnsqyqfNO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/J8nYACgkQAVBC80lX
0GzYewf+MuMlF7OJqQG0ckjT4czx5ZUQCvkKrGtFLljpQrJsXnA7c1NrM/0YfL5w
X3Gzggx7w/V8aDX6cKQrt6EUPREQTNwWtPUJstxrR3nl6bksMgkpvPeIYOt8OfeR
LLQlt5dFhMvP/QylWDUFOr5lYz3kW/C60mXJG1f5z8aSBF5jwqvm7P8vcwYrJI+M
nHgsJd5YkmBhMlG/+DIv+tNaV4A76DD/LBitKOKzXCJOx5YdXLNtfCRTanTp/XZa
YHQXLy4Dgz2K/FEQOvVtkRBkOHr8Xwmb3TTG+2tA/ZLg6qNELUyP4yl054GgpyRZ
/MDquwWBMxi+Apr8BwKCaGPLb71Tmw==
=J0hT
-----END PGP SIGNATURE-----

--Sig_/i/_kt//s4/F7sxLnsqyqfNO--
