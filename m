Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FBE215247
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 07:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728832AbgGFF6l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 01:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728747AbgGFF6k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jul 2020 01:58:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AE4C061794;
        Sun,  5 Jul 2020 22:58:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0Zcq5N9rz9sQt;
        Mon,  6 Jul 2020 15:58:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594015115;
        bh=hJI5DpYyo8IagiD10ZuFQLYh9ivnurZYifnJGE6lXyc=;
        h=Date:From:To:Cc:Subject:From;
        b=ARuCep/LKsUhWT+3DL25r+h/cQIT2LNCB9WHTuPm4kEg3894xdsAqvDxFskpcwZ/4
         rBkfztAzMxylwVBHvHFhxldI79vbZTK9tx7PALBwx86BvbZITTthSypGitTIgsiQ/K
         gkI0YFviDXmT/0lUXJRsSdAr/l4mN0c/wnauvXDXsmrQhGE6puQZGMohQKji3BhfXD
         /8fAnNxOtids+PQkUJVOgjyfEedHnoKtVWJ62txOb/ydL3WHTRAzEt9hnRJU2vtvnp
         KG2T3AxAHQKVfccdz1qxE0OBm4DhuoQLPbxdvawCxL5CwewvA28MU8ntm4u6PbTWm2
         lvG9Cf4UlbLIQ==
Date:   Mon, 6 Jul 2020 15:58:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Rapoport <rppt@kernel.org>,
        Christian Brauner <christian@brauner.io>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the memblock tree with the pidfd tree
Message-ID: <20200706155811.7928b30d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ny1bRXBtARAQWI26nlQAx8A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ny1bRXBtARAQWI26nlQAx8A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the memblock tree got a conflict in:

  arch/unicore32/kernel/process.c

between commit:

  8496da092a53 ("unicore: switch to copy_thread_tls()")
  714acdbd1c94 ("arch: rename copy_thread_tls() back to copy_thread()")

from the pidfd tree and commit:

  fb37409a01b0 ("arch: remove unicore32 port")

from the memblock tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ny1bRXBtARAQWI26nlQAx8A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8CvYUACgkQAVBC80lX
0GyXAQgAk3aqFJBtf7uAquuxnPceUaH8mt80yG3mSvMHrvFaDjs9qauN87zXqOug
oI0K+/gQ9aCnQSKa+IkMhog5DgX/WxHrAiMbXmZqvlW7gs7Nqp0cvNbgGd6/ky/a
paqo5jcUoe2kSWBsmhLzrbx4YPYDHoBYBVgzxYcJ8PyPUTHL9P3GbOXp0P1vCPzL
+FiFue5c6jSOlWIm3BUMNUZueb9SpJGhMAMREN81WcScUBLwuHk2zye1KrnUSg87
CYawJkm4qZqgD+xi8ToKjvRbeksMrYFOUpBV1I0k/xTPuCezMzPdLT+SG0iyKIxa
j4wS35I9XBafaR63w79P8SHusDN73Q==
=e3Ob
-----END PGP SIGNATURE-----

--Sig_/ny1bRXBtARAQWI26nlQAx8A--
