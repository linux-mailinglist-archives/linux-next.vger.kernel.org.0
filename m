Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489C143C7C5
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 12:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241472AbhJ0KhL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 06:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239509AbhJ0KhK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 06:37:10 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCD1C061570;
        Wed, 27 Oct 2021 03:34:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfQ6k5KMcz4xbW;
        Wed, 27 Oct 2021 21:34:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635330879;
        bh=LfOCxySsOV4UV6Fr37VkLYM7FY0YxcmyVeOxA+acRIE=;
        h=Date:From:To:Cc:Subject:From;
        b=Anc+Ol60btLuimdSAcr9bd1/KJk/IuoOnkKctBrhX2nEUi1tHkri/aMrKeBfXfdI6
         891uprEVqdDhQ6CAVjsdAH6FNWr7LS4D1WyvZ78RPPDOZlApUgy98Yqpx/SpNliW86
         wupzLa8wQ4k+U3+0yXmkXNz0DXBJvLVv5uJ+ER39dphmH59dUGiim6WdAQb3FYKNfT
         uAD90zq7Et0Z6Jc3mOMqWEPf5T/HY/PTRPHYEegBDG1Wm5pVxV4iG761JF/nwl3bew
         uYjDxbRetKwtSUmM16Li7Bn4NWanGTe88yapzyGKPGvB6NUZi0Ow/aczyyFYBM5sID
         5qNXpg7NRCXzw==
Date:   Wed, 27 Oct 2021 21:34:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the gpio-sim tree
Message-ID: <20211027213437.2414fb46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P.jhEaZQbsve6KC9.p5s4NX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P.jhEaZQbsve6KC9.p5s4NX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio-sim tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/admin-guide/gpio/gpio-sim.rst: WARNING: document isn't includ=
ed in any toctree

Introduced by commit

  b48f6b466e44 ("gpio: sim: new testing module")

--=20
Cheers,
Stephen Rothwell

--Sig_/P.jhEaZQbsve6KC9.p5s4NX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF5Kz0ACgkQAVBC80lX
0GxsRgf/bUHLnyef6kruoTYYsnah/hETdNz7JijbfMpBWLKoR8ejeK5qVwJNlz/H
RrRFn8Ds5ddRreucrsQUx2HSwcjMPmPsygwdNmPv+Sg2cxKQOVm3m5oS2fuS+/6i
pG6yK9Vlh5Lv0GH7Q+Ieif5UB3TYBu5Fybj2pYbXhn8Hx19uBmwcctKaU38X4ME8
swEDX0ZwZhVoCo8M0Rq+tmHW4XRrZpv2if6azzGGGFIsao7A5OkhvieLBwbzjT09
8U0u+DcMPBRlATMdZBkw1sBN/02f5X89P4TokrvI8go7KKN21NB79+OStmA9ls3z
sRIb7l50txIBMcs8CEColu73nAr9Zw==
=bMVz
-----END PGP SIGNATURE-----

--Sig_/P.jhEaZQbsve6KC9.p5s4NX--
