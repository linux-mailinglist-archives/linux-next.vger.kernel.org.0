Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D0B315C8A
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 02:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbhBJBrh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 20:47:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbhBJBqs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 20:46:48 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDFEC06174A;
        Tue,  9 Feb 2021 17:46:07 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Db2fM4FkYz9sVF;
        Wed, 10 Feb 2021 12:46:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612921564;
        bh=7cuAIEg1PCNMaEL0sP7lerceKxFGA5lNG/aeN21LNfw=;
        h=Date:From:To:Cc:Subject:From;
        b=SZHYg0lG5b9TVC9oMWMf53KME+ZaLYscBpm3lQjWYv9CCdVJm8qUrTHXcYzYLJnUO
         sKsBF8PckEkb7wn4pIkC4sG2zrJmi7C9svDsb1BTFeuLJPGIgzfrzd2w5UfQucOn9K
         n3NntGuyI3nDoI6/NbCGsNXHDS3rzUcwGiJbfnkWtA7k4ydNjZ/L7AEd//DWgRP3Rk
         h67+elF8lWRx9Xx1bIvYLEgUiGlwT8FOqn+dM0FcVjh9CpjfJm1s5yLoAQ/QAZb+YY
         NUbB2tF7+KRchdjk5e2e9Hdv/i6h/kUiykNifE9/UdmmWRTha9qpMWgVGppyj3YuD9
         lpuyRqtReNzyg==
Date:   Wed, 10 Feb 2021 12:46:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <20210210124600.35b7d66c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hPvyKO1swqjKJI1NmuVJa0n";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hPvyKO1swqjKJI1NmuVJa0n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/media/i2c/max9271.o

Caused by commit

  7f03d9fefcc5 ("media: i2c: Kconfig: Make MAX9271 a module")

I have used the v4l-dvb tree from next-20210209 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/hPvyKO1swqjKJI1NmuVJa0n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjOtgACgkQAVBC80lX
0GzsKwf+LSGHgWVI6+SgJWv/yRozGb72i6r7X4i1L018WsSOFzjoO6Dt4wMDfheF
+4soO3ZCg6ddB+9dWONm/81bOvHO4ljSZ0lcpuwPbh1n67h+q/xsRMNK2d/uNGNK
2zZ1eJHnVrQN46mECT5JYZR6y62LEHaaCn2ghN6phn+EdZQqMrSNW/ca+RRxZVmX
jHdEMziPk3RAgkZ2staLp+CiKMO0ADBbDKWD/6fQu66iorgXF3K9AtqkmqHZ0v4G
528nP30wk7xSe2lhgdvM/+WuDdJAOF3KgvhezI4u3a+5nn3FUZQdVEbCypBJBsei
znG9t6Vp887GCJ2oI56LXLwue32c6A==
=iZMx
-----END PGP SIGNATURE-----

--Sig_/hPvyKO1swqjKJI1NmuVJa0n--
