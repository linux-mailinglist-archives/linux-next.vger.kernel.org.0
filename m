Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6692A6FF4
	for <lists+linux-next@lfdr.de>; Wed,  4 Nov 2020 22:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgKDVzC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Nov 2020 16:55:02 -0500
Received: from ozlabs.org ([203.11.71.1]:52639 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbgKDVzC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Nov 2020 16:55:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRL6W5bpPz9sVD;
        Thu,  5 Nov 2020 08:54:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604526900;
        bh=1fDuX7HphIO6IZ4atzF22WnH+v+pV7wkqaHbchy7UFk=;
        h=Date:From:To:Cc:Subject:From;
        b=SweN6oxjTtmZqW2E2+9sfu3iPB7J2XzOrkllVMEMAh+/mZVMiMKGk5OmfELvGjjkG
         +Q6Q3JvOxAaLRMTHj3e0gWBcGiQhOdglZU2IIoS+U/FEz9UYEbohqkyQw8hx0QAwe5
         YaA4Fz7j0/Vl8hpk3GwiluceO0ybTvFgK41uRih+ElHqSvW3x6XZNxQMkn22mzD4tC
         Yhi2Dfo47jtAxxKl58sAPcagnuEPR2LxdLS83ulHiPXaCwU2KcwGoK3EXx8zqkj4Pw
         SGtm2yFooHYNhwXgGO50u9vkDxs1mWjDNwWo0ByCZCR4jM6vcPNqWgI1m+Dc6e9Gka
         N4y120ov59v4Q==
Date:   Thu, 5 Nov 2020 08:54:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Leon Romanovsky <leonro@nvidia.com>,
        Maor Gottlieb <maorg@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the rdma-fixes tree
Message-ID: <20201105085458.5addbe44@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jzu/OvMJgbBMpg2gAz3p+E7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Jzu/OvMJgbBMpg2gAz3p+E7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma-fixes tree, today's linux-next build (htmldocs)
produced this warning:

drivers/infiniband/ulp/srpt/ib_srpt.c:630: warning: Function parameter or m=
ember 'port_cnt' not described in 'srpt_unregister_mad_agent'

Introduced by commit

  372a1786283e ("IB/srpt: Fix memory leak in srpt_add_one")

--=20
Cheers,
Stephen Rothwell

--Sig_/Jzu/OvMJgbBMpg2gAz3p+E7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jIzIACgkQAVBC80lX
0Gz7IAf8DYszXuNICe4EZ5WJl9/zbisWiJ5Cj/sPRYNGW3HzgUcmJbVGBn7Ihxp1
a9OMOD5WLBqjtshvChTQKGYb2xPSUtR3pQUmJNVR3AZTWcjVvSZ4QegwGAhNu6kI
FwJC8+o5qcJC17IKPJivZzEgdwhqvdPBA3ELnTApQe/SQNsG06JIF1EiBJhYsceb
ZfiiJCX70vgZOMowyjOHQcrhbi9A6E3KKTvWCBSfOeRhxFz3D8T8wzJbZIPWfyNY
V5jwXw/XkAY5RNRl+cvArmBC50O99zQkGxK2WcrsTUD3l4NyXJGhCRyJRyeMq0FD
LMqWbNp+7eaDwLHnQSKjwxkXJ0co5Q==
=Q7Ae
-----END PGP SIGNATURE-----

--Sig_/Jzu/OvMJgbBMpg2gAz3p+E7--
