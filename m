Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0831970A2
	for <lists+linux-next@lfdr.de>; Sun, 29 Mar 2020 23:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729190AbgC2V5z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Mar 2020 17:57:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54255 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728966AbgC2V5z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 29 Mar 2020 17:57:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48r8bN6WYnz9sR4;
        Mon, 30 Mar 2020 08:57:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585519073;
        bh=YsqONLcUYQqleKUQ4xMM7DVzQvWlb866TQnITGGl5BI=;
        h=Date:From:To:Cc:Subject:From;
        b=qlge1KQcFkSMJv2lvvvCEYUPjMBzY6nHVA7J6fyOtvOpwsQ50yVYJmscRjoN9tX++
         DmODvd2rILM+P7b/gMgrrhkO/7lYDLd74/x+LhuUxU5SKrMU0sXrRS1sRR5/yEhp0r
         gp0MC/jD1YaTjcnpRe89AW25ePhdUfnWIwejI+0yIVueqmKhxQW61GaggSkiLUKwNF
         ctXrURcgzDpzfOeCmPAf4L6PVLODadhBZGaTItN3mc+pIStD1TRnOa0ZJdpaFZ9sSL
         Hi4W85BtTE1lJlZphL64NjQhsdrx3WWlInk01RZnHGcv+96VZSpDooJ/5q3WA+MBKN
         bagNvVV6a6rLQ==
Date:   Mon, 30 Mar 2020 08:57:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20200330085747.082749d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tNyDWNd.D=YgcvIHK=z77Uv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tNyDWNd.D=YgcvIHK=z77Uv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

ommit

  cfc825ccc046 ("cifs: update internal module version number")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/tNyDWNd.D=YgcvIHK=z77Uv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6BGdsACgkQAVBC80lX
0GzU8Qf+MD1EaB5r7iE0BnP1oOMkxDY4cn4kh4Xd8K96akHQbmgcuUYQOd6IzMj9
oWZh0o0UeqR0wXyFiTF2Dq+KHdKND+E5UYM6+mkHdJMM82kYCOP14wWNaKf/bV0q
PD3BudWfhNXWWj5CA73DIZfieutEg3yRAKJ/D5DGeSGs+YDt0THquSPml9Jkc5kW
/6sMlR2c8FJVLiJE2x4bFcKiOW3oTH1grQ89tmoOHCxNEW/rw9uYV3UiS8TMKnCK
f6h+/UteUUcJ7efN+OiOSWWBOn72ix4THvndLy1ccyYBllDibwI1Vw0stF6m/Udw
i7nGKVwqVoO+MBa1gt/70KnztrKMEQ==
=Sg17
-----END PGP SIGNATURE-----

--Sig_/tNyDWNd.D=YgcvIHK=z77Uv--
