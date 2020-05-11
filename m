Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD251CD07B
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 05:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgEKDrU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 23:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728058AbgEKDrU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 23:47:20 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAC9C061A0C;
        Sun, 10 May 2020 20:47:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L6M83sxTz9sRf;
        Mon, 11 May 2020 13:47:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589168837;
        bh=O6zAs4Q3XikfztIZH1d1NrZqdEwNh2c50gDfoygxdLc=;
        h=Date:From:To:Cc:Subject:From;
        b=cYYX+rnqJKBB7kkvpkom4AgbZA7Ut6K3fpZHtO9UVJm8HYD2zmmy7OA13Pf6keGMZ
         NVDSLByMO8p3eaG3rjej++DJafBPsi0ViWThdh+CTxpqmqcrlBWr25VRFpyh9BnEf6
         FNX3inFLdDuWNdAovuQoV+kn5xmvBZbXMssYe5/yn05GRt3dCSIKR+OZenfcBfPbIk
         KaPDUqGLKxc6VY3m/9wD4rw+UIV4lJL+zoa5aR/jw2ctCku3RgTFJgGM1hE3xpd1i9
         pGkjeTF3vHRfr0Ma98XoXZjJusKBPHw3NOUlMMo5ONnziBnYQ32zm/mFaf0gEK2Wq6
         gJhF69tafPXpQ==
Date:   Mon, 11 May 2020 13:47:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20200511134711.4956a5d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hf4wbgX98YvTZGDZmMXnOFY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hf4wbgX98YvTZGDZmMXnOFY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/panel/panel-v=
isionox-rm69299.o

Introduced by commit

  c7f66d32dd43 ("drm/panel: add support for rm69299 visionox panel")

--=20
Cheers,
Stephen Rothwell

--Sig_/hf4wbgX98YvTZGDZmMXnOFY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64yr8ACgkQAVBC80lX
0Gzz5wf/SzmSBIVJ8psuZOrI1EHRvhok21kidiDElkDPfM+wUiZQvM8SpHsE7rLt
jlWz+olEdZKQTf16JDo0SLMi5cvQgoz89CSwK9DJnTUFza70Mz8K4NHlTwxJfJde
aW5Wgua4+Uw+AghtNwSiuY6MRRCSiGfKBIexdtiLf8mJPmapMvBCYTLTXGyg/TEg
2RJbbY3hQz+4pLireQgelqmn3CntKDyFTifb1GT35N7iWrCJnJGwHMPA5/ap+8Ef
bX5iUgsfho6/y3vmnFXC0EpffphZiA3kDTs4z+mtWiVeY+v7HJAqe2KFU3Z6lK8C
LEJGa1rzLr5ayYXpgWVCS7vxFI/GVg==
=y+Pu
-----END PGP SIGNATURE-----

--Sig_/hf4wbgX98YvTZGDZmMXnOFY--
