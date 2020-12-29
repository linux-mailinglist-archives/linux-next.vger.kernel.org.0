Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD372E73EC
	for <lists+linux-next@lfdr.de>; Tue, 29 Dec 2020 21:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgL2UXf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Dec 2020 15:23:35 -0500
Received: from ozlabs.org ([203.11.71.1]:34051 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgL2UXe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Dec 2020 15:23:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D55Sr2mbsz9sWL;
        Wed, 30 Dec 2020 07:22:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609273372;
        bh=eHgCZQIxu+lT/fW5eiXbsC0wCd8aoqvPLoZK0h2m5aY=;
        h=Date:From:To:Cc:Subject:From;
        b=eVBx58J8Z4nVJ4I1Cc6u0D6M/KjL6ilZa/Nomm/j/qNqhO7R17QqWYh7713PMcghd
         H0VU+L8ZwW992VLTCDUt4ip/n1IbFvJxojRO5brJx4sp7P0aO1BLwflvuc3Tr0ONKi
         oewf5/IlWT2sTLVM1ndQrFRbyE27BMyAcFGjUBgxwICcgcXxhFA6tAnJygg4oIy8LD
         rh3bw0oF/9+Rog/od4GcAllrKyG0DLHXaRbVoVm595fw55e+6gWFvvDWJG9aaJtfRW
         kIKYfXEcRmPkVTnSkbUKKYfCoblPdyEo37z/glh6ON1+7+P7zraf+GY08PMFDBfrK1
         i0SHKnCHylTgQ==
Date:   Wed, 30 Dec 2020 07:22:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20201230072251.60ca2751@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VKT8_td1mKU02zv9njE.fAF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VKT8_td1mKU02zv9njE.fAF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  c2af4bc4f3a0 ("gfs2: make recovery workqueue operate on a gfs2 mount poin=
t, not journal")
  c8e56050f64f ("gfs2: make gfs2_log_write_page static")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/VKT8_td1mKU02zv9njE.fAF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/rkBsACgkQAVBC80lX
0GxGDQgAmE+O6jvlEj7miIDESeQ26KMCklFpcK5B4IrAer8/fQzaDZvi6zd1nFfo
/4ku4zWdTk/29uy4Bh82KuLbI+HSBu9pigWCt25kQFXU8ywjxcUHE7P398u9fJX7
xUI3tSglexNfDa83TJgM5EerrYpcaSJlbM5juZcO6ex5JG764oKMKevYoPT2H75H
c+YdeKaa2/no/cvdLo4nuRe+oiFeHdPTKvl/qKxv9KrN5YNYI4orG6jaVKHygXrp
RETjLupxWBc2NRgPJZXoGCMB5gIA2RjVNmvaiTrMq+1FQgcQ3zgCcKvUrUuChaSi
egK26VZr5QIJ0SQ/cs6J9J0c2pRSKA==
=DD5K
-----END PGP SIGNATURE-----

--Sig_/VKT8_td1mKU02zv9njE.fAF--
