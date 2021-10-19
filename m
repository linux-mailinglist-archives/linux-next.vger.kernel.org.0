Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7EB432D57
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 07:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbhJSFmP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 01:42:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60215 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhJSFmP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 01:42:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HYMyV0W4Fz4xbL;
        Tue, 19 Oct 2021 16:40:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634622002;
        bh=wVdNZfzP4GQ9SUiFgAyHrh14uvIPK6SvUSVGixhWo/U=;
        h=Date:From:To:Cc:Subject:From;
        b=FDABYmlZa6mGzbniCZYdV/AAFyLk9cGAgcRgnXf9kahNdaqOJImkX9dJClhIqdaQF
         kyjqTGW742BXffczVmXOelcV3m9ylfJtL/Jtxd0FfCArFG7VX0KBetzVeWGeeWEZTl
         MrjvowA9hyxOZO+01Fb1PqzXoRAgvxypJ4MNjiYhseswomhMphinVZAPya7kVYp0BE
         58cdLmrExX5W2C2ilf+JgnPxGW8GXtNCYIKuQ3TOmtH7kcISXQq/+eKzFk47HKissa
         3UjlOFzebRwi+tWCRAIvGWvgmmpQxeUD3VrUD/rn1UOOF3hprKiZ50Jdx3mczf65qC
         FmmUyTSza1h5g==
Date:   Tue, 19 Oct 2021 16:39:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20211019163959.3737ceb4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r73kAN7YyeM/jlj4zhCcCh0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r73kAN7YyeM/jlj4zhCcCh0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced this warning:

block/blk-core.c:1082: warning: Function parameter or member 'iob' not desc=
ribed in 'bio_poll'

Introduced by commit

  5a72e899ceb4 ("block: add a struct io_comp_batch argument to fops->iopoll=
()")

--=20
Cheers,
Stephen Rothwell

--Sig_/r73kAN7YyeM/jlj4zhCcCh0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFuWi8ACgkQAVBC80lX
0GzAGQf+J9Tzdgjc/dpquHIuuGYVn0lXKngNsuILVNbDfCjrE+5dCqyTknc084wI
rmRI6ackcmQ2QgTNoeKZ99t9IiSAIC9+KTxUY18D6FqbPkCTUoiOdXsLagbc7S6y
h8pysKY1Hb4JUl7zPV/4UBeOf2p1WPK/j1Py5sZWlnzlOCQO7GcwK3XKae5sBse/
I2q683snfq2KZJLDeGnAvHsZ6+iLU3dxgOg+1rLkxMNmhXpz+E33OM/4tSRXqAzJ
kz3d/VlHqLu+uml8fyRA/TkItyyUm9XIAlvZyayaSd+YGm7UFTg8h8dSuTrJT+8A
qqbTYFz+DqB6NnnD2pYpibhQ+w9tzg==
=sfGS
-----END PGP SIGNATURE-----

--Sig_/r73kAN7YyeM/jlj4zhCcCh0--
