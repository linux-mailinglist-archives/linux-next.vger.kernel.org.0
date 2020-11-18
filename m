Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330CF2B75F4
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 06:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgKRFce (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 00:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbgKRFce (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2020 00:32:34 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C68BC0613D4;
        Tue, 17 Nov 2020 21:32:34 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CbWfQ0tNGz9sPB;
        Wed, 18 Nov 2020 16:32:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605677552;
        bh=RB6gQPLk2IyeCwKNK6UjThau1ryfZYNug0uwMIEY+TA=;
        h=Date:From:To:Cc:Subject:From;
        b=UuiRsV0RyhJCrWj0gkqCzq3FBrETpqcGW4G+aCJVuXckyxCmCKCLWctMQMRO0Ynmr
         WDXEQlmlaNLfyFpKYtlIAo/+qQGcIVoMvlFbwRmRfYb7m/Np1nqpe09eirKv8bxBvZ
         RM+4ICRNJa1o0rB8vIs3j5qIaTgvtqdmG+0XVLtIslPyLz3/njhlWGVfRXBjxJfIZF
         r9MFIMi7xsDLw4Choy2J5MKt3ipr4LQv9HKVk3qxPPYpw63chHBrsLqUpRdLgQdvAW
         1koLEkxxy7lf6FV+vFkk8X7UrafQMcnNsTT6kIiQ3/WEVVcfojv1zCMNuziD5Ikeb9
         ly3ktGvmt2sVQ==
Date:   Wed, 18 Nov 2020 16:32:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Jacob Chen <jacob2.chen@rock-chips.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the v4l-dvb tree
Message-ID: <20201118163229.1cda4547@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nt1dCCOdh4cs09UhX=sJWQV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nt1dCCOdh4cs09UhX=sJWQV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-meta=
-fmt-rk-isp1-params (if the link has no caption the label must precede a se=
ction header)
Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-meta=
-fmt-rk-isp1-stat-3a (if the link has no caption the label must precede a s=
ection header)

Introduced by commit

  df22026aebd8 ("media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer for=
mat")

--=20
Cheers,
Stephen Rothwell

--Sig_/nt1dCCOdh4cs09UhX=sJWQV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+0se0ACgkQAVBC80lX
0Gxmxwf+M6wY63H9Hq+QbuSycpHon+EWfH0Wfwt6bO7eDGUhQXQv0unmuHq2UPgF
/QlTRQgRpqxhCyzfqtO8Qv3EEVV/ht8dpCV/ItqjCTgt2RZZIEPaBqWlVNeqw0h5
GIs5OaNzwEdGzkfJN4qOfoC2VIU3j6+eCk2Hj+x6A89SofHd/VuaxxLECs+mXg7i
r87uFCZ0d2zDf7b9fK0HKnbYPCNoNgaUVmo1dRnJG3HSzjxOnJjdK8iBE/6DvE3L
+/6K79VVlfkp5BERv89GF8xxIiIoU/uzSscv9wTHwCFPHD4YbmCAFoBLyv846HnX
D/JJ9dFDmAMhsSJir9NLJiVtR83wGg==
=0OTy
-----END PGP SIGNATURE-----

--Sig_/nt1dCCOdh4cs09UhX=sJWQV--
