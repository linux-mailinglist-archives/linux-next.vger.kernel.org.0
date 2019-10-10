Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96F8DD348A
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2019 01:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfJJXpf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 19:45:35 -0400
Received: from ozlabs.org ([203.11.71.1]:36939 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbfJJXpf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Oct 2019 19:45:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46q74X3b6Qz9sN1;
        Fri, 11 Oct 2019 10:45:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570751133;
        bh=AGVX3lJUAZT3jOSx8id9ksoYbtfMhHjY4TOLZ84JZB4=;
        h=Date:From:To:Cc:Subject:From;
        b=T/Cwil/sQE+i0dPQ2JMjjjHTFcL/fdlxW0EsfKTCrSMARwesIb/SyrAtfGVNxOhD+
         PB61J/Ziw/JWwGAd2Ed3wRIKJHeuQzSi7I6SVR/hXvQpQhCdeBOVSyxbn9VpYUOZLh
         xEC2mWw7zeGuBk6jnQ5czRTbk5SUl2chkMcEtFpCPuLc5eG0QL3xq3grGrtiyhHZkE
         KxQ6uYsfX6KbjomwUU95oK4HjJPO3FEdK4ZHsp/H+xCoUEd29zg8j8C5wHiOjpl/7u
         VgC006DexGmtoYiwGCkRj2Hfr335WKWHa/7q2zGx/ftIFeKAntq26ANfPR9xSJkqKB
         eDytpoAkJ5Ywg==
Date:   Fri, 11 Oct 2019 10:45:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lyude Paul <lyude@redhat.com>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20191011104531.6a5878fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VV0kRJMJDScfqR3BJY0WTT5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VV0kRJMJDScfqR3BJY0WTT5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/drm_dp_mst_topology.c: In function 'drm_atomic_get_mst_topo=
logy_state':
drivers/gpu/drm/drm_dp_mst_topology.c:4187:21: warning: unused variable 'de=
v' [-Wunused-variable]
 4187 |  struct drm_device *dev =3D mgr->dev;
      |                     ^~~

Introduced by commit

  83fa9842afe7 ("drm/dp-mst: Drop connection_mutex check")

--=20
Cheers,
Stephen Rothwell

--Sig_/VV0kRJMJDScfqR3BJY0WTT5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2fwpsACgkQAVBC80lX
0Gw9kgf/QV93DF+u8j5jQ/OYHhRIS+sgmExFSoK1Vdl7mw+9pLyOa0b1eL4RTFP6
zJPv6OjCtdhEOIUCA5WnavMetwxYvluCtlRgR1cxv1VIfkQx+QUJ+srs7JDt5CfS
YXT4ye/pSWJ5qCcHXm4rJfdnj6dCe1I7k5+TSiwSPbOVg9xOxku2OCxlfXwKKlgd
xAtgjdgfDW9xQPymguZiCXyqDEIRMHX7LrGagxlrOltrh83Tc5RcpV36o2vqVOac
BiPcGo073CFfLwYQG2rx9eaY14bZejeoII+Qcw27mqi4Q5tjqKG9Snz3KmssaYoq
et+4SPxbZ8lmdKCHezJvF8rG5SJ1Mg==
=vSnO
-----END PGP SIGNATURE-----

--Sig_/VV0kRJMJDScfqR3BJY0WTT5--
