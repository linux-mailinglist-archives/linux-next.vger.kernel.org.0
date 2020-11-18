Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A282B85F3
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 21:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgKRUrV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 15:47:21 -0500
Received: from ozlabs.org ([203.11.71.1]:34939 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbgKRUrV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 15:47:21 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cbvxy32ysz9sSs;
        Thu, 19 Nov 2020 07:47:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605732438;
        bh=KlRNMrEP52Um3m4GL7W95LQHH7PuwUeFgdBON1y9GQ4=;
        h=Date:From:To:Cc:Subject:From;
        b=EHbILVgTDOQWihg5ip4M0ZWdRBHEXi3V9vWibxzKds/UE3zdqZbD8CG///KiW27se
         Lc+PUYAcCvGA9hlpq8S00lCxeOmgrnGHUL1N/gJvRsTQWrlF974S9xcqRD3mmNSQ4h
         fdWxlYSJZQE8cB3StoettKwvjnA7VXJqLCi/ZhfAbpG2Q/ebO4Kg3tSvNAxXEEDaBN
         3vz+8d9hi09DsQTEYXm6I44SVN/81K2AEfuML5eiA+8M0kErgouQOU40p7PeFzygIN
         Q7wHyTbLJCK5f0gcnUqIsdpWRVjsEZl5XU8PltyoyHlqq8ldbLo2qBg5mqWj50Fa/C
         /prFBnaFBoJuA==
Date:   Thu, 19 Nov 2020 07:47:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the device-mapper
 tree
Message-ID: <20201119074717.79d94aba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UC86c3Y/584OPE+.27/BaE1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UC86c3Y/584OPE+.27/BaE1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a1e4865b4dda ("dm writecache: remove BUG() and fail gracefully instead")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/UC86c3Y/584OPE+.27/BaE1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+1iFUACgkQAVBC80lX
0Gyzxwf/ddkJaAE9MskS2LGQ6knGY+6r7uI0f6QL64ZzH6gNjaguNIkGjxiWrhyS
gSq2vp7tLNWTbTfG9LhLM7n8LXzJ29Dxner/nO1pCwWpmugErBa3BEmL0SWcSL5P
3Z4Pt9ya0y5e68K9J7Xe51wmGkBUZIipZSi/xAHmOpUvV1id123bWbid6HbQIGIQ
6Gklnnht/YruQ+lXRk4ruBAOuj0BWkud9pI+FooKnNI615bFzQFiftu6W/wQpAxl
2DHPckH7wqeKlBjK1ulr5Dv5PpKaYj7SceE4MOVhR39f56d9oA+iGdHGWffD6Nll
QtfRnY6aorNhJPpNYyLHid9bcVfqJw==
=BwJN
-----END PGP SIGNATURE-----

--Sig_/UC86c3Y/584OPE+.27/BaE1--
