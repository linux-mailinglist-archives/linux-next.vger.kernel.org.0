Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C40326CE87
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 00:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgIPWSJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 18:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgIPWR5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 18:17:57 -0400
Received: from pasta.tip.net.au (pasta.tip.net.au [IPv6:2401:fc00:0:129::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504C0C061A27;
        Wed, 16 Sep 2020 14:42:24 -0700 (PDT)
Received: from canb.auug.org.au (203-206-41-51.dyn.iinet.net.au [203.206.41.51])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by pasta.tip.net.au (Postfix) with ESMTPSA id 4BsD0d72y5z9BWQ;
        Thu, 17 Sep 2020 07:35:29 +1000 (AEST)
Date:   Thu, 17 Sep 2020 07:31:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Gruenbacher <agruenba@redhat.com>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20200917073119.2ba71263@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wVAK+=kgg.RWSiQAUefVR6M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wVAK+=kgg.RWSiQAUefVR6M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b15a7defc994 ("gfs2: convert to use DEFINE_SEQ_ATTRIBUTE macro")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/wVAK+=kgg.RWSiQAUefVR6M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ihCcACgkQAVBC80lX
0Gy7ngf+LnbtO8A1oddNcsoXMEYnVEOnpGas9X2OCibxJlCVzYPdYU48vBwndKEG
T6GJu7xXxoyti28hgAWujR7xAHKwtkozddrnn+ws7FoVg1sIWnbbSNrs+1S45/QY
wzGi2zy8BK5/68CYUvyRv8GoVNHdTUtGDSKzC1IifEb6YBFi5MmTjL6uramEk9sH
YX5P3kw2CG8CZXg9oZZZp0j4d+CxIY0zN24v+e2ayWujKdx/IYqWuXXewz8TYUeV
zYomqKA1H7EnGgbcb3QBgx3jbbIJ3c6o19SxKLknLrhuh/q95LSTi+1/wzkPbBdp
/3/qWm/xNKk1Y9uOqrCt7vZb0v72CA==
=ZHmg
-----END PGP SIGNATURE-----

--Sig_/wVAK+=kgg.RWSiQAUefVR6M--
