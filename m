Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D77540A515
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 06:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhINEF4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 00:05:56 -0400
Received: from ozlabs.org ([203.11.71.1]:59137 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhINEF4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Sep 2021 00:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631592278;
        bh=6cFMXTO7GUbRiRZP5uyaTFwAyl6nmgMp3L216E/i7IE=;
        h=Date:From:To:Cc:Subject:From;
        b=E2TqC42hd61gBo+YV4FOuAkP0lX70tS2eZTv9XX4aNFxOxvSk8TKE2/lSR7NhTTh3
         1BlvXGYfwACChch/4kzs4mZ+7oxCleW0e7o6lluMYN5saanMU6UKOnZ9zHrK0eVON0
         ql/fRmg1DRhwpKAQVER0qVRLSwqUPi91igBjZ3Ve91QHEeKqNtpAeawzyJZz/hk8Xj
         hbq/rWNhKN2pHL7Hhartq4w2BebZgIY5tyWH/eRjCLwKXWqmy/uIWn+0w1TKY52epz
         GA0SbVEjgcxMEZuEZcss4oDWcVyfqkifugve8w7YszNYLNLcAccBZsrcdIxrbkRVv2
         dJEv3npeIW+QA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H7qVY2nTsz9sXS;
        Tue, 14 Sep 2021 14:04:37 +1000 (AEST)
Date:   Tue, 14 Sep 2021 14:04:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Phillip Potter <phil@philpotter.co.uk>
Subject: linux-next: manual merge of the kspp tree with Linus' tree
Message-ID: <20210914140435.586dbde5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aCEXiuy__3xteDPlx9O4OwU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aCEXiuy__3xteDPlx9O4OwU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  drivers/staging/rtl8188eu/include/ieee80211.h

between commit:

  55dfa29b43d2 ("staging: rtl8188eu: remove rtl8188eu driver from staging d=
ir")

from Linus' tree and commit:

  cdea12025e0d ("treewide: Replace 0-element memcpy() destinations with fle=
xible arrays")

from the kspp tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/aCEXiuy__3xteDPlx9O4OwU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFAH1MACgkQAVBC80lX
0Gx2rQf/eDYWXngXPYfnjgTqfBosOOguixzB2q/xI3ZJewpgutUmnaS2IZ2VhCqJ
TYcDWIYsQcEuPJiIymz5mMCFMGDXqeRbc6ObEgu7payRUguZh2+n8t5Bn/aDfGjk
TZYIx5x2+cLoLKeuxnt20zwwxjgcov4kyYKox4gDM6EecYk0LzadKGOexQOAepUk
H3Uq84WrcRVn3PDpAhPflfR7sdsY8vYQngIgMveu0Fl3eU7wBALj4YQivYZKwOH9
qmGxJs51VTsOYyjHBiKzf+0ka70yqYHm959hXghdR5OBSWZPxGHncBEllPhF1f9Y
BE+x4zqORvX0eap9sRCps+nfK8Rmhg==
=/uUa
-----END PGP SIGNATURE-----

--Sig_/aCEXiuy__3xteDPlx9O4OwU--
