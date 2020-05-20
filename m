Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97CE1DAFFE
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 12:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgETKV3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 06:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgETKV0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 06:21:26 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B21C061A0E;
        Wed, 20 May 2020 03:21:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Rpgm1t8fz9sTd;
        Wed, 20 May 2020 20:21:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589970084;
        bh=ssWyo9ZQJwmqYStKYRADo5+sDEqCMcXmhdC1gF6qDqM=;
        h=Date:From:To:Cc:Subject:From;
        b=WzbVoL/yC+Jrcwa7p4qGBgTBgeF4acYHgkbV1TzuKraCxn65F/0bmo57zyti4qA1o
         1Iw0qqgzwDMtikA0rDL6f5xltAVs/Kk2MjjR1U0zbY6F3zIx3OVIzVrC5NRazX9iqI
         SvLC/VX0s7mVwaSd/l9P83W2mHqfhujst9p34GXBnMN57QKOD+B/sdUIp84G1EJkcw
         3+x4oEzwNn218UB381dZd1awE3UutN0znwDAZMEKG9RTFA4JTeWtLOPOvRM30sYMry
         CBLgkWEmcy30U0B/7f+LngH+OxNDEqVmkm/9Dzi5lCK1EJ8cs1DNGIXEGMzokZxIKH
         TLuO1kVN2BK+g==
Date:   Wed, 20 May 2020 20:21:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20200520202115.5409186e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+BnUBuvl01NHTg1FTRfF8Vg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+BnUBuvl01NHTg1FTRfF8Vg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  089795766399 ("arm64: dts: ls1028a: sl28: keep switch port names consiste=
nt")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/+BnUBuvl01NHTg1FTRfF8Vg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7FBJsACgkQAVBC80lX
0GyzIQf6AmglBY/53f0CkeyESbfZ1PXb5miCeortN/6N+7dWscsR42hJs2rseH6y
vPQSlh6AwXMyrveq66gTPoCWvgNm9djiUmWONuH88AGn0+U+4sUH13S2OHuIRvek
mPh+dSn4IGE90s9F64jtPMJV7g3ZHmF7TpXXU+63Bp/YLrAqNVerNNGkO5vWYeoM
p+Kxt3un+Fb6T0vgEsVUu6z6WjENS4NYG8EiqNrgHIyCu2e/RU4Ax1EaA+gHPpC1
sL2fHjaZpGq29XZxHEaD8zQcUC+KcyEbfVfVJY9acRMzHF4QfMLcMvhsd/YxaH/A
0y8fKxZPpf7YSdJVDL3OOEybpm1nTQ==
=UdoQ
-----END PGP SIGNATURE-----

--Sig_/+BnUBuvl01NHTg1FTRfF8Vg--
