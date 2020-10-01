Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A5A280A46
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 00:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgJAWcF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 18:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgJAWcE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 18:32:04 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68232C0613D0;
        Thu,  1 Oct 2020 15:32:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C2SXx0cT4z9sPB;
        Fri,  2 Oct 2020 08:32:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601591521;
        bh=fUY8+FnzG5Q2bV0WByp0ECn/teOoW1FrlqCSKsTxGEQ=;
        h=Date:From:To:Cc:Subject:From;
        b=mXLdliclLjqScHhS0gYBIlLqMgf3nC8UeEnIfrZo7l09gltSETVnHWA3PNQ4a3Hot
         V/5ZwmEs9Z34DvzWHJHMIoSp4DrkpcuAlXhxXAsmksUduoSTBqPUWd67H5Wj7VNFVy
         fUxuxmRwEdjAlc41OLKyhbgR/MvknV2CyCfMBfxMILUEWU9t46whxsJrOAESDdg/OV
         85GiuXPTgX1Iu0Tb3O7Ocs+GNeoL+MzeTCjSLJxEbEewq91iEmuXPWr5hZSQRekQfv
         DdK8lxeCvdjKUGtd5tfJ/57SwYHxlVve3IP03aJ724TUkCgzwXGF72TXNb2UIC7Rag
         X+Ay82CTyQueQ==
Date:   Fri, 2 Oct 2020 08:32:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Si-Wei Liu <si-wei.liu@oracle.com>
Subject: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20201002083200.685639e9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dOyryZZtE/hUhAiRtgy=LTM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dOyryZZtE/hUhAiRtgy=LTM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c9795f8fbb41 ("vhost-vdpa: fix page pinning leakage in error path")

Fixes tag

  Fixes: 20453a45fb06 ("vhost: introduce vDPA-based backend")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 4c8cf31885f6 ("vhost: introduce vDPA-based backend")

--=20
Cheers,
Stephen Rothwell

--Sig_/dOyryZZtE/hUhAiRtgy=LTM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl92WOAACgkQAVBC80lX
0GyaZAf/Y5fX2v/DrBcNgRdYakP6nIRQJ5QmrZpFxwQ55pDeAQqXkazzG0pOmEhn
QBVtiy0DU0p0hfenIfDco4fwi+uD1lip+m3rtsHhVO09LqESXH/L2veovm92fv5n
SvCqE2zn7aMibYef6IFSylXXaFmwgeMW4WEY1gMT0bKT8v0YbT3dHzCiblbtMh6R
ITFybYh3awtHJUH6mz3VaGepT6t2DaBA0e4qhwGKEt1jf9AAG1/mgr3YmDixJFn/
TC5LPvyFisVe7xUYtaLEpxaeUU+bZZYPivtR/FG5L39hkLc4A57mttpDfFj/uWDW
8URPwnDaVqgo4AKgfaTWEoPszkmnKA==
=4v+2
-----END PGP SIGNATURE-----

--Sig_/dOyryZZtE/hUhAiRtgy=LTM--
