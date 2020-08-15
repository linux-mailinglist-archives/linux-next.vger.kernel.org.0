Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BE2245039
	for <lists+linux-next@lfdr.de>; Sat, 15 Aug 2020 02:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgHOAPq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 20:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbgHOAPn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Aug 2020 20:15:43 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADBFBC061385;
        Fri, 14 Aug 2020 17:15:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BT16c2SVhz9sTX;
        Sat, 15 Aug 2020 10:15:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597450536;
        bh=9vqhVtWMdPfs/7oK+0KlTTMldlqRUdefpEwfMk8A0ns=;
        h=Date:From:To:Cc:Subject:From;
        b=P79cs7Scr0cEAGY/3A6MHKYkC0GmFK7g/iumt9RuYzYyxiGEowESdTUKgJaSYde9D
         DQK3hHpnBLXJPpdmL147yhePXPUmJGOljSrlh6MhMNQP4zT6vfJDMKw4c9ZW5iRN3R
         YxU/4GgJVQwintzK1nhJbgiexg4/LqRgL+Pou2yCts7t1JRGTBjualXTiPbtaGt2vk
         NH+/fTIMsm0E5xyKXlUFLI+cPPojbaDmOAY4wfVQ1O4FcOojOnbycQXvOC+NMdDlet
         7JJd7tkoE7hqhvgLufeNp/R5kPNoy4XvYxDAZB1nSPr/v025lN/R1GAMnW4kmc9cXW
         FFXSooy+dJB2w==
Date:   Sat, 15 Aug 2020 10:15:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jessica Clarke <jrtc27@jrtc27.com>
Subject: linux-next: Fixes tag needs some work in the memblock tree
Message-ID: <20200815101521.07f96156@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1EzAwQgN=z5fAiKrD5V4unI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1EzAwQgN=z5fAiKrD5V4unI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  520580d537a1 ("arch/ia64: Restore arch-specific pgd_offset_k implementati=
on")

Fixes tag

  Fixes: 974b9b2c68 ("mm: consolidate pte_index() and pte_offset_*() defini=
tions")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/1EzAwQgN=z5fAiKrD5V4unI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl83KRoACgkQAVBC80lX
0Gzvnwf+LhG7DnTzXAzkFJgCoR3Q+3s2zX0cdpi0+XZMuuRB4r3M2LJ1X2bmyF0Q
m6zsbzLhyHocCMKRTuO2AxITq0JDoevzp1RvAjFap2c1q18RVqtdc8zD0i+mDN6b
29Nbvqgf4ApQ5zCzFXgRPE8q8Yh0oN6xlPXNYluTdfvEPSaDVh/Ai4TDkufsOGrM
8G4EDK6B5gU62fbKAxv6FiqNtzlNLDGXilp8QdSrsoh3Lmy50MbisqnZyzHpxq/Z
wa33G4py/2biqXhRs9kXHBLx1VKIOEGnciQBH0jkWAu77Fnl/Ag0ujUuy3Y8hYOu
eC5Ge18DoGH49l4pmpE2ZSYJ+Yv6PA==
=Ae1P
-----END PGP SIGNATURE-----

--Sig_/1EzAwQgN=z5fAiKrD5V4unI--
