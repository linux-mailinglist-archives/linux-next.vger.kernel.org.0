Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C86532DA147
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503030AbgLNUP0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:15:26 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34159 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502847AbgLNUPT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 15:15:19 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cvt0F4BYbz9sSC;
        Tue, 15 Dec 2020 07:14:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607976877;
        bh=LKx8514/0Dqkj21evfoUNagclcOtEjZBds/wpzet0lk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OgPVcwny4zc3B3IkI3PTaESclpanb+GWqXhSMB6dkXB/d2PFh0IrxU3G53iJj3Zhe
         lqsSym2wCBzAGYuDB6KshbQimYNL29zHGwONMcB8OTPLbLVyNzKAIfsYUFvJkW9lR7
         ZhMVHLYSbQWgkyyKB4gu7k6DllsUlJvSJkdtuj8n0jfvAbpBMc7whDDpa/7rFzuYMn
         6BcRM3sDaBt6opxoHWtCabmM1WeUN6Qv4IOSG6zg93erJrHss66Sxk6ME55/2S+R0u
         zGAwMPht9yH/69kXjnFIGVoXjIuAmkqo9HYMI4/j3HWsBhHn1d8/I1B2ZY57/UDx2n
         KWHY5CfJ2dkuQ==
Date:   Tue, 15 Dec 2020 07:14:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20201215071436.3629b5ec@canb.auug.org.au>
In-Reply-To: <20201203183958.3ba2c4f5@canb.auug.org.au>
References: <20201203183958.3ba2c4f5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8vciti9=6RcXp0KbXG.sljl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8vciti9=6RcXp0KbXG.sljl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Dec 2020 18:39:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the block tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> fs/block_dev.c:1838: warning: Function parameter or member 'dev' not desc=
ribed in 'lookup_bdev'
>=20
> Introduced by commit
>=20
>   4e7b5671c6a8 ("block: remove i_bdev")

I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/8vciti9=6RcXp0KbXG.sljl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Xx6wACgkQAVBC80lX
0Gw7xwf9FC0pujrTy71ZZMcU78S+xMR39qWgjnKpvfbe6OQ7SxHR6DkNK/e6M8UT
H82owTj1VUv+J2X7QDmIcfhkuX+NLdkM3rkdcwefFNvw+C3fV/LspBV5TtpqDlgu
/hSG6FaD65cukbEu8IuKt8Dy19yO3N54ZaFPFEMKKnDYEJY+zQbl+6Qp8aeeyS+q
cMAUX0XtkmcyPMHhw2pFSavW8Q5Ws0H3vDaW5fuPAj4ImnFNdYxL2N+0+4oqgkru
VFmjGqMooCr1pO+gempweA5694IBHzGZLgUayx4XHYTPz8iXmxChgUw49yhxKAQz
ZfuLyq5Glf2yOFlk0bNV+SG1v+ueZQ==
=oCqj
-----END PGP SIGNATURE-----

--Sig_/8vciti9=6RcXp0KbXG.sljl--
