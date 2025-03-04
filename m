Return-Path: <linux-next+bounces-5633-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D404DA4D49B
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 08:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C8563AA591
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 07:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C251F76C0;
	Tue,  4 Mar 2025 07:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tmGYOlCJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F831F875B;
	Tue,  4 Mar 2025 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741072328; cv=none; b=Fl+BkyMCmxlnjqSN1+GQDe4YxG4J0dX5a9m4Bc8SZcHj8pNcskL1i/JBQJSSW2x9vcdkD0SUh+iw1oS8xSlRHpH1WZeaHjvz/3UQlC2vPiFad5OdEuTx9L+Cc18Mppg/1Q0eo4adCyiuZ/4R85cSToIziaXsj0jY6+meHqfpKFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741072328; c=relaxed/simple;
	bh=YpNyS+L+ebZaeL7cCRbUQtmpf7B/6++gtuflX+VXkPs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SOLh7/7SFYz5/HkCw4Aq82LF1qFzz1Jt/4L8WZz1QhF/Go7A4kxJcs5eJo2mWGYiFa/AF93l6PYA/pzy2e5eCaimU5VZ6ASZbkfjrd1/Wc8Qhrh4APwYNu0NLBg5InGITU/FwpJ/ffFXCxdAE8QSkCpnaZq+P03tnGabX/mN45U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tmGYOlCJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741072316;
	bh=s8VxkbU7o5vZ0fVz0uOKfgT2wrEWILjGmllok9tcCes=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tmGYOlCJ9n1c6FTtQOWBKBPc6mZLhZSL4Sl3rHBKebFo+4VFYYB1kQ12K1h45rB+p
	 fWD2Ff1LAG5D3tk3nNUWJ909bE2XPa2UvM0LOVXBxb4eNYqjbnH2nas3gymQgSBnoi
	 GdEfQI7Q3C1Vxpsst9QRbyN6YqfnzWZXzxAEL83UWAWKADXgBCcAW5dZOrGTtZSOEr
	 wdYqEMEWJU9O1kfdiZNPbTe0W8VTwA+Pin+nWk4zPkgGfJegCQ3c2cinR+cSuYfEpD
	 gu9u6pAokQyeQdEu0S020lmhMfXrH+JsumtoKBod1/nHcsdh1Vl7+/XXAagy3T/FP9
	 S47cOC9uHBVDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z6Rgs5Cq8z4wgp;
	Tue,  4 Mar 2025 18:11:53 +1100 (AEDT)
Date: Tue, 4 Mar 2025 18:11:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche
 <bvanassche@acm.org>, John Garry <john.g.garry@oracle.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the tip tree
Message-ID: <20250304181132.3e779c4b@canb.auug.org.au>
In-Reply-To: <20250225153200.00773d86@canb.auug.org.au>
References: <20250225153200.00773d86@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vl2WmDm8fXNy6S2Lypogz+N";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Vl2WmDm8fXNy6S2Lypogz+N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 25 Feb 2025 15:32:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>=20
>   drivers/scsi/scsi_debug.c
>=20
> between commit:
>=20
>   b7011929380d ("scsi: Switch to use hrtimer_setup()")
>=20
> from the tip tree and commit:
>=20
>   b441eafbd1eb ("scsi: scsi_debug: Simplify command handling")
>=20
> from the scsi-mkp tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/scsi/scsi_debug.c
> index fe5c30bb2639,2208dcba346e..000000000000
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@@ -8701,8 -9351,12 +9351,13 @@@ err_out
>   static int sdebug_init_cmd_priv(struct Scsi_Host *shost, struct scsi_cm=
nd *cmd)
>   {
>   	struct sdebug_scsi_cmd *sdsc =3D scsi_cmd_priv(cmd);
> + 	struct sdebug_defer *sd_dp =3D &sdsc->sd_dp;
>  =20
>   	spin_lock_init(&sdsc->lock);
>  -	hrtimer_init(&sd_dp->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
> ++	hrtimer_setup(&sd_dp->hrt, sdebug_q_cmd_hrt_complete, CLOCK_MONOTONIC,
> ++		      HRTIMER_MODE_REL_PINNED);
> + 	sd_dp->hrt.function =3D sdebug_q_cmd_hrt_complete;
> + 	INIT_WORK(&sd_dp->ew.work, sdebug_q_cmd_wq_complete);
>  =20
>   	return 0;
>   }

This is now a conflict between the scsi tree and the tip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Vl2WmDm8fXNy6S2Lypogz+N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfGp6UACgkQAVBC80lX
0GxD7gf/SrZPz02xtkwLy4s2PWkqnNER5eFYSKcT8ULThB0j5uPWqE6PEDEdsaaV
/pI1h3xZ9Lg7sl9TvXq9dRzJ4+PcsMBcRWKy3fTQNZxx9PXQ7vvifkhJpZx7UH/E
uev34+FWY+yy7UhGHGW6t88sSOCSu/TLnKhwdpXsIpNXVm2I7VHmEc5clejp6zMe
5XhiBGzwxYUXJzBqByW5iLcaQAR5XQOoWa3IzsUrJNPBMwUDddrac7UdFilqxrtr
ZMh1RBw/E7Au+N33cUe8zoFVC2p6N7vRSFJDlPEl+Q/V4tVwg/Z6C2whtZ0eCpP0
zjNA7g6DMVNrfXEBi0wZtCsFyD+m7g==
=GUfP
-----END PGP SIGNATURE-----

--Sig_/Vl2WmDm8fXNy6S2Lypogz+N--

