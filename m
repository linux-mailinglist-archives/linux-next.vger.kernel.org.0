Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73B497004
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 05:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfHUDKC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 23:10:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45985 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfHUDKA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 23:10:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Ct1y2SZfz9sMr;
        Wed, 21 Aug 2019 13:09:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566356998;
        bh=P1H9VicFPqkJV2AwZ3wXrQpYSivnct3XmGgdNbJe8zw=;
        h=Date:From:To:Cc:Subject:From;
        b=patCUhZQ72uhJQ7JUokCiE8psE/9lju6aXJ9W8y75gvCoLMXvnK8fwrIis+TuHbcQ
         obxutv7e+nEsTSulw8uLqi6xp6q2L6kqVHKvVLPx48EEX53vQIbSiun8vX7AQLqQXV
         xcEBVdk+9s67YqwVGhkoRl4KPclQHmehIx6D9RTTmtulWG4vbUT2rmKq3jgZozqVAx
         2rFOIWgdn8LfdAaQ95G/pWXEDUNliG8w+hwW8IGfIlznPwb3/BcdHG7DauHou9LJDS
         5QF64bBflgFBfveCRiBpY5VC7ryUTBIIFZLQpJM8mtVXZ8H9/Utw7RZ0Tq91So0Cjp
         bysgqn0zG6vgQ==
Date:   Wed, 21 Aug 2019 13:09:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Bohac <jbohac@suse.cz>,
        David Howells <dhowells@redhat.com>,
        Matthew Garrett <mjg59@google.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>
Subject: linux-next: manual merge of the security tree with Linus' tree
Message-ID: <20190821130957.407d9c10@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+6Z=r_TWP/aQC5L/trFlXIM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+6Z=r_TWP/aQC5L/trFlXIM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  arch/s390/configs/performance_defconfig

between commit:

  d1523a8f4b8b ("s390: replace defconfig with performance_defconfig")

from Linus' tree and commit:

  99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG and KEXE=
C_SIG_FORCE")

from the security tree.

I fixed it up (the former removed this file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/+6Z=r_TWP/aQC5L/trFlXIM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1ctgUACgkQAVBC80lX
0Gw8TAf/bCSxp7JMhlxskUqB0S7V1wbMekGdk8RURMsWCBwFPoao1q8SNY+bHmBs
t4pWjdzoKFByeqW8YMOXvYcX+WojPbA8AlkFD4v7LWRU2gDR2MB3+HkQydrFUoSR
E7r9Z84JhZKnz9cdxh1wARYy6fFW+qCqhUPqJk3B1ll66StotqaD8NW7YezrCk1O
b6RkEPELB92Kj7UDJHZYuwaXF5f8MgYZ2T2ujQdvFt5QFSZ29s1sj5MY54eEqvXm
oFFwS4pFPNCQc4RFvogApVIWPrwch15YFcf/Hrz5qXnuCBeqmQ1kECL+ltwHgCp3
8Hwlhm7Gdp/NqPTwyvdzXYddfVkqug==
=Wl/O
-----END PGP SIGNATURE-----

--Sig_/+6Z=r_TWP/aQC5L/trFlXIM--
