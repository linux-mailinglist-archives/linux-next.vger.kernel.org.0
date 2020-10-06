Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1442284532
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 07:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgJFFGh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 01:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJFFGh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 01:06:37 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510D6C0613A7;
        Mon,  5 Oct 2020 22:06:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C55682Jcgz9sSG;
        Tue,  6 Oct 2020 16:06:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601960793;
        bh=XDG4Ak+HG0NcqQMPWvutPzklTDbFLF3B5cH8nGgfJKs=;
        h=Date:From:To:Cc:Subject:From;
        b=QP84RdHqbOwpwL5tQzvPxVjtjY/rC7EsvSQ+ttzPJt+zSEp/lIr4JtRUvRkPZjYTn
         YYY3zttQJAKAd2yRv68zv5tPS0Z6vvi7FNGxkA+uRmJClebqhgKOtt0tr++P9c3Gh/
         h6l8QtnyLfkNVuCrKIzS6lPIDn7tMpbYUin/tko3mlXuFEBWkTb+Xj+uTIgY4RVWeq
         tepzB+PAltPFWkAoy0EPY8ettDKKco6tUjDe50hdjPpHk3IXk3qbzks19AvTe2bk1A
         esw5jqmOQUKsi7adnNoVShaZelRKd7Gh6BHyPRxFymvdbDBUkXiX5I8AXgZZcqwzRq
         T3CjqY2Ppo4kA==
Date:   Tue, 6 Oct 2020 16:06:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, Johan Jonker <jbx6244@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: linux-next: manual merge of the input tree with the arm-soc tree
Message-ID: <20201006160622.601d8c28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NbAvJVywx9r.KXIBqwMf/gn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NbAvJVywx9r.KXIBqwMf/gn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the input tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.yaml

between commit:

  cb1cc137a2c1 ("dt-bindings: Add vendor prefix for Shenzhen Zkmagic Techno=
logy Co., Ltd.")

from the arm-soc tree and commit:

  8f445ffa851e ("dt-bindings: input/touchscreen: add bindings for zinitix")

from the input tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6242f1baa24c,bd7b2d404124..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -1214,8 -1143,8 +1214,10 @@@ patternProperties
      description: Shenzhen Zidoo Technology Co., Ltd.
    "^zii,.*":
      description: Zodiac Inflight Innovations
+   "^zinitix,.*":
+     description: Zinitix Co., Ltd
 +  "^zkmagic,.*":
 +    description: Shenzhen Zkmagic Technology Co., Ltd.
    "^zte,.*":
      description: ZTE Corp.
    "^zyxel,.*":

--Sig_/NbAvJVywx9r.KXIBqwMf/gn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl97+04ACgkQAVBC80lX
0GxyNwf/XNHm9EZwwV+kaE16ggcql6aE/crWZJYlI4P4GaWYSrFRJwdRy7S/Pwqf
dI2cnu4iErMp/Nt6Fy9PFNWCCcEVfgWR4C3O5b4QEsUJI6V8HP/yR9w/MG3FnVey
mtIGzIH8ulEreupfshk7yEvLpH2w06U/OWuuHlVDHpGlR1C4hMC7Jnrw+nm2oUDf
RXVzQD1NdCZ51/rcupCXbuGQiJFOP3VPUcSPAMUW4aTGQYbPQzGUghRow5ReU1dv
gjE7Qg5+j1WsuWDSlX6OIsJvvWVOKYc+iukBX/D8gWfhIgFgg6n6lDsfky2xtA9L
nSHv7qIdJoZOEwxYycQCh/3jLe1lrw==
=evhw
-----END PGP SIGNATURE-----

--Sig_/NbAvJVywx9r.KXIBqwMf/gn--
