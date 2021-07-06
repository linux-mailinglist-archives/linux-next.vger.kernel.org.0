Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620F63BC4D3
	for <lists+linux-next@lfdr.de>; Tue,  6 Jul 2021 04:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhGFCkG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Jul 2021 22:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhGFCkG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jul 2021 22:40:06 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABA2C061574;
        Mon,  5 Jul 2021 19:37:28 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GJmtF4wTxz9sX1;
        Tue,  6 Jul 2021 12:37:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625539045;
        bh=TnwaB4vNKrB5x2b6SbAnbnf0jCPcyxQjZaTxiEbBhcI=;
        h=Date:From:To:Cc:Subject:From;
        b=isMCPBZ1BfYs6NLp3RwHFx/SXTRaGxVvq95+G7EiJsPtDaJ+LJcBFkx2Re3QKCBvY
         uOJKFIcNxDe3mI/HyaP5DWxwVrChGsJcBADI2VqIg/1LRjrbZ4c5uPPa5B20Qd8HRu
         0LpRZjrYfEbpfo8jGPpo34eoIaUj79a/SBz+Ck+ISbCuTU6mPagWvq/Uiug+0as1l0
         Yj6SDS/MEkQ1pygei1PVQhBknHlHsY/2u7HoBT/SCglL30FEhvn1MDOD185pOuB8p/
         rNMlwk9FlcT8PsEW33r2h+siOdB/sXeUluNgMvJoXK5epFMOhcuryXCek06Y+We2A6
         zWabm0hr6wH3w==
Date:   Tue, 6 Jul 2021 12:37:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vhost tree
Message-ID: <20210706123724.3acc9688@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EFry/NhO9Itfe+DuSZs6ELJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EFry/NhO9Itfe+DuSZs6ELJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/net/virtio_net.c: In function 'start_xmit':
drivers/net/virtio_net.c:1695:15: warning: unused variable 'bytes' [-Wunuse=
d-variable]
 1695 |  unsigned int bytes =3D skb->len;
      |               ^~~~~

Introduced by commit

  b3634a892df4 ("virtio_net: disable cb aggressively")

--=20
Cheers,
Stephen Rothwell

--Sig_/EFry/NhO9Itfe+DuSZs6ELJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDjweQACgkQAVBC80lX
0GyoRwf/Tbe/jR+qj+9xfgVt7rXbZLNeeN8M+GQvpBH6rTb9Dv5KayfKf4djK6xx
+jQAKw/asRWN1+VwmtoHilTPWOluasOoLOsoTZcrLWoTCo1ywOnPc12Rho0t3MZU
x6d6KXk07O/DB1a1/UHuZCJv/L1lojISVkdtZM+Hvh+cY3FklyxJnz1dKIgIopGF
uT0zJptyKk7auFk3yZtRczXC3KkNNeinzsmZ5sfNGhqIH1f7yXH9Q3HSJz/TjSRe
5hH6fGF9u44komlWWcoYpczL27IUuUtoeV8Gnt4VsruFWWp6lEOGT9/wvsHiTYgt
NPvMuxpWQ5AnzXqkFTwXK64bWA0z2A==
=xwzy
-----END PGP SIGNATURE-----

--Sig_/EFry/NhO9Itfe+DuSZs6ELJ--
