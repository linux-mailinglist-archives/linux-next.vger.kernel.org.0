Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551343ABEEF
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 00:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbhFQWeN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 18:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbhFQWeM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 18:34:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79752C061574;
        Thu, 17 Jun 2021 15:32:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5cHQ1s51z9sRf;
        Fri, 18 Jun 2021 08:32:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623969122;
        bh=Lg4IMDr2GbCE1yaWI9kKj6tz1z0yR0FzC7k+YHurMbg=;
        h=Date:From:To:Cc:Subject:From;
        b=nn+oep3U2A7nYDEpSbZ4CI42pXNRr5S/WNTnpZxCWoSUVvvxUw28so/juIYt21zIJ
         1/Q7M8g8NmBogrLRqVfoAteow41OSw79W04H2R+Cqb+WtfRHtVr2V5+k2V6dOGmUtu
         8SJLtPtoxQXYf2kPEu8KeKKUteDE2l8RWJRofQDHwPu83LhB02f2iltBC0or599EWV
         k93CEXlbKW89cKkcqxXkOFriM8frDrvzmwUKKZuWTGr8ho4M0UufZ3z8aDFMn+2EMu
         o7hQBT1UztHk3Tb/YqaerA7quQtGB2wp+2rRpsoYMsNKI9rW4f3O7Dz4pkytTc9u8k
         Bs71jpgouqJwg==
Date:   Fri, 18 Jun 2021 08:32:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20210618083105.0b792d7e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CIlqbxc853XH7Srh2Vi5to.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CIlqbxc853XH7Srh2Vi5to.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  63d581450413 ("drm/msm/dp: power off DP phy at suspend")

Fixes tag

  Fixes: 8dbde399044b ("drm/msm/dp: handle irq_hpd with sink_count =3D 0 co=
rrectly)

has these problem(s):

  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/CIlqbxc853XH7Srh2Vi5to.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDLzWEACgkQAVBC80lX
0GyTkQgAiP64jI5AfFua4PWxUl+nfCiBkU0lOBk+03glCC9wVLvp+qB7ZhabShDx
4Hgn7WqEXcjwzoIDaLa7XI+/9TnNjY0x3wDdRTgZBEjGpdSOxRxrH6vTiUDuRzpj
Y+ohBi+3iuzbuqWGl1EUQqT0NTOBlggAiMv+DYDa5X/U6RH6Y5pV+DR5ceDgmDCM
rwW6cLcsxYgwvS2ZxTcroNzufMiZ2mQdMy9zBxDiEjtejDqhrhdCrmyou0v66ZBr
mrR9CNVyMnwLDoF1IUrsX1kaAJI2qzcoebvp6cf21t7yQamx8LpDFghfO4POoEzI
/DUm24Xgg/H++p93b7VtOYMgl6UXlA==
=C5QM
-----END PGP SIGNATURE-----

--Sig_/CIlqbxc853XH7Srh2Vi5to.--
