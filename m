Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF7C1DC1C4
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 00:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgETWFA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 18:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728046AbgETWFA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 18:05:00 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C05C061A0E;
        Wed, 20 May 2020 15:05:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49S6HX6gZ5z9sTR;
        Thu, 21 May 2020 08:04:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590012297;
        bh=d25kKgw5HJ9jwNtqoObo7aXkR0Ino4RwqlUetquCMMg=;
        h=Date:From:To:Cc:Subject:From;
        b=sATPkDaKvHbpSGxrBO240DKbxIbtw8UwOptvfhbEo/ReEDaXMfTiFxzaxkBxONHkL
         IJMofvQblUsvLIulbp+G5R25doKbmh1BlPuZt+dLrOflRbxjqEn5fwNmVWjUFHQ5Qg
         2tYBeMWZptMnA+nC1vYlOtvglpcGzsMFTDboRbLE4v1n+l19Znpo63/OwVB2x7rOJ8
         lLfhtf/RXM8h/CnDiN9+XHRhi0SfphPkpG8j5i1Ae+i43ee5WMZkTeCZ1p1zD51s7E
         lILiCZP3eeU0DVncfaGowikY75gkWEuKpfvQNftCa1PTtm/Cl9Z4q4Sb/UVmhBXgFY
         u1jaCJYm8YwXw==
Date:   Thu, 21 May 2020 08:04:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the printk tree
Message-ID: <20200521080456.49a732be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z/2k/Ft6VHCux2CZ4w2P=IG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z/2k/Ft6VHCux2CZ4w2P=IG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  bdb7f0530926 ("printk: Fix a typo in comment "interator"->"iterator"")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z/2k/Ft6VHCux2CZ4w2P=IG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7FqYgACgkQAVBC80lX
0GxVRAgAgm2qeTHqDjg2HsgSXldl9ryOqDlkPKPWBKsVyfz0sE58AvltJt9BZeQl
eiqduPzXEPcKtaeFrHEXEsWpoEv3GMjCvOfEeOUjLAgGfdDe8Jn7pKgfrKkp8AK3
QRFE6e8g+pgaGQE5EOI472qe2bq0T1waUVO+bCWPrVkkUAh6942+MhC3+zm0jeyl
5J3F2xsk1040lPTgJKeAC+lFkguGdopNZy92JQYtBYG2NePXFvV5FCioi4zhweSz
jsgyrRis1ZJ6CBDwYiUbQ8drbV1bfMAM7d/5XHUi2QQKiY+BSbXx7slTkXIWBtjH
/ki1DJZuynrwoEDy4bT4l7uD5AGP/w==
=Esl0
-----END PGP SIGNATURE-----

--Sig_/Z/2k/Ft6VHCux2CZ4w2P=IG--
