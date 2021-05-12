Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C5237B54F
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 07:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhELFF7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 01:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhELFF6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 May 2021 01:05:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE5EC061574;
        Tue, 11 May 2021 22:04:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fg2lj0b3tz9sSn;
        Wed, 12 May 2021 15:04:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620795889;
        bh=JG2pK3DvsxbgELFYBVBaO3An5BMmE+kQ2qHAsGLRVdk=;
        h=Date:From:To:Cc:Subject:From;
        b=uCH5eH/+Wf5gaS2EJRJAMxZc+z+i4iVRrzFB9IJtxcWNl4Ez5bBmppeAAlDORzbbt
         rZU7EIMpwyAmcMYL1Tn7WJdY8FOjtIMid12N0/9JLrcSarj9qIki2KfjH1i2CZkLSO
         K2ICzuIrQoXHcaPZXISXwpgAJim7ShTmfE42RsCrfwYJoFb5ewDttUuUU/u12kqiFX
         4kVNuxWyBYHdTX3hGOfGohLcyh5q1t7KdBzXVPaLV0JVGjnY/FLz22dE+GBHhTBMm9
         IVhyFXaui5xnUpaav7rKce4MCuab1zI9qkNfcHVpPGcMXRO200nMkbdywT7rBDxLIW
         3zkmndZyaH3bA==
Date:   Wed, 12 May 2021 15:04:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Yury Norov <yury.norov@gmail.com>
Subject: linux-next: manual merge of the akpm-current tree with the rcu tree
Message-ID: <20210512150448.05728739@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5X2=ANOdhwM.8dxjZDOsfCd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5X2=ANOdhwM.8dxjZDOsfCd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  Documentation/admin-guide/kernel-parameters.rst

between commit:

  b18def121f07 ("bitmap_parse: Support 'all' semantics")

from the rcu tree and commit:

  458a0b70b496 ("bitmap_parse: support 'all' semantics")

from the akpm-current tree.

I fixed it up (I just use the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/5X2=ANOdhwM.8dxjZDOsfCd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbYfAACgkQAVBC80lX
0GyFoAf/ZuBpFpkJHErfw50H2+grJA0R2x8C8NMD54yEWYDPMzyuFZeb/XXU/EXz
Ly9HomCItgjUFK7ExC0qblUxjxd4qI/5XdMUXWSZ4v94NqKDS2/jd8qnedBW7vnu
jQedkzWcKFUWq4eNaIkDVLNGwkqLxZfWCPWfUQq/mMdu/kIQBueye9C7dupD55qB
A2QT4PlhOYuJ2brlqHp03TG0CVMbXlxcM9Qo+ds5FFX7WXgwKo+pfTShGw/bnobb
ItbYrftPXXPtdqSzWwmC9If2IAJQDJrUMr5YVMPGVoZZ92d2s1ttHtRnMwI8/waL
5x4IKcdf8aZo/atr0L9kIYd7s1Q4XQ==
=axzZ
-----END PGP SIGNATURE-----

--Sig_/5X2=ANOdhwM.8dxjZDOsfCd--
