Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C56CD1FD978
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 01:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgFQXNX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 19:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbgFQXNW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2020 19:13:22 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9074CC06174E;
        Wed, 17 Jun 2020 16:13:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49nLTS6J7Nz9sRk;
        Thu, 18 Jun 2020 09:13:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592435597;
        bh=1Gtkm33aO6e/bF+Mhbz7h/5k+HBM6U+43cRQnza/OAI=;
        h=Date:From:To:Cc:Subject:From;
        b=PgTDQpDslF2tvbyVUzGb/LWbdY9mQEzJ/jDYJ/IBUzby4hNcX7kdtBYEpaZ6ICBmi
         5tTfdcLDngVQRhX+ffJH+ffZ1Wwl+zJYC94RuWTMUce9nJIbWtmjlflvwhRCs7/upB
         DuvLKD8b38nEVFAkTZ23NDlr89JU9T3QCc3Z+bPeicQevW6+uUu0JKG5AFPK4P0ChB
         ViiUGY+76LQ13Xr/eOFNWBBz+0R6A0LtRPTfLEtPKbqnPZytadGifjr/f+7afuQ9rm
         mg09TFM/XU9zv9mJALbci/ZL6Rg6TKQ5HRIkF01oiRq0BIlUWXN7gxRmSG/4/dPMoS
         VvSmTGSnDeQYg==
Date:   Thu, 18 Jun 2020 09:13:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steffen Klassert <steffen.klassert@secunet.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Eric Biggers <ebiggers@google.com>
Subject: linux-next: manual merge of the ipsec tree with Linus' tree
Message-ID: <20200618091315.4ec8b8c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2zVsmWI73gp8OTQDEz_dQ=2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2zVsmWI73gp8OTQDEz_dQ=2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ipsec tree got a conflict in:

  net/ipv6/Kconfig

between commit:

  a7f7f6248d97 ("treewide: replace '---help---' in Kconfig files with 'help=
'")

from Linus' tree and commits:

  7d4e39195925 ("esp, ah: consolidate the crypto algorithm selections")
  be01369859b8 ("esp, ah: modernize the crypto algorithm selections")

from the ipsec tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/2zVsmWI73gp8OTQDEz_dQ=2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7qo4sACgkQAVBC80lX
0GxO2ggAiwFAs/8KalOM8mBOOtOqNFPt3A3IGF2vce7BdcScYX1N+H2d2A6uPl2G
BDOiKFS0gbiLTxpz8tjxrzMctsGhG0JvWFZmcIyqMK9YyXJsKVdnLH5XOKXOSZCg
AiR/++tma4csLGu9hvhtdJjicTP8GSTKXAXeYOT2BDjruL/x9BOWjmIbV4DC921l
S3ALXwGyczH89vQaAvxlbY0Sc1ubzFO7fbDjw7hW6Z+EsXOTBxE1okmTlkIfTCXf
ArOrz/cmriLAn9QzhY81iHm/KG9e1wScyFK5SzDgJp4GhPSvC4mU1/h48iJxseyn
2RMsFfdjiXzu8b0OCjAg5Ua4xME1nw==
=i5ob
-----END PGP SIGNATURE-----

--Sig_/2zVsmWI73gp8OTQDEz_dQ=2--
