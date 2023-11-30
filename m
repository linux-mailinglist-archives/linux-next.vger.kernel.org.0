Return-Path: <linux-next+bounces-167-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C087FFE5C
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 23:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8100BB20B15
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 22:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D8A5C3C4;
	Thu, 30 Nov 2023 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VMkiU1/+"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0020110DC;
	Thu, 30 Nov 2023 14:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701382380;
	bh=LxAjoxq0681WQkXf0rZHFfVRJcZv7Fy/N757wKutH1k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VMkiU1/+wsmtg9qXg39pxKjV6DMLjVU5gVEScKS43yDOJDl9WJ5cTqbmRGmo0tVRg
	 VECQMX+DLPiYrR961piYMvRn9uVXop2leaJH3+/X5iNeSwgp3RAx0I/UtSHJa57sOK
	 94isOmSB7tRVz4M8Cr4fmm3xJ8jWYtpCpDDo09vwlXR53dBA9Bfoy9dOeKLJe8whuk
	 BXg+Nk8ggwt2WaLT1Zt+jgu3oBGILmUwx3HBneEFhi1ppuK86IuJ7ED53QC/8Aa1Jd
	 MF1jSMgvUOk0wuIQCvQyxI26sjLRyPbIg+XNPcH/cBUDXx63tvGFLofVS8KoOZ0EWo
	 lcNKPGVNucrTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sh9Rw0NwMz4xW3;
	Fri,  1 Dec 2023 09:12:59 +1100 (AEDT)
Date: Fri, 1 Dec 2023 09:12:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20231201091257.02cb752f@canb.auug.org.au>
In-Reply-To: <20231129081704.f26fu3g2svnam7n5@CAB-WSD-L081021>
References: <20231129084547.79c27d63@canb.auug.org.au>
	<20231128144514.aa04099199dc13f52374e2b2@linux-foundation.org>
	<20231129081704.f26fu3g2svnam7n5@CAB-WSD-L081021>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UwtvgnCyWCO.XBbHbfHlb4_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UwtvgnCyWCO.XBbHbfHlb4_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Wed, 29 Nov 2023 11:17:04 +0300 Dmitry Rokosov <ddrokosov@salutedevices.=
com> wrote:
>
> On Tue, Nov 28, 2023 at 02:45:14PM -0800, Andrew Morton wrote:
> > On Wed, 29 Nov 2023 08:45:47 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> >  =20
> > > After merging the mm tree, today's linux-next build (x86_64 allmodcon=
fig)
> > > failed like this:
> > >=20
> > > make[5]: *** No rule to make target 'samples/cgroup/cgroup_event_list=
ener.c', needed by 'samples/cgroup/cgroup_event_listener'.  Stop.
> > >=20
> > > Caused by commit
> > >=20
> > >   fc2cf253aaec ("samples: introduce new samples subdir for cgroup")
> > >=20
> > > I have reverted that commit (and the following one) for today. =20
> >=20
> > Thanks, my rename detector broke.  Fixed. =20
>=20
> Sorry, I don't fully understand the situation. Is there any issue on my
> side?

No, Andrew was just saying that he missed the file move when applying
the patch to his tree and he has fixed it up now.
--=20
Cheers,
Stephen Rothwell

--Sig_/UwtvgnCyWCO.XBbHbfHlb4_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVpCOoACgkQAVBC80lX
0Gw9vQf+Jo89nL7Sn2LeMITGgzBnIiJQIlbYr9Y3lA8BTtq11TuTM3gGVKuJ8OLK
HzlP9fVTVz2whEe4rUKFZEUhVrTbTRddJT6gKA33JYpaf9uaN6uuHEd7tdPhHmP8
wI8E8eB56LyoOMJ8QvI0HcNPyDJYlo8a1rwbi96lFQISEC4qc+8Co4xylDu1FTBr
RBlpv2c2H9vQDGe/1a31M6Y3A8a4hNvkJbTPPAPsJmPwN+aC8WPm60ju8mSW6EgG
dVK2iqMllKQV0lKkjS/xfYjl1VvEupvjYx0PsB43c6kisGJ7LnO/Um1yupadQ65e
tfMPqZtKvye2kuv+Zag9DiAl5VIaLQ==
=1or6
-----END PGP SIGNATURE-----

--Sig_/UwtvgnCyWCO.XBbHbfHlb4_--

