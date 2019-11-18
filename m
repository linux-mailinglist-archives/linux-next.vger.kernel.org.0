Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4E4FFC94
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 01:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfKRAxT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Nov 2019 19:53:19 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34765 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbfKRAxS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Nov 2019 19:53:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47GVn73QnDz9sP3;
        Mon, 18 Nov 2019 11:53:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574038395;
        bh=D2NmXcop4WalS9+nYTXJNC09L7hGx3Xm79BoPtWklA4=;
        h=Date:From:To:Cc:Subject:From;
        b=KbMy+E5msgqiCqePUJpOJVRq5aPX/RbR/8HAtFqaOa9JqP6V4wZSm29qm0Jki3+nQ
         yxCvN8rhV4dEvpIT+yEhhI3AvgCI8tvdQbJ9KcCfFL87H3DseFxvUS8k9eeQoc0Sml
         R5VlfF4cuFGZPRW/KGfrFTQdBhCcvZ36JiXMiEcMeD2vIo012iOh+jZDcTW/9GHefE
         BO0b6g0CIVUfQ6Mx3v6mAWOXnO9uqrO7Rs/NVf7dWtYOcN0EMzjwjLjS7x5Pc4BEkY
         9sIggDFNkqAALGCVNk8zSzr8S3eJwTdL7xvVvuLvxj1Qze2kye3sC/x37QtoN6tM9t
         6lKcz+KLiwpgg==
Date:   Mon, 18 Nov 2019 11:53:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitrii Dolgov <9erthalion6@gmail.com>
Subject: linux-next: manual merge of the block tree with the kbuild tree
Message-ID: <20191118115309.10b3b8de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yMFWdo+E6/mUUCMIttLRrEe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yMFWdo+E6/mUUCMIttLRrEe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  include/Kbuild

between commit:

  fcbb8461fd23 ("kbuild: remove header compile test")

from the kbuild tree and commit:

  c826bd7a743f ("io_uring: add set of tracing events")

from the block tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yMFWdo+E6/mUUCMIttLRrEe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3R63UACgkQAVBC80lX
0GxOsgf/S/hCsamImU5eCaRECocmmYYwPF7i1a0HA8rjJ5Fn5dZq7qj7qufmmmVc
TV7/M2v5ap8Ha7RyhP7eSlg5pFK6K3Of6hskTYMqCb36Yn6XnKAvCZs3DZScgoXd
jc8sLwOeCY529Uw3iLncq4W+3E5LI8J6hDd62nAj/6laPB06HoWTJ1o88tgV/4zV
VxEMK7W/xaEtyUteBCEfjdRPltDd1DPiCdM6pMzBY75PltW3zPo7hEUDw7H8gYK3
SgYcv9wsul9+ajB+aVNUfHCv0aDck3z/in4bAIcj594mkAvYYd9yj41ATdTvP4XM
Sw/00rOWzq0HDzFpytbnG85QuI2meg==
=gAgV
-----END PGP SIGNATURE-----

--Sig_/yMFWdo+E6/mUUCMIttLRrEe--
