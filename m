Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4E31ECAD5
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 09:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgFCHxe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 03:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgFCHxd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 03:53:33 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0F5C05BD43;
        Wed,  3 Jun 2020 00:53:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cLkg6G5vz9sT5;
        Wed,  3 Jun 2020 17:53:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591170812;
        bh=K/h/9ELU/WqLHzEcfZJw1d76ZxAJpdhNitfnhQVECEY=;
        h=Date:From:To:Cc:Subject:From;
        b=hTVt5rgZSPhrTk5Ehwtv6ra6ylTx56+y6vcsXerEoKF91Z/NMLl4t0SEZZqW/ngRe
         8wR5y46oUBzWQkzAOImQARa8OsgO3uZhh5LQgwct72VpMyScT1h6JFobi20LUKpk+U
         G1UnUU4CoPNRGmh0aQBKnHxYe4cbeb0Eina6T7Q2j95auHwhUyxFJPdqCvuQ7iplf5
         GttcU2b1IWd/yqZ/yexZoMNMXwYl4KpGRMUoc8Kks+GarfnyYyeOeat7Lt9HDr+6xV
         PARmhFmeXOLx0Mk2DbLPxJmInfnwzYGnoqv68qHhRVh5QWuRrAZ/uvIhruKviCInux
         UXrVWwj/MWoDg==
Date:   Wed, 3 Jun 2020 17:53:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Message-ID: <20200603175330.5cd49c43@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n5vUtELcNdO8Pw2YTcb9TQB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n5vUtELcNdO8Pw2YTcb9TQB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_userptr.c

between commit:

  17839856fd58 ("gup: document and work around "COW can break either way" i=
ssue")

from Linus' tree and commit:

  bca3ecd3b92c ("drm/i915: convert get_user_pages() --> pin_user_pages()")

from the akpm-current tree.

I fixed it up (I just used the akpm-current version for now) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/n5vUtELcNdO8Pw2YTcb9TQB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XVvoACgkQAVBC80lX
0Gx1Wwf9ErCb0+6YGAkYDJ06OFzEzND/kn6iuAVSzScuQoERU0ZzSv2yPuH1N48T
kvgAwxVu+N6UW+LEtOkxFajZMoNeJRwx94rDDmlGI6du3rmULe9FpjlMahlwP4kn
5mvr2ket1W3BNkM8bY9N+DEpBjZk9QUvSzTOexBusF2ThDXuo42ItsIba/ECuymk
zpkHUgWUWIa1GRgKcmvkoM84nE21+Z1I5BcLCBOuEHiqbtXtZgdltZfEiJuubedk
Kc4VGwBgu+kzdsCbmjWzKR00BFxdSuqRRthimgvzu7MXmJHkw12z3p78AVz57B/E
JbHfgVmN/Fdb2YVtSK7+tZxTbaUS9A==
=r561
-----END PGP SIGNATURE-----

--Sig_/n5vUtELcNdO8Pw2YTcb9TQB--
