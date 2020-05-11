Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40031CD004
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 05:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgEKDA1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 23:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728485AbgEKDA0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 23:00:26 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C65C061A0C;
        Sun, 10 May 2020 20:00:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L5K11pNjz9sSr;
        Mon, 11 May 2020 13:00:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589166023;
        bh=XtwxjaEyKQ61c8GPXHGZyxSd8Z8WBcSX6JPt2spBvXs=;
        h=Date:From:To:Cc:Subject:From;
        b=GRRslkB27B0tL2yNEl+sP5KcJnCI2LQahCHTxD4kzfl/uM6YGFKlQlenOlAcCP30K
         8/EqU8pFA/IF0IiyrEsYjqDubriKfYmKDV6ZUvFiKM5rAh+O6TxfVDrqjLwtYPGUdq
         2M/UPZpjyIk5cva5I84NZfZkeaAyLRJ3q5Kzmg4PszLbPEN4sW1Q2bNKCnD6gDyfAB
         ATP/yY9yRb2eHbiivfLp48WhzzWptmHTamDwoHsoaz2OW6WjXVBSOW9hIghrzLwzqh
         1zDEe6K63PwWOanOw1KkGhIBDE38IvosMo2GI+6hJiDI6UgXazDBvQwEygOH/30Qxp
         fYQ+Ehtb+cafA==
Date:   Mon, 11 May 2020 13:00:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steffen Klassert <steffen.klassert@secunet.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Ahern <dsahern@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Westphal <fw@strlen.de>
Subject: linux-next: manual merge of the ipsec-next tree with Linus' tree
Message-ID: <20200511130015.37103884@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SZ_SHUTMX/4gm_m4vxWCbJm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SZ_SHUTMX/4gm_m4vxWCbJm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ipsec-next tree got conflicts in:

  net/ipv4/xfrm4_output.c
  net/ipv6/xfrm6_output.c

between commit:

  0c922a4850eb ("xfrm: Always set XFRM_TRANSFORMED in xfrm{4,6}_output_fini=
sh")

from Linus' tree and commit:

  2ab6096db2f1 ("xfrm: remove output_finish indirection from xfrm_state_afi=
nfo")

from the ipsec-next tree.

I fixed it up (I used the latter versions of these files and then added
the following patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 May 2020 12:57:24 +1000
Subject: [PATCH] xfrm: merge fixup for "remove output_finish indirection fr=
om xfrm_state_afinfo"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/xfrm/xfrm_output.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
index 886a9b284b3a..0f4b3a5e02ba 100644
--- a/net/xfrm/xfrm_output.c
+++ b/net/xfrm/xfrm_output.c
@@ -574,16 +574,12 @@ int xfrm_output(struct sock *sk, struct sk_buff *skb)
 	switch (x->outer_mode.family) {
 	case AF_INET:
 		memset(IPCB(skb), 0, sizeof(*IPCB(skb)));
-#ifdef CONFIG_NETFILTER
 		IPCB(skb)->flags |=3D IPSKB_XFRM_TRANSFORMED;
-#endif
 		break;
 	case AF_INET6:
 		memset(IP6CB(skb), 0, sizeof(*IP6CB(skb)));
=20
-#ifdef CONFIG_NETFILTER
 		IP6CB(skb)->flags |=3D IP6SKB_XFRM_TRANSFORMED;
-#endif
 		break;
 	}
=20
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/SZ_SHUTMX/4gm_m4vxWCbJm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64v78ACgkQAVBC80lX
0Gw0iwf+NzIJyEU1xvRC+Mc1+RZGwTA99JA8GXjtmjI7iY9gGMLfC5njQQ46fIRn
vxwFLBwtk/G1CyMHCPNQkDJYqfypj4nfBsFn4sBOz32iq3GS9+ou9vP1hOPhyWgi
gyw9KRlWXNlNpEDSr8EVns59P+2CRWmDXOqLz6pub+9KIXjh9+ZGSH/lml4AAbuL
KynEt4MvSjJyTFYiBOL73udpDVdchkK5gu0iNkDsrd1w01Bskf6wx47lkPlP7Z5Z
QNJGCp4tO7/FQhPPv0GyUrqV/Ip6jiU+M5uzjnVnTdxP6jTOCrSV6Qreb+zTFbKB
1SzFGNlqI6vfvMlumccqSM0h5Mg/fw==
=Uq71
-----END PGP SIGNATURE-----

--Sig_/SZ_SHUTMX/4gm_m4vxWCbJm--
