Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878C11AD2CD
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 00:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgDPW24 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 18:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgDPW24 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Apr 2020 18:28:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6397C061A0C;
        Thu, 16 Apr 2020 15:28:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 493DQs0vBCz9sRN;
        Fri, 17 Apr 2020 08:28:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587076134;
        bh=EpscCTIqrow2PlSw0PSXkc8ESSMhpE7S/ZWqsBaA5Nk=;
        h=Date:From:To:Cc:Subject:From;
        b=HtIjNc/4L3+YYVsI3vQDk0nmXyV2LztsuahapBCD0JqvaZAaFZKqMoghURKRbwsbu
         OBK6w13Brmvfg9vXb9KBdx+4Ns5FKA+ylbIe0JWxYQStVwOicIInN+/ppDOfSQ50B6
         hoC3TgjKkS+wHJH2n12fpXmzrw0+dUBAci5ibaa/dtwxMxI04ddkhPtF8q0eprT2j4
         mG0RSR7tQ/UvcnKKkheHmceFL7cO54UUUfu62PAW3UW0mj63bmPJTFuiPnUGXD0uP4
         hLkGa14fjklRgAtE3PBnZh998Vj223sCuPltEgIzvlX5bcA1Ss6BdU14U827grlIhp
         HbH5Wo098u+Gw==
Date:   Fri, 17 Apr 2020 08:28:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: linux-next: Signed-off-by missing for commits in the gpio tree
Message-ID: <20200417082851.7d68e9ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+ql/69sBZx4m90dkvoIzbhA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+ql/69sBZx4m90dkvoIzbhA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  fe5dfc6af3eb ("MAINTAINERS: Add Segey Semin to maintainers of DW APB GPIO=
 driver")
  49a369f94046 ("gpio: dwapb: Add debounce reference clock support")
  cbabbfa160bd ("gpio: dwapb: Use optional-clocks interface for APB ref-clo=
ck")
  fb7e1fc1b806 ("dt-bindings: gpio: Add Sergey Semin to DW APB GPIO driver =
maintainers")
  7f51dbb7cab7 ("dt-bindings: gpio: Add DW GPIO debounce clock property")
  179587eb757f ("dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema")

are missing a Signed-off-by from their committer.

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/+ql/69sBZx4m90dkvoIzbhA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Y3CMACgkQAVBC80lX
0GyLNAf/b86EB7v+B95qQdpb7Hn6DJ6NWgg/NVi8BsUPDdsIZtnZhdlkVNuJYJA4
VNfCKeY82ts0mK7lef6jBjE5Q00G8ATtRi7pWtsG4dO49ZM6mBW0akc8C47zplTb
I5MrMkZcDdNBbEXuPPkGjUDin/N0/Dc8sLu1JgCJpMKjToQINnEEBE/Vv2RNQk+N
jUFS4zUX1nn4XmslYVfz9PBSGVxAVvzrKIWGshksO2BQkIyJb5+D1QZJzg6G9AFQ
Eldg+04lEA2Tbzbn3sPxs+BNsh5QIvNyOLR57vMIu3Q6aSen/krCtZw/iQgvMko9
HE3+57E7lXukPDKZtLhXUsan5LMiTQ==
=hLqk
-----END PGP SIGNATURE-----

--Sig_/+ql/69sBZx4m90dkvoIzbhA--
