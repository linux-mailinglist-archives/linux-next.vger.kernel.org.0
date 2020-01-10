Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1291366EE
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 06:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgAJFwg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 00:52:36 -0500
Received: from ozlabs.org ([203.11.71.1]:60663 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726096AbgAJFwg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jan 2020 00:52:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47vBw218Spz9sRQ;
        Fri, 10 Jan 2020 16:52:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578635554;
        bh=ZgObojzw/bkaVacqay+uyCForK3P1Xluwr5FWR62KkA=;
        h=Date:From:To:Cc:Subject:From;
        b=drA2EQW2G76LkTT8bxDqDXYCrdXJsXGpSuB1MOynNb7TBiaZowcxUCsKRyXtYHnXm
         nKz2AmrB8voSxk+wmlApOUrnKNgSWEEn+vgaWGQ+s7g1QIQ/TobQRDrsuMShWt/s4t
         UbCy4/5Z3AQCoZFfl0GD7GEHS180G5CvbSp5Kxh4RJEFWtdGpfUS4EGgd7VLAKDg+v
         yEEKo5cy2piaIP1OrdQFe2ERmh3Ql9F5WzfHzy3qJNOtZd6kv0kfu4RpW4aF5xKBQn
         XKGN1vZDJoWMsAgpmc29hb9pPwvoh3KDXKW0NkqVVxAUaSh6umPopWV5/2dNoGqYNF
         Pv07ojKFK7bUQ==
Date:   Fri, 10 Jan 2020 16:52:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the generic-ioremap tree with the
 drivers-x86 tree
Message-ID: <20200110165233.0ee71ee4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.MqWFzW0QPGZWg/nTuWGK=5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.MqWFzW0QPGZWg/nTuWGK=5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the generic-ioremap tree got a conflict in:

  drivers/platform/x86/intel_telemetry_pltdrv.c

between commit:

  ebc28a8e59ca ("platform/x86: intel_telemetry_pltdrv: use devm_platform_io=
remap_resource()")

from the drivers-x86 tree and commit:

  4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")

from the generic-ioremap tree.

I fixed it up (the former removed th referneved to ioremap_nocache so
I just used that) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/.MqWFzW0QPGZWg/nTuWGK=5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4YESEACgkQAVBC80lX
0Gw84gf/f+cJv+9SUPipLb6vA5WGY4HWIqZs4pxTyZJ/5yOs3TLMTkNX0GK7FIHS
NXq3Rd+4/RSbQ8aLH4XxhmqdqVkPj+KQxjMxUazrHgjBWP5hyUZjGUn7FoS8Il5Z
jMuqqijNa93xDjLZNICLyF7mZN8Xbpo7I5f7FPWZbEKT+klq9Iz2v7h/guk/IgAA
mmnh0VqQedoZvA9WiINU7Tsl5B8z0QJ0hSzUiVQKyIRMhEvoaJkIj867qmCt/c0D
z53E0oPjaUZm+2byd/a+KaY5N6m7lptU2kD/gsuLX+kuJ9lK/eWOsTlOq4SrmLTw
V6XuBYp/3UgrTVauCOgVWNSC8BTPFA==
=GpJC
-----END PGP SIGNATURE-----

--Sig_/.MqWFzW0QPGZWg/nTuWGK=5--
