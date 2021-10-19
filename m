Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41BEE432D7B
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 07:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhJSF4R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 01:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbhJSF4R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 01:56:17 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45370C061745;
        Mon, 18 Oct 2021 22:54:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HYNGg6SmFz4xbL;
        Tue, 19 Oct 2021 16:54:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634622844;
        bh=hRumk0+uXOJH+4WTGGilujOJ7TIRVH2nLYUWV7N7AKU=;
        h=Date:From:To:Cc:Subject:From;
        b=ARMg33hb6fk/gsvpt1NohzfigWRSW4ZuMXLFyqlTZlcYfrouLUfTffjzA5liimKQf
         UlRVPu1Fm9egrQPgrHGZ3eW9QCc6ISByuUaTcmeYqtBci7iqtlZhQO7GhqNR0hA08b
         TnX6/m0iU3obr3yXv2x3B02Jm8arLrYHyTbQZPNXu2m+ZsWe3iQSJ9jz9qK716SARP
         6YQ/AtEHqTCkzympSd9y8pqO1UdHtFdL8u+Ipwt4pBHXhGlRSTjR4URULAM0sB8Xwd
         gHxI8hZGPpVajnEHGU3ePP2ZU5yJmldAv1K2q6tPAHlt9EIMhkJfCOJfD5og/7kF6W
         CRTwaEFKQ4/1w==
Date:   Tue, 19 Oct 2021 16:54:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the sound tree
Message-ID: <20211019165402.4fa82c38@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xux7DOXQo8riLuR6xbu9apM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Xux7DOXQo8riLuR6xbu9apM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (htmldocs)
produced these warnings:

sound/core/memalloc.c:203: warning: Function parameter or member 'mode' not=
 described in 'snd_dma_buffer_sync'
sound/core/memalloc.c:203: warning: Excess function parameter 'mod' descrip=
tion in 'snd_dma_buffer_sync'

Introduced by commit

  a25684a95646 ("ALSA: memalloc: Support for non-contiguous page allocation=
")

Also, the declaration of this function in include/ound/memalloc.h looks
incorrect as it has different declarations depending on CONFIG_HAS_DMA, but
then another one afterwards.  I expect this will cause errors if
CONFIG_HAS_DMA is not set.
--=20
Cheers,
Stephen Rothwell

--Sig_/Xux7DOXQo8riLuR6xbu9apM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFuXXoACgkQAVBC80lX
0GxJrggAgb43iVvo/fDgVFMEXskGs71sCGdqwX7zR9rmbIRL9/zwkoyWOwkdi5pU
jLTA/RzO/2cd7A7xAHE+8GGmySlTbLSkYBMy3zQSZIO5UeCFaTLkW6Rh1oUCAB/c
pSYuNI1uNLmCpTsg53pzQmm/0d0Q7eoa2hQMchZcR+EFdp3Q26jaIlsUOl40Fbzm
GBGse/4yiSmdAJUVK6ND9jdojPeo8/flgO6+C91F3gDULbawUPcq4n0w73NCBRHA
vtGg2BQ79TFg3AWWkbpG9LoJxUrufw1dnrsBbwlOHP+qpv/FWMO+U6fp49UiBvBT
VoxtJV4i/PXQaRJcVnky8APslMYAdg==
=IFLl
-----END PGP SIGNATURE-----

--Sig_/Xux7DOXQo8riLuR6xbu9apM--
