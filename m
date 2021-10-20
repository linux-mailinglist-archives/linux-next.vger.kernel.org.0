Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFC34343F8
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 05:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhJTDtN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 23:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhJTDtN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 23:49:13 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC07C06161C;
        Tue, 19 Oct 2021 20:46:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HYxPV3XhJz4xbP;
        Wed, 20 Oct 2021 14:46:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634701614;
        bh=+6XVvFjmvWFB0HvEcmC4AvpYYcQ+MzQCAQGfdLcXNY4=;
        h=Date:From:To:Cc:Subject:From;
        b=GOyjEKoZLzWGTrmdLIJs1C+VmosFYqxHPngX37NSpTLlf/XOs7EtDjWQT25ttVg42
         XS/vyMZXUnFKJaOws/sZbhcy48AWbN86TG+IcWFS8KGz+PklGOsvWLobnqfCwQ8Y13
         25G5nakMGG4vGJF8EV9Wn+MPJNfpzQ7V4ars5vAEswhXesnSLprJ6CNQPTEdMSEUL6
         mC8z8RQ3IboJDxTcW5PI+wEIFUoza5RwFLXAfmwBZncIxR4w10mUXQaqlwi1U8DqiL
         ZA1mNAILfDoE6zcgpWRTJ/AAajyFXO984soDNWZkiLDJ9a0vKYsmenjoK2JmLRnQOG
         2rg8wNO8ssHSA==
Date:   Wed, 20 Oct 2021 14:46:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yu Zhao <yuzhao@google.com>, Alexey Gladkov <legion@kernel.org>
Subject: linux-next: build failure after merge of the userns tree
Message-ID: <20211020144651.10321529@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jSgnN2rJ4ggzoDnXbXx5Ms_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jSgnN2rJ4ggzoDnXbXx5Ms_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the userns tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from arch/x86/include/asm/bug.h:84,
                 from include/linux/bug.h:5,
                 from arch/x86/include/asm/paravirt.h:15,
                 from arch/x86/include/asm/irqflags.h:63,
                 from include/linux/irqflags.h:16,
                 from include/linux/rcupdate.h:26,
                 from include/linux/rculist.h:11,
                 from include/linux/pid.h:5,
                 from include/linux/sched.h:14,
                 from security/keys/process_keys.c:9:
security/keys/process_keys.c: In function 'key_change_session_keyring':
security/keys/process_keys.c:923:16: error: format '%s' expects a matching =
'char *' argument [-Werror=3Dformat=3D]
  923 |   WARN_ONCE(1, "In %s get_ucounts failed\n");
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:99:17: note: in definition of macro '__WARN_print=
f'
   99 |   __warn_printk(arg);     \
      |                 ^~~
include/linux/once_lite.h:19:4: note: in expansion of macro 'WARN'
   19 |    func(__VA_ARGS__);    \
      |    ^~~~
include/asm-generic/bug.h:150:2: note: in expansion of macro 'DO_ONCE_LITE_=
IF'
  150 |  DO_ONCE_LITE_IF(condition, WARN, 1, format)
      |  ^~~~~~~~~~~~~~~
security/keys/process_keys.c:923:3: note: in expansion of macro 'WARN_ONCE'
  923 |   WARN_ONCE(1, "In %s get_ucounts failed\n");
      |   ^~~~~~~~~
security/keys/process_keys.c:923:21: note: format string is defined here
  923 |   WARN_ONCE(1, "In %s get_ucounts failed\n");
      |                    ~^
      |                     |
      |                     char *
cc1: all warnings being treated as errors

Caused by commit

  346b5b4aa656 ("ucounts: Move get_ucounts from cred_alloc_blank to key_cha=
nge_session_keyring")

I have used the userns tree from next-20211019 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/jSgnN2rJ4ggzoDnXbXx5Ms_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFvkSsACgkQAVBC80lX
0GyGjQf/aB7AvAs0s61kzZXhYgZvokql29GS+S7nEs7auO2kIBfrGvJb5pCJ1jbO
dK0LgR7vxlVwhbjO3PjgDytCeqRD3ePr+TeKRPaxoULMgMaj3Kg7pfiRi2i3ez4T
bNBOUJ0w1WwUS94J+EX/kU+H1QDMFTqu9W6fQDXISwVETEtAFCFDG/cj2X8ubGzd
dwl0YqoeOf8vyzG12ON4WCNHzoYb+IVFswsO5SCAe9mboi9EJR7BGpBUr6/Fg7y/
1SzNJCLqGHKQZjltJSkTXLGPBz0xfwekQPM4ESI4MYn0ZA0lgOdWBXwuLswG5T7A
QFglYQ5ifDBPerWBqC2mfmKe6H9X5g==
=qzC9
-----END PGP SIGNATURE-----

--Sig_/jSgnN2rJ4ggzoDnXbXx5Ms_--
