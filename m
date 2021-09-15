Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD2640CF2F
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 00:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhIOWFc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Sep 2021 18:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhIOWFb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Sep 2021 18:05:31 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9545C061574;
        Wed, 15 Sep 2021 15:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631743448;
        bh=9P1x/qtQGpuSph9+D9dgw27UFz1vE177w2tczUadCUw=;
        h=Date:From:To:Cc:Subject:From;
        b=TPFJ6gAY3Y220lIQt1TDfAxjoe6M1H2xLijGtZivGXw2pwS62qT1uBo6SVeLkQE41
         NsMyL2pEdiRNw4CgpW90buCR54ReaVgs1kX9yJlPDjrjvqYOMqdLtbD+96aYa7xIth
         wiADf9p1j4dPes02PJWomPJC5AzPplM6lD+/20ja62k5PF3iFnKHQyHZ/dBhzWtC7w
         hXaS/Kgb7djpWOGpOTw2qspyeJVnf71x+atQhn2ThAPdVkABOjc3C3PclYAz93r2rL
         Jag/EKUCIDRavKH/m4fKpuPsTVCtYB1cR1wgaj07al4/Hca1dP0OeM1yYaYdIgU15b
         or6FOK8SpRA6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H8vPh4rQxz9sR4;
        Thu, 16 Sep 2021 08:04:08 +1000 (AEST)
Date:   Thu, 16 Sep 2021 08:04:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chuck Lever <chuck.lever@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error fetching the cel-fixes tree
Message-ID: <20210916080407.6fe9ac3e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UFG=o4PbJACMp56TVQEuRMZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UFG=o4PbJACMp56TVQEuRMZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the cel-fixes tree produces this error:

fatal: couldn't find remote ref refs/heads/for-rc

--=20
Cheers,
Stephen Rothwell

--Sig_/UFG=o4PbJACMp56TVQEuRMZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFCbdcACgkQAVBC80lX
0GxZyAgAkNCLnVG1XBNx2koRxFheYVRbByNkBWwyEIVKbVpFQ+DhtSH+eEZg0lJC
/HllnDyNg3hnQ2Scc8d+P+fYGcGp+9Q3WlZXMdz9N8ceYPzE70Pn+x7crKGURrvi
Yt8/FPhHoXUs4PZD+JbsT9GwMUhZ19KMujNMF+ety7sRl5LBjXRpKmNJRvhYJhw1
gDL5GZygpcfYpdUWTn9FeGVgYtfSlLo0jyvnjj4C/lxqPzdCFQJmv4Me+JJCgu+J
PtUdrw6oa4LIqy2OMSYMUjgOXsG+MlMV4uvUOQF9BNFy8QmUQdxnKW30Dinyp9Us
yaZSKciyDsd2EWxDZnFSmJPeawihJw==
=D9vS
-----END PGP SIGNATURE-----

--Sig_/UFG=o4PbJACMp56TVQEuRMZ--
