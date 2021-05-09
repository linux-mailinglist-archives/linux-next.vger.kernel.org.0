Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C4D377911
	for <lists+linux-next@lfdr.de>; Mon, 10 May 2021 00:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhEIWrq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 May 2021 18:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbhEIWrq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 May 2021 18:47:46 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2B1C061573;
        Sun,  9 May 2021 15:46:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FdfS50j7Mz9tlT;
        Mon, 10 May 2021 08:46:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620600390;
        bh=GPSwWIto8XM1WPw0y0gO5ALkfbL0DkmvceyKA7EtgDw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mOob1wFQmaB8Lar5FRGZEfIKdKojQgfMp3dJSK22sgD0ZVYNEXOfVNVGUEp2ymU8b
         axuok2gZRt9fJT3XEKGagfGGg0sD4Wmm10TwvD1rpiG0IYVYzt4XlJWD2QpQ/TUV16
         kK3GIMp+PhzqVRqTKILhBNboY5b3p8JJZqWUoq8Ixh80916EwkfcBRjx5ycDNX4YB6
         Z1LWhrz/veVUkjtd8znYh6l3Xhsn7f6OcqHkXKZVMIF6X4YIbNfPc1J1v2G895w9cX
         GZhN9jzk6+dCDSgqff6d7I5P1y4XsfoP4N18454LMYoRgG36xZeHm9GUgVCeBTsfuT
         7VQwDcG/5GfXw==
Date:   Mon, 10 May 2021 08:46:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Jude Shih <shenshih@amd.com>, Hanghong Ma <Hanghong.Ma@amd.com>,
        Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
        Daniel Wheeler <daniel.wheeler@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210510084628.0d4bbd6c@canb.auug.org.au>
In-Reply-To: <20210505093458.23efd0ee@canb.auug.org.au>
References: <20210505093458.23efd0ee@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.0HOqGBUH=7Z.5E4Xb=vk3N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.0HOqGBUH=7Z.5E4Xb=vk3N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 5 May 2021 09:34:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function =
'amdgpu_dm_initialize_drm_device':
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3728:7: error=
: implicit declaration of function 'register_outbox_irq_handlers'; did you =
mean 'register_hpd_handlers'? [-Werror=3Dimplicit-function-declaration]
>  3728 |   if (register_outbox_irq_handlers(dm->adev)) {
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |       register_hpd_handlers
>=20
> Caused by commit
>=20
>   77a49c458931 ("drm/amd/display: Support for DMUB AUX")
>=20
> I have used the amdgpu tree from next-20210504 for today.

This has now been broken for 6 days ... please fix or revert.

--=20
Cheers,
Stephen Rothwell

--Sig_/.0HOqGBUH=7Z.5E4Xb=vk3N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCYZkQACgkQAVBC80lX
0GzRWwf+ORoHa0UNC2mU9HMN8nZjIN9NIYqYIon4z1vb3dhxx9xo2x5L9j/C10AJ
YUrWLIOsOryg+lrySC57fgD5v19KpYZ02yDNa08Cusq412q2VhcBQ6RquDiUSxd6
6qGLvqlt4bkUHb2fqlcp8RzFs2eYJNlpTeUVwhdNRbyz7PwOJiaOfLxDgv9tiAKt
ioTQDndwAN0B6qjEtx9IZPfLJye+mO6yVtU2V3jRtGvNtwk+4qRbjCtu46s4TJJE
1d73NYmMVRXSZWXAcsAi6kzcBPf2D9I2AUAL62inklwtsspFJLSt1gqrVmRcf3qg
xLeiSk9QVI9IrwEhG7n8WVzMgxDnXw==
=a/wl
-----END PGP SIGNATURE-----

--Sig_/.0HOqGBUH=7Z.5E4Xb=vk3N--
