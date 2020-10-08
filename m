Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A056A286D04
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 05:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgJHDJL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Oct 2020 23:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728231AbgJHDJL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2020 23:09:11 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C196C061755;
        Wed,  7 Oct 2020 20:09:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6GPt1PSzz9sTL;
        Thu,  8 Oct 2020 14:09:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602126547;
        bh=WFgb66T8uct3URGR0o6YznmhZVhqUy1KGIGHbN7Hnac=;
        h=Date:From:To:Cc:Subject:From;
        b=U8isCq3CHNoPO4LSG1gbdaDkIO4bPITFubkpEs3E9W7wn+oVWW/aPOUUkejzyh8cl
         BhnGxFsJWZv78i9cZVuO3VOE7dDBBRVjjuaXx8gqvFG5QN4Z+BjC24KXYKSAkC74qS
         nqDx2AvXCFI3ro4OVgUyDq76VqfNV52Epyi8U8fB6DI5mmCoM2Ys/drznxNqY2rphG
         HYEsXXzzz7z968gNdVerFXYraPKBUZeDBqECllT8r3CEbEh/ODt52nkMUnOc7jRGdt
         9Wdw0C4+5fucd4hxxvPqowJ1LnjQcHwB4kmCy6afFsMDuS/vWnkvtSYHexwdAKSFLG
         Iv2Ykzrzm6dsg==
Date:   Thu, 8 Oct 2020 14:09:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201008140903.12a411b8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WklVzws5ScGzWTI3gSj773.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WklVzws5ScGzWTI3gSj773.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

I noticed that the ingenic driver revert I had been waiting for appeared
in hte drm-misc tree, so I removed the BROKEN dependency for it, but it
produced the above errors, so I have marked it BROKEN again.

--=20
Cheers,
Stephen Rothwell

--Sig_/WklVzws5ScGzWTI3gSj773.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9+gs8ACgkQAVBC80lX
0GxTrwf8DR8w5azLvR/u5k/u9K8Ta3cU2eorWJI7Xd3o1NMAXQieljr/0XJD72qA
x5/QDnHm+GxtxEcJIC8sKBHhBqMHqiDV9uN3A2zns9Z2JKw0jeoaCbrcNq2d6A+C
SgsGDfi3EdLTmJYUqfrNdz4BBPv4MYqMoO0zwyrP5UdCMXpfyAb5Pk9dD6pdvMAU
ywTXxYlJx0rCbBme1iC8T6OhhzHe6dAhXKab4UnJITzLuyztqkvjrMNUzjcFpDEI
jJLP6Npv40fxZ7NFlOK5MeKseVFrvwgK7CXMYc7dJUX3sfmwBY1qBLrSFFgjJE7q
IVUk8yoATw/Ww1LwQL7n6EqtOJTKqQ==
=X/fZ
-----END PGP SIGNATURE-----

--Sig_/WklVzws5ScGzWTI3gSj773.--
