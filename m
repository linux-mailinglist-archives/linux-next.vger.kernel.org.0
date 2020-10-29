Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E068229F6AD
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 22:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgJ2VKY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Oct 2020 17:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgJ2VKX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Oct 2020 17:10:23 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A384C0613D2;
        Thu, 29 Oct 2020 14:10:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CMdPl2snfz9sRK;
        Fri, 30 Oct 2020 08:10:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604005819;
        bh=/8mwEBtt+7y5jWDrI+GQS5GZEJxTWO0JoWvTqNd6xAY=;
        h=Date:From:To:Cc:Subject:From;
        b=HHZjIXLX2WSLiQeuFivkKB4kEowrb7UKCwObxCrN2x2HZn5tiMaLX414uuNywXLQe
         O5kmuDK1mGMjMcBT+wlJqPIXiTPZyX8LBrR/lyE4SiYJaWlaFrBycRbzg8flp/+PPz
         /oo8PeIw70ItADenwWdCs/7zQBEVu/JzdInsQXYcVmtPa/3IOWSUcthKgTGlO2lJoQ
         6FCWy6QAq+W1jILi6lnWsqahpzdX5sRkhdKbX7k3G/a6/ScFWwtvCjHvT0XEMyw8up
         hbR9jWglL4Zm7zQVpPN6YYdpB1IDzBN1X+GJI8IdSTxg2HYqpbRrUltFbBuN/qzcyl
         ImQxPNffnDoVg==
Date:   Fri, 30 Oct 2020 08:10:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: failure while fetching the pinctrl-samsung-fixes tree
Message-ID: <20201030081018.11279822@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2zDp6ViemrIqRdZjGDxb1uc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2zDp6ViemrIqRdZjGDxb1uc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the pinctrl-samsung-fixes tree produces this error:

fatal: couldn't find remote ref refs/heads/pinctrl-fixes

--=20
Cheers,
Stephen Rothwell

--Sig_/2zDp6ViemrIqRdZjGDxb1uc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+bL7oACgkQAVBC80lX
0GyvdggAhz32KrMpqfLdTHq1iZyFBOmuUYmO0x70ZbT7Pm1PvpJn7aNBpi4S/idE
zuELLalUUaO3nQ5j+nu+alNNjAjF5uhF4l7kX5bx9E1hNOKu9l12vFBK3rhsTqou
Hbbj146Z9cqdorJuUtV4XgasT7aT1Z5cv/LAfjwNbS6lIOsZgoz4OcJcGp9KuKtz
WTkK9N+f2TDouzgAj9+N+yLnHmMJU2KN6yI4gYHJrP+UuNkg9yvfQSSc7Gmd2MNG
v0xRTAaawNCtPnZCQBegEVPyeH3VGeiPpY3z202yjfxMBO0M3GgkkdlOMkB9LRUu
EqvSpeWtWtg2J3u5OX8FoudwfK84ZQ==
=zPmP
-----END PGP SIGNATURE-----

--Sig_/2zDp6ViemrIqRdZjGDxb1uc--
