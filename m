Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF7ADDC37
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2019 06:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbfJTEBX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Oct 2019 00:01:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36829 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfJTEBX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Oct 2019 00:01:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46wmKX4Rnkz9sP6;
        Sun, 20 Oct 2019 15:01:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571544080;
        bh=A5NG6wBGHdQxoA6uV3LIcCnuwg/zZS43zd4ihERmpy0=;
        h=Date:From:To:Cc:Subject:From;
        b=Jd3e4VFMSbqS6nOxCu6DiIjWYGImoclTe+29yvZpy3kVlJ5hPvkpBpL6i6Cy7Im1Y
         YuGkAf2NypMfbrBitTiTM8daaClbFz1ijiRbYTXKvwkITljx/141MMS7w43oIbo/zu
         ZnPZXbvIjxo818x2mAz+neW1C+oYlYMTzmJ/pGdi78NV/Yssm+ZdafbpjFqvOxABPA
         +TrGUAsw/71sKzwek+NUmfm8Ophm0LXHzpfsidEAe2jfq0abHoMJEzVqnFY+o4RfqQ
         iwmtNXk2qVqK0QVsQLEDVJqzifzWsRjDGpybCDt2neiuAE/CExXkz54F3HtyJb3Yff
         cWheuOKtIbCkg==
Date:   Sun, 20 Oct 2019 15:01:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: remove the actions tree
Message-ID: <20191020150119.1f997025@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s6DPuxFm2n.b3NOvDxL/DTz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/s6DPuxFm2n.b3NOvDxL/DTz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The actions tree
(git://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-actions.git#f=
or-next)
has not been updated in more than a year, so I have removed it from
linux-next.  Please let me know if/when you want it reinstated.

--=20
Cheers,
Stephen Rothwell

--Sig_/s6DPuxFm2n.b3NOvDxL/DTz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2r3A8ACgkQAVBC80lX
0GwsJggAiNQT/+VyHJBekHdRz9lIqrpY1m8Ux4A69BVlhyRe/Dd/aUTAfPFo7odD
a2vQJJ6wpgpUdQ5JxJWIXjv8xJPb8dCSWFn6uilQfUuI5FJN56QY31826xe60sTh
6Up1SbMfGVFEraRFtjp2bV21f+2aySDu/J3lM2200XsT2jjsTAS1PN0gvnJBBcm1
gVqt1evE/ER9v/gbw3h0XOGLXKXtRtAGHlATnfxQ2slJPaYeFnLfvOMW+BwZ2iBM
B3ZIG8gzMguVEEYDyfKdkDr6XPftvPHf/rWOTBaA5M0UfGkIPBCIl4N1hZTz6Z9G
kkfA9ye8kN8cQTB1oD+hyH+YM8vqhw==
=FFZ1
-----END PGP SIGNATURE-----

--Sig_/s6DPuxFm2n.b3NOvDxL/DTz--
