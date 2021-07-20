Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE9D3CF49B
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 08:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236659AbhGTF57 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 01:57:59 -0400
Received: from ozlabs.org ([203.11.71.1]:55495 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235503AbhGTF5z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jul 2021 01:57:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTTZ12TzRz9sSs;
        Tue, 20 Jul 2021 16:38:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626763113;
        bh=p2LHTevonXCOxbjDx9/858+XL9QsjTBEtU9QUjzY6QY=;
        h=Date:From:To:Cc:Subject:From;
        b=eQmqbk7+fzUu9WkOU8t46fc7qtRJoYDX8d6PTl6CTwUGQuHBsMI/M27YtJSFEUxag
         83kYcHJtiF8R7m++ZfW+5IFQzf+MfaUDHejFhO6pzGOJvB7qgl50ByWgs3RLPlN8Sk
         uB2/NEUcxPAZXfJH/meyCe99g6QM6Tf/lvhGTJGTmdCO3N2NdQNPOv2SeK3RVRopRl
         eJUrEWbGjKUH5hqyLmhQgoeolmznJAqgXyBo0qyuoNNjo3E0HjT+YHcQh9Rcul6PkQ
         jkNek7yBsCL/RiTCWsn2UV2EhiDQzzLAJN+h5oT0HSeseOfCLinGFfxI6mVmRJa3M/
         P68W5/b47Vx5Q==
Date:   Tue, 20 Jul 2021 16:38:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Amir Goldstein <amir73il@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the overlayfs tree
Message-ID: <20210720163832.544a2baf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bHJUQRrvlR+2Piqqj+Wy4pq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bHJUQRrvlR+2Piqqj+Wy4pq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the overlayfs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/api-summary:95: fs/stat.c:67: WARNING: Unknown ta=
rget name: "statx_attr".

Introduced by commit

  d1e717e0032c ("fs: add generic helper for filling statx attribute flags")

--=20
Cheers,
Stephen Rothwell

--Sig_/bHJUQRrvlR+2Piqqj+Wy4pq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2b2gACgkQAVBC80lX
0GzFOggAgyMl6PtVO31Aee/Q6zSUS3mLFMxcOiZMZm116Y/nDnWwcUdLpGVUzZuX
T5PNr4CcMWkNefdR6zTZ/Bl0tM6sGi1slB0EysKNgJIwzAHY9N4V1nvxOmkkxtat
rSW0Qv5qfO9FUuCLRa1XCGLiHWr5RuEiwKnN6qdR5KlkNffwVAczQGe00jBd8TNg
Iqd2j0Uym2hmrFmsrVvNo9lt5QYtMfawTg62xqW1WMQSqKpjYuexs+XxO7rs/+Qr
poauG5mUYgsalva50v+HTuIMBRw9PTrTIsa/PjKxUGRogLRWUocp0sOCFFW8CQP6
QCudDYJORkRutTXWytu+wsMEU3rXdQ==
=PI85
-----END PGP SIGNATURE-----

--Sig_/bHJUQRrvlR+2Piqqj+Wy4pq--
