Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C0F33E732
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 03:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhCQCyK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 22:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhCQCyG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 22:54:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48569C06174A;
        Tue, 16 Mar 2021 19:54:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0ZVc2WL8z9sVm;
        Wed, 17 Mar 2021 13:53:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615949642;
        bh=ghKS5MERBp1teKODr+s9Nv78WJJQk4wDT73OQ9B+8eM=;
        h=Date:From:To:Cc:Subject:From;
        b=efaqHqilylwa0Ut1qgLsiI3O/5Es5dvFIAgcpnJLVHZ+toKC0MEVcy3wdHpN9r4mT
         nGbrwg4pQVYEUHSph3138LxXKgOO2AxW29XiSFOjHwoNk0IKPaF1wiGEuBs79wxMvf
         8zGrd3nA4qDShSAPBGvNWK0dfORAz8U8Hzoz4Z7TZB2aVBUpVsFrCmjXhwJfRp9XO8
         wfAnzfAUZuyO7J8hs835EuICjOOUQyob7CakGnzm99KncnUCyWAntHpCUrCENNaVOB
         DQMAPl7ujoui1SxQDhoYuYZHnn83pSljPuOBeqJSH0a0xVdHhgga9Pi649oUdWmzg3
         chpO0pYREQu/A==
Date:   Wed, 17 Mar 2021 13:53:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20210317135355.1f9b0139@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XHUXYh.QD6qLrCLx4v06Kb+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XHUXYh.QD6qLrCLx4v06Kb+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/rockchip/rockchip_drm_vop.c: In function 'vop_plane_atomic_=
update':
drivers/gpu/drm/rockchip/rockchip_drm_vop.c:882:26: warning: unused variabl=
e 'old_state' [-Wunused-variable]
  882 |  struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_sta=
te(state,
      |                          ^~~~~~~~~

Introduced by commit

  977697e20b3d ("drm/atomic: Pass the full state to planes atomic disable a=
nd update")

--=20
Cheers,
Stephen Rothwell

--Sig_/XHUXYh.QD6qLrCLx4v06Kb+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRb0MACgkQAVBC80lX
0Gxibwf+Mkd+hq1Kqd0VM6tihIymwBFOaSOuEdTZh4fCXPuB7Av6HD4+L+td0mjr
c4uoTF5evRfswYpkiZva8y7Uph+sF1UFyWIBcZPitAubpG7XBpz8N5y2CrNquJk+
SJnqheBYk1jYjGMUkewIpe9L59sVoinqXNgUPDXzhN+IWCmJPvik4cEW/44jgI7z
H0oHKqjqbgZszU4t6peoHvyjpLCZ73BhHU3A56Oj9FAQBuPuS/kevdYY+UjzcWte
b5/rv72dZE3GpDxxjf9fjOVyCUd/dK21oJ7LHKnxbafwrr1X4UhI9+L78pRQCAeo
p4Opo4X2HwEjum8ZK1KRAK3Ni4VEWw==
=nu8v
-----END PGP SIGNATURE-----

--Sig_/XHUXYh.QD6qLrCLx4v06Kb+--
