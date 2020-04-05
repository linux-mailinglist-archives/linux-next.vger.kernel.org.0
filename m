Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D0519E970
	for <lists+linux-next@lfdr.de>; Sun,  5 Apr 2020 06:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgDEE6Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Apr 2020 00:58:24 -0400
Received: from ozlabs.org ([203.11.71.1]:50447 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbgDEE6Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Apr 2020 00:58:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48w1dn4sdHz9sPF;
        Sun,  5 Apr 2020 14:58:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586062701;
        bh=kieI5DIaIBhQUl9ImQ24nDmYG+HNHxUGUbriOEx0fRc=;
        h=Date:From:To:Cc:Subject:From;
        b=V0XMjbzOE1dlIPEHplCkJ03jzSrc8v4FomTjjHEGnTED3DkyPPCrIbmFy63XvB2Nc
         Nvzfom43RmQMY3t49G56Srr3xTGK9Q0//H/fqPqusEZ91YnNUmxdzvGlBVQAGEV6gA
         wSPs1vn6/3uox4avaVY+uzXcm3z9plcQJuOfhIl0BH8zRFMCoqmVo/YbZ5/gPpDU0U
         15A7m7FqW8IYfvD/NTuJOV6C7kIcijQA6HrYkrPH67lY3XjoP0Zw9G5h9uL/loYDZI
         gJq1M92IuSPbY57eGOKuqrdeNg7BrDvmCgPp4SvxaHXVZvNuAE2BwAP5/qIMd27mmK
         yP3hEEM1xmM9w==
Date:   Sun, 5 Apr 2020 14:58:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the kbuild tree
Message-ID: <20200405145820.466f886b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=g0YpNNO4_hnrpgL3AfRaKF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=g0YpNNO4_hnrpgL3AfRaKF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4075db8ab43a ("x86: update AS_* macros to binutils >=3D2.23, supporting A=
DX and AVX2")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/=g0YpNNO4_hnrpgL3AfRaKF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6JZWwACgkQAVBC80lX
0Gw3gwf8C7NdaixRLwA34OGE+hbbyGuEnUOulfaQhTxQYBQVGULpBNDZVBbgWGXr
keTfsezxgRi+SN9apC3yT5pr18IRu9ccrvsKlsnJgvwEIOWxZ6F0mpdWxDBeYKEH
/rdPGMkgS6V1VMJsOfLQBqbQEuuTLtAj3jaMxKGqHSQEr3jcztxCaZxjWOh3L4DZ
eOdLpYa2Srf481Gx0aUJSZUy3gUdfi3mdsxbUScqPVz0TKrE5/+m+7sbV+6m8ANw
meCIVnwTJAbd+p6v/OlJ14MGVin/Gy5pbxkzq377kLcwJFFXwkMShZX2Kb9RMno7
U3lIOA+Q4gwKP95gVKudgT5ZdPCXyw==
=PcGi
-----END PGP SIGNATURE-----

--Sig_/=g0YpNNO4_hnrpgL3AfRaKF--
