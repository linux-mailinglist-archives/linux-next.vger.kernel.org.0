Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA7A3F23A9
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 01:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbhHSX26 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Aug 2021 19:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233512AbhHSX25 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Aug 2021 19:28:57 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69194C061575;
        Thu, 19 Aug 2021 16:28:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrLYF32t7z9sWw;
        Fri, 20 Aug 2021 09:28:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629415697;
        bh=jwmBww8fgZFFHGP3eHblDQ2cgbGOqIpWqVXtIoHchdg=;
        h=Date:From:To:Cc:Subject:From;
        b=r/PeC/Wm6ywASSRArp8xIv7VRufJNTjJ/9XVZSY+6QTgK2iKBUtNCAmFbgTsmlfzD
         0OPW9Ls3PsCDfRZQO29zMtuaLhhPgF5UREZ0skcK4E12evPoE5DuWWmUKTLCKiDWOd
         clciWEfqW9lJCysdfl/xqmulstizAdmW5+DApzTSpHbkUq/s+vytZ1+k2P3BsXZqls
         ZI0uupWnR+G5bLszsksU2BIuI8Iq48KW/htpPQnVN+KdmHK0hduzQv2DaM6JTGVeL4
         rOieeN5Kf6MTZvdMrRZ86Oajdeu4/LfXPiz+yguio9u6CrZzRSZ9d8Ek/YjniYgvEr
         9enSgEVqYqRuA==
Date:   Fri, 20 Aug 2021 09:28:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kbuild tree
Message-ID: <20210820092816.2858fac8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B+m7qnVBw8JGFzL.pmY1S1v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/B+m7qnVBw8JGFzL.pmY1S1v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing
arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing
arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing

Exposed by commit

  0fc7db58e2a6 ("kbuild: warn if FORCE is missing for if_changed(_dep,_rule=
) and filechk")

Not sure why we need 3 of these :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/B+m7qnVBw8JGFzL.pmY1S1v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEe6RAACgkQAVBC80lX
0GypPgf/dbOyMPGTQZOrl/4Ukb69429aMamI/EQRJup7XrdjU7w4TF9UMl3dvQg2
KMf9aomS3+rX8UrMGKDJ+UYyhV3cspuD0g0dtFE9qbsQ/YSZZJdb267FC5vBMBZb
rBE3SUvTa9WI+Ddsgej9kULDubx7+ZBmGBy5wf7VmgDWReRroDQCWZ7Fdq1Twr48
9oFz+3jkMo8jkVnjYO5qsej2h21nBDhyIUCSo5eZTCrP3wNV+y0gW/oxy6V2d/nU
j0+0LZKD1BciyV2XGiCayY0lUPmu2iFZhyRsh+80KfY+ru9bQ1KiiNCXYe9YxPP6
F26CRC1MQ48qCMK060Z3OrjQS7mETw==
=HPZS
-----END PGP SIGNATURE-----

--Sig_/B+m7qnVBw8JGFzL.pmY1S1v--
