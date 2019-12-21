Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDAB1286C8
	for <lists+linux-next@lfdr.de>; Sat, 21 Dec 2019 04:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfLUDcP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 22:32:15 -0500
Received: from ozlabs.org ([203.11.71.1]:53471 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbfLUDcP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Dec 2019 22:32:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47frlH6GNsz9s4Y;
        Sat, 21 Dec 2019 14:32:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576899132;
        bh=GZOz47YKenOi/JA/Kr2YsnlbQYlnTpXT0J6nB83XU9E=;
        h=Date:From:To:Cc:Subject:From;
        b=CbsLLkpsR0tz0DIdgpltgMSafJVV/fJZkrePED8kpzgfKfDxoDmXVVUaOH5Z6rL2r
         4Zwj0Ex3+ovhFVQvdgA0qxIQd0nQLuxsMDaNIxMksEqmWwWP2nPTt4XOJIGr30Tkfw
         j/H79WBsVxF+ibrufcqnQfhkCmlHB6bto91Tp9+ZS0JDJWTaQifV/WlYkGPko51d5f
         4UJNImk1zawYk1HVt2yDjkxm61/HSKc/aoCMD0Dbe72Kn0QnOT8r82Snt9+cwjNEM3
         FmSemRgzQZzOhe49znHw91o2YbIC5Zv/xcbCtx6PdpNrp//yYMgRO2Iwn6bo6v944w
         3cczxIzOE8bYg==
Date:   Sat, 21 Dec 2019 14:32:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: linux-next: Fixes tag needs some work in the devicetree tree
Message-ID: <20191221143211.47eea79d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oPQLz6qE1lJiDZvH7rPijIu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oPQLz6qE1lJiDZvH7rPijIu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

n commit

  13670c493ab8 ("dt-bindings: phy: Fix the PX30 DSI PHY compatible in the e=
xample")

Fixes tag

  Fixes: 3200df7fa1d6 ("dt-bindings: phy: add yaml binding for rockchip,px3=
0-dsi-dphy")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 3817c7961179 ("dt-bindings: phy: add yaml binding for rockchip,px30-=
dsi-dphy")

--=20
Cheers,
Stephen Rothwell

--Sig_/oPQLz6qE1lJiDZvH7rPijIu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl39kjsACgkQAVBC80lX
0Gz9PAf/astw6r2VQo0WSVZskzWpzeaory+y/jHNLipn0q58XveOjKjtCOBlCYyS
mLeNyO+B7skgwVDvUm/TMPhYiyrhsEx1W2e+eFdti9zv6SEgnOp38LnUQGo6UGvd
fqGh3GniOQHSk6WuoloNXXnMemkvIfoIJl5V0CWgCe0cMGxlLhAYvbPZxUd7iMVd
DStSasykWsO8JeGobJCzT54oN+rXpvbmS0dh0XrqmObgWIGNi+KpHEujKS1SsyJx
pk/zw0e6dN4EBpKprldjtKIADIfnRTlJnoZbkCn76tjrLKcU3DZwU1mDvAxsDzkW
VUjEyGO69N2Q5k49AABGMV6eu3grHQ==
=WNTD
-----END PGP SIGNATURE-----

--Sig_/oPQLz6qE1lJiDZvH7rPijIu--
