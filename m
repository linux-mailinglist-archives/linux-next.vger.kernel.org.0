Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC3E28EC78
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 06:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgJOEzw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 00:55:52 -0400
Received: from ozlabs.org ([203.11.71.1]:60783 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729634AbgJOEzw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 00:55:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBcRp0dtWz9sTL;
        Thu, 15 Oct 2020 15:55:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602737750;
        bh=k6WFsSJNWHlahUvXoLupeZUZSPIIxRYdmu2agNUGOOs=;
        h=Date:From:To:Cc:Subject:From;
        b=jChQbBChO1bcs8+tIX1iJNrYHPyMEMBVGGeiZAJVueRla3u7Ef5KfNJLhbCQhaePe
         DpfraBn5aKyzrr+Nyc/ymg5Y5xwFgTQDrmO3Dxkpe333cNuSeUCLzDozZkLlNZPGX0
         qnAwpBOhMj0ulGWRlsIVotYp6/9kmEJmtAgd9WKvPwV+/Itx9WBt36p+pHL+EydSF2
         gzxV8HkpRQyePy9eYweeYOpaKjGf3482zJ309WpZ2yGlZSuuVn6neScOyVe3GL2F+2
         6lvqpb6SBpMcweDuQ5uacJNY6BdgyyJp9wQyQbxUR2blHLjaedocz5tfkHwruoeGhB
         ElodaJHOBBkmA==
Date:   Thu, 15 Oct 2020 15:55:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pi-Hsun Shih <pihsun@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rpmsg tree
Message-ID: <20201015155549.58724351@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q1zMRKTsaIiKJBUPhz2pqns";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q1zMRKTsaIiKJBUPhz2pqns
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rpmsg tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/remoteproc/mtk_scp.c: In function 'mt8192_scp_before_load':
drivers/remoteproc/mtk_scp.c:326:2: error: implicit declaration of function=
 'dsb' [-Werror=3Dimplicit-function-declaration]
  326 |  dsb(sy);
      |  ^~~
drivers/remoteproc/mtk_scp.c:326:6: error: 'sy' undeclared (first use in th=
is function); did you mean 's8'?
  326 |  dsb(sy);
      |      ^~
      |      s8

Caused by commit

  fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q1zMRKTsaIiKJBUPhz2pqns
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+H1lUACgkQAVBC80lX
0GyYwAgApDyvg3cfLWJzJvfbs8OnaL2w39VmvPj+xMbtP2dyQGXvTbaT2/nWWQNG
Eq6wCbxmeFgVsKSW9j5OY2FFob9PzrgbmWXhHaZVCd+6Xe7tW5gA20TR5c+55xzN
Y/ytQeVEjDakO+AjsEO9WiKNHP9OtX+MyZHCd4p5zHcwZ1lqDGE+P7RQGsoH7LHE
4dD5+7mLXflLN4IwMrTHIk+txiAcXl/VWqu/AF77P1T5C0LwAbRyZTP74eEO2qY8
qluaMY23+Z5xSP92sxTzxSpN0DZBgPBwsAPor+y9QH8v1zaISZzsf2vPrMCI2dlq
/2I8w+PyRHcXem4CcifVPm+esj1/NA==
=0bXn
-----END PGP SIGNATURE-----

--Sig_/Q1zMRKTsaIiKJBUPhz2pqns--
