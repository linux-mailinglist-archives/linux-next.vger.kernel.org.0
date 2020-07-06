Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0242151F6
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 07:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgGFFDB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 01:03:01 -0400
Received: from ozlabs.org ([203.11.71.1]:34969 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbgGFFDB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jul 2020 01:03:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0YNd2rG6z9sRK;
        Mon,  6 Jul 2020 15:02:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594011779;
        bh=fwmVguoDWnwTbxc4sPqxiDoblGFReTc+/EW2B2YycXY=;
        h=Date:From:To:Cc:Subject:From;
        b=qu+GbHtfAqq7fs5HpFx+2ZEEIHqCCNM7U/HFweLvp5u9seYzlcBTjGmfLtgK6WgaB
         rqj6UbsRwyfCCQmO4hwmy3xSpePpKpZiYQCHC6QwJWWT7yKrrZ0T4T3/9bprfgD0Jg
         1gcvah9Zmd26Bewi23qrB6D9rmk+9vl/keyNARavcEwfKJ2xScpXHZZv9V/6IhYZtC
         9H+mBduFXADo3WXu4Lpt6OyJ/CcRj9gG65kYU3Jmqapr1N2jSDpWrXi/j5BLPN1Pi8
         AOsGItaSZn/6EiiTNR4ZqNblOsmHigd3Xgm+rq31U/gtydOIpnQYi92ShEPhgSwQHN
         YcgLQXZpFjWtg==
Date:   Mon, 6 Jul 2020 15:02:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the csky tree
Message-ID: <20200706150256.5bd2ff66@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VgejV5CQ1M8kSCOAmq82TRb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VgejV5CQ1M8kSCOAmq82TRb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  arch/csky/Kconfig

between commit:

  f4dd2edafba0 ("csky: add support for SECCOMP and SECCOMP_FILTER")

from the csky tree and commit:

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

diff --cc arch/csky/Kconfig
index 822362d0598e,902f1142d550..000000000000
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@@ -38,8 -38,6 +38,7 @@@ config CSK
  	select GX6605S_TIMER if CPU_CK610
  	select HAVE_ARCH_TRACEHOOK
  	select HAVE_ARCH_AUDITSYSCALL
 +	select HAVE_ARCH_SECCOMP_FILTER
- 	select HAVE_COPY_THREAD_TLS
  	select HAVE_DEBUG_BUGVERBOSE
  	select HAVE_DYNAMIC_FTRACE
  	select HAVE_DYNAMIC_FTRACE_WITH_REGS

--Sig_/VgejV5CQ1M8kSCOAmq82TRb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8CsIAACgkQAVBC80lX
0GxLIwf9FRyHVS7UjbGIP4SuKcPTv76XUQ5DbSEwai3KzAU6NWyTk41XQ2wNOBAY
J8D7NOQSR0332Hn7m3zdQXG1m47JA3XpjA0QjyuVb4+pYrUrr6rVimxv5lzwENXg
dQrNYxBIK3GzV5sdxE01Yape+7Mm+7IkpLq6SwpyPreaIRBuhrBbIE838odW2Xqa
+ggO0yYsCr9cNoRlgbI4bwP1vqUnSylctYF+kKCns5FSDbq2oiHtsQfBgBTCDCqt
OjivCoUhJgZ9Q0J/E+m7OKTINMvMg7pfjhNDIO61mJ8RuL3qckmqqSQuNiJULOvm
bskEE7aGnye2qDpDDnwSB6JhmdI4RQ==
=M/S4
-----END PGP SIGNATURE-----

--Sig_/VgejV5CQ1M8kSCOAmq82TRb--
