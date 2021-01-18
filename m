Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 925AD2FAA50
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 20:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437553AbhARTgm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 14:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437551AbhARTgi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Jan 2021 14:36:38 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C14C061573;
        Mon, 18 Jan 2021 11:35:58 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DKMTS0nsMz9sWD;
        Tue, 19 Jan 2021 06:35:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610998556;
        bh=+c5gKv/Myi+5GsbhoEPbNIsQdqx+Fe87Hkw0OETM7r4=;
        h=Date:From:To:Cc:Subject:From;
        b=vIbOkIChryhdKS5sBk5/j/uw1/RUE5PIcc7YfwZqjZyCke4F+t/VKu4EEAS1htKqv
         JwQeDpOZ31YGW57ngqpAut78lFAVGlodksqLjz6MiXouuHovu+mAB0bKuI1vZukuZL
         MjY2IMiHEhvJwE67F+5+fi3uzNi4XtZ9jTWbRvNr1k/b/wS5rOEAEHJdgdjmY8uwih
         dxpMy0OTyMSHs2A9wuU8u2JSfppEB7XQnlATMyrCoOfr13/yS2a8aNRQ7/TpJduGs6
         kYnUY+sUQ8GhBkNhVAgIZNMr/OFEv2MCxImP62Jpd6HBs2bm0xAJVCeIBHlTIMKs+N
         S4bE8+Xg7fxSQ==
Date:   Tue, 19 Jan 2021 06:35:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Frank van der Linden <fllinden@amazon.com>
Subject: linux-next: Fixes tag needs some work in the modules tree
Message-ID: <20210119063555.42227a95@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aJS_3ctTE.R1j=itbrOtShE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aJS_3ctTE.R1j=itbrOtShE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  46b93cf85455 ("module: harden ELF info handling")

Fixes tag

  Fixes: 5fdc7db644 ("module: setup load info before module_sig_check()")

has these problem(s):

  - SHA1 should be at least 12 digits long

This can be fixed for future commits by setting core.abbrev to 12
(or more) or (for git v2.11 or later) just making sure it is not set
(or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/aJS_3ctTE.R1j=itbrOtShE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAF4xsACgkQAVBC80lX
0GzViwf+Pauy8QafINqgBrcgx25nKO5j9bxdpwaa6jgItmbylNXQ16AGpf6X6aLc
2BfJHc3nQRD4IIHdEhNkN1U41fCG0sASIgmRjFvuURDFQZN4+ERXRF5cYnZlEN9X
sYmRCM1fojrFN+l3uXNlSdwCv7qf7OLzc+ZF+YbeOJRN7jPa8o5o9cToWRyJW5r/
P0rQHKZ1Do9pMgWoVy3orEN2uV8qm9XIGSckwsK2kXNUMg1tJw0N9OYTAerwsIgH
J3romTYm/YFT4Idk8Yev0vFWCooeaDArJocbFJ4pgR2CDFnCnAHEFIaqHjKqIyug
fBZCiUAl/KE6HYkQmEsbTXTdeDXgNQ==
=7w6B
-----END PGP SIGNATURE-----

--Sig_/aJS_3ctTE.R1j=itbrOtShE--
