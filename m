Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6A03B134C
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 07:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFWFiP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 01:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWFiP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 01:38:15 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6414C061574;
        Tue, 22 Jun 2021 22:35:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8sSB2m9mz9sVm;
        Wed, 23 Jun 2021 15:35:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624426554;
        bh=8kHZJxQBC7cb10Mj/h8zfXqFSiobI0W1rFE7ppSQYPM=;
        h=Date:From:To:Cc:Subject:From;
        b=C4G8mHD92Xl/pDXMf/v1t2iXUmLtJ4+dlAn9vJKN/WzjmlITEWhR02bOtdWH7s7T3
         4swrA5PpETccCbst09ZQg4xbHmLJQflqdTHDKGsQ9mGG1lhzb+Hcwscu59w5dNvwo4
         jg2PfogjQ2kEJroseGusQ87f5+srhX7PhlBX5wYLupUG2FBH//88icsAuaXlBmkDe/
         qbFTHg9DNEgIpHPvLl3ZBNFAX4FAUkVYiGBBOKwLUtH30nwXbA2eQ6zrvW37cXoo0L
         f9cq4Y2LP4LdblgAawSlZHnwXNbdXCQYmGzd42h8rbobQs4MOssVbezRpIC7g4oAgg
         0ehL9KWH0U0cw==
Date:   Wed, 23 Jun 2021 15:35:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wim Van Sebroeck <wim@iguana.be>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error when fetching the watchdog tree
Message-ID: <20210623153552.3f624d74@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9V/AbxR.TksE_D5l6Qkgvq3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9V/AbxR.TksE_D5l6Qkgvq3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the watchdog tree produces this error:

fatal: couldn't find remote ref refs/heads/for-next

--=20
Cheers,
Stephen Rothwell

--Sig_/9V/AbxR.TksE_D5l6Qkgvq3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDSyDgACgkQAVBC80lX
0GxNzQf8CidAj7S9fc6y5pY3zLZOg1NevvyEtqHPcGs7uEB87q6dIu4CiSV6+uKW
vSQU5jG0TZDRRXYstdFgmZgkxXngxPUTkQRTqzNd5Q4cA5+s7SQre30UOzFUni7F
Xna0WRa2/KX7wSrpUtTwFlVKzMa+spf2g7wxJQWtDcylXLCclM4TtI3xBHdCjSuW
ol7ZUGzbZWfWSSXYKnJyKgLLJtfRHv+IfZ400tozzzOs0wC412Tg0UVX0qT8ydAQ
JkWt8sI0kiuCbmeH9NFQBj581+mjuwhUhRSyWmgCFEQ4HQn7RyTSZ17TwtQ17A1V
fHwbeajfFpxfC8sjw3Z0GBvrI96Uyw==
=gWmx
-----END PGP SIGNATURE-----

--Sig_/9V/AbxR.TksE_D5l6Qkgvq3--
