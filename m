Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3739D277FED
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 07:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgIYFbE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 01:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgIYFbD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 01:31:03 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98233C0613CE;
        Thu, 24 Sep 2020 22:31:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ByL9b2Mjzz9sRf;
        Fri, 25 Sep 2020 15:30:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601011860;
        bh=GPNQyX2INxPEuPLNF1oh65V0sinyfT55ybKwtb6O8DM=;
        h=Date:From:To:Cc:Subject:From;
        b=jhwMorfW+FJsb0+PMJCrDcg20zalq3y9LfeDnowr6cj/iUWmnCGEd1PsOcfPi+mJa
         QICY4cKE0xxzP1KeL6VLA7S7MpNf5ly/KRnVof99us21V+T1sXKd/BavZKFlqUuGkL
         F2ZLwOA8rLBm5fAUXGzWyIVfqZW5rxgd8dq86wYSp8RzEtuQQYAip7AMJjb1VLngRu
         /tOAFgaPBMGy3A1RKJr8pzjfRGe2G09/Oxezv5cMjxmDWPRW/eSOJufqSvli2Xcvd3
         O5iCIpH4GqKJIMERUfVZ9VuBJqry9Dk79R2Z5Ko9UOmY0xs05ZQiXiPadyB9lEW2qZ
         dxi0xYmoBtvJw==
Date:   Fri, 25 Sep 2020 15:30:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the vfs tree
Message-ID: <20200925153058.1475e014@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gluaN2WiBVQVyHbsdMULK4e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gluaN2WiBVQVyHbsdMULK4e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  arch/ia64/Kconfig
  arch/s390/Kconfig

between commit:

  5e6e9852d6f7 ("uaccess: add infrastructure for kernel builds with set_fs(=
)")

from the vfs tree and commit:

  077ee78e3928 ("PCI/MSI: Make arch_.*_msi_irq[s] fallbacks selectable")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/ia64/Kconfig
index 3414e67229b3,7ff5b3bbf160..000000000000
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@@ -55,7 -56,7 +55,8 @@@ config IA6
  	select NEED_DMA_MAP_STATE
  	select NEED_SG_DMA_LENGTH
  	select NUMA if !FLATMEM
+ 	select PCI_MSI_ARCH_FALLBACKS
 +	select SET_FS
  	default y
  	help
  	  The Itanium Processor Family is Intel's 64-bit successor to
diff --cc arch/s390/Kconfig
index dde501bc6304,63dd5a0aa252..000000000000
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@@ -190,7 -185,7 +190,8 @@@ config S39
  	select OLD_SIGSUSPEND3
  	select PCI_DOMAINS		if PCI
  	select PCI_MSI			if PCI
+ 	select PCI_MSI_ARCH_FALLBACKS
 +	select SET_FS
  	select SPARSE_IRQ
  	select SYSCTL_EXCEPTION_TRACE
  	select THREAD_INFO_IN_TASK

--Sig_/gluaN2WiBVQVyHbsdMULK4e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tgJIACgkQAVBC80lX
0GxLAAf/a/UEtIGo7ApmDBWgyehIOixqRnCCMElNJEeUKTiucRbX4hgkUR4HG5HM
l+V1XjJPr24xphSIvQJi5sJrHpAvnPwtOvAKwk1Xwx0mMUUC7/sqHjpZAspjoIDh
RCtFXWyRfKAqUf9sCCoyTHiRzXwRvQD7pWnNqaZUJVFfrnzS+ASSG8V9nGta5gdJ
+oRYwSe6vGosmtusE5r9AHr8f6c+Hif2r4FwPBQcou6ToYJSFV4uvpzoinMBIqk9
CYM0sNzBg2Y7/vs8iQFZCFweDt5SyKdPX6FBQMpoNCvVULpxKOeLFNLz5FZi9R1e
upYLC66QKrbOemq28zo0FQ5D6IM6CA==
=f352
-----END PGP SIGNATURE-----

--Sig_/gluaN2WiBVQVyHbsdMULK4e--
