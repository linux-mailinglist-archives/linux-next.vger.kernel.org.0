Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58F41D0390
	for <lists+linux-next@lfdr.de>; Wed, 13 May 2020 02:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731344AbgEMAXx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 20:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731107AbgEMAXw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2020 20:23:52 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CF0C061A0C;
        Tue, 12 May 2020 17:23:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49MFlT0x5Hz9sSW;
        Wed, 13 May 2020 10:23:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589329429;
        bh=jN1QN1TG9rUlC/cO5tkTA5RV3QkYWS8DMK0A1jUUtXs=;
        h=Date:From:To:Cc:Subject:From;
        b=apgUCNxf5B7DNXZlyH6xSTZLE1XvQN8cWfGAkLjos0QWjYOXZ/ZrrKgBRSRx8dZgC
         d6/+Wl5pT5LqZ4RvNVuIyvT+tIH4Mphpq5SmVPjXDPewVBJit0Je25U2U+hDaCHM+D
         nWKAZ5e8xfITcSMsjPS2x77tTm+GBJLdiCkbKtIZ6NQBTwH9l1OOm4Sy/Rtm1h4FAi
         HD3uFXVi6wpV4yDOt2UZSGh0UFF8VSTp6B1CYakGHwyRKLmcPyRx2t2PG7qV7534K0
         nNi74vMByvq3Evgf1d5j1zPvODi/hC/HR6iTnVqkmbqpim9owGrYOzs2VRHWjDVaX7
         leutDunzCXsAQ==
Date:   Wed, 13 May 2020 10:23:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: linux-next: Fixes tag needs some work in the overlayfs tree
Message-ID: <20200513102346.6c04d912@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B5ZF1246aJ3hxFxR5uCPJue";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/B5ZF1246aJ3hxFxR5uCPJue
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8d628847a2f8 ("ovl: potential crash in ovl_fid_to_fh()")

Fixes tag

  Fixes: cbe7fba8edfc: ("ovl: make sure that real fid is 32bit aligned in m=
emory")

has these problem(s):

  - unexpected colon after SHA1

--=20
Cheers,
Stephen Rothwell

--Sig_/B5ZF1246aJ3hxFxR5uCPJue
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl67PhIACgkQAVBC80lX
0Gw2dQf7BclmJ6Sbq8FhiEg971vS8aI4xrL7BOllAN6h2dX2JPmR3AepyCCuFk2f
Q5p9QVFlJM9ZHIqVAKIObw0YdwwIR50hR3z5hzeZ2qFHN+VUV1Au/4DYCJLeO/ZX
9qLGA6A6nTnyShvf8sB21Sq3VHhcVEjl9ES0IfKPB152m8ZhAUmbWPK8AAIQ9pto
mIX2KIQhqyXMFo+ZWwMDMySD8AYvwAC5b6hanFsYIan/w8lSU+HoPIPZq2i4K9XZ
VeSN6DlK6lsc5Hn+BDeYz50CRv15L+iQmFh1YJwzbR14fkPBn9y7/6XFBRPC34k0
Xp49NoAhv0D6WTsD5iyZ1xtXNQzo4A==
=9Q/V
-----END PGP SIGNATURE-----

--Sig_/B5ZF1246aJ3hxFxR5uCPJue--
