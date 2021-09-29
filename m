Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E264E41BCF0
	for <lists+linux-next@lfdr.de>; Wed, 29 Sep 2021 04:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243763AbhI2Csk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 22:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243785AbhI2Csk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2021 22:48:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD16FC06161C;
        Tue, 28 Sep 2021 19:46:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HK1420C64z4xZJ;
        Wed, 29 Sep 2021 12:46:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632883618;
        bh=HW7aZHEjXEKf/hUK5nFDRQoDLHpYNFTTn5wGUb+Ev60=;
        h=Date:From:To:Cc:Subject:From;
        b=JuitIWmHavKjRXShW9xsgZbtiqyw3sQUaD3Qj+Mu/Mu829RYEwfCC93lFgtz8GrIa
         ixxqCY8DxXirqweXb1vkLStb9qUw/Xvl8kEf3/8JqWKwQTwo0ufIK/95P6qPZ6Zu2g
         tr8laJ9+ITtFYCBk8btzqd0DqViHc4GUV2wZdp5XUzWWoAzAxHUi5o98u4akCwYAWl
         kmv4wVAXLNbd1AKJ4z/mPDqzm+kUvu8brpDorLnbLjURmV65LC/Vo/9U/p+dYCk7qJ
         snfl4queSWMWezXFML0W8S3igcEKVrmEUbW2Eym9OdoH2Bewe7abA4JC3juJOyWByx
         ctQiZPGFT5R3w==
Date:   Wed, 29 Sep 2021 12:46:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Krupa Ramakrishnan <krupa.ramakrishnan@amd.com>,
        Sadagopan Srinivasan <Sadagopan.Srinivasan@amd.com>,
        Bharata B Rao <bharata@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the akpm-current tree
Message-ID: <20210929124657.51ef9f53@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BRf/Nkn5L7bPXvFZWUA+N+H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BRf/Nkn5L7bPXvFZWUA+N+H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  976cd8d1b9f6 ("mm/page_alloc: use accumulated load when building node fal=
lback list")

Fixes tag

  Fixes: f0c0b2b808f2 ("change zonelist order: zonelist order selection

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please no not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/BRf/Nkn5L7bPXvFZWUA+N+H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFT06EACgkQAVBC80lX
0GwUOwf/ZSTi1D/eqxLwsIYGKc4SI/mNdEXOi3E/PPubOBbse2dj3xT+49rEyW3f
qtpIW/yiliepUJBX0VkbVRP2YQfb46ODrKYydFYUnwQ3XJBlWnOGSX0eJl5aam6q
ooZxjCKTdkA56wudIv6lp5IbdFVXU5RusixX2IfrssIdJiaqoHbb01W6X7U513zw
D3PDI3yWhOuKiB5aHpd+npwnyj9cs1FQOlSKsL0u0SxOCtnHRWYTbKrAMj+Vauck
slHBCYLtKW09hF+t0Npjsi5IcyIU6YGruN17LZxcT20BPrpsUZtJ/J7bHCNl/Ir1
FK86zX8WxNl/jxTsYkNImcdJ0g9Buw==
=z2Va
-----END PGP SIGNATURE-----

--Sig_/BRf/Nkn5L7bPXvFZWUA+N+H--
