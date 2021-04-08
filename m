Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E0035824E
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 13:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhDHLoP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 07:44:15 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41233 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229837AbhDHLoO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Apr 2021 07:44:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGKD20tJ9z9sVt;
        Thu,  8 Apr 2021 21:44:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617882242;
        bh=3K67/Xs0hVIB5nxzMRFFHmBcsK05pXsTDKCQmYp2FVM=;
        h=Date:From:To:Cc:Subject:From;
        b=JpSz8lYhwCsYZhxmUqDQPHYIGdOqE5iT+Hw/FFD6SFTOtgTiscm4/wsgtk5vAXFtZ
         DdHoztHLPqPRsNYvVLirZXaf7CCFDO2RjAQRE1ngJuAhp3Jf2qHIUbQhE8tvW6+4Q3
         btlj3avStmiHr/NJd0VqB8fkrxUrUpNPtZ4+S/3ei3gvIqBaA6PYiQGezJo2l8tyxx
         yRsmV6rK8Uw1NQ8OTep8Gxl6nP9hudeu+hHbEBbzE2xcZkzMpUehGOpx2VakM5mF/b
         0nn1k5HYA7gYwTQsthX27/WxXHS9NZyFfWpYbk4yPW281EZn/mUX64l+OuReCdd704
         xA8xWfSAmbIvw==
Date:   Thu, 8 Apr 2021 21:44:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>
Cc:     Jianyong Wu <jianyong.wu@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kvm-arm tree
Message-ID: <20210408214400.52632f7d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DLpkkb8k+jjqxff57G9uT_O";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DLpkkb8k+jjqxff57G9uT_O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-arm tree, today's linux-next build (htmldocs)
produced this warning:

/home/sfr/next/next/Documentation/virt/kvm/arm/ptp_kvm.rst:19: WARNING: Mal=
formed table.
Text in column margin in table line 5.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Function ID:     (uint32)      0x86000001
Arguments:       (uint32)      KVM_PTP_VIRT_COUNTER(0)
                               KVM_PTP_PHYS_COUNTER(1)
Return Values:   (int32)       NOT_SUPPORTED(-1) on error, or
                 (uint32)      Upper 32 bits of wall clock time (r0)
                 (uint32)      Lower 32 bits of wall clock time (r1)
                 (uint32)      Upper 32 bits of counter (r2)
                 (uint32)      Lower 32 bits of counter (r3)
Endianness:                    No Restrictions.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduced by commit

  3bf725699bf6 ("KVM: arm64: Add support for the KVM PTP service")

--=20
Cheers,
Stephen Rothwell

--Sig_/DLpkkb8k+jjqxff57G9uT_O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBu7IAACgkQAVBC80lX
0GyHZgf9GoAxnaGsnqlzUY4SEsrd+VIg4nn1C3F5mCg4JK53aQnF7txwegioeWlW
4dnFSWujG4xBrdy7hNQdBQXLD+EZa+ltbHxjIbXFxk50+BcBTQovOFmaVvyRsBND
WaunK5iS7okQdgCbdpjxNBWSL3CnFnv2s/qaRIqIeIucVen8Dpqk2GEk4L9+2P2k
HE+gzyZWSWDZ4rfiDcJRYlj25Mo9FUqpQuiZ8n30OnMbYVGxK4Xg/HVUV6Qtx9k3
H/dL5ehADFq8xgd9Fec9vF6mmRW2piwDkqtRuX2j2V6nQ0Qpcu9DdUOaj4BA5wl8
rAx7sMUo/LIL+ygosVllR6cly8Daaw==
=4ojz
-----END PGP SIGNATURE-----

--Sig_/DLpkkb8k+jjqxff57G9uT_O--
