Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBF33615C7
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 01:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237710AbhDOXEQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 19:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237638AbhDOXEK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Apr 2021 19:04:10 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D488C061574;
        Thu, 15 Apr 2021 16:03:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLvz22z3Dz9sVb;
        Fri, 16 Apr 2021 09:03:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618527822;
        bh=1x9N0l+K17Z+qSwWI1gmDCcs/2ppvv/6dnEA7XVQBg4=;
        h=Date:From:To:Cc:Subject:From;
        b=nFzE5D32l2bk9L4rTNVlmaLwtmHZ/LHkM/u88HSqtZmqqlTFPyddU2IJinvMlTLAq
         0xZNk42LsT77JEoNL0aOk0mzgm4jrMsTVtRLSBrLvEBpNapyPeKjRg2GFSGea7vcGv
         cOdFnv3kXB/Gs2B6IiX/sBhe/S8shyJFoJAb9QMRcmNlF8zdRwZ+LZL7aMHSnsfiSZ
         swVboGhsGeDdDipIrGiMxS+Xi+G7vlZaj1xuC6AJtFkqmKioPCzRG34XMouLqNClWD
         j15pQqQaCtYxXCNX/gY+PpCv+Dj8095IfTn0TiwU0TN3SYftsOjLv4lUAUmiegF2CK
         SpTIQ3S3qOWgQ==
Date:   Fri, 16 Apr 2021 09:03:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error trying to fetch the scmi tree
Message-ID: <20210416090341.25d9fca6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RkF8G/5cw_=1d07s.L.e/cE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RkF8G/5cw_=1d07s.L.e/cE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the scmi tree produces this error:

fatal: couldn't find remote ref refs/heads/for-linux-next

I will use the scmi tree from next-20210415 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/RkF8G/5cw_=1d07s.L.e/cE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB4xk0ACgkQAVBC80lX
0GyRTAgAoGpqId4+NNLf68AnPAMIUSvLW2zVtYBXhIaSneJff0an8mFP7nOQxHcb
rs5TUAqZruqcq2bPH5Mm4vqJeYJoPyHt8GVQkQ0k89uToMhGb5v0xkUyPVb0y4El
M+AvLs6CGhjUU82gtsXfViXGrIJjS5S0nPZvxr+MLjIsCUUltF0pa1s0/mQtZJ6e
RjPuopsy6IKl6J535Y1h2LAfAyfrBvNcdG+5AGWnsAMNdMg0C3R28+JtVn0qYXUH
dlhtEQIwTmhHEHlOR+mFgHS5+YvgjFGAqioJbQiF7dbz7iS+LSF/f20ZKzjFg0RT
FlbW5z3AwwqJv4mFDitT+G203rY5yg==
=Y5eU
-----END PGP SIGNATURE-----

--Sig_/RkF8G/5cw_=1d07s.L.e/cE--
