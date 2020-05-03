Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C0B1C302F
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 00:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgECWsl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 May 2020 18:48:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60747 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726751AbgECWsk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 May 2020 18:48:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Fh3p45gLz9sRf;
        Mon,  4 May 2020 08:48:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588546118;
        bh=+DTZ7vGvV+Z9WnCAwIgghVv2D16ad9AvWeMeyiyct/c=;
        h=Date:From:To:Cc:Subject:From;
        b=ZQgh9CNCoQh43SQo87DWxmXo/SHna5uJQJ6IFPhqx07sCwlD5PPd4lPlUGUk4Us/x
         db3JVG0CJLIDyJ/dkxKZ5kY5xtQoThj8tATNgDLg1ZfrC/pCTYGOVsPsrSPX7IVWMt
         NhL3pWz6yd8bmzFm3Ok7bvBaNxBFdh7TQ0UdCtd5q5yYIxOStTSMxzJJ7Aq8xSsnSa
         QMh1G9RBqABpbCIkBon4JW0C/jid5ZUgP45te4UjMPUANVxp+54/lXJ+mSbw0VXVEw
         oVu3DRbRwoN91PFsBdVc2b3MlIOVZ2JcXsLpPPP28u4S138RCF+y1gDZ9dCV64viyL
         gvsruV/T55JBg==
Date:   Mon, 4 May 2020 08:48:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: error when fetching the clk-samsung tree
Message-ID: <20200504084835.5814c682@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2KTLp1KJSP/wG18RPW=BZYS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2KTLp1KJSP/wG18RPW=BZYS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the clk-samsung tree
(git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git#for-next)
produces the following error:

fatal: couldn't find remote ref refs/heads/for-next

I am using the last version I fetched (which is empty relative to Linus'
tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/2KTLp1KJSP/wG18RPW=BZYS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6vSkMACgkQAVBC80lX
0GwqmQgAnMW/63HMFdc/uPtvIMCUmaotAXhB/s5uXUl1b8vAG30WR11heCnJMaTV
xnPN3WGfzhaBc2Kbr86fyYr7VhzZQump4BE/jsaSiblBoCgoZ8MkTriBy4zUKu7s
2PX3s2ama2NB6wkcN6R8mJb5TD5eBfIRt2Zj3QX7kFP6zTI5AZtyKYWuewvjE7y9
6f7P1AGw6UUAIsWWadLEzDq8SaE9ZOseuHKHfa1EcV9nJh5KxGS4U97Idz60r2Se
lcP8YyhGSia2Z/7T5Sllu3P1Dg5ZU9xT1bXF1O0uoZOjzgOeVv31p1LNoFav1ONG
O4jYoXHTMfMoFtnsnguut6D7Ebr5FA==
=Nto5
-----END PGP SIGNATURE-----

--Sig_/2KTLp1KJSP/wG18RPW=BZYS--
