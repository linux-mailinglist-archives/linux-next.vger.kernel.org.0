Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5895F180DE4
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 03:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbgCKCQY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 22:16:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41481 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727506AbgCKCQY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 22:16:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48cbDQ4nw3z9sPF;
        Wed, 11 Mar 2020 13:16:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583892982;
        bh=IUNSc58Jz6r6hiWS7vwzc6j+AQinhAUb1odUaLgBQoQ=;
        h=Date:From:To:Cc:Subject:From;
        b=gikDt68mh47MXcNctlx//GD0dNwSONcLDZXZo42RCvULWeue4ye11pP+nPDibdyWe
         X6IbM9FH6EJSmyOE0xVLslZHK2thNJTUVWKE+YBuRQOAuejufKIhNotnZD61Nt50OZ
         /vHq5DJfaEIyqnCw2s2cue/r1yJES9q+gwL+kh5UZEQhcsCIzcHqBvxoT9uUX2dCZc
         gvSeFFptGrULG4F3nrg4UrxzO+cvWGDCEZkufchij435iWcazkaTWmvs0WyioqJ+hw
         EIOP2GJc2mUBlYDWOq8WeYWpdIu0yT6tQjJA2t0sbH3FB2PGAMPUIbGQtONrJ4NX0e
         YKe5EZJyJ/ENg==
Date:   Wed, 11 Mar 2020 13:16:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the nand tree
Message-ID: <20200311131616.41e728a1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0V/_r3uLAw0Z0QjKz.4eQAc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0V/_r3uLAw0Z0QjKz.4eQAc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) failed like this:

FATAL: modpost: drivers/mtd/nand/raw/ams-delta: sizeof(struct of_device_id)=
=3D200 is not a modulo of the size of section __mod_of__<identifier>_device=
_table=3D64.
Fix definition of struct of_device_id in mod_devicetable.h

Maybe caused by commit

  966d708517e3 ("mtd: rawnand: ams-delta: Add module device tables")

But I have no idea why.

I have used the nand tree from next-20200310 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/0V/_r3uLAw0Z0QjKz.4eQAc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5oSfAACgkQAVBC80lX
0GxGEwf/bj6EsI/hl1fveK/KX7xJ+ovgNbwjOVAJ+PPiUpiUnkTgJ/2FnCJ9Wd0g
Ijny1ky4hGEmd842/q7nOXK3Q9vpatQj9EukNa0dfuTVQcCHtJK0kDhWW8wg75v3
UfBNx5rmFr1HyP7dyOrdsdkVZun3jDQ/i/xGcbU9NJrh7qyvKdia1mI0QW4aWOlB
RItlSm+8LHle/Pn8D/r1Oj4CIZYuxYdHoNPkXHCL12KnHaSDoR5rOFY+pqLKtaBA
lGRzn8sInx28ux6BVJ9BkssmE8FySG+8VwML9LaxuzdbVbTLTOspppGBcx2SDsxz
nZsWag6QZI5RoiU+enwZbXocYxE8yg==
=EvU6
-----END PGP SIGNATURE-----

--Sig_/0V/_r3uLAw0Z0QjKz.4eQAc--
