Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1DC93194C9
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 21:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhBKU6P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 15:58:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbhBKU6N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Feb 2021 15:58:13 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11286C061756;
        Thu, 11 Feb 2021 12:57:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dc88T4s7Gz9sBJ;
        Fri, 12 Feb 2021 07:57:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613077049;
        bh=GSMK+eAvChXb51RTmJDZ4dZtCAnDMPEQQgYTm5wyJTs=;
        h=Date:From:To:Cc:Subject:From;
        b=HfekXgDVuPHBfZfkolY+PBvuymCl+TeqIgOk4TluqONIz1g8ay18wlSLeSC/LACIl
         ML1oWfdlnvqVcG+veKavYr3bOogUn0/Cven2r5qlZLnAwQUBZjKRaB64E57A1kdBqP
         BEq1dknuseqzWSs1RCfX+1LggRE9Epkth7hy5SHqi9oslt7R7ZJRF4xgOPM8wmL/KF
         0BZGElVSRsgSAPet4LHha5o44XFn0S/dm9uMTecd6lB0LAgXXLUcGH6/GTQWqiOuf5
         gPksOcRWQdCeja4LfbORz4HlpOjfdB0RDpTzA4s1tE7rXD9tzuvn3mR41fMn6Zueut
         XYY88B/IG7PhQ==
Date:   Fri, 12 Feb 2021 07:57:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Tom Zanussi <zanussi@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ftrace tree
Message-ID: <20210212075728.36941e15@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//c.OM7nBOyJTKurYq=GrEjQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//c.OM7nBOyJTKurYq=GrEjQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b5e7014fe1c4 ("selftests/ftrace: Update synthetic event syntax errors")

Fixes tag

  Fixes: 81ff92a93d95 (selftests/ftrace: Add test case for synthetic

has these problem(s):

  - Subject has leading but no trailing parentheses

Please do not split Fixes tags over more than one line.  Also, keep all
the commit message tags together at the end of the message.

--=20
Cheers,
Stephen Rothwell

--Sig_//c.OM7nBOyJTKurYq=GrEjQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAlmjgACgkQAVBC80lX
0GwqbQf/SXKu+Q2p9ZCWREmiPd8T07I+QOiUhorHtz2LLBngELcio7Z7gJGXnOJD
3ihDWmrQEotjy+z6ChxEOsghIX+PiWzUTre+9Hx4inoDl82Ly0UGgZ+a9ovGOFFb
ueSUjtksAfE/zsVZxn6Nn5Sn1DoyaqrcJJZ0gMNk4bAi7G6CghU0N+43+h6KZRtm
03KT6Xn+PzInOwNgWzYhxnIe4p18otP/ZYcPsINCU3BtsEpw0QpeTQ269BGx2bjF
+jGZu83tdtJ3qU6UmuUfz78vGdQ6SwcSeTuFRERaZ4bhcwGtZNiES5B2UFa3UooR
ncQFxl5ZBMwgPtYUsmTu7BCvoie3mg==
=5Sgg
-----END PGP SIGNATURE-----

--Sig_//c.OM7nBOyJTKurYq=GrEjQ--
