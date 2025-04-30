Return-Path: <linux-next+bounces-6464-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7234AA4944
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 12:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97FAB98040F
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 10:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0EB2343CF;
	Wed, 30 Apr 2025 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IQMq9WfL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5AA23506F;
	Wed, 30 Apr 2025 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010510; cv=none; b=ngGsHthm3ZTQbUL/BIq2Jr70S7NgPSelMdh9UIp1svGJQNzIth4mPtmjxMEEU0Ka7/1gQc8clOAIe7H7bjIQlHY8CPo+98j9X2ufUZrpXGIiXQQbhuoklxTdybA/sfYFZRryj9OPvirLA7HOcBSuRXXkJxSKvKZ+VC0hWLvFLTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010510; c=relaxed/simple;
	bh=zxME15EebRVsIvX/fz64swPwb6igKI40zmDzxT7+w3c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCEq8bLaA4afgt0iiZIspKhrqbbZ/l24ke9U6gIfJqRbH+pPaHcUnKpRD0TNGqRKHoIeeDSPaofVCU917JFdMJzJi3BQJuFDjlrwW61iqvJbxoFYhgDGSl5amZjVp4TE1HhmeuY3YAIIFxqL3t3FxT6m/CfWdORozw4pvVTIIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IQMq9WfL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746010504;
	bh=0MBspg0Ro0uJeWy92hfImYAIv5ZNp9nMlurNTZPV5WI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IQMq9WfLLQ+aJ/iOEg9mmzEpGR7QOxmjjTF/BaSuesZ34tbXXYpE35eKbVQAXeq56
	 GLmXoswRDPKb60ICcPKkAw1q5YhhA0NXIBzSaEfcVxowbVhHgTWBJRvOHE9hUGI7rP
	 XM+hMoMKTebDqlO0E0+JI8ayTLzKPwymVsVdcH5ZM6JxVuweQmrxBd/1moucplo+JA
	 NAioDmeeIPUnhUXw7K75VTdAl3763OUzvm/LwJYx/CrmlxM4bz3f+GJjKyxRn3xiy9
	 MCHrpvWBLLieUF9SVfPjTQKmRVJYhqX1KsOZgOAva3c/TKgMMNeBRsNGL4NvjY7rsG
	 CBdMWXAXFq/rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnYx367GVz4x8W;
	Wed, 30 Apr 2025 20:55:03 +1000 (AEST)
Date: Wed, 30 Apr 2025 20:55:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: luogengkun@huaweicloud.com, Andrew Morton <akpm@linux-foundation.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, dianders@chromium.org,
 joel.granados@kernel.org, song@kernel.org, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [linux-next]Build Failure: kernel/watchdog.c:936:2: error: too
 many arguments
Message-ID: <20250430205503.4a316f48@canb.auug.org.au>
In-Reply-To: <562a79d1-e8a4-4d8f-a576-47c017aadf93@linux.ibm.com>
References: <339e2b3e-c7ee-418f-a84c-9c6360dc570b@linux.ibm.com>
	<20250428084117.31215b8c@canb.auug.org.au>
	<33aabaae-5789-4b67-bd06-06b79d03ea38@linux.ibm.com>
	<562a79d1-e8a4-4d8f-a576-47c017aadf93@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AozVZ7CvelvBtRXQa7Sc_o5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AozVZ7CvelvBtRXQa7Sc_o5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Venkat,

On Wed, 30 Apr 2025 11:57:12 +0530 Venkat Rao Bagalkote <venkat88@linux.ibm=
.com> wrote:
>
> On 28/04/25 3:11 pm, Venkat Rao Bagalkote wrote:
> >
> > On 28/04/25 4:11 am, Stephen Rothwell wrote: =20
> >>
> >> On Sat, 26 Apr 2025 20:39:26 +0530 Venkat Rao Bagalkote >> <venkat88@l=
inux.ibm.com> wrote: =20
> >>> I am observing below build failure on IBM Power8 server with >>> linu=
x-next-20250424 repo.
> >>>
> >>> This issue seems to be introduced by the below commit. After >>> reve=
rting the below commit, kernel build is successful.
> >>>
> >>> Bad Commit: 6b07f9a0fa41 watchdog: fix watchdog may detect false >>> =
positive of softlockup
> >>>
> >>> Note: To hit this issue, one should first resolve this [1] >>> <https=
://lore.kernel.org/all/e8bf676e-7bf0-4896-b104-ac75e1b22d2e@linux.ibm.com/>
> >>>
> >>> Repo: >>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git
> >>> Branch: master
> >>> GCC: 8.5.0 20210514
> >>> ldd (GNU libc) 2.28
> >>>
> >>> Attached is the .config file.
> >>>
> >>> Errors:
> >>>
> >>> kernel/watchdog.c: In function 'lockup_detector_reconfigure':
> >>> kernel/watchdog.c:936:2: error: too many arguments to function >>> '_=
_lockup_detector_reconfigure'
> >>> =C2=A0 =C2=A0 __lockup_detector_reconfigure(false);
> >>> =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> kernel/watchdog.c:926:13: note: declared here
> >>> =C2=A0 =C2=A0static void __lockup_detector_reconfigure(void)
> >>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> kernel/watchdog.c: In function 'lockup_detector_setup':
> >>> kernel/watchdog.c:940:2: error: too many arguments to function >>> '_=
_lockup_detector_reconfigure'
> >>> =C2=A0 =C2=A0 __lockup_detector_reconfigure(false);
> >>> =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> kernel/watchdog.c:926:13: note: declared here
> >>> =C2=A0 =C2=A0static void __lockup_detector_reconfigure(void)
> >>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> kernel/watchdog.c: In function 'proc_watchdog_update':
> >>> kernel/watchdog.c:962:2: error: too many arguments to function >>> '_=
_lockup_detector_reconfigure'
> >>> =C2=A0 =C2=A0 __lockup_detector_reconfigure(thresh_changed);
> >>> =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> kernel/watchdog.c:926:13: note: declared here
> >>> =C2=A0 =C2=A0static void __lockup_detector_reconfigure(void)
> >>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>
> >>> If you happen to fix this, please add below tag.
> >>>
> >>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com> =20
> >> Yeah, the CONFIG_SOFTLOCKUP_DETECTOR unset version of
> >> __lockup_detector_reconfigure() was not updated :-( =20
> > =20
>=20
> Hello Stephen,
>=20
>=20
> Will this be fixed, or from now on we will have to set the SOFTLOCKUP_DET=
ECTOR always in the .config file.
>=20
>=20
> Trying to understand the way forward.

Yeah, it is still not fixed today :-(  hopefully soon.

This is caused by commit

  4ab274088f03 ("watchdog: fix watchdog may detect false positive of softlo=
ckup")

in the mm-nonmm-unstable tree.  I have reverted it today.

--=20
Cheers,
Stephen Rothwell

--Sig_/AozVZ7CvelvBtRXQa7Sc_o5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgSAYcACgkQAVBC80lX
0GyMJQf/a2ML4aSxdL3xgsweb58kulLB2+PpoWlAvezJiNw7yZBa5Uwd1ucVY+k1
GTAJPNeOnkJ/RPCNXm6fdTDnwKOZ12B46kEIR0W1K63kqAcpXCDZUaxB3tDMw8m9
/66QFt/njcmuk70d1pAm2IlgMWCr8aWasZEdXUv53zTLD0yd+MCf9GPHMAdyz45P
6cKTaqxgK0+1QGye2aoRICxcUfsCmRVKur31idDVu2g+qhKFwcChGajC/v/meQFg
pnnhrvhbHAwRGHqf1ApeMYhvrgRIq4PSahtF+fxvZrOz/4rvyogE0JxT61MQ+9jA
+9uCiecyrRRvReQJQH3BvIc99eSYzA==
=5OVw
-----END PGP SIGNATURE-----

--Sig_/AozVZ7CvelvBtRXQa7Sc_o5--

