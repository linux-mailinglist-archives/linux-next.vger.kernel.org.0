Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB0926CE84
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 00:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgIPWR5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 18:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIPWR4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 18:17:56 -0400
X-Greylist: delayed 345 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Sep 2020 14:41:24 PDT
Received: from pasta.tip.net.au (pasta.tip.net.au [IPv6:2401:fc00:0:129::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944C7C0611BC;
        Wed, 16 Sep 2020 14:41:24 -0700 (PDT)
Received: from canb.auug.org.au (203-206-41-51.dyn.iinet.net.au [203.206.41.51])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by pasta.tip.net.au (Postfix) with ESMTPSA id 4BsD7Q46SRz9BVX;
        Thu, 17 Sep 2020 07:41:22 +1000 (AEST)
Date:   Thu, 17 Sep 2020 07:41:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the irqchip tree
Message-ID: <20200917074121.2af9e668@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RqNR1VWtnxK_CcJr1T23cTW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RqNR1VWtnxK_CcJr1T23cTW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0502fd082b11 ("fixup! irqchip/gic: Handle non-standard SGI deactivation o=
n Samsung's Franken-GIC")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/RqNR1VWtnxK_CcJr1T23cTW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ihoEACgkQAVBC80lX
0GzcLQf8CE943EKN59HmWtzQKL2AXdfSITR7JBDBnjkskpJ2S5lIZ3vpKAL+OBii
VfKRGeISfaijXKKJrMhlyFhJ3e9G0pH6f6lyUX/z90hHQQmQFa06iJDJzFMY6dsJ
l5MY0I3biBHPpVlqrxdPN9wmbTey/mkMGRZXTiveGX2/jx+ThCjFoMwURZKNGi5+
ojUL4PWWWKBHhXv++bWnVOIcal2u6ohOq9RMOUf1HJ6PciKsoLNNPH1dhEpq5EIL
PTO/HoyX9ZqvMWR5sTRef0M7IzuVj5tpf7ENuXHmomQQz78Oi4KoBZ8QW2qhdl4t
IT1iKeb3PmdY1a0vabCsOcK7tCXBgQ==
=EGvw
-----END PGP SIGNATURE-----

--Sig_/RqNR1VWtnxK_CcJr1T23cTW--
