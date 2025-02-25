Return-Path: <linux-next+bounces-5569-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C39E1A44F50
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 22:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17FB57A7ABF
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 21:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041FA20D4FD;
	Tue, 25 Feb 2025 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hfal9T5n"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF5198A32;
	Tue, 25 Feb 2025 21:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740520507; cv=none; b=TgahALl+NR6UTmWcpQ/owNTX0qLbcysIkCRShBvVdUpbespv+eM64q42SHNA1rCnDW9OSMG+W76+6+EufRV73wxk0LlV4RIi1Dsn8VbBOzDEE85MbMNjDKeZp4XDySDn6Doi/ZdnAp5CsoZfIEV/Wt3ggAGRENdUqckguWlRjso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740520507; c=relaxed/simple;
	bh=KOaUpuobEYJa6FPJI2WuExOdYmMlPWWncrQ/Jha0ucE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EinIHlvaJC13/EOVDYoiFf1ZMMe5GofuBeUSQvAoL4wagQbbsqRjcfBnLZqChCKctxyHzyY88X12fLywWcUg0FF8pSMnck7w2V/opqBPli7RuQHJz6w12Pq8GP7eD55gsHoVMZzR7TvcPZUQNp0Y3TwNxGAMbAHUJmyQzE1kNRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hfal9T5n; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740520500;
	bh=fA2zsdMbwAeLI5ZvHBc6b5RYSJ2cOjYBLDyph7IPDWg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hfal9T5nxHSpS8X9tO5ZiAmNoUUuFGQ8AAMSS2F7IeA9DBMPFRCO/0uietMMVC/sG
	 0kN3NJPX9gKk5MArO1/1e7c8BX8rBqemRu1BzzTOlAhCn81bsziZENz1cp0/jL00RO
	 yHD3wUcEaKe+VfFBJiWThw5qdd111i0ax4FFdrRI7WikwJPL8rxIeJJxGEPYi5Zszt
	 AYOqaJA8TQQSbB0+32LtVCm447tW8D+Onw1QsSBK2QW370z6TEaXn5q5BIz4Rj4llz
	 xLdC+cdkK7p9ioZOffYsu8JjexRc8fIH8gKPSW9hpTnqq6tkPZvmN7nSnHffcJizyp
	 eqEBGxNo5SUfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z2Wc30dVSz4x04;
	Wed, 26 Feb 2025 08:54:59 +1100 (AEDT)
Date: Wed, 26 Feb 2025 08:54:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Garry <john.g.garry@oracle.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Bart Van
 Assche <bvanassche@acm.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the tip tree
Message-ID: <20250226085435.50a140ab@canb.auug.org.au>
In-Reply-To: <87h64hg6r7.ffs@tglx>
References: <20250225153200.00773d86@canb.auug.org.au>
	<a902ea86-132a-4b64-8710-575a798f1a18@oracle.com>
	<87h64hg6r7.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=JQ4+YJ7Dc8tjQ+W8HjhzNz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=JQ4+YJ7Dc8tjQ+W8HjhzNz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 25 Feb 2025 20:32:28 +0100 Thomas Gleixner <tglx@linutronix.de> wro=
te:
>
> On Tue, Feb 25 2025 at 09:38, John Garry wrote:
> >
> > static int sdebug_init_cmd_priv(struct Scsi_Host *shost, struct=20
> > scsi_cmnd *cmd)
> > {
> > 	struct sdebug_scsi_cmd *sdsc =3D scsi_cmd_priv(cmd);
> > 	struct sdebug_defer *sd_dp =3D &sdsc->sd_dp;
> >
> > 	spin_lock_init(&sdsc->lock);
> > 	hrtimer_setup(&sd_dp->hrt, sdebug_q_cmd_hrt_complete, CLOCK_MONOTONIC,
> > 		      HRTIMER_MODE_REL_PINNED);
> > 	sd_dp->hrt.function =3D sdebug_q_cmd_hrt_complete; ***
> > 	INIT_WORK(&sd_dp->ew.work, sdebug_q_cmd_wq_complete);
> >
> >
> > I guess that setting sd_dp->hrt.function explicitly, at *** above, is=20
> > not needed (as hrtimer_setup()) does this. =20
>=20
> Correct. hrtimer_setup is enough.

Thanks, I have updated my merge resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/=JQ4+YJ7Dc8tjQ+W8HjhzNz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme+PBwACgkQAVBC80lX
0GxDEQf+OIs7m12CrjF4Vp27eyc5zzcnhB3TpqslahusUaCwJyQX9ewMzpdOpCa0
vg8H0i+4gs3HrJVOUKh41zpUr3SiqAOmfEbAlAPY/SRopulNzbhq2+25qfTmXmwf
Lg2495AkLwmz45V5Edh5yAHWyGHERIayh06rO9VA7XFqMERrWfufcolQPlIQKAVV
+ubycHFztIlEx96fjcN04nTR9T45o+MlDa8SXeLGf5/L1GBWcpKFncxffECfoXms
GkOO+BPyxrmpQYoxr+xlXQgdiOMa3iPfA1/wSrSECKYDrJQEM0wbSUhaFmLkNrwY
ZOgY5jSRUmlhnleEk/Ex6I3K5ApdQA==
=v6/I
-----END PGP SIGNATURE-----

--Sig_/=JQ4+YJ7Dc8tjQ+W8HjhzNz--

