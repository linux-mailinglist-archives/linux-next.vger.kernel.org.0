Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517761C5AD1
	for <lists+linux-next@lfdr.de>; Tue,  5 May 2020 17:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgEEPQb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 May 2020 11:16:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40585 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729458AbgEEPQb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2020 11:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588691789;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=S5jSjNSt3FRjAMpv+BM9fPdmFYdsgn8Mgeukut02z3U=;
        b=dJA0WZPSLtq9RjEf2CZ/+5ArQPRe12nne3v8jRz8g89o97LJk1q4cfoh2MjSRlU3QbwN9E
        w8yh0ZdciH/xBoQkQIiFwtk70aK5BUdxaE7uTJQgZRiqLV41qp9SAX5b87XK+smccf4Qce
        I7jHTCWffU5uyn/WBQzppMbmYcbOWTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-S9YBJx5ROTuOY7H7iHjFCw-1; Tue, 05 May 2020 11:16:27 -0400
X-MC-Unique: S9YBJx5ROTuOY7H7iHjFCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A7F2835B44;
        Tue,  5 May 2020 15:16:26 +0000 (UTC)
Received: from localhost (ovpn-113-143.ams2.redhat.com [10.36.113.143])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E9B91053B00;
        Tue,  5 May 2020 15:16:22 +0000 (UTC)
Date:   Tue, 5 May 2020 16:16:21 +0100
From:   Stefan Hajnoczi <stefanha@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20200505151621.GE381978@stefanha-x1.localdomain>
References: <20200502103018.07774059@canb.auug.org.au>
MIME-Version: 1.0
In-Reply-To: <20200502103018.07774059@canb.auug.org.au>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2020 at 10:30:18AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
>   ab8be610c87d ("virtio-blk: handle block_device_operations callbacks aft=
er hot unplug")
>=20
> Fixes tag
>=20
>   Fixes: 48e4043d4529523cbc7fa8dd745bd8e2c45ce1d3
>=20
> has these problem(s):
>=20
>   - missing subject
>=20
> Should be
>=20
> Fixes: 48e4043d4529 ("virtio: add virtio disk geometry feature")
>=20
> Please don't split Fixes tags over more than one line.

Got it, thanks for letting me know. I'll keep the tag on one line in the
future.

Stefan

--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6xg0UACgkQnKSrs4Gr
c8hQnggAgGQiqAqlgbDL2GudaR9leWkOqIdxAdFLgjaNmzqd1LtsPGhjxs9JAA42
lsOSk/AFa7TBhg47bVj70gu9G4d5dCYIxs3ojqJDB0GJ0hWxd+pghi2O0UpY3QKZ
8kRlAAyj25zfZbZtqlew9aCw3ShUd9a7Tc1uVSpyHoIL2OyW6zcMN7/8Szta8YUW
amZqA1zUc+lmgg1u7ctMTrcIFV+Hmd1frnebEZlJjAWOw5djJR18CpJaWBMece8R
XA8IOWHPiA+jBQdP8E/+MVE7x2kjXmvDCrA/XRT6283KeHasFzWyaznpWpaUuLvh
nZs6GIuCFnz8dejuRS2FEkYUmFIfwQ==
=3nCS
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--

