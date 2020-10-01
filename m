Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4904727F983
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 08:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgJAGey (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 02:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgJAGey (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 02:34:54 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE8C4C0613D0;
        Wed, 30 Sep 2020 23:34:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C23JP0F9Pz9sVH;
        Thu,  1 Oct 2020 16:34:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601534091;
        bh=8SVK23LN1XV22rfFMMDF+52/+6mmf2HKqJIAD2e6HXc=;
        h=Date:From:To:Cc:Subject:From;
        b=gJKhPs6rc32DplJ3rgjnY5fKaHOpJ3/ZV09lfne/h40Pcn7u4Ugxs0jTktaSPVkWz
         URUSxWJBT+yaAtV82mrP1umohM7blQCI8RCFMRsRLFWpAZY2sH4HB8yI7DYx3Ic7lK
         gNC8aP+cWWQz/usosO0zQ/yyMe05+1X5XXVXBPgTUHwlA1Omc33PGN/W1g6SVYC7J7
         p8MAu+y3+cUd/K+1XgW3ydhgs/3G9tqi98+BIp/QYQ8f5vMxD1mBiDkNp7JMVFBOK4
         4M3bkrmoVoaIlNxPhxMaQ4g9aWcML3jyckDURorBkevlgDkz8IF2UGgFIu5O/B5uMe
         Tp/THkhiNeiAw==
Date:   Thu, 1 Oct 2020 16:34:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the tip tree with the vfs tree
Message-ID: <20201001163443.0176e807@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o6VICmVLeBu4iUL1hbj.=03";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o6VICmVLeBu4iUL1hbj.=03
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
  981aa1d366bf ("PCI: MSI: Fix Kconfig dependencies for PCI_MSI_ARCH_FALLBA=
CKS")

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
index 3414e67229b3,9d0f1e13c918..000000000000
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@@ -55,7 -56,7 +55,8 @@@ config IA6
  	select NEED_DMA_MAP_STATE
  	select NEED_SG_DMA_LENGTH
  	select NUMA if !FLATMEM
+ 	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
 +	select SET_FS
  	default y
  	help
  	  The Itanium Processor Family is Intel's 64-bit successor to
diff --cc arch/s390/Kconfig
index dde501bc6304,0a3899386a51..000000000000
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@@ -190,7 -185,7 +190,8 @@@ config S39
  	select OLD_SIGSUSPEND3
  	select PCI_DOMAINS		if PCI
  	select PCI_MSI			if PCI
+ 	select PCI_MSI_ARCH_FALLBACKS	if PCI_MSI
 +	select SET_FS
  	select SPARSE_IRQ
  	select SYSCTL_EXCEPTION_TRACE
  	select THREAD_INFO_IN_TASK

--Sig_/o6VICmVLeBu4iUL1hbj.=03
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91eIMACgkQAVBC80lX
0GxOvgf/SSvRTkrGYn/qQXFfACffvFAtOpnQFMJjDMYxt1qxdcR+51oh1Zxb5gsR
b33tk5CulyPByFbVHG7sdJripzoAfSn8k9cDNxEbhjHTIL13Nk5q4WZ6U4riDO+d
LWq+ZCFwmSO01RlVT0XGtTxRGX/eVC3FCByECvg+xTneea3cRXGV8XAVCb81+dpC
7LZ76+DbB6G3xCnRGqtei1yAhRjSy6f96U486mKfw1kB5Kqi1vf3A+GecS18PUbY
PXoWzx4dJ3WKF1cxtcftS4qL2HEkTIpgoJGpHB3yM9hFbCfKdIoxyxJvaoLCCurx
ranoh53SnRDHaP28+wdv6jLMKS6Keg==
=sFWZ
-----END PGP SIGNATURE-----

--Sig_/o6VICmVLeBu4iUL1hbj.=03--
