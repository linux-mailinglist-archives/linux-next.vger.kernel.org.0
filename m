Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025D5459689
	for <lists+linux-next@lfdr.de>; Mon, 22 Nov 2021 22:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhKVVUd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 16:20:33 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:34587 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhKVVUc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 16:20:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hyg8M59d7z4xZ5;
        Tue, 23 Nov 2021 08:17:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637615844;
        bh=0Ea/nGzlHHDKeHVORh6NEs6b+59/DkXLK/Xllk7w01Q=;
        h=Date:From:To:Cc:Subject:From;
        b=fp+dHbw9hKEH+H3CnExICiukktyEKakcyVojT3Gfdvseu+Czx+cYWe2kzfvnCWzzB
         jV1k/9DWShMqBvKt0e/qI7TqshQn0eRRVF4Lv9M3OWJpUQOhBWRWInnJ9xzdZe3N7g
         RJbHKcr0TYjbG7XKA49IWY/zARlL33a0g/FaXry7RjM24gJrK1LVyskJzzF++rW+cM
         LFNPBzAELWXyFO8Xk6Bd+L9UR+Xv8KlLXPEG9evNu5TlxhucywPp6GWDUyd3th0RDw
         xi5XJJLWEISofwcKRIx89rMvZ60JdNZRCdXEFyth4R46HBAWEEBSbqwf1sFzUQNg1I
         73bbL64+nUX2A==
Date:   Tue, 23 Nov 2021 08:17:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20211123081723.4263f8c1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ntmYhIbD6.VFJiV.zy69hlb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ntmYhIbD6.VFJiV.zy69hlb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3e6a950d9836 ("HID: input: set usage type to key on keycode remap")

Fixes tag

  Fixes: bcfa8d1457 ("HID: input: Add support for Programmable Buttons")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

Fixes tag

  Fixes: f5854fad39 ("Input: hid-input - allow mapping unknown usages")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/ntmYhIbD6.VFJiV.zy69hlb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcCOMACgkQAVBC80lX
0Gwfowf+IppKvrXo1/ZOxM2JEIoRdazcNpp2x0PbyXdcfo1R6IrMJ63iQeZ2IfwD
Ke0VRnYw/oM6UxTzaBZoo0dmspDLfRVf9D3pN9KljwhNdREMshZf7j9cEkaXXjIa
L874MGvK2RkhBjstup2eNbJ3DbHUN8JVRZ1BkMo521I5qI/8LbRJ2aB1zpBej1kc
U+GK9VpiwgfsCwaRCii/mCp2UKozQkxnFFf182QVjPFaDXA4Kb1MSTcv37DMF75k
AxsDDI1rcTFEWrMSB2tLaQegHRstMsE4aKzpkSFzXVSLLJ267lFAiMb51w4CsVbq
2VFZhKLQBNGAzIqMnP3+n5gr7/fdiA==
=Me6A
-----END PGP SIGNATURE-----

--Sig_/ntmYhIbD6.VFJiV.zy69hlb--
