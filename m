Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F77D2CB26C
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 02:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgLBBkX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 20:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727660AbgLBBkX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 20:40:23 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0742EC0613CF;
        Tue,  1 Dec 2020 17:39:43 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cm1qJ0lBrz9sVx;
        Wed,  2 Dec 2020 12:39:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606873181;
        bh=CgMKVXTfncw4rcc7e6P6TYV2cbXW2lIpkNw+DDQDDwE=;
        h=Date:From:To:Cc:Subject:From;
        b=GRbPXN+RroJKCFeEV3DMniFjRlCE+Or0APIasUmQTXRYWUSUKoVdZwK8+tsMjOAxR
         2KHOvdwDVynilhcq+hY3LDVWf/kAg7zz6q4uQ69UwUqOAPlslc3W2A7LBCmIkxU2uf
         We5uE1OY7wyinEKF8l5Ni9hNkSSHg9lgYTiJOpLO38Ux6qs1jMOuZCcKShPjvRirO5
         xT3xbmcFyKHEPYS5m/5ROR8B0sM4MVnqRTFOco3BHvOf2jolkjzMHD+vytIYZbW5gc
         ajOhSodbs4/eXaLVjdgAbBWDHYaPWjiqLrk4nmzmK9iJxhjU8E1hRzu40LjHeQ60+6
         66zP2QB88xR+w==
Date:   Wed, 2 Dec 2020 12:39:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jassi Brar <jaswinder.singh@linaro.org>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mailbox tree
Message-ID: <20201202123939.4a9e7549@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7.K6NmFNZ7lbpzpGjwpI8ze";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7.K6NmFNZ7lbpzpGjwpI8ze
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  983df5f2699f ("samples/ftrace: Mark my_tramp[12]? global")

Fixes tag

  Fixes: 9d907f1ae80b8 ("ftrace/samples: Add a sample module that implement=
s modify_ftrace_direct()")

has these problem(s):

  - Subject does not match target commit subject

Maybe you meant

Fixes: 9d907f1ae80b ("samples/ftrace: Fix asm function ELF annotations")

or

Fixes: ae0cc3b7e7f5 ("ftrace/samples: Add a sample module that implements m=
odify_ftrace_direct()")

--=20
Cheers,
Stephen Rothwell

--Sig_/7.K6NmFNZ7lbpzpGjwpI8ze
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/G8FsACgkQAVBC80lX
0GzmNgf9GSqMPPpR8GrNwdoU3GDvfTleFVsx+Jxn1C5VrAQ2mgQPGQFfRA2qLzFa
/xlVChcZmZOyqoDkQMMpUW4UqqGm18CHUTDrbt35xp4Gl/Benqyhm9NZJ/601AEp
DCeVec/L4MvpsujyA50IS8BbAg0fBhGeIlpjpao4HM28oUS0NtcW10g8xRq+imvr
rUIUpuNuVnM8lRnD/wVCBr6hag7Ujmnrif+GVTPE1HYdrNkptffSC1APHh/MJiYS
+/enjwHNgzlsHDbfTeavHeHs7Fv7tMeNBjzNkM6FVeWKXmqi0I8+1jDje2SXpsMR
6vKdNxCaQoi+zrVZb3yU3AhQu98mag==
=uWfR
-----END PGP SIGNATURE-----

--Sig_/7.K6NmFNZ7lbpzpGjwpI8ze--
