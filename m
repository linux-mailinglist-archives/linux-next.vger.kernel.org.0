Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579462D921E
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 04:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438448AbgLND5X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Dec 2020 22:57:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438400AbgLND5M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Dec 2020 22:57:12 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0311C0613CF;
        Sun, 13 Dec 2020 19:56:31 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvSHc0cQkz9sT6;
        Mon, 14 Dec 2020 14:56:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607918188;
        bh=A9a1+hVQ78tmjI7qC70Ny7zpbZPeedgfTn567KznCZk=;
        h=Date:From:To:Cc:Subject:From;
        b=VQvQ/RLynV3VanaebXXvFl/yR32wUHa2mDO9u5gof4h4AVcXRvkA19SUaHdOc9eGg
         dx7CYMQDG6bvmD6MMi34oqNSWvvJUBX/5NrBprQoJEIqE1dIxlyeB13WI9de2ZscxW
         40kMGHQIgj2dmO+4Me6B+8y6ow738tXfGrZPV86L5VkKYKESTTVJLvjOK8/6PLlqGp
         usEpJeRaFAyS39pBC3Jo9QvPep/beqd5W1ozjwYJkH1J8vOPpCb/B5WUgBbXdaoFhQ
         KqU3sL9xKp6vzwnE46FJnhxCZR344UZ/mF8S1g4eSGB06lC9xdhlAUiiI7WJPrytDM
         yY2PZqf0tzFZA==
Date:   Mon, 14 Dec 2020 14:56:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Song Liu <songliubraving@fb.com>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20201214145625.0af40a87@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q4IYx7eh76.4W5XfQATSv=O";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q4IYx7eh76.4W5XfQATSv=O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/md/md.c

between commit:

  57a0f3a81ef2 ("Revert "md: add md_submit_discard_bio() for submitting dis=
card bio"")

from Linus' tree and commit:

  1c02fca620f7 ("block: remove the request_queue argument to the block_bio_=
remap tracepoint")

from the block tree.

I fixed it up (the former removed the code modified by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q4IYx7eh76.4W5XfQATSv=O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/W4mkACgkQAVBC80lX
0GwHGQf/Xhg3J+DSKqLSyWzpG7GlpQ/WrqnXNmQXazVYXMDnZvGR6dNHexr//aw2
xNNeSnmDYJ3M6RgBlVJLiTYyNXjiePRyYBkwlWcEgcuj4xY9o667aE37kKPVp/uX
Fjlras1xOLaX8WAsIuwMxaHZ5C7WP8KfID4zRt6Eb2PEdrTeRfCgWQiOKJ6q/8ue
GSxH6sgCgDU/2YGaBfSNtYBu94eF9a/yVDQ8f/7q57QAZh42KVW9YxCzO9kNa2wK
OsMFmsFBmVvTrISaFRyBLzz+dxmoAdWwqt80W/pGbMBziq2wmok2502vNOfjWRK6
/bbBiqayuY9viWRr+fdcdg4wrFhhPg==
=6bmh
-----END PGP SIGNATURE-----

--Sig_/Q4IYx7eh76.4W5XfQATSv=O--
