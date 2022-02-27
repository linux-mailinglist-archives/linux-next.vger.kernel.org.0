Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 863554C5F03
	for <lists+linux-next@lfdr.de>; Sun, 27 Feb 2022 22:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiB0VUS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Feb 2022 16:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiB0VUS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Feb 2022 16:20:18 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F833DA6A
        for <linux-next@vger.kernel.org>; Sun, 27 Feb 2022 13:19:40 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4K6Gc70pcCz4xcd;
        Mon, 28 Feb 2022 08:19:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1645996775;
        bh=lvWcA5RWoTP5+1db9xR6cIiYGFVvIf1LMn0UHW2KhY4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sB/49VVC8dQkWInPpUq4mKx2Pv80bWRmAJBu8CLMFg74cJ+L7TPxS3UA904sKMnQ8
         dgmYQF2VdaCy/z2PYKOQrkseKOGvNBydRQ3I8EddLuieLr2FXap6bDC8Xw8xCHGFA3
         JFTFRan9oKZdbiDnuLfz8l9CcgIRlq4J70hfYIwqRb+JbvBZvkEdlnGWOExiggqqeY
         aHjFZERXh3gnn8bJCFAJai3jNF5F5X1UQqj0Q48jlsESNo5zt9lJANUwutFggO5Scy
         iDba7kRwH/ahxJaBJVy476VxBn0/FgTh7rWhLynunaB4pNhCaUQTY0Gt8lSmt3muqM
         pAhs1TjfrTk2Q==
Date:   Mon, 28 Feb 2022 08:19:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: Please add for-next/execve
Message-ID: <20220228081934.1b5bc274@canb.auug.org.au>
In-Reply-To: <202202232131.809767F@keescook>
References: <202202232131.809767F@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m=e+OOsZI/_9zw3/XoxQba3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/m=e+OOsZI/_9zw3/XoxQba3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Wed, 23 Feb 2022 21:37:51 -0800 Kees Cook <keescook@chromium.org> wrote:
>
> As part of Eric and I stepping up to officially[1] be the execve and
> binfmt maintainers, please add my for-next/execve tree to linux-next:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=3Df=
or-next/execve
>=20
> This tree currently contains all the exec and binfmt patches from mmotm
> as well as at least one newly reviewed change[2].
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/MAINTAINERS?h=3Dv5.17-rc1#n7223
> [2] https://lore.kernel.org/lkml/164486710836.287496.5467210321357577186.=
b4-ty@chromium.org/

Added from today (Mark added it earlier to his tree).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/m=e+OOsZI/_9zw3/XoxQba3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIb6uYACgkQAVBC80lX
0GyBNAf/bzXBHhXoST44tdS7C1IxFCGhkHcTYtIJb2F17pD18btYX2qN1h6sqv1R
b4yESXDIxnB+H3GlclOEn9svHWzSADNYXKTPAYhd2aMh6G7/oPmqPdV4Hj4D2dC2
+F8bTzhsdevzS45C48ZqJiUZ/k4Feemjtmc/ovZCSkQuVwRv7ZWQjpdYZQw3Oktj
OfsMylGfHdKn7oYcO7CsshEuvXElx+UdtR36YaOdO6VKPdNNcZsvFKiLCZWTLlnj
rMtAIZforQvYm3K5RmwpTQRkgkRtfDtWPVntRePR58dYVS8vwk9RuXmQY+ky77di
SYGd8j6lG7PILJV666tt9Dfpve9h8g==
=zU5L
-----END PGP SIGNATURE-----

--Sig_/m=e+OOsZI/_9zw3/XoxQba3--
