Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C36DF062
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 16:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfJUOum (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 10:50:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38172 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726289AbfJUOum (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 10:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571669440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RV3ecg2N0wkLXEQtMxcEfXchq1mGHGomE04WfJcMsko=;
        b=WfDf4Od5ibIUJcGhSNk4zN83TKgCJFKKE3BwnO/524sWm4RS1D/50n1vm6Mhl7xfaKHtQA
        Woguam9QU89VAy+1088VALfTB3CNWG9CG1R18vE+zuFkmzZeS5VK7U5ra7bQnYTpUqwwam
        N1sscMlEnlCmsR9j1Nm3kVmtQTGZuIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22--uv4ynX8NoSlDMemNAL_XA-1; Mon, 21 Oct 2019 10:50:38 -0400
X-MC-Unique: -uv4ynX8NoSlDMemNAL_XA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801301800D79;
        Mon, 21 Oct 2019 14:50:37 +0000 (UTC)
Received: from linux-ws.nc.xsintricity.com (ovpn-112-37.rdu2.redhat.com [10.10.112.37])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 693DC1001DC0;
        Mon, 21 Oct 2019 14:50:36 +0000 (UTC)
Message-ID: <c4377d50c8a30ae292cd7886909238ce4fb56ee5.camel@redhat.com>
Subject: Re: linux-next: Fixes tag needs some work in the rdma-fixes tree
From:   Doug Ledford <dledford@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Potnuri Bharat Teja <bharat@chelsio.com>
Date:   Mon, 21 Oct 2019 10:50:33 -0400
In-Reply-To: <20191021184128.601ff09d@canb.auug.org.au>
References: <20191021184128.601ff09d@canb.auug.org.au>
Organization: Red Hat, Inc.
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-ZkBQHAptL0Q0RdP3IbyJ"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--=-ZkBQHAptL0Q0RdP3IbyJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-10-21 at 18:41 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
>   612e0486ad08 ("iw_cxgb4: fix ECN check on the passive accept")
>=20
> Fixes tag
>=20
>   Fixes: 92e7ae7172 ("iw_cxgb4: Choose appropriate hw mtu index and
> ISS for iWARP connections")
>=20
> has these problem(s):
>=20
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git
> v2.11
>     or later) just making sure it is not set (or set to "auto").

I'll leave it to Potnuri to fix his stuff.  As for the rdma tree, the 10
digit hash is still unique as of today, so I won't rebase the official
branch to fix this.  However, I'll see about adding a check for this in
my workflow.  Thanks.

--=20
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

--=-ZkBQHAptL0Q0RdP3IbyJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAl2txbkACgkQuCajMw5X
L90jnRAAmva1mMR/L/EnhjHaHRAZ3hpytxvf3Otb3jbyhskj3IzDiQa9574c7MWp
3UPuklJaf80BqjzQ5LfKF1fsRY+zXHxep2i0FvFqy06kHbphIjV5F65R4IP35TlJ
yHbXlgreIJGnNeI9569GFdVZZnYgWEebOyOvAkQj+sQ7FBpvn18urE8Hy7MJGoPN
1lpVguYtAnAgqAU6pvOmoZO7sxEoLzMZ/gDiaZijwcksYoVb90kSbg3ffeZzdhjq
0Qzcy81BmmbrLPo/aa52uyEmvXHAmwPWtShRwcxS5yXgQ11mVTvVcGgApYFD5Mw0
UT+LEZuXISf113zRy2xNZTh2+QoaUB6o+nw0xpjAJXut0vML1fqmVllWQuk4ASus
NnX/pLlsdLCsgMYUU8Eygj/CNPIyIqvXwJb7OH7dXBgyYlFwuKehrAGFCLgeCtfX
vbGcnumxyPcMzKy4W/PbDa3tDy42K2FQwpMKbHyGOMDXA6bpBi+uBaRxAvDmPk5I
WpmTGMcNF9q05lBQIL8e+9wMXqRISFtfrwS0cJdxP+Aven62rT/d5DWYG+sDot65
3SkEH6nWW+YUhzKmi+17kPrGK14+e0nY9zZrmniUQdIDNOBwTVtG8kqlXS/c5iPZ
NB2ubPRLdruVDUl+5ekluie7SKMi1Ib/KOimLXDG7Zuu9B4DEoM=
=S99E
-----END PGP SIGNATURE-----

--=-ZkBQHAptL0Q0RdP3IbyJ--

