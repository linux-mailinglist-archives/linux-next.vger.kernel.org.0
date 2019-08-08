Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A12185995
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 07:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbfHHFEe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 01:04:34 -0400
Received: from ozlabs.org ([203.11.71.1]:60593 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfHHFEe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 01:04:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463xB76MJ6z9sBF;
        Thu,  8 Aug 2019 15:04:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565240671;
        bh=Xa2MwgolVrtG1hRvqOby5CPhV+YKZxy3UyY32mksAaw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=amDxSOWwPaHRCi+LZya3DZQxaNN95vGGTcC/iyvyKHzYjlbqrM5K2dnC8AMeHul/e
         EvBixVgeXlALqxBKYS3RwtLYh29GUpQBzFXEgEM/P1eX/v4VJpyIAERvvBv8m2SbKv
         nHkB1Qv1pa7UjkFplKa3n9IXFvE+vVjoK4yihyOuhFSoY/k7d5nmtdoAjpyXkqA0dP
         we3rlM/RvKKunPa+qjeYBep4wQizzPu9jwVlOT+V3wkAIdD+j2HJr8XjPxCri4EsR8
         amh2ox68x8+9OF2z8M8VJDgXLSunmO+fmjNNm+FQFcUjO7xfjP61/q2LWpuk1948CP
         ZYPx4qdqrAaWg==
Date:   Thu, 8 Aug 2019 15:04:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chuhong Yuan <hslester96@gmail.com>
Subject: Re: linux-next: build failure after merge of the crypto tree
Message-ID: <20190808150431.09c1be19@canb.auug.org.au>
In-Reply-To: <20190808050004.GA17267@gondor.apana.org.au>
References: <20190805145736.2d39f95b@canb.auug.org.au>
        <20190808115245.0c88c300@canb.auug.org.au>
        <20190808030156.GA15782@gondor.apana.org.au>
        <20190808131710.7186de0c@canb.auug.org.au>
        <20190808050004.GA17267@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UcC82gN90_6AWef8iLmJULb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UcC82gN90_6AWef8iLmJULb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

On Thu, 8 Aug 2019 15:00:04 +1000 Herbert Xu <herbert@gondor.apana.org.au> =
wrote:
>
> On Thu, Aug 08, 2019 at 01:17:10PM +1000, Stephen Rothwell wrote:
> >
> > Excellent, thanks.  Should I add the crypto mailing list as a contact
> > for problems?  Mostly the emails are just reporting conflicts and only
> > very occasionally do I actually send a useful patch.  If so, what is
> > its address? =20
>=20
> Yes please.  The address is
>=20
> 	linux-crypto@vger.kernel.org

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/UcC82gN90_6AWef8iLmJULb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1LrV8ACgkQAVBC80lX
0Gwedwf/UGI+L69kQpgyjRdweWJGOWQZyNiDw0LgztZL1/I54BSN3PIvdiO/KTsE
giVp5FLx7bkXamnmxsBhlHvpKtW3Cq8AWC+vzkewp9m5KDRljJVmALUSzqRmhBAp
QC+74+FKGGh4zcfn0gezJDtZV6TMFpr2E6TykzU4/lMWYNJanSRPywqko1iaB091
G44HX1VpIoT+Tq+Gu0kHe6AQhfQvaPf86TnZzd97kHRWc+qCUuYgjCy9six4dlY+
xq2jFcg0VmVLvlYgra30mmhU4tivJxAA8IM8IzHvKujwH3eKNwwyDYeWC1efGRQ7
BXIP2Gl3o2kiOMfoP0sCHKl4nHFBfQ==
=VTk0
-----END PGP SIGNATURE-----

--Sig_/UcC82gN90_6AWef8iLmJULb--
