Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471343F53AF
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 01:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbhHWXhb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 19:37:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43747 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233093AbhHWXha (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Aug 2021 19:37:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtpY73x2rz9sW8;
        Tue, 24 Aug 2021 09:36:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629761806;
        bh=hvLMigJIqx6oXYqrSl36W6Pn5wU2BQgJ6YZdidwL3uY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=E4MhkrfZ5zdRIFicK6xmeCWs/qAfM6hglO0AqWDkFYD2vSGoij3bf900tOxkfNQ5T
         aQbGYLBm3/ttNWgJQKYcd4wyUMtCIjaXu68kxsPSSnJhDpOLlmaxMclSH9qv2+FuPW
         SLNU0JbRdgWtoabtSiBG2W/pieq3kkGcBZ1CgOWGvQd3y1BGyzOS/r0dcWaA+e+PxG
         NfHGW8peri9fD56Ht+vT2V9duDni85mvguGN2kxiSEop8xJxGiZcg+4/pq/+l7rrtQ
         IRURJcof3C4gn5dnbMSeEPXxcWCmKrh9U4Qig/wyOD/VNakmEjOiqPguoCRZ8gNtNE
         KRK9EAJVq0CdA==
Date:   Tue, 24 Aug 2021 09:36:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dave Airlie <airlied@linux.ie>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Jason Ekstrand <jason@jlekstrand.net>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: Re: Notable build failures in next-20210823
Message-ID: <20210824093642.05859341@canb.auug.org.au>
In-Reply-To: <291c0a6a-5285-0b63-21cd-f6aaff4e6727@roeck-us.net>
References: <291c0a6a-5285-0b63-21cd-f6aaff4e6727@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EDnFl_fLuSEELseFgGpPDcm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EDnFl_fLuSEELseFgGpPDcm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi allr,

On Mon, 23 Aug 2021 08:47:38 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>
> Seen in next-20210823:
>=20
> Building x86_64:allyesconfig ... failed
>=20
> drivers/gpu/drm/i915/i915_module.c:50:11: error:
> 	positional initialization of field in 'struct' declared with 'designated=
_init' attribute
>=20
> This only happens with CONFIG_GCC_PLUGIN_RANDSTRUCT=3Dy.

Caused by commit

  a04ea6ae7c67 ("drm/i915: Use a table for i915_init/exit (v2)")

and then moved to this file by

  708b7df3480a ("drm/i915: Extract i915_module.c")

from the drm tree.

CONFIG_GCC_PLUGIN_RANDSTRUCT help says

	  If you say Y here, the layouts of structures that are entirely
          function pointers (and have not been manually annotated with
          __no_randomize_layout), or structures that have been explicitly
          marked with __randomize_layout, will be randomized at compile-tim=
e.

--=20
Cheers,
Stephen Rothwell

--Sig_/EDnFl_fLuSEELseFgGpPDcm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkMQoACgkQAVBC80lX
0GxorwgAlAfEcwn9DTxDIWlC6ZXiFh17QQkmWYxKRbqt/XjCG0n6fPRGCUK+nF4p
L98y4AqTqsblpRtvafAvLS7nErSjDR4nGDtMhLdcgWFlVUdO40SAP54SHdwTcRvx
xZH9p6K+nSfQ5CvFgixlSdxnV/CLVlG37eZBa8wjnbVWgPLfBBRpyrBM9cN5+M1h
C87hNRdOIstRGFCZ4v3OtYbzoBrBkH67Mi0y1Y3mYrSwwgV+sVtxzyAht9/FP4Yh
tSgre1B2NgPvka/S84YYVrpfKeGmuOyFK5x7w0QD9HqbsNY46fHNsN5lJCMNe4b8
haGp8CTVgJwHI5KGtVgKaZzZSQVleQ==
=qVeC
-----END PGP SIGNATURE-----

--Sig_/EDnFl_fLuSEELseFgGpPDcm--
