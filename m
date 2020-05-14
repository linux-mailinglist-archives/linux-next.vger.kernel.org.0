Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5365D1D2C72
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 12:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgENKUT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 06:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgENKUT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 May 2020 06:20:19 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C1DC061A0C;
        Thu, 14 May 2020 03:20:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49N6xB09F8z9sPF;
        Thu, 14 May 2020 20:20:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589451615;
        bh=noRZRjnnfbp+mfKpOGnMryo185orbohoJJNVrTEq25U=;
        h=Date:From:To:Cc:Subject:From;
        b=PceZRpeH0EsBAFKbImCABDJCfQFay6IENMjwJBJubtdrbnj0Wal/duC+69EeUIO/w
         oLKT9awK0whO1aaflQSow1MMSyLQH5RMUxgq+zHn/n0mAN0WqZETfgY7CHAO8VwyaD
         oXTlCKYY6EazyoRd/T+bSxdo2k6EZfpc526/YWlzYJOAfcxbSNWx8+J9GPL0uAxf7v
         4osbEt/P7USi9JvL/HBVgkKqciNdBGgki4zIM6fA0hj6DKkdGNAD3d4TjVK2bWK78r
         /JVAIiVujTHFWsRYTfGpCJM1qyWGTVVL4ZInNE33XmJ44bK9XlFx63SklsMmMzJJaB
         5nFrFfSwY3B6g==
Date:   Thu, 14 May 2020 20:20:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Safonov <dima@arista.com>
Subject: linux-next: manual merge of the akpm tree with the csky tree
Message-ID: <20200514202008.5ba89194@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0=mb1Ei=9Nc4ZXKGQq3j9B3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0=mb1Ei=9Nc4ZXKGQq3j9B3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/csky/kernel/dumpstabkc.c

between commit:

  18c07d23da5a ("csky: Fixup calltrace panic")

from the csky tree and patches:

  "csky: add show_stack_loglvl()"
  "kernel: rename show_stack_loglvl() =3D> show_stack()"

from the akpm tree.

I fixed it up (that file was removed by the former commit and show_stack
was moved, so I applied a patch similar to that used for riscv) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/0=mb1Ei=9Nc4ZXKGQq3j9B3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl69G1gACgkQAVBC80lX
0GzXqAf/VXDEKhbkNiunaHtlqmaVdfM+eqatoJeJgbpX4MkOodG9hdkys/pb9J/V
gluYirmQ13G2I7vLlU9OsnxCFdGrkkhDaxBwZyRenlEHNrlBbynxtxfinPXp6fJh
V0PMqXf0lcTcUZ5/K8d3PgDvvJhUtehbLrmlWUt7fcoJftETyBD+dcafsxcaRHMj
XcKxU9fNugjTwKqJN0W/zMDxL4u/OYNgKsHWxiYAR0eDPddUWyaP+G89iHb3j6xe
Divq6jiNC36qFjQGjum1D8egezVKCngUbHwiORLMHbQ1SRbrdGHmmqf3znh6nZ5n
byzP+PIo9CPDC0upf69mGbNtXcv/6w==
=z3VA
-----END PGP SIGNATURE-----

--Sig_/0=mb1Ei=9Nc4ZXKGQq3j9B3--
