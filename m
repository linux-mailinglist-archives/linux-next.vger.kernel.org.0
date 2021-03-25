Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3DB349B65
	for <lists+linux-next@lfdr.de>; Thu, 25 Mar 2021 22:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhCYVGj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Mar 2021 17:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhCYVGO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Mar 2021 17:06:14 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF15C06174A;
        Thu, 25 Mar 2021 14:06:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F5yLx4q4mz9sW4;
        Fri, 26 Mar 2021 08:06:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616706361;
        bh=/bbsaWFrT3mbTxmmmEwMNqEr2ymMLIXimsZsQ6SJKa4=;
        h=Date:From:To:Cc:Subject:From;
        b=kQqNBK4jeX2Ty2M8LP0E98g7n3E2gQwVVFecBbK1SCwuDdMJQnha2LMf3i754+H60
         W1uL+E5aCwfe4Qq21TMSbwRPRh3OVdez7civtdH/1uYrCMnuxy4JUkNY/4ad1tQLz6
         JNUjxIj7d5eTnOtuZQEi68gYHQFGayqauPWl32GyivQTpHvZonk4ciGnXTkHNzWZau
         0U1m+MZizN/Y2htNhK52ezyo8EKO3Rc12OE3TWOXzv3QuG/GekO6a0/rFd+CGsq2yw
         pqOw4eT8NHJEAcLHcYPoYvVrnsCnc8S61UJtZw0oI9taM3cHJJKoTTicsZHwGLgQ0W
         BIFkIPEXWxtsQ==
Date:   Fri, 26 Mar 2021 08:06:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the leds tree
Message-ID: <20210326080600.5b707e08@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1MVUZ/VJueeChGdDPd9s6vs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1MVUZ/VJueeChGdDPd9s6vs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  feac7685def1 ("leds: Kconfig: LEDS_CLASS is usually selected.")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/1MVUZ/VJueeChGdDPd9s6vs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBc+zgACgkQAVBC80lX
0GwRDQf+O1IiCSLzP3AJTfG7q9yDm9GCpkjqaz0LrJTGJ6OQyrlUyBuyA5tUBY6Y
ES/8fH9vvMcfSIAIOC2ORxaQhswcjvCoUzgOquCvrKK0cjQ2Bdhs/+OxB1zuWqW1
H782Ld2UWN0PexipvI0JcqOb15naPPE7fkNRcsXb+Ec1sJI/gy8TIv1dK4wnyd1W
LD/2hoAS5TzusEYP6/JFvbq6bq32sBzi2PDoTZLIx91+t6fbS1KzibH1kg6muaue
QMzA93eJHYW5XIvo/iFDl7lUzzM3QeAUVNMl3W1KOgbiwcZNGC/OkHMOd0LEv4u3
V0CrWWDu4vvIWzn1xqylZ7X+99MW4w==
=EpAI
-----END PGP SIGNATURE-----

--Sig_/1MVUZ/VJueeChGdDPd9s6vs--
