Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBD4366A0A
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 13:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237924AbhDULmM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 07:42:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51371 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237575AbhDULmM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Apr 2021 07:42:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQJYF6wJkz9sjB;
        Wed, 21 Apr 2021 21:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619005298;
        bh=I1NgyMIoyOKjCXFY2N2P3O3RsN3GgwWYHvsxpNnyoqM=;
        h=Date:From:To:Cc:Subject:From;
        b=Xi/Q8XLYVdP8mcDWDulCFUw07IDCHLva9me5ippvneiaSH3pegHI4Ta6cwf8/0wgv
         /6sJJT65zPvMMfuf4w8P1oHgZ8769SJm6cNfkdTJ+lLgnYsHDh/ot8yeFR1fycUU7t
         Ee+sjUz4N9ExO/cvVf2/Fw36vnrAlL8ByvBQUdbpc+leHjnUUsG0dvLoPXCFt0mzo1
         4ka88IkNNqlQf55odi/ebX6Y4Y0dz0uFxJvoU9OiY3cGKmRNzlFMsTcE4O+79jedKK
         MXP4twumABbE/zvunfi26bCqRuQaoZGg3LKSMF35gGkR2feNLM0bqlcEi9j8J5I8Db
         8hlkHX2un6wpQ==
Date:   Wed, 21 Apr 2021 21:41:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the csky tree
Message-ID: <20210421214136.2aa5d34b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rs79qFZyJFWlCYYLItY1H_b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rs79qFZyJFWlCYYLItY1H_b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8bfe70e69658 ("csky: fix syscache.c fallthrough warning")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/rs79qFZyJFWlCYYLItY1H_b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCAD3AACgkQAVBC80lX
0GxrQwf+Np4pQQ5ssGNYRtaQ6MCx0T+WrQswkqknEq507Yq2F2tpb9RbTpkxlEN7
RuRRZmqk63sQriqIRH6unwlmFgwcMouZivO/qV4cU+7lBO3dFjDh6z04ZoobP5ot
iMWsa6uxCvkG+ex+kUQFMjKNYNZaorfDadbzyki2od9OycMm5xkfBA5jHmoMgdZX
0qEKF+T7CRM9DDGQhD76dZBUTUHCpvp+yptkvwmWbbTZdQcoU+gePgFCnLvp7CKp
YlfKPqYIojZPGNtCTlS5mJSzeLadJSXOjXhlPy/EzF0vRL45oLvxspXBvDM0Bwdx
nz0Av+CUrwUE2L2KSfgoQS0yLX7jAg==
=FtTS
-----END PGP SIGNATURE-----

--Sig_/rs79qFZyJFWlCYYLItY1H_b--
