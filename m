Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A55EB86C96
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 23:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390169AbfHHVnf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 17:43:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42625 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733295AbfHHVnf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 17:43:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 464MLs0kWsz9sND;
        Fri,  9 Aug 2019 07:43:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565300613;
        bh=PS8G/7lQMLzePnLYO1WZHyun9IUCnij9C8HUKhUzTJs=;
        h=Date:From:To:Cc:Subject:From;
        b=R6CdS5AfYd3rKRx93uuRu4LogFSLZrx2d6IVCsl21yixw42taNTqNdAenDsJu4ehm
         PyZ9L2AwGHP39aoisFV2VGhSVLAtqkDtg5hEJ7pXduAzGd2tFa2XHW40X5pkifQchv
         OcZFceO38BNVHvoOQPEwnNoq8x4LIbpF4ztTwNKcH7dp3TEjKsqS88hIeNksBIt/8J
         ggurRIE20dUOwDAg1f36FtxJDfNImIHtaga/Oce+zut94hH+7mOzfW/IP50up393y3
         4TOPCm/VKglGsi6r6MjToy9VxQAAnvKq57WARjubgRElxyQ4MomBQN4FuWiPSzE3kx
         PT6PTQnKT3WRQ==
Date:   Fri, 9 Aug 2019 07:43:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the sound-asoc tree
Message-ID: <20190809074325.65a72962@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RbJmcSp+m0Ab=t+LgdKH+Mm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RbJmcSp+m0Ab=t+LgdKH+Mm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  c42d8cbee4c7 ("Merge branches from Takashi to ease Skylake development.")

is missing a Signed-off-by from its author and committer.

Despite what the commit message says, this is not a merge commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/RbJmcSp+m0Ab=t+LgdKH+Mm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Ml30ACgkQAVBC80lX
0GwG2gf/Wd8smArT/Nj7a7JXIQ34odcrcuOSDQK3qTS6ugD5F1OyT+IKJGVIP/eU
4NIDy/cO0DLdnZv8XP98UXcPC1b+5/I8KrisQ8n36nJ9Tw4pvbbK1VFQBFLRbeAy
d6ZpVvlxCcvmvLy/kOyM4+WJmd9D4GAU1L3idHYl7Zb06wG2BLMkqavrWKvrWuzY
n08N9bT7E7dGFWb26jBn5jgVAk/2DXR1A186bsRdcwCjO6BtsESnzQ4LHGsJcUQ6
q+NSlss/KAZqfxC32FjlfUVQAXmoq821hFcJGoTGz0wdmA1vmfbTq2+BgIhSsTwo
eH80vpw82mk+CaIFHuQuBFKijnvM1Q==
=CMfa
-----END PGP SIGNATURE-----

--Sig_/RbJmcSp+m0Ab=t+LgdKH+Mm--
