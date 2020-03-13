Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 885D5184017
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 05:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgCMEwJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 00:52:09 -0400
Received: from ozlabs.org ([203.11.71.1]:34731 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgCMEwJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 00:52:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dtb91VwKz9sQx;
        Fri, 13 Mar 2020 15:52:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584075127;
        bh=RiR9fwoy0HDJ1C6kTBpIoXGkrKG3C0/jyr3D5Az743c=;
        h=Date:From:To:Cc:Subject:From;
        b=D/VDMN/4dWNtCzfWbANNOVrvqGhtqUtsErJq4Yu27siCS6soUoyIqhNa2Fahv2jC+
         Io3JSMIU0VEZvcM1T3USGHVLJdhVpDs3nxRlyMjr25qdzwFa2hz9m2zTcjXuauBMT+
         Y9pgTG3EWGzEU8DDjDLGBccLv0lnGASeucfKHmgtdORrZHBOJ/XwuuxAgCrYFcT/rv
         nJ81NOMxswVocboiG2Nh3T9vV5IYU28fJYW8reswNPpZ48w8vwUxwv7p8r3vAkaICH
         UCLauNDu7nGXXqiQpJv5AtB13N6HNkwtgwslZEF6odUxDdzr9JiXzkyj956z4qU9Ny
         vEFvBtaaX8BhQ==
Date:   Fri, 13 Mar 2020 15:52:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nayna Jain <nayna@linux.ibm.com>,
        Marco Elver <elver@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: linux-next: manual merge of the tip tree with the integrity tree
Message-ID: <20200313155200.11dcbf35@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lvpSyP=hYUGVuCtp.4VSXOh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lvpSyP=hYUGVuCtp.4VSXOh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/Kconfig

between commit:

  9e2b4be377f0 ("ima: add a new CONFIG for loading arch-specific policies")

from the integrity tree and commit:

  40d04110f879 ("x86, kcsan: Enable KCSAN for x86")

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

diff --cc arch/x86/Kconfig
index c4315d8c5edf,61c628e2662f..000000000000
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@@ -230,7 -229,7 +229,8 @@@ config X8
  	select VIRT_TO_BUS
  	select X86_FEATURE_NAMES		if PROC_FS
  	select PROC_PID_ARCH_STATUS		if PROC_FS
+ 	select HAVE_ARCH_KCSAN			if X86_64
 +	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
 =20
  config INSTRUCTION_DECODER
  	def_bool y

--Sig_/lvpSyP=hYUGVuCtp.4VSXOh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5rEXAACgkQAVBC80lX
0Gz0IQgAh6W1dJL1V4wJezg9jxW+IznyBsv/Q+kU3j6bZ9ng8JAvX7OivLS7HYG4
RrDbQXMDa/sOOg+o/bTQ0cumMjh7Xi0wbftQe+TqbROd3BZhsTFHFY0jQ6bw2hit
H7kU0kQpfq0dxMuguaDpW2YztgifnCp3PN0HxMJG+y6fELa/Uy/4jO/zsdETHMdW
Ry2z6IkRDooYTPWwYFWpkF9XgvMKcRkLDHzaSx4AC8Tj6VzgnrxCPqMPBZVSC5qp
n62hTzCzQzYYWC7uqr+LAfeVaRkHvEFWu6KctD78gkMnu/a+IG2QGYQSEHRbtl+R
ZGJIEMDVLl3kl6pCQ4xpsQezRW407A==
=YmY0
-----END PGP SIGNATURE-----

--Sig_/lvpSyP=hYUGVuCtp.4VSXOh--
