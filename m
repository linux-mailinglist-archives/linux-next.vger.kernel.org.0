Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8F1813CFEC
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 23:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgAOWMv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 17:12:51 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43989 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728899AbgAOWMu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 17:12:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47yhQm1bqvz9sR4;
        Thu, 16 Jan 2020 09:12:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579126368;
        bh=VwvnsRF5QyUYzsy7hKl2SwdTNWpbDKTxHWiuRJ/KUU0=;
        h=Date:From:To:Cc:Subject:From;
        b=trCS9XoUbj2orwWa1DRQMMu8nasf2lh6PxVys0jL9R8tpfvZQCI8vzhZnyvvkL8x0
         nNFwrQnsggHhT9pjE6izo7/9pvMgG+D7Ywf0FmKXuSql3tDvvULc7yVdkf3d6EkEug
         6hzwDOPEMf0YfLFQ7fRfn4driTm0Xj0qEj/57r5+K7rssQFsFSf1TfkQQXiqKIKqhO
         ewR/VozV/CKjGhwGkfWM9UlZMTUTYnqrt9DEV8yPlgi77ve8VUqi2NGC3Tb4SKaHBy
         mX0LnO7ZpcEMjEZwKtHONAIUU4yMQc2OV92lmUdLEe+9Iap+p59frL3fbtlitgOLi0
         aX5y16EUHvFYQ==
Date:   Thu, 16 Jan 2020 09:12:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the xfs tree
Message-ID: <20200116091242.087b425e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tB5K.FQed=J=16rHUY7Q0_c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tB5K.FQed=J=16rHUY7Q0_c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build
(powerpppc64_defconfig) produced this warning:

fs/xfs/xfs_inode.c: In function 'xfs_itruncate_extents_flags':
fs/xfs/xfs_inode.c:1523:8: warning: unused variable 'done' [-Wunused-variab=
le]
 1523 |  int   done =3D 0;
      |        ^~~~

Introduced by commit

  4bbb04abb4ee ("xfs: truncate should remove all blocks, not just to the en=
d of the page cache")

--=20
Cheers,
Stephen Rothwell

--Sig_/tB5K.FQed=J=16rHUY7Q0_c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4fjloACgkQAVBC80lX
0GyFbgf/SIwCXuZtZ2ZSV9E8IC+eVzezoHsE8WZu5CVL4ryy20oS769RhR1EHc1H
LYh9P0lz/SEAYMKWEY+f+ubbQCergd6afMuvslD4ZHBGllxnQ8XAjOfUjOouHKwP
qhBwFkw72B6fFxxG3I/cRJHXrIR1BqR4R5Ojiqa8r7vOje2LKVGY5AhiVOJYsp58
zM1k+c7r5aivAilTQzhSxo+jfRfPLrnC4xOkGPhTQFF1MjYGAtVhMgrdMKh1JuFS
up9L0mARr8sgvBsjSWljvSlBE4F5/+nIiRw6RF4lAqLXKUJz+ol8Ie2A6pfOe7OM
AT4XutEInIkqyGLqR2qHf2Yq49tYFQ==
=Bzn/
-----END PGP SIGNATURE-----

--Sig_/tB5K.FQed=J=16rHUY7Q0_c--
