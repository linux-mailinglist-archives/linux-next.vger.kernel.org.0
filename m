Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844741EC798
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 04:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgFCCqt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 22:46:49 -0400
Received: from ozlabs.org ([203.11.71.1]:40251 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725823AbgFCCqt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jun 2020 22:46:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cCwl20RQz9sSc;
        Wed,  3 Jun 2020 12:46:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591152407;
        bh=tm85i+M0UoXTbE+sU69kEPCnuNV5C/WVHJVbrmMhYy4=;
        h=Date:From:To:Cc:Subject:From;
        b=hVTDyEJmCM/JSpL3WddkJu9cy0ZFoG/WZnjUmhjioB4Y2T7F8DiXGqWvDz5qGS8Qr
         6kig96nndy6asSDNX1bG6aIvztwGstU+9NxkmlqGKe8FxLm+z8zF6RpWyrfXa7XMpM
         tFfZwaEq2QxtB62ULlCXDmBnTaamudY0JthHp/shB0/zMMP0dllsXRT44PZ42pv4DI
         2AOTztrAuQ3w12QVX0FJ1FfN71kfV5/Hpu2prvCz3p3zPpyZhLZy3n1A2ZgCos3BnS
         BNjeMRaQ3XKsl+n1r0BGLUfM1MT5qL+k0pYzAFL6k5/VFrjurX3EPnabk0+lFjj8lz
         Nu9yA1QhpRyvQ==
Date:   Wed, 3 Jun 2020 12:46:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the v4l-dvb-next tree
Message-ID: <20200603124646.4ce0ca8b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qPkXCkx5Qc722FVSGTz6W75";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qPkXCkx5Qc722FVSGTz6W75
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function 'atom=
isp_css_isr_thread':
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:4196:9: error: 'at=
omisp_hw_is_isp2401' undeclared (first use in this function)
 4196 |    if (!atomisp_hw_is_isp2401)
      |         ^~~~~~~~~~~~~~~~~~~~~
drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:4196:9: note: each=
 undeclared identifier is reported only once for each function it appears in

Caused by commit

  be1fdab273a9 ("media: atomisp: change the detection of ISP2401 at runtime=
")

interacting with commit

  7ef17aa55fc3 ("media: atomisp: atomisp_compat_css20.c: detect ISP at runt=
ime")

I have used the version of the v4l-dvb-next tree from next-20200602
for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/qPkXCkx5Qc722FVSGTz6W75
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XDxYACgkQAVBC80lX
0GyWFgf/YdkExVGSIJNHaFCJMCB52AmgZZMHw2DWH7pLPN0nDIof9SE9G1PUIp5O
NKRwIYV27S36J+wO1ZYjJCFpHcnOmARMiSe0N15c/T1teo1ZNJM//l6RTxbXunS2
KWs+OE28gQC+u/SmntCqc29hMLgePnFUSHBcAhtmpJFcH3UGOpANfI/4N55gQzbc
hI6f4Ag6xHHP1rz/SRrVGjNQDYL2HnInjV9VHdhng+uq9SVHOD1EXUiZ7c4fsjBr
vLD9aGQ7AmwVQmXGW9aG58BI/eNdH8KSVXva4wydpijhGn2qMjmLUz5FdWE5g+Em
7otiQk6p20Hvjl+XoyzFaNZ+iVEu7A==
=UTnA
-----END PGP SIGNATURE-----

--Sig_/qPkXCkx5Qc722FVSGTz6W75--
