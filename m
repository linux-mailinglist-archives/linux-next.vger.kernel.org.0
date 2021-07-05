Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01513BC351
	for <lists+linux-next@lfdr.de>; Mon,  5 Jul 2021 22:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhGEUMY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Jul 2021 16:12:24 -0400
Received: from einhorn.in-berlin.de ([192.109.42.8]:40517 "EHLO
        einhorn-mail-out.in-berlin.de" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229565AbhGEUMY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jul 2021 16:12:24 -0400
X-Envelope-From: stefanr@s5r6.in-berlin.de
Received: from authenticated.user (localhost [127.0.0.1]) by einhorn.in-berlin.de  with ESMTPSA id 165K9fls014834
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 5 Jul 2021 22:09:42 +0200
Date:   Mon, 5 Jul 2021 22:09:35 +0200
From:   Stefan Richter <stefanr@s5r6.in-berlin.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: linux-next: removed trees
Message-ID: <20210705220935.4d24a7af@kant>
In-Reply-To: <20210705215743.40b26667@kant>
References: <20210514123221.7c21393f@canb.auug.org.au>
        <20210705215743.40b26667@kant>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9s8Qt82ZjAaJfCmL6FL0aXx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9s8Qt82ZjAaJfCmL6FL0aXx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Jul 05 Stefan Richter wrote:
> On May 14 Stephen Rothwell wrote:
> > The following tree have been removed form linux-next because they have
> > not been updated in more than a year.  If you want a tree reinstated,
> > just let me know.
> >=20
> > fbdev
> > fsl
> > generic-ioremap
> > ieee1394
> >   this contains the single commit
> > 	67f8e65e4fc1 firewire: net: remove set but not used variable 'guid'
> > random
> > realtek
> > thermal-rzhang
> > thermal-soc
> > y2038
> > zx2c4 =20
>=20
> Would you be OK with adding linux1394.git (for-next branch) back to
> linux-next?  There are two patches queued and I am finally aiming to get
> them merged. :-)

(PS, this is for the /next/ merge window after 5.14 is final, not for the
current window anymore of course.)
--=20
Stefan Richter
-=3D=3D=3D=3D=3D=3D--=3D-=3D -=3D=3D=3D --=3D-=3D
http://arcgraph.de/sr/

--Sig_/9s8Qt82ZjAaJfCmL6FL0aXx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElVwAmOXEbvmhUkgUefNvslRdedAFAmDjZv8ACgkQefNvslRd
edDSyQ//USdECkSZg6HZfGDxl+r02umdl3qf5K1cM904eDj8hSL2qsnvjC4ELPZY
Sxugd3yZWiOMCbEcbUgC0yxr8RcpXmPz/TiwA7Nj24EJ7okGU8nbIuKWXjDBZ8Fz
m3g37DaMp1NQ0MxuIb5Hk3ILroB8QD1oSHUCQEe5VHmhQSsEPUAf4tSkwguhSynr
jq41nOYkqXH9/0KWFWBR3yjNwDLNae7j8cNzO3ND2EatgleJ1qD0A7xfi21u3uXh
SJF6kK+lqff0ky5wTRZPNZn5shy2AdycL2dF8YonO8BS01dIWpGio2aMCNVfLXxZ
4kGksqw09LjwLOXvSGxplXVCUAjz1UVynegZZRb3laY5ODlsqTT80ieWZr86dFal
pq96Q81jIzL9Eg8tVhW4jjQIInf6+VuZVgzIu3ZhzZMVeMe6lP8IBR0qjq3K3/3D
jvonOMGnO3OZqq/PtBAn8+R43z28Q+j50kCKF9GFe7Kev08d3Gq+itqJLSwaHKeL
khWzJ7LyeIZ36O0wd/JZrKsiK2kxUccGNtwiZTA4HS/tyRak3ZBotqlAZe2qNXZv
HBm/wM9J4Bc3fYhpdoT/zNAY5KgFuVjKxVhDB8gGE5Lm/ER5o0p0lmH8ziIbFpI/
/9h1XmRuVDCUqw5R8k/xRO3rlMz9/AdOT0hx0cD96SzLAxgwL54=
=Eg1A
-----END PGP SIGNATURE-----

--Sig_/9s8Qt82ZjAaJfCmL6FL0aXx--
