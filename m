Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1375A4553C1
	for <lists+linux-next@lfdr.de>; Thu, 18 Nov 2021 05:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235898AbhKRE03 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 23:26:29 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:39087 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242205AbhKRE03 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 23:26:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvmrH6DFgz4xbM;
        Thu, 18 Nov 2021 15:23:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637209408;
        bh=PUV4AggU3i5O1AzQqAIk0fZqSyVSbyeH5Fls40vYFO8=;
        h=Date:From:To:Cc:Subject:From;
        b=KvKzuqYMxwjCYPr3lT74mAMa7cjvBrjKwbSmTNgMQLRhwkah002s5lwtKFcOPPZa0
         25l9BAx7Qp19NytYVN2pcp+36x+tOUPTjY9fedsdU52nKHS6To78hau+Z2p+8CTXnW
         Pf0jigvxVgTQQtGk3lbp00Euucp4geuemvMR083dR9uVH41QR/NLZME6T2qNCqkUYD
         TggVaFearQdvcQHIK0qVfzK+swAeaTFbaTyE/+Lxj+3Vh3I+i9wFtAjBN9urKAjc3i
         vb72s+paChanvcfQvrm0WQuhe+ZRBA+SeWe88+vm4Ck8lJnyt5RkCeuvNU78F5OgIp
         0rrx7BVBvZHwg==
Date:   Thu, 18 Nov 2021 15:23:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     "Leo (Hanghong) Ma" <hanghong.ma@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20211118152327.1968e580@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rr0tjDCu5IrD5+xxPkogONg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rr0tjDCu5IrD5+xxPkogONg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c: In function 'dp=
_retrieve_lttpr_cap':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:4623:4: error: i=
mplicit declaration of function 'DC_LOG_DP2'; did you mean 'DC_LOG_DML'? [-=
Werror=3Dimplicit-function-declaration]
 4623 |    DC_LOG_DP2("%s: Read LTTPR caps data failed.\n", __func__);
      |    ^~~~~~~~~~
      |    DC_LOG_DML

Caused by commit

  9c0dc981c97d ("drm/amd/display: Reduce dmesg error to a debug print")

I have used the version of th amdgpu tree from next-20211117 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/rr0tjDCu5IrD5+xxPkogONg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGV1T8ACgkQAVBC80lX
0GyCCAf+L73Lbf6P60piKkeSIU+Mn0eOfm+dUoOX5ptCuKHlhvnxBZN5mujsvKOm
sANHt9cyuJp7ESXA8ZvL+aEy0vRoIjbjLFguz/jtpsLsCuvbk2MGy0Euh4ObRHwV
X+tYoxIvD0HzV1tQsW32yoJfeTjnM4moaInKKkQ4RTXGfOAxzRaa2cmyWczfXQpu
rg9RkuI1VzIcJt20yXdb/jWijJNoHSQYQtOWNtyxA3rbMuF8MHMTqMtKOexfNUPS
o6XwKK1EAuTJCAedT8zuu/9lMn0GtONRKmk+MQgTbzW51xuIlsHGvXRjpPsJhhKp
Ku2oIhvi6TaQK6JJb0auwP796nOlkw==
=TpUr
-----END PGP SIGNATURE-----

--Sig_/rr0tjDCu5IrD5+xxPkogONg--
