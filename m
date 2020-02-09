Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82282156CFC
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 00:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbgBIXGF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Feb 2020 18:06:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58757 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726798AbgBIXGE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Feb 2020 18:06:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48G4Qf6wbkz9s29;
        Mon, 10 Feb 2020 10:06:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581289563;
        bh=64KQQ6OGnuOCJTUpCt9x6QtWmXy1QR1UiQDytN151Qo=;
        h=Date:From:To:Cc:Subject:From;
        b=M+6RZ2KbRpUVZ1Q+dstXXw66wFYRFkndj+LQuQW/9hXZK1pfc1L3reW+AmbRbDtPQ
         5n8GNJzyiI7Z5Q0pjBvGjpSJATLaHADxEKOQe2hheFUmI0yAEIEDQvbABFQl/DKPOd
         6wNSAhn9nFpT/Cw24i8fVREFKn7yPkRWLuJ/dchm6WQ5oxXex+pSKvxoe4kVcmeJSD
         K2be/iiaZhuKrF3WNZJYeR6IL/C9UktQ3BkMfMcmg81Z2/Pmqc8yN/xwaAdGM825pL
         4RbVx4CshHS2xCHyJNVRyjkdcEqEqAxPuVcvUW+BCQiAt/3jYZ5oDybTszT4DjgwNZ
         SdDETLp+Sh9kA==
Date:   Mon, 10 Feb 2020 10:05:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the keys tree
Message-ID: <20200210100555.7497d69b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/II1eBoj.2IzcWVCzG9IYoqY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/II1eBoj.2IzcWVCzG9IYoqY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the keys tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commits in the keys tree interacting with commit

  0ddad21d3e99 ("pipe: use exclusive waits when reading or writing")

from Linus' tree.

Given that I haven't seen a pull request for the keys tree yet, it seems
that this work will not be in v5.6, so I have just dropped the keys tree
for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/II1eBoj.2IzcWVCzG9IYoqY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5AkFMACgkQAVBC80lX
0GyZKAf+KsjDg+wqlTQQ4wJpLUi77elenST8EO8TCZROI62YR99+FXrK1RXxRIk+
TZyWsIBnwBRpl5zpRWOCfL5IZFGbEYIKfLBhT4QUjuxGZLBYvjZN3gM0U+QQNnSs
dvuTWjbjEhVObg0zhwntITdxuC8GUL3rgpX4QEIjmH0EY2uIMAmgc5sYjB0tFfMb
36Yj1bacQtfN0i/7qCmoyDkIf0NgxQlIHFlrmYUUsQkFfVkom7EdFC4DmMJ0V7Tj
BsMEHSdVKFMtFJQc4QT52dEG5gTrtB7QqVVfKzCrrU+8/cSyS3HeRC2OsEIbX9YO
iQlJJaGe6YcN5gtk1g5WDjYWzGNVhA==
=MCe7
-----END PGP SIGNATURE-----

--Sig_/II1eBoj.2IzcWVCzG9IYoqY--
