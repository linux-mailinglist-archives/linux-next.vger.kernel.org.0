Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F66F1260D2
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 12:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfLSLag (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 06:30:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45977 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbfLSLag (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Dec 2019 06:30:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47dqS80dMlz9sPJ;
        Thu, 19 Dec 2019 22:30:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576755033;
        bh=6lBsCkHyaN0GoUoK5YulVgcI4GDTGjPtr5Z7BZ10PVA=;
        h=Date:From:To:Cc:Subject:From;
        b=TS12gv9GC0kxPJAMxsqZrOVOVNgj39/e/bSIOmXMqC+lDLVUK/qR91R/n7P+9r1T8
         Bj9OZvyeEVAnWGaKYGCVIabn4YsK7nCJ1GBwZ2kEq41hQaiP5AKw3gT7QR6NFE4wa6
         sdUZx8An50ewUOpOFjmtsfglzGdwv6yU60QlCno2OdPFT9zyTAwTdkCb2gqzxMU/jQ
         lWtvLnPiz06dph5B6g09oJJrgoXLb2g+ijzBGZFybpFRSZvnK/tAqiTuCYVRcxqjbx
         ulXDUgvtVaA95aOVpld9JqtT7vUv5fMGOh6m8Hg+2hJ/LpMZyAby8MCiapzx8i2zgC
         0PUlgcTVC3j8w==
Date:   Thu, 19 Dec 2019 22:30:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the
 drm-intel-fixes tree
Message-ID: <20191219223030.1747f04b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PVy.JeA=7gTRi=texyQFMjh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PVy.JeA=7gTRi=texyQFMjh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  987e379d7500 ("Revert "devtmpfs: use do_mount() instead of ksys_mount()"")
  9bd5ba4fe25a ("Revert "initrd: use do_mount() instead of ksys_mount()"")
  fa31001c96ad ("Revert "init: use do_mount() instead of ksys_mount()"")

are missing a Signed-off-by from their author and committer.

Reverts are commits too and should have reasonable commit messages.

--=20
Cheers,
Stephen Rothwell

--Sig_/PVy.JeA=7gTRi=texyQFMjh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl37X1YACgkQAVBC80lX
0GxWlgf/bAhMqppXRsR38Gc3y9hw0JI708FL964r+7yrzRrkj7VqrGPnXQDnUyZY
jCWlrmN1n/FFcQ5WLN56Ly0ZRIx7naaVYKNN2Yg9fAP4fcPX36WnvYOd/lF+XORZ
yF5LwD72vMISD07Vq4s8C+oqryZQESJzQPjb4hwS0Bd6/vzv+lnis8ECPO/pSMrE
5x58r4NcN/YcB83+NxxdakBI1Q1hxRX9b2vRwXFmHWzuD4OtxfcnFb0AiFV903G9
dCRVEAAy0Mx14hQq7cOEB9yzJka0YJYoLUwld/u9WIB1t6wWGRgkinz90OOrWL2e
iRUhZtFzNOBNJdbe9XJDxIfYlBY5XA==
=96zL
-----END PGP SIGNATURE-----

--Sig_/PVy.JeA=7gTRi=texyQFMjh--
