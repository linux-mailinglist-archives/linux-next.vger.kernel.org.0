Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA3F98705C
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 06:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbfHIEAk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Aug 2019 00:00:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56833 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725766AbfHIEAk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Aug 2019 00:00:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 464Wjw3N34z9s7T;
        Fri,  9 Aug 2019 14:00:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565323236;
        bh=TzdjBd5IaEAqnQkCG3gU/M9q4Nx3d0GNDs4jlrsd1ew=;
        h=Date:From:To:Cc:Subject:From;
        b=SwxB7RWUlVwy9IzV/2TFjLedarqlQDBDjRz8s8W4ktO3D+QMbQ8rQoIFAExRs3AnB
         T0IdGzrSpzX8Gngi1VZbDrZaPl+4fzCS7c9SviSxZwroApfDCF1yJmYQpIq+qrytFa
         kx0657mDE1ufy1ZVvWtl5e7g/pmKxP8sNA9aUy5CzH9u4Ks0WPiER/VfFyJyQaT8uS
         Loa8/3M3t5iNXnBYO6y4WlZQD89QRxIiPqsS7q+D4aI9nQqsa6bmwqeuZkw7B52axb
         zwL5+z8n+SBqPH2QX2Kd044LK6Wi/y8h8HxmBgc05l8Fz669sbALlZzX/efrv1psDC
         ojSkoWyWaLOLA==
Date:   Fri, 9 Aug 2019 14:00:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: linux-next: build warning after merge of the block tree
Message-ID: <20190809140035.5b59c31e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s29ZE7AiGGIsYfHMjn1trN+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/s29ZE7AiGGIsYfHMjn1trN+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/lightnvm/pblk-read.c: In function 'pblk_submit_read_gc':
drivers/lightnvm/pblk-read.c:421:18: warning: unused variable 'geo' [-Wunus=
ed-variable]
  struct nvm_geo *geo =3D &dev->geo;
                  ^~~

Introduced by commit

  ba6f7da99aaf ("lightnvm: remove set but not used variables 'data_len' and=
 'rq_len'")

Removing the above line will also remove the last use of the variable
"dev" ...
--=20
Cheers,
Stephen Rothwell

--Sig_/s29ZE7AiGGIsYfHMjn1trN+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1M7+MACgkQAVBC80lX
0GzbQwgAk9FRuRUe8eK/HMkiHWQ/utxFyA2vc89LzbjoWbuv+9B8+v/9cHXa93KO
PH0sVcEHP7Vm2eOOgCZQqsMgJW6vdIjzfOarNT4VmATNeqmSVxvr1aVbUh0DAEbi
HUuG5s4c+rX4eL6DBgHoXe8FYloBvmmENpx8vmHbjkxrRSa8up8qh1NhbPbupMAO
NKqKkaztqBRtxe7BDS6iUvPhmHQN2tkTdKS07Dr/lEnzo26e2qk78Gu2hvQmT7Mt
iVmWm6C1p1ocI24qiGR6/wQGkTGxOl90AVEMm0hUwAO3XU/XxQcAh+oLVn6KCCQj
J6SXalcYiGyA2/xHJNkxM3LbpupRLQ==
=TBd+
-----END PGP SIGNATURE-----

--Sig_/s29ZE7AiGGIsYfHMjn1trN+--
