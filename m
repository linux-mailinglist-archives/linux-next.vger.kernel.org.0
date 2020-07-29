Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC96231CBD
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 12:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgG2Kbs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 06:31:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46055 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgG2Kbs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 06:31:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BGqbP6pY6z9sSy;
        Wed, 29 Jul 2020 20:31:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596018706;
        bh=t0maApQGCxnVpZN64FrXzhSQq308d3DnF/qmn/ohK4A=;
        h=Date:From:To:Cc:Subject:From;
        b=MZTp+V4Zv9XcGGC7vKwcaqySHDrPJVpUj+NneEWnFaq0dPaVDU/Oj3fMBJ2GlIyyD
         nE4mN5E6KPuTXc77ryTvmeJ0MuyZe8I+gyWj6n54kRfP+cw2XIAQm5bAgFgKVusEtG
         AS9Fi+lAZItx3kUu44ewGWZcYwqlD3DuSrUaKE4uJwaJ1FGwo23FIF2PB5m64OFEXC
         vPOg+v8IYQoTyGDwDMhIZkI/mR1UJtjrs96T4J9kpc7ug1NBznA1oGnMvMz24DVzmz
         LrWlqE0jS86EXvk9oOpzWPEfYe7vHxOlzVqnCKTG8KRqIKqsXnrfOA2QkLwhgGUK/L
         Udjuff1O3F9AQ==
Date:   Wed, 29 Jul 2020 20:31:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh@kernel.org>
Subject: linux-next: build warning after merge of the mips tree
Message-ID: <20200729203142.18248463@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8u=t1DxTFtfH_cyhjn0PVya";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8u=t1DxTFtfH_cyhjn0PVya
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mips tree, today's linux-next build (powerpc
allnoconfig) produced this warning:

drivers/of/address.c:104:21: warning: 'of_bus_pci_get_flags' defined but no=
t used [-Wunused-function]
  104 | static unsigned int of_bus_pci_get_flags(const __be32 *addr)
      |                     ^~~~~~~~~~~~~~~~~~~~

Introduced by commit

  2f96593ecc37 ("of_address: Add bus type match for pci ranges parser")

--=20
Cheers,
Stephen Rothwell

--Sig_/8u=t1DxTFtfH_cyhjn0PVya
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8hUA4ACgkQAVBC80lX
0Gyt6wf/TYJJ2pMxrB0BoOyK9y8Vg38zi2cPgwg18uSlAJHQRawceD/EL5vKHGN0
cJ7LRvbJeiHNrQ9sc6cK+EWhjgfmX8WTXmf/F4J8x6wQ3i7poSwR3RKtontt1Y6L
iDiKfpcxCuB5CYiJ6LyO3Gzq+bM2WEM4+TaPH+jK+FxkCQKz8Ypi/2ACQoyH+tQ7
9dEw2dzGneYn/VX/UmbKNyFgiw2wmBp+VBRgbgAuqzRbNMjh4lX9+zkQFDe7d9FU
RhHGm85FMSwXLeecOK3NZmwFUMU2qng87fXxVkmRBk+m6E5kJziVDNycPOXw7IHb
MWnKXa9lQ0GVVOGmz0YFIHpHXylQNg==
=IfPA
-----END PGP SIGNATURE-----

--Sig_/8u=t1DxTFtfH_cyhjn0PVya--
