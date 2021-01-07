Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E864A2EC8F5
	for <lists+linux-next@lfdr.de>; Thu,  7 Jan 2021 04:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbhAGDMn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Jan 2021 22:12:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbhAGDMn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2021 22:12:43 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E810C0612F0;
        Wed,  6 Jan 2021 19:12:03 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DBB9B72cDz9sVm;
        Thu,  7 Jan 2021 14:11:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609989119;
        bh=NMjDZB9wk71fhpOuOoK/J1FolRmyMWXXHuZyIVhIXGk=;
        h=Date:From:To:Cc:Subject:From;
        b=mt6tfmHLWiOJM5LitPA59itiAnTyGF+f2qhpwDZcs6dEjVX26hyxjVSTvtGnH4vYR
         IqVqN1lT3ydGWNhr9I03JQVGG4P0OuBJW5m5q8fFJ0cb/C/vztHBpmImTKtbx+9ano
         vlJIblWKP/FBu9Q2qQbIgy2an9S0AUGpOrZBXslanMIEQlA7dV9nfRulB7dT/Nin78
         FDR7ca8HYtxKu1KtmCQNhopYwvC6dDMVjNECMUCns8aCM6uXlSW/vWX6n1oIJ9E0kD
         65JOk1OZ9/m5ySO6OIE+Bl+CV+wmbJeLVdOor3N0VCs6J1P23hSbetZlI9QaomVYhv
         kIfjpYvNTUg6w==
Date:   Thu, 7 Jan 2021 14:11:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the f2fs tree
Message-ID: <20210107141158.312835d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7c5jyQcv_X740EElX35uM/3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7c5jyQcv_X740EElX35uM/3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the f2fs tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Inline emphasis start=
-string without end-string.

Introduced by commit

  f23307575903 ("f2fs: introduce sb_status sysfs node")

--=20
Cheers,
Stephen Rothwell

--Sig_/7c5jyQcv_X740EElX35uM/3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/2e/4ACgkQAVBC80lX
0GwAJggAnf9yQfT8d+RyJAKCZuYbBPR6dUya3+0/USQWCu/Zygx424VI0W8UPFLF
qDWMLm1w9VkFnHKdqIQ8J3j22CKtgQIcFVdJqMFtGgirCvB5H1IasgFJWXcXCVcP
67Nzs6sLT4Ulv3AWwFC2oFcgk/rmpnK6iPU8F7wywhQsRmQ/nPzDJbShC7B/OBPU
uZSJ/C06PZCRXQyOgDyn3ecRF9vBpa6+GOIp0Ojh9my9o8r5D+FMSKiGzeUvQvgQ
4gV8HRB2Z19SMbXGxpamWLlOVuwlJvnHX+w0n+8pun/7fnlxTp1vXuN6ogN84ud3
9pdkY+DqzkAQNbxcvjoT0fT1hH8BLg==
=RudV
-----END PGP SIGNATURE-----

--Sig_/7c5jyQcv_X740EElX35uM/3--
