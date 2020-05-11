Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773FE1CD023
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 05:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgEKDD3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 23:03:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56209 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbgEKDD3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 23:03:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L5NZ5Brhz9sSF;
        Mon, 11 May 2020 13:03:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589166206;
        bh=bYkZqtNYinOGGqD45lX+jcNTScgvzj1AUWkrZ4zaLT8=;
        h=Date:From:To:Cc:Subject:From;
        b=qR3LGm5Fy4mxpj0/wGLUvi1ICj5WmN1PF/mEc++yjkE3vG37ruFhJfFp4d4ib7obc
         jtf1+EwwsU8DYlvOFO8CR8CZqzfO7LxLELFYE0kq2tsNw5kSAM5JdPR5ofTGJHgomG
         wiJDfVO5xCHE0X5C+Biv5+i5LowiT91rWhrPz+2RPIT3Lfq/hqvszIsgv4eFSPBEOS
         fVb0zpLTErjHqN0CWFwzeJodCDe1BqPbyky5PCUNJuBxgFfEibzQ6CWulsFxV88PCk
         NFE8ITy8TyK0MfX4fZZkW8htDq7bpMuUXQKSda/f2t4SzR6LziB0hriO2XtPlGObns
         F9+fNaiZX1XjA==
Date:   Mon, 11 May 2020 13:03:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steffen Klassert <steffen.klassert@secunet.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Westphal <fw@strlen.de>
Subject: linux-next: build warning after merge of the ipsec-next tree
Message-ID: <20200511130325.44e65463@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H0m2nsbdEmsZqM7RA38vAZu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H0m2nsbdEmsZqM7RA38vAZu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ipsec-next tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

net/ipv4/xfrm4_output.c: In function '__xfrm4_output':
net/ipv4/xfrm4_output.c:19:21: warning: unused variable 'x' [-Wunused-varia=
ble]
   19 |  struct xfrm_state *x =3D skb_dst(skb)->xfrm;
      |                     ^

Introduced by commit

  2ab6096db2f1 ("xfrm: remove output_finish indirection from xfrm_state_afi=
nfo")

--=20
Cheers,
Stephen Rothwell

--Sig_/H0m2nsbdEmsZqM7RA38vAZu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64wH0ACgkQAVBC80lX
0Gxo8wf/aTJIp8KoEMmyZ8M7V9uxU1OUygBSgDStKkMHQjMqDwP/qchnW8uKmSzm
3tr+7tBaNAdlkoVYiPuC1gxRavueiRzEHff0y3a3twCy09LfdC0uRCh3ch5qLLdL
7nC7e+eVHGQhFj89mzB/GH4ebLQZI8KKVahlshGKEWUZm9nC6IWfTunkT4B6FGK3
+5Qf+3m5OqS1QOh0mESd6IhsrLKnTTLZIRuNj4fexo+LNayBl3hC73VyXydmB1Dz
Y/ZyuSI44orJrpN4tsNCU9E53ge/jLf8Wy3uWbuV/7s2y2OLhgz/OzISLcoBY27s
RYd/7uShQTCWLdShNdJrsMig7Znujw==
=sD9A
-----END PGP SIGNATURE-----

--Sig_/H0m2nsbdEmsZqM7RA38vAZu--
