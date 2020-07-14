Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9446721F1EC
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 14:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbgGNMxU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 08:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbgGNMxU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jul 2020 08:53:20 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335C0C061755;
        Tue, 14 Jul 2020 05:53:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5gRY3cgKz9sRf;
        Tue, 14 Jul 2020 22:53:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594731193;
        bh=WxdhhT3xJBEpwVaUPSy80Amv6nH76of8j38ezETeGLI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Woq8u2BW6oF8HcstvzYhuBDqNwkPAn3B0zojk0Um0lQ5BHKFsN7KrSgP9e8JISs5Y
         TCnbrvzMTz0+EdMkB647PrbBbSJ0FmnUX5Vdm4PPSxm5KQoU6XY33uiijKfWMsIV3p
         /KgjgxQueAurUm1hLJ8TouS8bLXe9vibQqrO4SXKXKkmrKcLC4TwP3Mo2NNS/26ids
         5Ki79z8DWDKUyg9TEXdknZrRDBhK3KMRdpyVFKpk1rcaNxdBTPWe5lLhPOXg5pDPvz
         w8Ywr6YDH83LvOimpxd/vCbOcbPzKwJSS8FDOZpj4Kf5moLG5Ct7877QsYAPjnhFkD
         pB7XVc4FRShEw==
Date:   Tue, 14 Jul 2020 22:53:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
        <john.wanghui@huawei.com>, Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH] mm/percpu: mark pcpu_chunk_type() as __maybe_unused
Message-ID: <20200714225311.7aeffffd@canb.auug.org.au>
In-Reply-To: <20200714134101.80534-1-cuibixuan@huawei.com>
References: <20200714134101.80534-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J=dR+cfYKKv=+cQfMInw+=E";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J=dR+cfYKKv=+cQfMInw+=E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Bixuan,

On Tue, 14 Jul 2020 13:41:01 +0000 Bixuan Cui <cuibixuan@huawei.com> wrote:
>
> Gcc report the following warning without CONFIG_MEMCG_KMEM:
>=20
> mm/percpu-internal.h:145:29: warning: =E2=80=98pcpu_chunk_type=E2=80=99 d=
efined
> but not used [-Wunused-function]
>  static enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
>                              ^~~~~~~~~~~~~~~
>=20
> Mark pcpu_chunk_type() as __maybe_unused to make it clear.

Given that it is in a header file, it should probably just be "static
inline" (which will also suppress the warning).  As should
pcpu_is_memcg_chunk() and pcpu_chunk_list().  Also, without them being
inline, there will be a new copy for each file that
mm/percpu-internal.h is included in.

And that should be considered a fix for "mm: memcg/percpu: account
percpu memory to memory cgroups".

--=20
Cheers,
Stephen Rothwell

--Sig_/J=dR+cfYKKv=+cQfMInw+=E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8NqrcACgkQAVBC80lX
0Gy1Ugf/Q/FkaGsEtMOw6s34DBkZttcN+Ayf2WPXZBy6iPueeNHxS6jToQ2/jQ5c
zUJ4itvLutvGFlxVl9ULesKcYdQuwqCAoXgxUisPCLFPhFcBC2qKXRBObKNv+OI0
f9Ia6prDgnLNf5D/jX7SbVNBqnDJGwBQYG3XQBTv2c3dgJ40s6RPcEfjm83K6CUp
WjVbgEfvqcN6aB6PoelT6+JtKNDrLfn38OAYzavri8p4KgRaLppO1e5gWBMOxtUE
sQDJ7yilgfw3gxalrzzTTog7O0Fggx3LZrsfIFfVZVw5kZcxatC+64CbpCf3fAqT
uvgGiL7yfkcMVw9JLqyn1ldzQ57lWQ==
=zIOj
-----END PGP SIGNATURE-----

--Sig_/J=dR+cfYKKv=+cQfMInw+=E--
