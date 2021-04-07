Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA413577E9
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 00:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbhDGWqh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 18:46:37 -0400
Received: from ozlabs.org ([203.11.71.1]:43521 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229449AbhDGWqh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Apr 2021 18:46:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FFzyh6hjwz9sPf;
        Thu,  8 Apr 2021 08:46:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617835581;
        bh=2AI9kqyrCkEU8kUxXeNdqaGbAN/vm2MR4Xc+goQbAoI=;
        h=Date:From:To:Cc:Subject:From;
        b=V+hKP1zpuULfqr6tCKb5/pJFwTjtasX0J+AkiU+E0amYbs1ANsMO8mIh/Pz/ROqYo
         P+R79b3zYVEmcjGJbYiInsdxPW6MvTAcrODCaq4wL//Xcqv0phKhdIvQ8mX/syha1s
         Fk3uHgafELo5ANsapotnSEEDF3h5SyxZrsIs1P7dRqCS31gtuTOA+7qqjcBxLFFDhJ
         odzzJR37+43Ok840DcGQNm1B12ry3bDdmRNNN2/BY4HivhxlWUPMyX2smA7R4xfpXR
         mDXciSww7O6W3vUH02VxJdzRRx3JvpCoSMYmGZXZHxjqEN/KoiIyL6JQrnrzLv3i9z
         U7/xg22pLphtQ==
Date:   Thu, 8 Apr 2021 08:46:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pinctrl tree
Message-ID: <20210408084620.3b1e9bd8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/27cZD7fZ1N6aqkO3TQ/G9LM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/27cZD7fZ1N6aqkO3TQ/G9LM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4f838411c98b ("pinctrl: bcm63xx: Fix More dependencies")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/27cZD7fZ1N6aqkO3TQ/G9LM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBuNjwACgkQAVBC80lX
0GyFMgf/QAqeh5nzILtPJRe/7t2RuGmk7/eypBbRVMoFTlJK1IK876SEz6p0eRiw
hVWY7HXE/DENn3hAumP8Lf4Z7RkK/+9CdK1n7KyJ362DLWPsnujEauyrmyEkvsAp
thyox3ngYgDJG0pFditA101a5qVaxcyRTF4/YL/0veKTwjAajpReBEM9VxESd6Zl
6T8kU2mrDGwne9WkyJM6HoZr+7FppNYCp+N17zAgkwWeG6TUvWrR1SKOIJvo/iJX
intxDFXMwLvYjZF9pLFQFyf5WhSWufazbg9PwDTdVJ14BmjhUxR+g+rAfDZtgdWi
aWrP6QcDEhDlAOw6jfT1rRF1bwHYTg==
=MzdA
-----END PGP SIGNATURE-----

--Sig_/27cZD7fZ1N6aqkO3TQ/G9LM--
