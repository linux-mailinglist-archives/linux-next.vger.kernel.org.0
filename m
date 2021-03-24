Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39573471DA
	for <lists+linux-next@lfdr.de>; Wed, 24 Mar 2021 07:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbhCXGtA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Mar 2021 02:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235615AbhCXGsc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Mar 2021 02:48:32 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7446C061763;
        Tue, 23 Mar 2021 23:48:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4zMs6pVWz9sWF;
        Wed, 24 Mar 2021 17:48:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616568506;
        bh=GPiRH2UAGiYoFWp3PqOG1NTQgv2s0J87+bwKftjuEZQ=;
        h=Date:From:To:Cc:Subject:From;
        b=ddx201idS53kACIgEX/pmGxjmCWPVBGKkHofzsYLzf1/bsF7zZHRe0tjJhXrn+oYK
         X/SyjpGPFDbXQkdZOgAEdY1PqbOxSgdk5dPPDvbczOA8kPeNYlrA2aiMy8LQ6B3RNc
         +B6fVGmHNHGzF0PJr15WfNmXWDMczM6t5OsYMqxDqnFqSFuxIVDARqsKX06q8TngAy
         iGCD0lBRSmH3BErWwOzJxFnzGku/K3NlDCrIV2QHpufuik+eC7/CLn2EFLCx7hROq9
         feSyhLNMM+DuYAS94G8G1rhzZ9w08N7kYLDXJvNmmLsQxJq9cBaanS+56XBJ8qHnMn
         cgmH4YIhP9nLw==
Date:   Wed, 24 Mar 2021 17:48:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Wayne Lin <Wayne.Lin@amd.com>,
        Daniel Wheeler <daniel.wheeler@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Solomon Chiu <solomon.chiu@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210324174824.7d320946@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AV550Z3LwKDOY/O9eIkg0_v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AV550Z3LwKDOY/O9eIkg0_v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:398: warning: Incorrect u=
se of kernel-doc format:          * @crc_rd_wrk

Introduced by commit

  bbf514b0c626 ("drm/amd/display: Add kernel doc to crc_rd_wrk field")

It is missing a ':' after 'crc_rd_wrk'.

--=20
Cheers,
Stephen Rothwell

--Sig_/AV550Z3LwKDOY/O9eIkg0_v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBa4LgACgkQAVBC80lX
0GzVywgAnx71dN2FIErfMIlRCcgs2xfJMKwiZLuV7/8QzpS1LHnbb9juSVoi4Nz2
q1hGrA1i4kJY9dTyCGIFO/HY177X3TGVXG2QOFyNM9X7q+slIFnpMTpNZPPKrs46
0FzIV+avfv3t5Zs+Qs7yeQnYgKtUOzNSKVrJdQ4ZVpxY9aU2Ck2E///k9ug0NzYC
pCUn1YNiAfSJ06cKrCFVw+xfOJGLZynC7vWXMtCoL5OUV7pYkQE+nvLYnYaPufoW
iYPKYOn2mCcuu/H/VDpqIID25EQsZxubUoUWZjmUV1Zlt9zYY/CgpUlQ3dXE+vOQ
Jv/EMssbIAMy0oE1Q82aJJScqK+cow==
=M23i
-----END PGP SIGNATURE-----

--Sig_/AV550Z3LwKDOY/O9eIkg0_v--
