Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A44A39AD7E
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 00:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCWRA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Jun 2021 18:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCWRA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Jun 2021 18:17:00 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB196C06175F;
        Thu,  3 Jun 2021 15:15:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fx0ZQ62hwz9s1l;
        Fri,  4 Jun 2021 08:15:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622758511;
        bh=FLhYbQcR70OGtsLy38uPsw01SqC9p0StlYgrf4TIaxE=;
        h=Date:From:To:Cc:Subject:From;
        b=FleBTEDsr+HX9o6rYOMmwnhySb7Ayu+6Zc2Q78PnWg/7TTGOyfL+OG/1Hw1p+v37k
         skTWEj5GE8d7oqMDzC5hPWFkv3ZLnGe1MQCOhlJBEFxfVMqfAf8rLi45XZjDDbxZqd
         5FK9pc7PaGe5QHRcnDBJsgQ3NANl5uoYEec4T5AgXyS6t2VPXFB+Bk5YBW0rckfhkW
         1AEdXfEdmLL8Jfrai52mU/gII3jc8KygWEnLteRcXHMfSj+L2aUTCLt71Eh6MyhUci
         cm1DosrT1wbQ6Ea3+Z9li5WUePBD1kB5OuCNB/JW0OgU6rtV6kEPwyWyjS0R83uNLV
         52e/1QEwlMYGA==
Date:   Fri, 4 Jun 2021 08:15:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm tree
Message-ID: <20210604081503.2229b376@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ssh0YjeJxYbN6Q6kJdYcJ7h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ssh0YjeJxYbN6Q6kJdYcJ7h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  aafc8eb78635 ("ARM: update __swp_entry_to_pte() to use PTE_TYPE_FAULT")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ssh0YjeJxYbN6Q6kJdYcJ7h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC5VGcACgkQAVBC80lX
0Gw7fgf/Q1evrRCclHWbDGGF8X/LItIMNjfdTvCZ6uUh5hFpND7p5E1CqMJ/Rs+9
JUSFZz/MjLf+MC/gH3f2om7bmXw5hAaOtJtjjgj3Du8gFGltu+kDOLEdnRDzhTIg
BufuBlovf4zr6wMCbn+EfsU8qZ2CCXmIrC9FJMCnUxm9gK81GytftKXWvINlUzUD
hETiu4keSp1AOIhNIkTmCk0bQbha/bPwsBIuepELlEc/J1vy3k9+3sqlrf2fQCy6
H2ezP2mpxdBn5tuMoWM1qnDVCf+dO6BG9pznH7XEIkevxXFOe1ocQTmGrIInlks8
i2hEHQsvlsd7NCmt5evjvUsvN0Dr4A==
=r4IA
-----END PGP SIGNATURE-----

--Sig_/Ssh0YjeJxYbN6Q6kJdYcJ7h--
