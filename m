Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99F82138815
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2020 20:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733283AbgALT6K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jan 2020 14:58:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51393 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733277AbgALT6K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Jan 2020 14:58:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47wnZl5y5Tz9s29;
        Mon, 13 Jan 2020 06:58:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578859088;
        bh=RKOZ+KdcBYQcF9ag1+KXaAKuqw8iJQvL/zzqvJPuVWY=;
        h=Date:From:To:Cc:Subject:From;
        b=JrJeekypbBbSNS4M2xqA8bGDnoncU4P+B/Z6ssxo1qb6058KvX3DDZH/l143bsG12
         ojgeHmuOiPd94wM2cbZGsESowmuYmLF4Lp2bse4vA7bCCUlleKHAHsYBDMSBkflNWw
         NPhPN6RQkhwyntQMTTrY50CBF+Wh86vrFDNC6j8b5DSmYdybT9NcQM3vnMr1gSTy89
         6yAaAWXVBb4BTqNxOkfsjGcVx0BkEeJ+TonaUdcKcfmUPtUbMvv7tuKveqyKQQ/yn1
         Wdddfabt0/SpICzBENOdMrTduIO/GOjEAV5wajfZId8DBsI7CfKUb5CKQhF7Lb1ctn
         NtQh3O+LFlfcw==
Date:   Mon, 13 Jan 2020 06:58:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Ludovic Barre <ludovic.barre@st.com>,
        Yann Gautier <yann.gautier@st.com>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20200113065808.25f28c40@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UM6nfW.JtSHOQCmzDuvZ2HJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UM6nfW.JtSHOQCmzDuvZ2HJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  7e5d83981911 ("ARM: dts: stm32: add sdmmc3 node for STM32MP1 boards")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/UM6nfW.JtSHOQCmzDuvZ2HJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4belAACgkQAVBC80lX
0GzfOgf+IpncsQ3XUqU6+JhxmTJ/qxlVRmqjtF2BD0VTCaWzvLIpqVTngnd+tHk8
7FEi5i9JmhUmwWsd3C33unnbwpnemGCvNsl+oYxXG9IGne/z/JNihH3ExLBxQdK9
ODnyiGn4ar9piq10GgsdAf2s/qWOrQUabHKnK2RxUTVof4LEb8ktLzdMwkmg8QIY
+7/IwOk7gU1f+EqAp1G37KZ70nRYc5HCyCGJw0BwT0VBPDGBgPYf3DWexKFJ15TG
7VRDwUbiynwrI3O5jkB+CztjIKO21CVylQlUiaetG5hPOA7/aQG/NsWGQGNYHfKp
f9ruFlO+WAXgonMO6Beuv7xcdjpNrg==
=DlFx
-----END PGP SIGNATURE-----

--Sig_/UM6nfW.JtSHOQCmzDuvZ2HJ--
