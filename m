Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246393CCEDF
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 09:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234890AbhGSHzI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jul 2021 03:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234778AbhGSHzI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jul 2021 03:55:08 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B602FC061574;
        Mon, 19 Jul 2021 00:52:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GSvFJ62Jbz9sRR;
        Mon, 19 Jul 2021 17:52:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626681125;
        bh=kHCUeX0+kFqJ3j0S9S+NV7XpHeaQK63xC8ZFjrvLoSc=;
        h=Date:From:To:Cc:Subject:From;
        b=YJ9FVp81Gm/wpTUdjOzFcMw0CUm1rRaDFtB+29mk5oefiJ4pCnhk//9Rm/nYd6BSN
         tBU1GSKxzMSbuJ2D36WguRnBIBcSTTWMuSqpOU59Sjd+56YMHxiC2si56mTKOoFOPs
         I5BQFpdPc2uoSi/grOfwn1YnPispQKhaervWk6Sp+JMBHdWhYB8JmI+b7IZUbkszbk
         Dc5wwvkHWimf1dUjjjlGUto2AAS+cZDU3TQwxJ6TnUiMa6AbO+t09d22HtQHTNhcc2
         gUOkEeBuRivMgj1g9ZGiMbOjjguuOS7E4loxUuplZv9ibnkm/+kqEQjLydxR1wmARN
         j69bB9wZdRnEg==
Date:   Mon, 19 Jul 2021 17:52:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Ben Widawsky <ben.widawsky@intel.com>,
        Feng Tang <feng.tang@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20210719175203.2152c54b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5ba5/QJI/ET9PquGRI13hSL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5ba5/QJI/ET9PquGRI13hSL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (i386
defconfig) produced this warning:

mm/hugetlb.c: In function 'dequeue_huge_page_vma':
mm/hugetlb.c:1180:1: warning: label 'check_reserve' defined but not used [-=
Wunused-label]
 1180 | check_reserve:
      | ^~~~~~~~~~~~~

Introduced by commit

  df178183cf05 ("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")

--=20
Cheers,
Stephen Rothwell

--Sig_/5ba5/QJI/ET9PquGRI13hSL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD1LyMACgkQAVBC80lX
0GwQIQf9H19xqP4Qt9aKIiYR1IXQbSHg6MLX4OoXuD39UNT1kd5FLXkJvCkn2rR7
ANNMuQenGCoL7zqrFkR3KQMRcEEeNmMEjcx+smttVO/zL+OFaoaK5Yp4ROPiIh6w
Sbql5gUvRzHa32clBVYhPeio8vyxewVk56fh2OmZeDpvGPUzLFm4iTKpLpAUpueU
4kh5uh30H4LmLqNqB2aNQ61nvlzTanADJHD+jx6pT7TVY/l/rMXQAxcV1MQowYrH
dRTYts8yTfaThnV6b9Q1DWTuOT2qFkFfhQ2OMVfqo8N+BjP0EmjMz6AbmQvTQBYF
vsm0QtWWatd321t6Kuh/bm8oXF0Mow==
=ZOwd
-----END PGP SIGNATURE-----

--Sig_/5ba5/QJI/ET9PquGRI13hSL--
