Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0217229658
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 12:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgGVKiS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 06:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgGVKiR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 06:38:17 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BAEC0619DC;
        Wed, 22 Jul 2020 03:38:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBX462F1dz9sRN;
        Wed, 22 Jul 2020 20:38:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595414295;
        bh=G2OKpMJf7TXN0BgliBx+hmCERlwb78Kx6qogY3MuDZg=;
        h=Date:From:To:Cc:Subject:From;
        b=UR57oAWlbpnGN2Ld2CpEvv6NySO8xFLdNykZqwa8kCFqJsfYRvi4QH9krVs0FmM+5
         tvQ7I76bAKrNFAPzBW90g5xLm5kUNt9ghYkXtppSnyQjh6QnvHtuorpF+EQ56Zuqfz
         Zft+IEmBecw0oWkgtXBPnCIaFN0VYGvMGIA9Qv8WEtlNl3sUccn2K9+9vRcwHjppSF
         jtxTN+3gwV45HHAXF/of/n3SPKADUGYGwpsrmBwk3ni4C4G3ncOF5CfB/BmexnAD8i
         lxkwMNmH6ZnOrCUNHr3PXHSK3NG+F4TeVKcz0ePhee8pXBOE6C2u2xPBj9HLTcrnyt
         rqYSOhEL15Jeg==
Date:   Wed, 22 Jul 2020 20:38:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Rich Felker <dalias@libc.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the pidfd tree with the sh tree
Message-ID: <20200722203812.6ca23e0d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x+W3LsrrrKSHka0rbOzRN/w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/x+W3LsrrrKSHka0rbOzRN/w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  arch/um/Kconfig

between commit:

  5c77ba8aa183 ("dma-mapping: consolidate the NO_DMA definition in kernel/d=
ma/Kconfig")

from the sh tree and commit:

  140c8180eb7c ("arch: remove HAVE_COPY_THREAD_TLS")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/um/Kconfig
index 32c1d1945033,ef69be17ff70..000000000000
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@@ -14,8 -14,6 +14,7 @@@ config UM
  	select HAVE_FUTEX_CMPXCHG if FUTEX
  	select HAVE_DEBUG_KMEMLEAK
  	select HAVE_DEBUG_BUGVERBOSE
- 	select HAVE_COPY_THREAD_TLS
 +	select NO_DMA
  	select GENERIC_IRQ_SHOW
  	select GENERIC_CPU_DEVICES
  	select GENERIC_CLOCKEVENTS

--Sig_/x+W3LsrrrKSHka0rbOzRN/w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8YFxQACgkQAVBC80lX
0Gx5dAf8C7VOAxe/6DdQQs2IEa25H7OLYt2wqVyWmPLTOPq5qXMDvfw/gN7jAJAj
B4579sHxl5za29HNp8fdDz3o07jB638irPa8LpmAM0xn+MqbZPA2lQHyEViuq6TX
bzu4M+Yj3NjstAG2iGMcK/PdG3pyVEtdpDBaFFsKChbmGTqTbRBh9ykuQ8NixSEn
OK+HSuYlNoajCo8EP8DfcY+YJFeKuQ+pMCRfutNQxOluGqLqGcMBK1c8pqW0zisN
tLch/vy+kh6HA23JiVBY1hPQyQEa01Q+uTTyjhxKskBeJ0JpBax2PKaZQM6oWZ92
zRaSXKlruT9B8U/FMLWchbiMXz6WSQ==
=BfZj
-----END PGP SIGNATURE-----

--Sig_/x+W3LsrrrKSHka0rbOzRN/w--
