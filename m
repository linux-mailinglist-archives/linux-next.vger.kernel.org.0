Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AD33EEA85
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 12:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235588AbhHQKFw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 06:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239342AbhHQKFp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 06:05:45 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED8FC0613C1;
        Tue, 17 Aug 2021 03:04:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GpmpN6Zl8z9sRK;
        Tue, 17 Aug 2021 20:04:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629194656;
        bh=a5vBp05i0w+6dipIg/OspEpX80RBiZzeW3gLpgTDYE0=;
        h=Date:From:To:Cc:Subject:From;
        b=K736wvBQAeOMYhW10/5rrjSZ0i3XBaHadyADeMa2KvCD2r6N/rLWEo9FSRtlzKfQz
         BRjjB5VkmBqeueLPuU2RTI71bUN36yjPlWKUF+00I5he1RhxoVsf+/gqb3YD9ObWEG
         KH/qhzZASWAD8DbSi/dEUjaTcKvxRQe2NO1jNwr6QoZRN8qxXsJu8ZjrfxX1CmF8Tl
         6g1qkZ60QIkNLf0V7FRxt19aqS8J7SF2pzl65OUytMpx7nYmMbEYHU7jMrHKf/Ukx5
         JgmMFFjdCWnUuuv+9SHt9VA4lOqzSix0R2io4NA+lhUI4lNK2EQV/BI77QUdwSV+P3
         685o3HSsupGAg==
Date:   Tue, 17 Aug 2021 20:04:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pinctrl tree with the irqchip tree
Message-ID: <20210817200412.799bd992@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hk5d0=.3ZZ3m5bQKIuoxfeR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Hk5d0=.3ZZ3m5bQKIuoxfeR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  drivers/pinctrl/pinctrl-rockchip.c

between commit:

  a9cb09b7be84 ("pinctrl: Bulk conversion to generic_handle_domain_irq()")

from the irqchip tree and commit:

  9ce9a02039de ("pinctrl/rockchip: drop the gpio related codes")

from the pinctrl tree.

I fixed it up (the latter removed the code changed by the former, so I
did that) and can carry the fix as necessary. This is now fixed as far
as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Hk5d0=.3ZZ3m5bQKIuoxfeR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEbiZwACgkQAVBC80lX
0GzAbAf6A+vnqy0crTp/QZiL6Xjw4grziQBJCjgtIDxS7BFqhnc5ls74lS3Wy070
q2goxA6C34fX3QAAfVFPJ81Gs6kv+5fIxWwKhnmHPVSGY+2b0hn0WjPzkrF2Jt3t
h/pr9/AA3CEuym7kccPEsZ7GqSDLjFi4SO3aaG/nSGSHIwvQtU7ekDVnVBPfvZw2
NENUQ46TQVOa3Odf/IT0/Sr7kc6BMuZ1JLXqDI+JPrTxHgYIkfj7KNQfaM7zOVgq
FeLwOlijtyUO/bnSxmpNoInnxgCs+NCwhJde7trzD0E4RmOIftecN3i9bISrIxup
8eok8uLCu6fWicQVD+UjcA0zWCOTeQ==
=uzMx
-----END PGP SIGNATURE-----

--Sig_/Hk5d0=.3ZZ3m5bQKIuoxfeR--
