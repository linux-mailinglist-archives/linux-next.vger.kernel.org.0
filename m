Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F104326093E
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 06:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbgIHEPb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 00:15:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37169 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbgIHEP2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 00:15:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BlsJF3Rswz9sSP;
        Tue,  8 Sep 2020 14:15:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599538525;
        bh=Wqtrfj5HlqGrcYAVH1VxP++Iktu5EHpo0Uh5otsB+Yw=;
        h=Date:From:To:Cc:Subject:From;
        b=dxgd6gvHmlZyMPSJGHOi5lJ9f/gSHg/5rhLlmKLYY1ZG71wlH1u1C5sbek4stOjFk
         4bLPdNKGdlLSQ7KcqgpOOq8exsl8WHv7Id2gKFrVmAGbWGjW6+g9nKZr0UtCs6yAsa
         I/IBcyVPD6RUXvTg+7gn/pH4uLvCt98XxbiJeulcpEcAwWreSeUUCQX/l3zgc+qL4L
         5qIw0cm6qQOGv2UvRCJO2Gtr1ED58OVKBSBrkmkgbTKUMUHEjVT6p8tgjNFBDrxp9K
         4X9sc5t8wauUA79vkbIMu+y10qHAjBbCQ/wFhJ5BtuRp3eKfXMAGLTKVaesX8tHL6d
         wbMHvPA3uLp5w==
Date:   Tue, 8 Sep 2020 14:15:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20200908141524.7b63519e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.XlmKJHoCIUNF/Gn=PQnoFl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.XlmKJHoCIUNF/Gn=PQnoFl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in drivers/gpu/drm/panel/panel-s=
amsung-s6e63m0.o

Introduced by commit

  b7b23e447687 ("drm/panel: s6e63m0: Break out SPI transport")

--=20
Cheers,
Stephen Rothwell

--Sig_/.XlmKJHoCIUNF/Gn=PQnoFl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9XBVwACgkQAVBC80lX
0GxB/ggAiHVjxZVmZRH4U48nYAh9BXl3leiuMFSupmtqObfxXFoXcNl+6zuSOun/
LhE5yVnH+QqXB1J+UYI4Rmy6es14KAoEOl8kheQ/Zv7Jf9y43i+gasFhhxEq9g2d
ucrUtu93e4rg0eXPjtVkqBw1JvWyPYwM5ukicisII2pUNpzjzLQBZf35VaZiNUM7
cjiyLG8seiflM/aFDKjrHEmoI2C/u8UYHOk91jbox97r56d4zH1ry6yjXoSG7Shs
njgKoefGvGXrgaAmRmKJbFKo7lMwCyPkRm5/w2Bgu4cFVDuKF+uD0V7F+CnymjOE
tI6J9EQPV+BdufHHVdKOrrpzNE0rMw==
=AR27
-----END PGP SIGNATURE-----

--Sig_/.XlmKJHoCIUNF/Gn=PQnoFl--
