Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8104C30A01A
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 02:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhBAB4S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 Jan 2021 20:56:18 -0500
Received: from ozlabs.org ([203.11.71.1]:59907 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229813AbhBAB4Q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 31 Jan 2021 20:56:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DTWHS684cz9srY;
        Mon,  1 Feb 2021 12:55:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612144533;
        bh=BfyU9bFRiydMRCXL2NWr/Inhh9O6QnDdob3A1iGsWVY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KFw7qMBdtv4dxz9b0SOZWtrr6l/tzjK+D9X5/EAmzTWZHTp8NH9/k5kRsQlh+ymXH
         JJCTtqD6MrCcg/wiwBT9KKA60YVVfiCmMTc7tESkkepsoa6hOiAotHN6IUhDC/amz6
         aSxmgsbMfidjW1wEuxx4rbPlqfenL/9D1VJCjOLg+k4Qh8/uYuAAbnlBpJEdBzBYrd
         EvlcArdXU0YgmssH14co2eh7Gqi+q9VaMFp92imJarZUoDSLMjcxZ+lwGV5W6C4ZuP
         KnWnPqqEzfgfRvoqx0rHjpSXMPKETheDGK7qsJhEypidPo98A/p2htk5gUfoXqtERV
         9IjkY2BWatWbw==
Date:   Mon, 1 Feb 2021 12:55:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm tree
Message-ID: <20210201125532.2d51c381@canb.auug.org.au>
In-Reply-To: <20210122115918.63b56fa1@canb.auug.org.au>
References: <20210122115918.63b56fa1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C_.j+qZ.bOkaYaCl9P+aeHV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C_.j+qZ.bOkaYaCl9P+aeHV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 22 Jan 2021 11:59:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> WARNING: unmet direct dependencies detected for DRM_I915_WERROR
>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM_I915 [=3Dm] && EXPERT [=3Dy] &&=
 !COMPILE_TEST [=3Dy]
>   Selected by [m]:
>   - DRM_I915_DEBUG [=3Dy] && HAS_IOMEM [=3Dy] && EXPERT [=3Dy] && DRM_I91=
5 [=3Dm]
>=20
> WARNING: unmet direct dependencies detected for DRM_I915_WERROR
>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM_I915 [=3Dm] && EXPERT [=3Dy] &&=
 !COMPILE_TEST [=3Dy]
>   Selected by [m]:
>   - DRM_I915_DEBUG [=3Dy] && HAS_IOMEM [=3Dy] && EXPERT [=3Dy] && DRM_I91=
5 [=3Dm]
>=20
> WARNING: unmet direct dependencies detected for DRM_I915_WERROR
>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM_I915 [=3Dm] && EXPERT [=3Dy] &&=
 !COMPILE_TEST [=3Dy]
>   Selected by [m]:
>   - DRM_I915_DEBUG [=3Dy] && HAS_IOMEM [=3Dy] && EXPERT [=3Dy] && DRM_I91=
5 [=3Dm]
>=20
> Maybe introduced by commit
>=20
>   4f86975f539d ("drm/i915: Add DEBUG_GEM to the recommended CI config")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/C_.j+qZ.bOkaYaCl9P+aeHV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAXX5QACgkQAVBC80lX
0GypAwf+NDRIpkYcNy9Nlt7QWWLrP5UzkVOdnU15x7CXd58ZAjC05WLvM3y1TpXM
hWwbfnQOiPZ7/sSr1N1ecph6BPzHLI2yZOqnU0ZKAo5ZnfhrHgASml1fLoAF/fDo
cHQ4e2Im7XnoDDF4gTfTr4CKkQlAGLfaI4Kcg58VRCDkYyRFXTKLtFLZxPYfhjof
pytu2L8zV63oGfDqYhzXLQOpoeKmLcyeYQCIx5y7gRn6s4G73kmA8A9vETvFiiWf
SVM7gJB23gu6KnpP2fP5ULRCRCE3lq2KAANEiNnzyZmnmJPjaRM0bM/TcpHyiwc2
LX7zfG75SVW+Ir3ia1unpxZzZDyLHA==
=Mf7s
-----END PGP SIGNATURE-----

--Sig_/C_.j+qZ.bOkaYaCl9P+aeHV--
