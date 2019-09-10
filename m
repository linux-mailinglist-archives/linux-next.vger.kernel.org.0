Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5B6AECDC
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 16:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732767AbfIJOVv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 10:21:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36033 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbfIJOVv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 10:21:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46SRzr0pmFz9sP3;
        Wed, 11 Sep 2019 00:21:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568125309;
        bh=oX7poVQc2Tu14cSRLhNCFaiHh5hLbCOKDcSEdR8Ykc8=;
        h=Date:From:To:Cc:Subject:From;
        b=hzZrfhBcTqy4opSEC8BK7RVlXSq8PVzqRB3ckwvGeEpY1Fh4TfLRGpzVCG4Xiauen
         Si6YtUZ5NOpz8K4sap56jNB+DVkeB6G3CIgvGmwGCqk4xAs+kxMa1xNBxuNXy2xHpd
         apgphwDpD+qxWFBypzEd6D4yWeyyeG4Hx1hyYj6Urm43SCAV0LVA57nJ7GHu/rwdZz
         jNApXkr5ipWaY8nDWM4h51CIN1GtyyzVNPpMGfhRZkvojOD7fA4w4n3RA+989rzXYK
         APhqr00xviSt3u98UgG9WaNoBbZ6YMUvmBYN8kHxeyEHgPMyk0/LHdWomF819CL7Nh
         3mJxUX+fPRxxA==
Date:   Wed, 11 Sep 2019 00:21:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the fuse tree
Message-ID: <20190911002132.3048d137@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3TjHW9kQ2LmYM=VeVtuBwO/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3TjHW9kQ2LmYM=VeVtuBwO/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4beb84c4282f ("fuse: fix deadlock with aio poll and fuse_iqueue::waitq.lo=
ck")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/3TjHW9kQ2LmYM=VeVtuBwO/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl13sWwACgkQAVBC80lX
0GwCEQf+K+GBr58Jzn47UfTB7zjlv6QjeLpY1HLCAxvWppbOcu6/IvGJUNo4L3xp
kFg+G8stV2GJNvR9NysKll2pNzVmyJchAc6yweMLNPeZBYuEFsnGaE/mKRLxgg8y
Ly0VXv210jrFoQWj95qRYswSD1gqLMCItMkaXvPuRWdOUEH8b/yN2KXsqUMEvkjm
liPDVwWDE7fyA9v6Em9ELCmXEpyn3WS3rdPE2TwjkbWun7L4mRV3+4/TSxuypu+B
2NYP7DXuqlVoz/2gce3vd1Bu77tlVBfari6SHh/n9sgm/zCCwinJasWB0MnoPU0X
R1nVZVgUUYftqqplG2T7UDcf4Y4VkA==
=vm8G
-----END PGP SIGNATURE-----

--Sig_/3TjHW9kQ2LmYM=VeVtuBwO/--
