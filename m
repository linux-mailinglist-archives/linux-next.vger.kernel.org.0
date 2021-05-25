Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432F438F6F8
	for <lists+linux-next@lfdr.de>; Tue, 25 May 2021 02:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhEYA24 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 May 2021 20:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhEYA24 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 May 2021 20:28:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D6FC061574;
        Mon, 24 May 2021 17:27:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fpvzc6ClBz9sSn;
        Tue, 25 May 2021 10:27:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621902445;
        bh=uY1tMlJDraie7CtVEoPLKUE0zodkOSlHe/tyaZb/89E=;
        h=Date:From:To:Cc:Subject:From;
        b=a73lRudqDUPoHOxD4sZB+RvLENAbSGY1a7iWlXpOgtMO5byGjyZ8fjdin4csMemeJ
         FVtnEfnvY31wDDKRTFBW7tsg6cklXWx1EX+WMgXcgVvb9AEnD4Et8b0YOirwGCTHUW
         ll3B7rpfsGXV/Y8ZRp6kc/nWiBOo+PQxuj0Dc6op2V9Qjq5EYUVpmSLY9aFQEK6tav
         8+Y+Z0Ci+EMwNzFKHkwhCyqJIXau84EhlDUQxjusSTCsMQL6nDguLRh4yvCJY2ha80
         QvvxRSdRLXKX24jvn4bt1rNcVeBpe63FQDB2J3U6DlEXvIddA8UP8Wi4gEVA4ffDeP
         qTQnB05FkP6jg==
Date:   Tue, 25 May 2021 10:27:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm tree
Message-ID: <20210525102724.6037e7bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iCWy5p1XHKbwihCFSchm0Z8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iCWy5p1XHKbwihCFSchm0Z8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8dbde399044b ("drm/msm/dp: handle irq_hpd with sink_count =3D 0 correctly=
")

Fixes tag

  Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and=
 pm_resume")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: ea9f337ce81e ("drm/msm/dp: reset dp controller only at boot up and p=
m_resume")

--=20
Cheers,
Stephen Rothwell

--Sig_/iCWy5p1XHKbwihCFSchm0Z8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCsRGwACgkQAVBC80lX
0GyPnwgAgObDcg8b09wPwJDysoHzpYmFFPLqdk3DtH9mjaZyFa6n5n4UKRqV/kf8
vDw8mXyXb3abpGGQsVyqmEfJhq4uD/Be9SUv5LzHYVntyJzd9c75V5mKeyVkbvBW
2uz7RgT/UO04te3ViVklotgZnnXv1Zg9qIU4Op2rGEtQNzXq2iFhfY6qjtquCTJv
g+rbvv+buAQHykb+EOf9t/B/bRdcQNIhiOUU5aeUVWU1hpGzut2uK6K2i1ISGbq2
DVie5DYKMJI6Wkbcwjdf4ZRCpjpSPpG1wDpBvzflWFay3U6t3QgPA/3f9hqGRncH
/gSxQ9IudPA8p/K+gw3iaR5EV9JVuQ==
=6D45
-----END PGP SIGNATURE-----

--Sig_/iCWy5p1XHKbwihCFSchm0Z8--
