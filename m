Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7FDE15146F
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2020 04:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgBDDDH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Feb 2020 22:03:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45087 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbgBDDDH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Feb 2020 22:03:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48BTyw3cLWz9sXF;
        Tue,  4 Feb 2020 14:03:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580785385;
        bh=f4bKvAY3IkHW8E8G+srPYzm7WFzsms2KBAcbUO6YL3w=;
        h=Date:From:To:Cc:Subject:From;
        b=Qpd77wEBG27F6ykwMDIDYYGkGsOpSZJb8GsFIjpRx0iKH/BdckBgTonmhy43H3mUX
         qeBtLcGTLoWv2KIHDkA0W8lyxPvrq8J/kTEY11aPV20ULJjyR7ZRSDF1ec0ZoCrZ8w
         mDUrGN4syThVbvAogczYxAd8ddjnkf4wCSDqMY2E6IzIRl4PbNEL0d+YLgJTXYKoEL
         cQbwc8ZXKRxpp72H5IQ4PxpWMPo2UAYX9gk33ymD/HLnwezQs+wXv0TBm2fQWRbOVM
         B6N6mJGl+v68Qsz4kpTpBEOwsWHrtHNRQhEgnukHfCQv5nNZm9dgSGqPiud6WBZtp0
         Y9CbmXf8a9BhA==
Date:   Tue, 4 Feb 2020 14:03:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: linux-next: build failure after merge of the mfd tree
Message-ID: <20200204140300.7537283c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6Nr7eXC_NyQrqlGVH.I9iir";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6Nr7eXC_NyQrqlGVH.I9iir
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: sound/soc/codecs/wcd934x.o:(.toc+0x0): undefined reference to `of_clk_s=
rc_simple_get'
ld: sound/soc/codecs/wcd934x.o: in function `.wcd934x_codec_probe':
wcd934x.c:(.text.wcd934x_codec_probe+0x3d4): undefined reference to `.__clk=
_get_name'
ld: wcd934x.c:(.text.wcd934x_codec_probe+0x438): undefined reference to `.c=
lk_hw_register'
ld: wcd934x.c:(.text.wcd934x_codec_probe+0x474): undefined reference to `.o=
f_clk_add_provider'

Caused by commit

  6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")

Unfortunately that commit is now in Linus' tree (and was never in
linux-next).

I marked CONFIG_MFD_STMFX as BROKEN for now.

--=20
Cheers,
Stephen Rothwell

--Sig_/6Nr7eXC_NyQrqlGVH.I9iir
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl443uQACgkQAVBC80lX
0GxZswf/cp+SmpQRyGcIquTeIQknXyRR+bRIj60qb0CeYYyuYiEw8bG2QUbc3sbO
zTOGZmn6dzC4u0RDSZF9haC3DXfa6Gp0lolc9s3hk9QPTYo4TczSLeqjLGvhDjze
chbhJ69feTEuhDY+J/2IwOwRujtIzXJ24R5UQENWFwlN3rIh6GemvLem5+Jh4hkt
rzktHjgqOHJsPOvLP5CuHY0E9UsfSwRfucDJVkwrlq83YvB/46dywb8KFAnAQ6eW
iRW4Y2Lqz7QmlHIgR3y8kykoxAeQQylnsuS4zlMiHtzaUqPN/KFb5o0cC6zCCMeH
eJ8dOXv7G95CGGxL0qYQPGnX0VJ8AA==
=PrLd
-----END PGP SIGNATURE-----

--Sig_/6Nr7eXC_NyQrqlGVH.I9iir--
