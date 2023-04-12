Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19206DE8C8
	for <lists+linux-next@lfdr.de>; Wed, 12 Apr 2023 03:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjDLBW3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Apr 2023 21:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjDLBW2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Apr 2023 21:22:28 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF223A9E;
        Tue, 11 Apr 2023 18:22:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Px4gs0Th5z4x84;
        Wed, 12 Apr 2023 11:22:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1681262538;
        bh=XhOrU+QFWcb+CVANp9ratxZSEqdjnqay4In+Rbto5+I=;
        h=Date:From:To:Cc:Subject:From;
        b=EJ6xW+ViyMy/3l95STmnF2XsHDzfs6v3XJ65nsMjXlz2b+cIJ0WZxcbSBghzkNhIY
         y4WQyMc5T2B014GaSVJuc+yOWKxcAx1WsGrScj/Y4rstQW8SEP+dZTdp65zBkFKCyu
         koNlBmgtk15pUMQy0aU1+iLuOUA91mssXJgi1i5CxRqMftXOzDLd95DEsO5wdVNLjX
         TXkbXLE/EH9nKNngCEXxTfTep1uSb7pXTpoFTkkY+BuqC8Iich5gJ8JWeJIlkbKIdG
         neOj1Bxbs7IT9UnlAC0Pq+xa+lPPflSLbtzcZj7Bp9hZuf/iIkS5EeoQmrWfycJbit
         Nm/prWt0Jrjqg==
Date:   Wed, 12 Apr 2023 11:22:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@redhat.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the powerpc tree
Message-ID: <20230412112213.59365041@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/60om+LnrpZ0CbC8sc7Il/5w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/60om+LnrpZ0CbC8sc7Il/5w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/Kconfig

between commit:

  78f0929884d4 ("powerpc/64: Always build with 128-bit long double")

from the powerpc tree and commit:

  4652ae7a51b7 ("drm/amd/display: Rename DCN config to FP")

from the drm tree.

I fixed it up (I used the powerpc version - with "(PPC64 && ALTIVEC)")
and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/60om+LnrpZ0CbC8sc7Il/5w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQ2B8YACgkQAVBC80lX
0GxzBAf+Lg//lxSU8q+Rc5ntDb5otOp2iFJrWaVe1Q233Y12PERCK4EyuK18LIr4
x1W0O/2YNMfLrOw8ptMSYsSLQIm7Z1NbpotR3w/0mNaR2utwEbKYf4N/sd8R2p1u
mkCAX1apB7e/P54o6fOq12/dj4cEFdnnR83OlULTGEp/JyRyKm2W3sHzrf8Mp1aF
t1BIS7cwYu970Tz+W0U3cVEljay9mdscGOYBdiw3L9+s9D2AWv+ocOboj/7aDZtK
goNTeHu8/h+CQCFc/ulDaBdWk52b/uy+kbSKDNy1rulbNNs7jA+3PxNs/+dOIwsA
qPBJveVZlPWhkQ66ZdZZ9/5LoBr3TQ==
=MaU1
-----END PGP SIGNATURE-----

--Sig_/60om+LnrpZ0CbC8sc7Il/5w--
