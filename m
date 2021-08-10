Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3350F3E585E
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 12:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbhHJKcA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 06:32:00 -0400
Received: from ozlabs.org ([203.11.71.1]:60013 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239045AbhHJKb7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Aug 2021 06:31:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkTlD4QSNz9sRR;
        Tue, 10 Aug 2021 20:31:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628591496;
        bh=MReQHuDSQSRyaLKya4YJSHkkokyUvKDV4rZHCUVOo9w=;
        h=Date:From:To:Cc:Subject:From;
        b=mMB6IxNU8nDT7DzLxHPKBl4JWy+re8UxY/CwPq5ZR0s0LdTM6gl7std6eHlrNVuJX
         08IJbCXsyQm22daiNYqlUnar5+/GCfrZt5dyl24YG4XJCX7R6xKc1AYO1J4OlUrGvm
         DzSgLIFtE7+mHQ6+2jj+7S4Ga5WV7Of1qWMxPCkrH7YFVkh+0pj6LKkwFUPMM5GLPS
         6FhMfGJeLs186l4ucLc2e9h+TZk52Jpeeb6ZBmi8gOLwhi3zs8e9NXe6si/MUhuqW1
         6RtUht0u4NHt1GlbuSjN2DAt0iDh6HNKclazYh8puwM5I4u6eoM4Vn4MQtlzg19XzJ
         /sdiNgmJFCB+Q==
Date:   Tue, 10 Aug 2021 20:31:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20210810203135.7eb7b01a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n=5DrvZNE8yPU4kfr7exugS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n=5DrvZNE8yPU4kfr7exugS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (or32
or1ksim_defconfig) failed like this:

mm/page-writeback.c:2044:6: error: redefinition of 'laptop_sync_completion'
 2044 | void laptop_sync_completion(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/memcontrol.h:22,
                 from include/linux/swap.h:9,
                 from mm/page-writeback.c:20:
include/linux/writeback.h:345:20: note: previous definition of 'laptop_sync=
_completion' was here
  345 | static inline void laptop_sync_completion(void) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  5ed964f8e54e ("mm: hide laptop_mode_wb_timer entirely behind the BDI API")

This build does not have CONFIG_BLOCK set.

--=20
Cheers,
Stephen Rothwell

--Sig_/n=5DrvZNE8yPU4kfr7exugS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESVYcACgkQAVBC80lX
0GwuAwf/QGq9DJ/XQu+tSinoG1lJhOu/lSlN52C53itoGSu3pVplA0VnkxJOVEx6
uIQcNNK4dpUY9aM6TzWJTjCkPUiA0i0NLUEWKrLd8MN0f58fmCJlQfChMkKyHwtr
jtiHNmge4l54oHOWpuD6ATn7zGhHNsvbzVMMV0OlZ+WMVyb92MdG8PZHfupq7a2C
SlQ/xV/0wUxQ4fqhCuyG9IkzrJYxZmwtTMdmKI3l6C6C3js9n6H0KUQD+dRJjL32
aSKjvrdzBV+ko/F45exIclyqTA5Bb6oHoK6cfVWrrkZDpjvqM8Zj3D3rNyjAjolK
oT1Hm4KyPAI71QZBBCamvBaiqOrInw==
=XgCK
-----END PGP SIGNATURE-----

--Sig_/n=5DrvZNE8yPU4kfr7exugS--
