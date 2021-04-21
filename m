Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C41736750B
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 00:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243694AbhDUWOQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 18:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236112AbhDUWOQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Apr 2021 18:14:16 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24894C06174A;
        Wed, 21 Apr 2021 15:13:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQZZV0Hxtz9sVw;
        Thu, 22 Apr 2021 08:13:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619043218;
        bh=6dGGkg5WTuIarSC5op2/xk5TLHASB3YAFyk0Hwg3yHM=;
        h=Date:From:To:Cc:Subject:From;
        b=HvsNoRCx8JoyRzBK64kgb2E5+OQQLSeSY2n6FDbi+PbLZIwcwd3yhuV0eLvZd3At7
         bR8xIlY2ToH+OUYq3Vu7YO3dkT40iNUfI1Ur/o6D5P7wKlaD4jSfIkbtXK6QnUS3+t
         InYnsIjKTK+Z5IgT2EBNi0x770egUI3JQ6sn4OIR1mWpaHlldbpP3i8/0lc92ML1jj
         8LEyhyas4ajieskPumFYcAr8Dgf2J1fA9B8yJVKrx8fQHeNorSDIXlnmu6SqNJB4Pm
         De8gG0ODAZtbG1TTiG5rhUWqefeL8+jZ5xwfLweUkav4yZoBrj2YLRrh5Oo+/Rz3Px
         xIXDsTWbbXaZQ==
Date:   Thu, 22 Apr 2021 08:13:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Maor Gottlieb <maorg@nvidia.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the rdma tree
Message-ID: <20210422081336.5798e36c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VH6ahuTKBM_mPapjVJz=VI5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VH6ahuTKBM_mPapjVJz=VI5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  74270e75d9dc ("RDMA/mlx5: Fix type assignment for ICM DM")

Fixes tag

  Fixes: 9905fb65119f ("RDMA/mlx5: Re-organize the DM code")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 251b9d788750 ("RDMA/mlx5: Re-organize the DM code")

--=20
Cheers,
Stephen Rothwell

--Sig_/VH6ahuTKBM_mPapjVJz=VI5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCAo5AACgkQAVBC80lX
0GwUAAgAkdk2/JFd5atdvQMgBQcCiqzBI9IlmRrwWQ8W5PXRiZSlkf56I8DhdrxG
KdH7UjdxGAA2eZgMwN82in8bd1fRiXmhLajobi/Lnv4PnaORxHgroxQSkUFGzmA+
amhXLEhA5/95aoT/79lfGLInUAcKooQnT+97z0eF7+AQ1p7uz3AlSozTxJysL8cs
AoUYbMZPtmhc/4SoAbCXbYnhhmtcneGiBwKJ+uEaYq5zoOtyoDou49ZCiT0uzU1e
HMo8AKVaCjS6t2HwzoZVT1EviFruFgR1ujts2ZVp/lbkbMR7SK2RG0YOELMmq/ph
isNl5KVODGFzOe4A0yIRbIbX1jpNQA==
=2gWa
-----END PGP SIGNATURE-----

--Sig_/VH6ahuTKBM_mPapjVJz=VI5--
