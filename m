Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1608A65F7EE
	for <lists+linux-next@lfdr.de>; Fri,  6 Jan 2023 00:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbjAEX6y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Jan 2023 18:58:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbjAEX6w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2023 18:58:52 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5BB392C3;
        Thu,  5 Jan 2023 15:58:51 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Np3Ms21Yvz4xyp;
        Fri,  6 Jan 2023 10:58:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1672963129;
        bh=GY8Cz0dVwN/ETvKSCKlGagBcxImrn29hV5zlOpm7tD8=;
        h=Date:From:To:Cc:Subject:From;
        b=vFz6n+Lmp/iPO0hXrKPY4T75RP7/z4600bALQ3gl9x6T2jJUvXnW69xU+73HDDfXZ
         boPGntfEvPVhjxEBQUmNxgYD1ZDEaIDOyHm3b2MMI+MzVbryyd/Qlgs7N6D6hKhacV
         +9sBuM0Xhz6EMl5GgvKO1ESceG35h46otp16vO2ZgBJSbL1UywXJmE3FZF2w7NuNg9
         mwuA59FV23av/DwyiNXugO5kGlPyGcaGYbqdmHJW+4BNvkEGvUNe3JAtsPBGrm9ArF
         ZVeo+LnfBUrBNyyqFuHFbabqyrXwBZ0QWT4zYOwzJl0qMXsEdVKlVyaKnAWcCl0FPs
         KW0xBjH2f6l/Q==
Date:   Fri, 6 Jan 2023 10:58:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        Dave Airlie <airlied@redhat.com>
Cc:     DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the amdgpu tree
Message-ID: <20230106105848.44323715@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A8DC7Gz+2dIM9tfYSZPaJSp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A8DC7Gz+2dIM9tfYSZPaJSp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the drm-fixes tree as a different
commits (but the same patches):

  878a3c004c0e ("drm/amd/display: Uninitialized variables causing 4k60 UCLK=
 to stay at DPM1 and not DPM0")
  4243c84aa082 ("Revert "drm/amd/display: Enable Freesync Video Mode by def=
ault"")

--=20
Cheers,
Stephen Rothwell

--Sig_/A8DC7Gz+2dIM9tfYSZPaJSp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO3ZDgACgkQAVBC80lX
0GwZYwf6AsswaR37yco292WIG0aho0Yini96g5sdLG8CBpEtv3R4ffXhYh0W88U2
SzrggtCzfZgoeWJaHDPLEfRtKWFeclYQEQEDyJlMmDAtWXFIIUOxF6IgaDQmBjNm
YWwmJwwP1x+tbyqkq3eEj2B15+PQEPnBOcVKNt/PtWXrw5WezQais+rst9tdVo+n
LdHflLdxGcjIUm1a5NfvEJEIl6+86OClmZESeJKwU+/R9mzILwmoSD+msLJ7riWL
DTdToj3xU3eWu7LalEaOxPGY7I4vHf9i73T3VCPkIz09Kgmmgv3BBiri6U+TVE+Y
xCrQarkn7sEh9tgo247mgffLNlZz1A==
=gh15
-----END PGP SIGNATURE-----

--Sig_/A8DC7Gz+2dIM9tfYSZPaJSp--
