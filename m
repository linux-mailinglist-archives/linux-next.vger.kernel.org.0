Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E523F263F
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 07:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233495AbhHTFBF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 01:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbhHTFBE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Aug 2021 01:01:04 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8200C061575;
        Thu, 19 Aug 2021 22:00:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrTwR5l2bz9sWl;
        Fri, 20 Aug 2021 15:00:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629435624;
        bh=zaRQOtdUudekI3U8BHK5Nmz50i9XCavgVORW58yptvQ=;
        h=Date:From:To:Cc:Subject:From;
        b=ivT+npR5a35enc5YIX/ASSqN8lfQmbLtWtp6Hfrecfxa15e2azaWullG+/Ix8dwno
         oi12OxSg82sHhwm0lqjHY7RUptLrqwD0g6uShsdXqiZhUfAzTrsx6brtlLAfbgyFC3
         NJ7E3WNBRayTiwf12+n8GkoXtAKfrC3xI36GZJip1Yh+TYX88ntz9F9300dOAAQ2Jc
         uq72/BZRcYQL/5+AHqJgEOlSTDjF8Db40bav+FTFvcwy7oVMwQb/cnRu02z13LH3eu
         TnUFGTQgChLwM/q50XOvc3fe2HmfO+sE4AajvbyKJ+/PtxhyczYTk5cmsyOZGaLmkh
         nCU/aOHd6TEUw==
Date:   Fri, 20 Aug 2021 15:00:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Meng Dong <whenov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <20210820150022.2160a348@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//EhndGbVAvoXj+l_0i8q638";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//EhndGbVAvoXj+l_0i8q638
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/platform/x86/ideapad-laptop.c: In function 'ideapad_wmi_notify':
drivers/platform/x86/ideapad-laptop.c:1469:3: error: a label can only be pa=
rt of a statement and a declaration is not a statement
 1469 |   unsigned long result;
      |   ^~~~~~~~

Caused by commit

  18cfd76e7b84 ("ideapad-laptop: Fix Legion 5 Fn lock LED")

I have used the drivers-x86 tree from next-20210819 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//EhndGbVAvoXj+l_0i8q638
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEfNuYACgkQAVBC80lX
0GzICwf+NH9l71Ae37AcDBaIgOkW1257gJaXIW7Up1CFCNK+yJfWf9u77qdTTjfs
0ufn0gfCqQgLK4VmkozF3d56uqXQ8RZqBBFzgCeCtthxz91X68Hcq2sUjXAAsZP0
81cdXjPFhDkf+pWk2guhzftLbdvHlQ2om4l4KBehDjhYmhnGz8o6gZe85uagVNAg
uKuc3jmosDTy/2Q59yf3xccjuqzQRR8lPgsXOHOT+yHHLh5NnBNI2qlcnWsrFlss
huBvPI7NzxLQCsbI/U/kgKqpejm3ffHrLJXaNYli1aETMAUtEZBQerBpPCGEqcAQ
XB2SxZCaxEW/rkURAzStDkYbn20YLw==
=aZ+f
-----END PGP SIGNATURE-----

--Sig_//EhndGbVAvoXj+l_0i8q638--
