Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2F61AD2B8
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 00:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbgDPWRM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 18:17:12 -0400
Received: from ozlabs.org ([203.11.71.1]:60595 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728251AbgDPWRM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 18:17:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 493D9K6bR9z9sRN;
        Fri, 17 Apr 2020 08:17:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587075430;
        bh=SN53g5J2zyelH6wbBo51OeHNv9f5qzmMVigBqCC5AJ8=;
        h=Date:From:To:Cc:Subject:From;
        b=Tc8b5F8FzfMVZp3rW0+lI4ALSMEkmIixt3Q5W+LxV4QBNbBOkHg4jWVQDJTg/PDei
         E66fTLNyqNNuNJh+2zKNxLE4KRJDXR+HIY1kMcVOo+2yUNDkg4tQuFr2dxB0nUY+MT
         d0F7w9r9nDo4CvChF0mRz3ZhmToQA8kyldZIet5sWwhov5S7wv0pEoTryHy08MlreQ
         Aic9Ah6TDuqQdgJO5LFuIRaQLeY2KO/3MbIDzyoaK3I8iLX2Kc0dzcPIz8Zht5zNt4
         7QZfpL8iDfZzazyvXPEeZDRenOsveDAPvRSh9ij0uKzyWIp0H0Tqof4jSxRs38FY8p
         o9W0ui/3urFPA==
Date:   Fri, 17 Apr 2020 08:17:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the f2fs tree
Message-ID: <20200417081707.0c7c84f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3CH4vjpkEJ14b3ZfBS1E5T.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3CH4vjpkEJ14b3ZfBS1E5T.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  46471a1f6e97 ("f2fs: add tracepoint for f2fs iostat")

is missing a Signed-off-by from its committer.

Looks like the SOB line was lost in the rebase :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/3CH4vjpkEJ14b3ZfBS1E5T.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Y2WMACgkQAVBC80lX
0GyAMAf+J/LIQeUMu4m6DboZ5BjqrKCoa3mJi2xujSbg7aspYldV2a/CrnXT170j
dsNuvxDdkRdf3awWfGlhtCKXBHa/VnE1qJ3H9XpttI8oULNkmWeqvRHeEMslai6T
1/nPjBAjv+uqCNsH1kjBJmZPNk/WAoLPQw2PEFdmzTm9pFYRIF9/Wt/I+ir/QbPW
99BL3UvorMAGRZ9Bmb+WOQbMLkj91EAWs2ZOFpNu5Hc8HQN+nN9MNWdxSOkC2ud0
fH0aYIwaGdcv21vo0PBc7N3WLPKj/qGONu07CUEU23Sl3emRrcHN4AAYT0pXlqGA
m1PfOdWcK/4+WedMQW/Ztlwg7jYrjg==
=mmzg
-----END PGP SIGNATURE-----

--Sig_/3CH4vjpkEJ14b3ZfBS1E5T.--
