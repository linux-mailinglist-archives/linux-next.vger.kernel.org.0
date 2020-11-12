Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C712AFEB2
	for <lists+linux-next@lfdr.de>; Thu, 12 Nov 2020 06:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgKLFjL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Nov 2020 00:39:11 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40439 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728849AbgKLEcg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Nov 2020 23:32:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CWpbz0Rpkz9s0b;
        Thu, 12 Nov 2020 15:32:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605155553;
        bh=PDWmW54yXwo0yC2KfQdz8KGggoSumwekoMjsgIgwcLI=;
        h=Date:From:To:Cc:Subject:From;
        b=kKBT9TqkxWKo0yw30ovbfjcar4UhI+MdPVivwEHB+4onCWJvsrUB34RUREj1CvdsG
         lcnFQApu+uhzn+OsTGqGQwqap3MQBOwd55nTPtlpdw1deSjrYz2iIAXxNfORbVkvq1
         5f9CbotFzFASB+bB/DjMjQfHnLIiF5DHznbZgf+F+r+3yp3PwatvrzC2DRJ6OwkHmq
         Wf2A/BpbUZ+em2Rt5I/3KC0HBXFmOLZNsxOqqZIhyKT1oKe0b3yY97xGG+7sqVjCqu
         eIlgGI6oqd5oTuP4keACYajn3mv1N+Vq73aEBC+djCl+JcY2VjG7s5LVsRa7ULr9ad
         YkFksjCDnV9mQ==
Date:   Thu, 12 Nov 2020 15:32:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20201112153226.10561c8d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XTGP/.Nns9J1GX9AqrF6nJ_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XTGP/.Nns9J1GX9AqrF6nJ_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

block/genhd.c:439: warning: Function parameter or member 'probe' not descri=
bed in '__register_blkdev'

Introduced by commit

  3da1a61e7046 ("block: add an optional probe callback to major_names")

--=20
Cheers,
Stephen Rothwell

--Sig_/XTGP/.Nns9J1GX9AqrF6nJ_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+sutoACgkQAVBC80lX
0Gz27wf9G625GLonUt+tZvYBFhzpFt73Gd3P418b9O42Wq71eTGZt7lAfcE5qExP
ZAsY4ew8KlKtxElWYNX0NralD+gluS1r/eiIkVey2j/BCn3fRVWYx3GexcvwfrwI
LiqJUdSzSU5l9H5otVGk3eUwt90tNpDMAPYAYhGi8uFjzep5FtwG+yRPwMRwcP6s
UoQy8X8Db9BF7QTNF1gOKzK6K7qPDJ9ga05RymwvFldjjwMNX/palb6ENyIgoPOV
jyYA3/gvQOGzj6jjEaxjoEKLgt+bEip32EbvoPw2heT8pD3wT3uS+jN2eBk3j8d1
oyXP8pl+jZ1KPMZC40YXPNY4tYTAPA==
=m3j4
-----END PGP SIGNATURE-----

--Sig_/XTGP/.Nns9J1GX9AqrF6nJ_--
