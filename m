Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DF81CCEAB
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 01:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbgEJXY5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 19:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729126AbgEJXY4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 May 2020 19:24:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD6AC061A0C;
        Sun, 10 May 2020 16:24:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L0XM1Sbrz9sNH;
        Mon, 11 May 2020 09:24:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589153094;
        bh=vV9k04WFwMB+UjRxfNNv5jSFprCu9yxZkIT8Vp9Y9IM=;
        h=Date:From:To:Cc:Subject:From;
        b=ag6DvP0xmBuO+nKkKilufxDIW/XsGkFs3Vz7zUJk086MqDn0nCq11jGgs/XL6sGZN
         KiSP5f3dpU9jBTsxI419VTmRyB0D5azM8zQGQAq9orok1O5xX87+eoGXscu3eZ8Usu
         PdaDMKtN1qXSIwSc1aUEOoW/6HIFCPuPjqJ6GGgBJRLGUE21z3BqKwgYUzlgq+tWlx
         oeJLtPNTugiuX80CBr/qDnyeFceWgnwG4A8NIQnut6xu3hL33Hr5aKTJOC5Xia8wux
         o3pDmqbrqbpxxO5d011djPAv671Zv1AOnWIt0LVwzkAMxkI/7Ly5NeKcEaiA1NTaqL
         zmC/CG5F6/gtA==
Date:   Mon, 11 May 2020 09:24:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: linux-next: manual merge of the mips tree with the clk tree
Message-ID: <20200511092448.65c5d790@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z4I+Np8IVo026EuKEaw6R+d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z4I+Np8IVo026EuKEaw6R+d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/loongson2ef/Kconfig

between commit:

  bbd7ffdbef68 ("clk: Allow the common clk framework to be selectable")

from the clk tree and commit:

  c02e96304451 ("mips: loongsoon2ef: remove private clk api")

from the mips tree.

I fixed it up (the end result of both is to remove HAVE_CLK) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z4I+Np8IVo026EuKEaw6R+d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64jUEACgkQAVBC80lX
0GwnZgf/fAGEPcUQPTHFCF6xZT+/VQroPntTMAULD5Fc0RZkZLt2t4gBZOHZNJsx
eMduUm/HFpIK10yR7wbUxhKWNhOVA4mCO6tEE8Fs/ovs7s6oD5DrRzbcefH71rZh
twn40EnuH6YQVk+wKxkaKwYwUNluLUSKiFx0CouyCP42C7xVQ+Xsl8aJ9sPmIso/
rP6ytTV9pgkZLbQBfUz6aRGQlVZvzmzMo7497T3f+Kb28EbhuScowhAqmEp/qfwC
eUb6sZxzsNEA0mmwq+4OGOE/hauuXFSu3pNAHmAXUqnMhU4EY0zxG5OVfQrh1zzm
YInDw5MadrJs10xSxGERP1HY3+O5gQ==
=Ovaa
-----END PGP SIGNATURE-----

--Sig_/Z4I+Np8IVo026EuKEaw6R+d--
