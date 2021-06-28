Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96993B57E3
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 05:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbhF1Dif (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Jun 2021 23:38:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38539 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1Die (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Jun 2021 23:38:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GCtYf4sVwz9sWG;
        Mon, 28 Jun 2021 13:36:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624851368;
        bh=rXCYJ2rpixugftqiA1OEFkibotF9G+HgUlfu0YFc3io=;
        h=Date:From:To:Cc:Subject:From;
        b=ljX5sr52R0vz3+JXY4WIhMYkkosjXYNJJ2a/9l5mH88AAI36Vn9Gs2mcaqweD+h29
         AUr21MPrgSDwvJsG2CueSf7PE1V77nqPanohyqzw0Y1Dxp4Gb27KpJiL1pQApF87tm
         0gMvxpf+Y8gHWuxqHzIrzq4bb/YYS6eWP4jAqJg5UcCLxvopZEAtgXFOkNeXGE+saq
         uoDBddYR53EyKiikG2NHjJMWOEDhT95saJKzC0ILCVxvgfzbNA+ontdZEvkRAbmxMk
         YXGwGbJdGk3wESKIu30hNbmLqpCsxRy7CyZN3Jsqt4xW3aRRVQePGM42u0RCdXALjF
         Y4OmGHRNGx7SQ==
Date:   Mon, 28 Jun 2021 13:36:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20210628133602.1ca94b56@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KJqGq8WpQGF8VZY2menm/Fx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KJqGq8WpQGF8VZY2menm/Fx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/module.h:21,
                 from include/kunit/test.h:15,
                 from kernel/time/time_test.c:3:
kernel/time/time_test.c:99:16: error: expected ',' or ';' before 'GPL'
   99 | MODULE_LICENSE(GPL);
      |                ^~~
include/linux/moduleparam.h:26:47: note: in definition of macro '__MODULE_I=
NFO'
   26 |   =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
      |                                               ^~~~
include/linux/module.h:229:46: note: in expansion of macro 'MODULE_INFO'
  229 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license, _=
license)
      |                                              ^~~~~~~~~~~
kernel/time/time_test.c:99:1: note: in expansion of macro 'MODULE_LICENSE'
   99 | MODULE_LICENSE(GPL);
      | ^~~~~~~~~~~~~~

Caused by commit

  34c7342ac1b4 ("time/kunit: Add missing MODULE_LICENSE()")

I have used the tip tree from next-20210625 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/KJqGq8WpQGF8VZY2menm/Fx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDZQ6IACgkQAVBC80lX
0Gwl1wgApWs8DkSPY09EaCL+S4onJROeDkZeM6VFwrYJWIlFzatqvG6BneU3GIO2
236FoOAwCqcWWbp5EYKnQ6/D88NZUaX8SUfwjrWRhG4NJmqhxK2RaDUBDxEvp1jm
jlVYpMX8ftmV+vYRIxQY/r1T+Pr+80vO0Tj+gX3AHdNk2GWT5DoxqprvevJT94Tk
yZGi2LDD1ybo4Esn7gkjGx4ixXz3kAdVAXTue3Rblj/BeG3hnQLw/ZVQEQgGxYvf
tVAAhHoeCYCbxY3XkDN59s80Me8bRPKso8WwEDvI/qmJEcpKUeObiVQVpcst16vT
bBKdVjqfXiaaJCSvhR2eCHyEzOTWpg==
=Em7S
-----END PGP SIGNATURE-----

--Sig_/KJqGq8WpQGF8VZY2menm/Fx--
