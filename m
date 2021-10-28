Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727E743DED5
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 12:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhJ1K3X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 06:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhJ1K3W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 06:29:22 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2200C061570;
        Thu, 28 Oct 2021 03:26:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hg1vJ5zZ9z4xbr;
        Thu, 28 Oct 2021 21:26:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635416813;
        bh=uQh3gPYokxYVOUJ7Iyqv9DP5cj4U1hIIKagooupob64=;
        h=Date:From:To:Cc:Subject:From;
        b=SnB4VZGt/hJpydQLrxzSl3bUJ7hmvyo6KaCvoAF3vgodogSFnXjrbu9V73KXzrfFS
         sM35rWnou7hvzrHyt6It+dwO3WXfggfCHP/WHvuljLEI/39YmsTMHv/a1sWiAyAoME
         YNA6k4C9x0jx/9x/Y5iAIBBZy/9qiwka055AvYmTOak8vYaoV4N4hJ7z3jtuGhVyKM
         VAStYGFr2wrLgb2sT8RdOgYEDGL5F0wCfoaenZ2nMqqJ8z9v1c+C8TBORv7Hp0I3up
         zHdGh8DMNShfsowd3PiTFzT/bbVqiKr5joVApaSFfmEmCPBr3qZGPFpP9dhyi8hmFM
         YPvp5dXoiLMHA==
Date:   Thu, 28 Oct 2021 21:26:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anton Altaparmakov <anton@tuxera.com>
Subject: linux-next: build failure after merge of almost all the trees
Message-ID: <20211028212651.57beb05b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9F=Co5trPhyZVWZ4R77tcdx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9F=Co5trPhyZVWZ4R77tcdx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc allyesconfig) failed like this:

fs/ntfs/aops.c: In function 'ntfs_write_mst_block':
fs/ntfs/aops.c:1311:1: error: the frame size of 2304 bytes is larger than 2=
048 bytes [-Werror=3Dframe-larger-than=3D]
 1311 | }
      | ^
cc1: all warnings being treated as errors

I have no idea what has caused this.

I have disabled ntfs for now.

--=20
Cheers,
Stephen Rothwell

--Sig_/9F=Co5trPhyZVWZ4R77tcdx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6eusACgkQAVBC80lX
0GzLAQf+LtDfVXYxAGR59+53EMyUzfBPGVbKZd+r0pcp8tDWMgFsl/0uvGbcnR+3
hJyrOkQEOtQMU65ru80mwwu+6tfy4Ap2I78A/ka3k4iSYd4qvtTYWM3he3Zi+mpZ
eRyp3QbnrKTxPcy9w4+1tjRFjCXRVZurDPPEVWjVx5SkmBa+pWtVwIGyIdhb1si2
H0LfD088y6crkcbdRjM8udRzynVkqabg+nl+5pS/NxQNueLMQSDZgek6yrbXS+rS
ESBHUcYdOqDDe2Li2lMG7rHTNbIzV+Jti1CQIfyJ21uR7RrhgLU65un8C466C+kP
jVakm9qZPMnr36eb3ryteFZgde21wA==
=+WXI
-----END PGP SIGNATURE-----

--Sig_/9F=Co5trPhyZVWZ4R77tcdx--
