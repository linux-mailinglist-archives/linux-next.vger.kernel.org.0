Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93FD1E17CA
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 00:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388473AbgEYWRv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 18:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388054AbgEYWRv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 18:17:51 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49A1C061A0E;
        Mon, 25 May 2020 15:17:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49WBL337K4z9sRY;
        Tue, 26 May 2020 08:17:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590445067;
        bh=0ysS2z+yNChls6FS1HzZSfYyyT2HJw9ck/dqhQ7SXwQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u809ssKvVscfArVyqxEosS7XXAPqZrT1IkBQXkNSEIvEU01xA6lUYxfj+TbRR6N8/
         Tiqak1hki7S46RQvPHRS17h8MH+Ia+YdSnDlWSxFS9s4LNE3XiwUgqMzLYUJmWGqI1
         A1qtHS2gimV4dWRfTXg38r0vtqVdk4bgfgtZ9Qq3CTdCoIo27bAIpIyVHFBbZHj/aK
         FuMwhin/C8HUOwM73FhQzU9zVOhif5VwfH2Sk+lklPefJaXF+53O6nIPk86ZTwfFPp
         oJUT3lBNGiPdaNOuo5mA0trJu++A0IeZ1gMX9hrQ73auyL007GMd5DhjX0o2WJurGQ
         EE80OZftQSj8g==
Date:   Tue, 26 May 2020 08:17:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michel Lespinasse <walken@google.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20200526081745.53d45f01@canb.auug.org.au>
In-Reply-To: <4e1d8a9d-e308-df6a-6921-dbbe8d5f8389@nvidia.com>
References: <20200525221700.0aa347f7@canb.auug.org.au>
        <4e1d8a9d-e308-df6a-6921-dbbe8d5f8389@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6T++Jexwpt1_=Kq9gfJzKp3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6T++Jexwpt1_=Kq9gfJzKp3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi John,

On Mon, 25 May 2020 11:18:46 -0700 John Hubbard <jhubbard@nvidia.com> wrote:
>
> Yes, looks good. And in fact, Andrew has the same fix-up in the mmotm bra=
nch of
> linux-next.git, as
>=20
>      commit a76c281a8ddd ("mmap-locking-api-rename-mmap_sem-to-mmap_lock-=
fix").

For some reason that was not included in the section that gets applied
to linux-next :-(

I have added it to the akpm tree today.
--=20
Cheers,
Stephen Rothwell

--Sig_/6T++Jexwpt1_=Kq9gfJzKp3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7MRAkACgkQAVBC80lX
0GzemAf+OLYeVgHg8oYOZkzb4wVt0XAmdFwRO/Qpv5dhgDEpELizzPInrM75rIKV
qeRMR6+B0hgBOp4Iwgf7LT+rydlk06t2N/hVfWfSf36IEaLAn4An8r2fHahcS+S8
a51YYsTsWcfhk3DHXqGYclTDOjmpiSkVldmGHCIYMJAdFVsJvlxwH3WWWUvL+pVR
hkrNB32kfpzc+MIBo2rxHeSg2ofXKWQk5H3joQLLqs3Y0EC8MuwizGuUlLMOg42o
J/XAmkl7mdVMEYXvwko8bKV31zvFsfKgAfuoY6wvqdmOA8OlvSSzGVvTtLwK4mbl
k8Lt/SjIlRgjgXQCMZPOz1rBMu4ZvA==
=as/T
-----END PGP SIGNATURE-----

--Sig_/6T++Jexwpt1_=Kq9gfJzKp3--
