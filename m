Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0B130CCAE
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 21:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240373AbhBBUED (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 15:04:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240357AbhBBUD2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2021 15:03:28 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E9BC061573;
        Tue,  2 Feb 2021 12:02:47 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVbMS3dt9z9sWR;
        Wed,  3 Feb 2021 07:02:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612296165;
        bh=K4yTIb2JP5VClEiIv/GsnIq/Q4ux0b0nxbjJvKijwgM=;
        h=Date:From:To:Cc:Subject:From;
        b=KbcSwYtClAJH3BPTuUNWdWH49wNqiJmcTbJuNcdpC+94lr1DQ9A5VxoI3z6iFwYWf
         weygt7PvFJ1FjYfChNEoQG7TzNI7u2JdzyjvQr/6S9hniPMdSgS5BvOYJy2bFX+CDW
         jVQ1lGNVF/cFsofTBIHDamV7FFHpZ1j7tzR5ZA6kv80/7WgT7OCRQz6+YfqBLe/8bx
         3MCYM2WOj9HgGlRltN88aq6Yklnluc++u7E72bf84XObDEwT29UnEXCVEvIzqfsDQW
         WcQGJSyvzqlJAGP2bh9T7DALkDm2Obo0seUhD3YR7KdCc89QgoK977yStEBKAuPlkO
         u92ElUy0hv6vQ==
Date:   Wed, 3 Feb 2021 07:02:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the drm-intel-fixes
 tree
Message-ID: <20210203070241.657dfd46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dArlrtFwRPtiBZ=NqSg7Roh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dArlrtFwRPtiBZ=NqSg7Roh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  44c5bd08518c ("*** HAX FOR CI *** Revert "rtc: mc146818: Detect and handl=
e broken RTCs"")

is missing a Signed-off-by from its author and committer.

Reverts are commits as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/dArlrtFwRPtiBZ=NqSg7Roh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAZr+EACgkQAVBC80lX
0GyROwf/WvQJxPhgsUrnWh1cFx4/eizUDI7wkS/oMzGOnztgiJ0y6T8b7fgLU343
d4codFL8gKFM9zleir6oamILyZZw9fQTAy5OdKE3f4ka3PqgtESb+vIDhZrOxqLM
5Uj6NVUzjU93qaUTjqqfDnr3AHLcoZj6+9Bry+1A7b5OWbj8NzIcr3e+yU0eu83W
62jxdTvboJowMZFpE9ZAV+5vEQ8UdaC2qtvWWQE4qAddOhy+HOXp0ao7sjlIVrre
cxwxXW1AQsh3TOakeTplIN3PWSld2Xg9yhfE54iB/VH8CcN1o/V+iHVjfJLdGZ+T
gFebxDdRTW0JrQ9K7B8lV08eCoMrjw==
=Vgcj
-----END PGP SIGNATURE-----

--Sig_/dArlrtFwRPtiBZ=NqSg7Roh--
