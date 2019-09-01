Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE67A4C4B
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2019 23:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbfIAVca (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Sep 2019 17:32:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51329 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728519AbfIAVca (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Sep 2019 17:32:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46M5yz2zQHz9s4Y;
        Mon,  2 Sep 2019 07:32:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567373548;
        bh=1ZAnkpw6JSe9YanCuQYfIuIdHuGTrE01UvUQJ8a0Khg=;
        h=Date:From:To:Cc:Subject:From;
        b=MvCuz7UYgpqesGbF6nEZSXJmUFGDEcEJq60NUxfbqxfGPfUttJFKrSsnwsDIJZFDp
         0PhBVXyAvTIU00Ef2X8Rk0qjMDhbQP80cjDlUkdnqbIPzvAC1RD91P4NfGRkf96wZx
         mHyzgpu/v0CZ8yegoPz4o3qWIpxznd4vMoMWTkFUxZ7yBv7+vjac0QG9puVF3165WB
         tOhy8b+2eS9FqwGDzpQEijmO6x40RNAEq0Li8YeQ6FADZqcxvcQXwIeUQW9/d38NPG
         7WKcvkabD0oVCcYN9gJ6wn+x+lrTYkWnUdzfXIutoAohbnF+n9SfbCV6emjLav82B+
         cqPxTuPOjIdvw==
Date:   Mon, 2 Sep 2019 07:32:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <20190902073227.34b86449@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y0nNvpMqCucxQ.H9ZB5L.+x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y0nNvpMqCucxQ.H9ZB5L.+x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8dbcb44f392e ("tpm_tis_core: Set TPM_CHIP_FLAG_IRQ before probing for int=
errupts")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/y0nNvpMqCucxQ.H9ZB5L.+x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1sOOsACgkQAVBC80lX
0GyBhwf7BeaK9LJNy8ZnZQgu30tG8rhg0hL8IA4eQSxmDcI4vRSh6Xc1+Rvte0X4
w+AddLeC7YFdQgp2CopFBBVA0uJEXyoXY+jrjAE+OcYuRcSoXaWL0TSfMOWC//SY
t9x8f5ng5njISf18J5CwtlKkffQ4fpq9s+NkwZpYfHpx8PaYCGs0TufKV40E3Lph
JxmJUyGgW3eKnAqzrJZp7b8vc0p+dctsvcDzynTr9cnvSJSiproYiyeYJaA+IIa5
nKzcVZQKUg0no0sk2M96o0Iy7GyiyI5s9hR/MMSvrqdXsv4zJNDxe0+ufHI7fTEU
YrLK4BXooJjhQF6zr1atcCD5HR/1WQ==
=9D7y
-----END PGP SIGNATURE-----

--Sig_/y0nNvpMqCucxQ.H9ZB5L.+x--
