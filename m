Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FDA1AD2BF
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 00:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728990AbgDPWT0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 18:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728221AbgDPWTZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 18:19:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E616BC061A0C;
        Thu, 16 Apr 2020 15:19:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 493DCv0b80z9sRN;
        Fri, 17 Apr 2020 08:19:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587075563;
        bh=uD3XGVR745G/z5OXTjHFa2cFPMbl/b4si7y+VRMxGNc=;
        h=Date:From:To:Cc:Subject:From;
        b=f5J9MBFIL+OVDZsuAvNTTFMikMTVBdZmDS6zkz/aMZO8++ah4GKbGsuu8HSflwlkd
         li94a216zhf1FaHvKgE9E0DR30w6/WYux2aepoZaA0xD/7UtX4B5mXCo3WTSKx6jJj
         SPgGI8yIZj8WwV6Fx5VuDmy/c1mSNXFIUgj9LEmEtKUrjdMs1hTBhqmUM9z/pj4nZS
         VKr9EZnoGueCg5AvI1VuK5d/ppzWHIaqHPswau6h1Ey9TBhXV9Bt1jCDdIL4biOYRB
         cH10PsThObX+5Ss/Fs+y9kRTchhBSZYx+AdXEopY7AAUc1veX7hieoGfRU8w9D9lPU
         wFvadNKI5Sj+A==
Date:   Fri, 17 Apr 2020 08:19:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the xfs tree
Message-ID: <20200417081922.3b539711@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yCK/bVt__4zEY.GbscHcnsv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yCK/bVt__4zEY.GbscHcnsv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  63dc90feaa20 ("xfs: move inode flush to the sync workqueue")

Fixes tag

  Fixes: bdd4ee4f8407 ("xfs: ratelimit inode flush on buffered write ENOSPC=
")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: c6425702f21e ("xfs: ratelimit inode flush on buffered write ENOSPC")

--=20
Cheers,
Stephen Rothwell

--Sig_/yCK/bVt__4zEY.GbscHcnsv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Y2eoACgkQAVBC80lX
0GwZtwf9EZfqnje/VCx4ilazW38G2AlNbDOasNxzIfxpOShuwrHavN3BaVWrVi1M
Jv9YyJfhci5FDgFu5hRR+ifoAwfhlVvFcAwN8faCNvEOtQiLgNTY7FvKcQXjE5Yl
jTj3cG1g00lsjklOykO5IJ6y+CXE+g9SSH3/PJMzefsfeEGUdkYov8xfuovEIOjB
N5UOonJNmg4/24O+sHse+BzXRfT61CPpJMycOJBu4mZ5bkAGewEWN0uHs8+zp/C4
SQ4ujDtJy2s4P/HIWzxmEeleDNnLMpKG5YlXF7wKOBwe8XlMo1sfPYrUlW1jGlP+
4WPVzC/wHxBHIYswOdYSkVzeQU3YYw==
=CjB5
-----END PGP SIGNATURE-----

--Sig_/yCK/bVt__4zEY.GbscHcnsv--
