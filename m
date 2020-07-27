Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB78022ED8C
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 15:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgG0Nij (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 09:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgG0Nii (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 09:38:38 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE03C061794;
        Mon, 27 Jul 2020 06:38:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFgqv3gfBz9sR4;
        Mon, 27 Jul 2020 23:38:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595857115;
        bh=lrjDWpJO5W1X98Ew79jqZzE+XYvUfd6gy7qsjnl8u74=;
        h=Date:From:To:Cc:Subject:From;
        b=cmbsuozRy6HtgiJ/fAbJpPKx/9jKpgYUOkuFbVe7xLGyVaQpDNVGpvdNvIP89tEQm
         NuhKPUmHvAN+ZpkdrXahENkaUwlepvlmJvy6r5xvOljt2mTP1+ti9ijDedIAI9viF/
         vrNT5G9usTBAPbCd2mit6ZFgt2GMU7tGCJtKrc5IgiCwL58j0qBIqTOO4jGoIwxAqz
         5WzvNKFel8dFVukmbphISqipOX1OjExEj6CVFONQcWs+Nt8YDhwXHgncA/08iSOE4a
         dEXht1xN9XqYpg//KnhMklhaZBh/tNXs/m0ary0sPxuBN3IFdhOpzjzx1TVBCKUkde
         HkKVaeMCAjQRg==
Date:   Mon, 27 Jul 2020 23:38:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>
Subject: linux-next: Fixes tag needs some work in the drm-fixes tree
Message-ID: <20200727233833.05e48968@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Co/4Bcm5QQidkYLxcFUhXqx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Co/4Bcm5QQidkYLxcFUhXqx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  163d5446c37a ("drm/nouveau/disp/gm200-: fix regression from HDA SOR selec=
tion changes")

Fixes tag

  Fixes: 9b5ca547bb8 ("drm/nouveau/disp/gm200-: detect and potentially disa=
ble HDA support on some SORs")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Co/4Bcm5QQidkYLxcFUhXqx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8e2NkACgkQAVBC80lX
0GwAggf/ZE9yqLMQZdDvhVq4R9E8Ba61mMPfHQyuDi2NNouo69KZxO/aieZOok/+
q9a95BG+f58FeymHHAfdztrTUh1LtQyPE26rCaGb3ipFmIr6tNTR20ktOVgqtNbQ
B20WH44+6lAk4zrAWt6T6BynwdIRBLXASKGBSbYvzKaSi+dQ0bXHVurHDVvNruoi
zCpFDRLKptRU4YnYCw+mssPvMJlVk4kcsusEoYhXRe0DK7dIrAfC+bu7SzAFTZs3
SK8rQs2kXn9xPq8tlAvYFdS5kvuZFLSjbBDQKeXy4cq0Wm4DAH1rH8522g+68oij
nNH2EdqBQtuDulXL6HDUD9bfyqQ54g==
=V+os
-----END PGP SIGNATURE-----

--Sig_/Co/4Bcm5QQidkYLxcFUhXqx--
