Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E644527DC0F
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 00:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgI2WbY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 18:31:24 -0400
Received: from ozlabs.org ([203.11.71.1]:53597 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728124AbgI2WbY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Sep 2020 18:31:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1Dd50D5Tz9sSC;
        Wed, 30 Sep 2020 08:31:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601418681;
        bh=W3Lg61ZUw1qk3MQEiHZDuvayLSkktmrH1/ZJeHsKV7Y=;
        h=Date:From:To:Cc:Subject:From;
        b=YSLnM2rNMjoOa+ttzwYf2aNDQnj+/IBUoYhl72snbC79HP4BDjAyVzhRnDRbmv8cm
         ZDc4HTv8oQOYNn/Vj6SKbEsV81V7vqSW9RWKzao0mJH2s+ondBUw+MM2WC0vuA3BK7
         akr8jnszyL83SyStlDZypM1jWcfAa7VBOgvR0G5+o1xI8q6g4v/HuHrG1jmakJEgQO
         DXfYAXQR8zqW39QS+j3yPhu1xLeOCZgCio0hlADpgAqP/kFqFc5C3VN43hw3RZdbdD
         iZCLKBlkQWAfK5Rp9O5bZ4PVndfvMaLlto7IaArgZlzEpFA4RWpUoyzxKW0q4aRu5Z
         ba4NwXKHD4lxg==
Date:   Wed, 30 Sep 2020 08:31:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20200930083120.6b969c8c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+zrm8fnmFoK4Q=bf7T5Jo4D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+zrm8fnmFoK4Q=bf7T5Jo4D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  87505cefd88d ("Convert trailing spaces and periods in path components")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/+zrm8fnmFoK4Q=bf7T5Jo4D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ztbgACgkQAVBC80lX
0Gyy3gf/bnrB4ISrmgHTaY+2jZVc51owFvlTe99kQQcmxYyCniN9DNZ+bZZ0/w6W
ec4K+ta51bFc1l2cL+C3jbv6ZJfP7qh6UiDrvr7K+Xown7q9cd0YwhUXiDo/hXa4
4zTB8AJIVtliZZhA5jJrtmkQ72HgXXqXKYcXqDEe6T8R2Iv7IkY4VQYRPetqerpR
VwqQgLik+qCVyczJi20NMhBe1W8boOuFF9oV+TpZIZtJOEws6lWtdyEcqY9yWYLx
Yne2EIzgmEewvVSe+KcfU+wHLNetUGnf8uhLQjPfnRNQLEdSHxn9fmb2c2pWbkS1
qY5WQkoT4+m9SPwiTVOKauhY9oIsyw==
=NgTT
-----END PGP SIGNATURE-----

--Sig_/+zrm8fnmFoK4Q=bf7T5Jo4D--
