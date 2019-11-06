Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF4BAF0FD3
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 08:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731331AbfKFHFk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 02:05:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43759 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731000AbfKFHFk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 02:05:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477HcF4cc5z9sPK;
        Wed,  6 Nov 2019 18:05:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573023937;
        bh=o/otlUBELOZEGjG9xH+HXFSIuypbqtHhsgOaySaQjsY=;
        h=Date:From:To:Cc:Subject:From;
        b=QQM2aYT7ZAgsUPro83AfML0dkQIBE4REyqMl5khj5NHiLCC0zSq1/gnKgs/MUyZio
         Xq6IITQX3nUc9kyyojMbWpRfl9DyxIH44YORTqMpEC+gi2L2eQS2185n9KTf9XmsJo
         lsUBn6CzpzS60o6b4MYrjEfQVSCiGKFdNQDGgslIB5pB2rjgGy7y0MKtlgPgoMaB8n
         feE44jW39LX81Usey7PzmGg/CA7oea3tbSd0T0XHpsnKRVJgoMILR++INA90jLKhsc
         VDtSKTz9cmTtEyvip2DkKJw7v6OvUQf936apWYnI1DV0Sfxfkm0X6vZJtZWnUXI5Hz
         g+5dNd8XVywCA==
Date:   Wed, 6 Nov 2019 18:05:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        yuqi jin <jinyuqi@huawei.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20191106180531.11419dca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//J8ctAOzAP6MM35GZCSjHxK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//J8ctAOzAP6MM35GZCSjHxK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

lib/cpumask.c: In function 'cpumask_local_spread':
lib/cpumask.c:302:1: warning: the frame size of 5472 bytes is larger than 2=
048 bytes [-Wframe-larger-than=3D]
  302 | }
      | ^

Introduced by commit

  3d591f2836cf ("lib: optimize cpumask_local_spread()")

MAX_NUMNODES =3D=3D (1 << NODES_SHIFT) and NODES_SHIFT =3D=3D CONFIG_NODES_=
SHIFT=3D=3D 10,
so MAX_NUMNODES =3D=3D 1024 and there is an int array and a bool array of t=
hat
size declared here :-(

--=20
Cheers,
Stephen Rothwell

--Sig_//J8ctAOzAP6MM35GZCSjHxK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3CcLsACgkQAVBC80lX
0GwlZQf/XYdYUqzvcxNBU8FnFfIYRUzQD7/nO9dsqE97dxk9nISd3uTdBYM5xQbK
R8hEl/JnphnnTgzLC1gob2UVTH9zW4gRvLJSAOGpXApUjDIRqtjIMamKi0rQLK4C
a59bgGwZeZZ+tO+/S8V0e5itT41QrlSMDkSrtUDL+VUWdDZIuVetUBeoL9+Nm52w
O9NoXASdYNwE2JxPAHEs2dCZplYXYANd0XVPtUvxToOIrMHN+Z0DcvYRrvYRvX5e
R4MauOCOjPy2wr6xV32WjLCXdXrwOeLRaX5NJYkAtedje1FmlouwyN0hSBiB5Jqg
TTyMPtMv/tUyK4M1MwKMKhPWKvRKVg==
=SLkP
-----END PGP SIGNATURE-----

--Sig_//J8ctAOzAP6MM35GZCSjHxK--
