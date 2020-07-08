Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEE7218539
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 12:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgGHKrB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 06:47:01 -0400
Received: from ozlabs.org ([203.11.71.1]:58647 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgGHKrA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jul 2020 06:47:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1wwd55j4z9sRK;
        Wed,  8 Jul 2020 20:46:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594205218;
        bh=ZrW8RmkJHtrZxVS8lqjQ/q55l95r6iO1EK0yC9UCkUQ=;
        h=Date:From:To:Cc:Subject:From;
        b=QU2Zpel0ZeE/X4pnLb6kXHkE0cVCIab746XfiGyxT2L8k2zQkX4oUwdxG12e2zMZR
         fgKSOk/byGq729TBGJO08TT6NdonSaTymD0slThREnbPypHqLFeMtFzZ6QixJUBfYG
         hBMoto0nQbqTNm8cdFU5IaxrP60xhqoKGE9kcn7KCMGORiPcplf7uWorWJwf5mXnkm
         dcRE8i6oD5YJSpW8SnbIn6AZ837Ulj4zJ3PoV4umHLt7EV/USxTLYqG/vlBf0mpoHg
         qPsOcSV6JmnrKOsgBJT98Twpoe+TPJcKSEiAZTA5rE4fMNpp3WGlX5gyAlgDpYed2d
         5oJ9AA88Sc9sg==
Date:   Wed, 8 Jul 2020 20:46:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Theodore Ts'o <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Satya Tangirala <satyat@google.com>,
        Waiman Long <longman@redhat.com>
Subject: linux-next: manual merge of the akpm-current tree with the fscrypt
 tree
Message-ID: <20200708204654.41f1a274@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9aFPucP7BhW5i5D+_zdtUV7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9aFPucP7BhW5i5D+_zdtUV7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/crypto/keysetup_v1.c

between commit:

  73f43e98d01e ("fscrypt: add inline encryption support")

from the fscrypt tree and commit:

  f15de703d326 ("mm, treewide: rename kzfree() to kfree_sensitive()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/crypto/keysetup_v1.c
index a52686729a67,c8a930f8faf2..000000000000
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@@ -154,8 -154,8 +154,8 @@@ struct fscrypt_direct_key=20
  static void free_direct_key(struct fscrypt_direct_key *dk)
  {
  	if (dk) {
 -		crypto_free_skcipher(dk->dk_ctfm);
 +		fscrypt_destroy_prepared_key(&dk->dk_key);
- 		kzfree(dk);
+ 		kfree_sensitive(dk);
  	}
  }
 =20

--Sig_/9aFPucP7BhW5i5D+_zdtUV7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8FpB4ACgkQAVBC80lX
0Gze0Qf+JzrxbOvydfTY/7zTdhvR8lZBtHfik/iJPyI8CzQHdSGyA9JrKghAPGd6
ZAQndBhorBHJpKcwkx2lwdbTXRyiZLLU6Ns9Blq6zSiSrZ55Qaku9j6MQcAtwMTM
vKHHnlhSkjZC/qx51jVo04w1Je4sl0RO5NMd8nnGxi4HOKLWrL6M5sKAfQr0W7kW
pw/Ze5wrrgPJZDZIuZOA54u1o/B0FMJWs9sYjCWXUs4WPPI+SjeG6DFYAtpBu6jM
iUCMsM5f/txCL6MoYniVFW7Kgbapgty7dV7uUDZ4QrXc7skkpQ9qdnpQZupmdWdt
WvrQAuCi6zFgzDwIfpOPKLNfsNWASg==
=OdH9
-----END PGP SIGNATURE-----

--Sig_/9aFPucP7BhW5i5D+_zdtUV7--
