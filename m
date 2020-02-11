Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6C3F159D9F
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 00:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgBKXqH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 18:46:07 -0500
Received: from ozlabs.org ([203.11.71.1]:51717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727911AbgBKXqH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Feb 2020 18:46:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48HKCw1wk6z9sP7;
        Wed, 12 Feb 2020 10:46:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581464766;
        bh=exESUYWPe1Tez79Fvw6VBBOxsvDzDK7Ow0tx3QysHD4=;
        h=Date:From:To:Cc:Subject:From;
        b=g20JzSdZc8SHAYRc355DMI3I1qAs4wBl+n6q8F4VYyN0g4baXYsK9WFDI7XpgQmRh
         h7BX3CVFEZ54rC3AgkKGKXLkjqNRtdGPSmCU+y31QSs7POKsmQlLqIeTTRPLXXeYQD
         cc++nKZAP4MtSNkUrdhGFwW/dUGaFuFvROTKT1H6d7vyoJgTErp18BmbKKLLIY0pXz
         r3QCbGYW9w1MEqBmmXeOiNX8A4Gn8lOZKPjsTZCxDPF+XBaJQGmJEXHq4mUAyt1KnN
         IVvH8x/fobTUkWh0ALB9AVFc/8awqppLIuG3aS1/YtNqZHxMCE8OaBqf6mVOnG3JLZ
         wIxBjZ84qt17A==
Date:   Wed, 12 Feb 2020 10:46:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guido =?UTF-8?B?R8O8bnRoZXI=?= <agx@sigxcpu.org>
Subject: linux-next: manual merge of the devicetree tree with the etnaviv
 tree
Message-ID: <20200212104603.56f59785@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E87cHN2xRimx6.cQE3hrfbt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E87cHN2xRimx6.cQE3hrfbt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt

between commit:

  22567d017c2c ("dt-bindings: etnaviv: Add #cooling-cells")

from the etnaviv tree and commit:

  90aeca875f8a ("dt-bindings: display: Convert etnaviv to json-schema")

from the devicetree tree.

I fixed it up (I just dropped the etnaviv tree change ... someone should
maybe add that change to the devicetree tree) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/E87cHN2xRimx6.cQE3hrfbt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5DPLsACgkQAVBC80lX
0GzBjwf+Jvz6qbuN1A6TBaXUvWrHaTlwLFDSVt/gt2Nuq1OgH8GQtVo1P46PIvmt
82QmD2YpSoaRnTM8dY44uv4CqFuOBVhqv1YBaC4kYwhmFfari1xsEnH+NO98drS4
KVJjuONeQ+6Z8J1umhbx+bTelldgSCJTEkHhe34cOlHFftXlHOxanQiRgH0bNV33
xBdXJntQXNkpGir5dO1q7IAjWSsESIL1WzEuDbbfT9ms+VJMRZ2mjgaHImMm0Z29
s+PEsVlpzhjQmefqLeQR5KI5ChgrwdKfhhLVyiEa7Qke19/k4KRC1+E06elGs5Qn
CEeqUdyUnkqIFZ1vs4+5SNmFWsiLOQ==
=VA0O
-----END PGP SIGNATURE-----

--Sig_/E87cHN2xRimx6.cQE3hrfbt--
