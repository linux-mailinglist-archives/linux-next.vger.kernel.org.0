Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B514E3AA681
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 00:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhFPWNX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Jun 2021 18:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234199AbhFPWNW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Jun 2021 18:13:22 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54C0C06175F;
        Wed, 16 Jun 2021 15:11:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G4zss5HwVz9sT6;
        Thu, 17 Jun 2021 08:11:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623881473;
        bh=Z0z00xng7PUfgZnfjxRZ6a4A/l31jHMMQHivtEwj4r4=;
        h=Date:From:To:Cc:Subject:From;
        b=jaPqNmX+cWUp8P4+P+jnH+4gnbpmSeV2/eMV3qUM32UmGEORj3Du4KduF65WoVtOp
         Cs2sqUPm4vpCuQblIzt7CG3c0OHUtM9iE/6TDTTj/LXWKlWbYuYHNVc8NTWbk/SvNe
         7ONmp13PRWNpCaOLEKHf54rH2EJCfxfAE+A78GB9qAqrptjK8pVlQQJ9C0V1SiI6m5
         QBSs3lW4iLZagIpwCW5Gd0FbfCxdL3fViEB5XFqOhG4V85S9fr0I10+g0gG55uzECc
         x5tU2JCOr3exF/GKYA7P9kbROTqlxw9Tkg8XVMAFMqAlpHYJemR0m+cHeWW13W9zY4
         iZYNNx5vNXv0w==
Date:   Thu, 17 Jun 2021 08:11:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the kspp-gustavo tree
Message-ID: <20210617081112.25e57b9b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UxuuU3pv_URlVNqMM/DB2FW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UxuuU3pv_URlVNqMM/DB2FW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d5f3d2f175ce ("media: venus: hfi_cmds: Fix packet size calculation")

Fixes tag

  Fixes: 701e10b3fd9f ("media: venus: hfi_cmds.h: Replace one-element array=
 with flexible-array member")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 380f3bbd9562 ("media: venus: hfi_cmds.h: Replace zero-length array w=
ith flexible-array member")

--=20
Cheers,
Stephen Rothwell

--Sig_/UxuuU3pv_URlVNqMM/DB2FW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDKdwAACgkQAVBC80lX
0GznXggAn6l/rZTPRT4M9ZLOc3L3N2uIZiAJtFJjb0/CBwkWBO+YuEdHdnuwZtyx
QUKIm6Ac+MOOMQROLQSxvUTqgYXLwpuuLF61Ewd/S0hs3gC9tqNM1/Tr9p968QfT
aeitgI8ke7zXZDuWOX75Jia21EDnt8mmC19XNrSivWINVh9MZ4UwRfcYp+CJk9Fy
LJ2MRAybun3cCkT6t7Lt86vOdG9FuVuz/SbmrQP5Cgz/xcMAaGA4zo5rNA0mfBEG
mKDD71jTPiThlb4n14OmXb68gwGJMuTvbUKUSkqC9PMuNE2PTDRZ4hcB6CaB4/u1
PbHBgdzxn/fzhKYdW/9VFLGYr8ONWA==
=6O9K
-----END PGP SIGNATURE-----

--Sig_/UxuuU3pv_URlVNqMM/DB2FW--
