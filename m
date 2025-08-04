Return-Path: <linux-next+bounces-7840-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37CB19CFA
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 09:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AEE91887024
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 07:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F03236430;
	Mon,  4 Aug 2025 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5Iq0w/8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78D8231849;
	Mon,  4 Aug 2025 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754293987; cv=none; b=Jmy0nHNoZ2wgSJdbfSbUht5+SOByNpaS/mg2etOuDfXzDlxh0zbRu0llf+krDd5DtaPod7b4i4NoqaJV4L3HMRaWyNwmq/sQWTJxVnME4Q+EpRno3m4k/6raB9RQRIOcv88U30mPfeyf2lJz/XbSjItMltB3MYV9GXpxTB/p584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754293987; c=relaxed/simple;
	bh=p409egi6kq0D9DCqotfJK0S8tUxF4vd2nF5rRbpBtj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRAWbx3RrUgSxG5svts5h5tg+yi91erY+Rw8vOpZ+Q09FDTCzdFu2H4NlzvPbFYTj5UPPcWTUOwaVOGwd8kIYWdMaBk6xSL/g1zWjO9K0RVMyAJBvb7HDzpsQyokkksXUiJNv6ABUnRglFxMHHGf+VZtFT8dTYDe1HPVz+bklNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5Iq0w/8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0761C4CEF0;
	Mon,  4 Aug 2025 07:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754293987;
	bh=p409egi6kq0D9DCqotfJK0S8tUxF4vd2nF5rRbpBtj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5Iq0w/8IgNOUE64gp+aZh1wyrlIgK5OrvkxLwR2JPRrs0eaj9oeY7zf0uxhoTDdW
	 icaAgQ6q0/JXwctguP5uau/dnNHSEge2aOfYtko0XG6/H3EMCSZZSKA97bLOdQ6zNn
	 oy4c8CGZyyIpNxMahPqIsRNizf4WF9eAS0YREe4nxitIOwEoeQ4BNVDjuLxNboRpVT
	 b02ocngq+Ag5ub9Pi2+zI2W8K6YVGKUcluuPGXc1xIUzGSttgvppn4w05RDg08nOwK
	 e5gwLKUOGiWrQ1m6KlF0SKAZWoILmmvoePP52Ex84AJ5gFEbyJI84oSOsHdflIRnLO
	 P8hW+pKHT+KMw==
Date: Mon, 4 Aug 2025 09:53:02 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <6ir4rtzbnnsl325hgo7xvdj6jcqd6yw3zgppjvmsvakpxiejhc@xkkuiquipkvc>
References: <20250708190003.4eabc8ab@canb.auug.org.au>
 <20250731110521.0cf9d6a2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jqhjfux4v4t4nrtq"
Content-Disposition: inline
In-Reply-To: <20250731110521.0cf9d6a2@canb.auug.org.au>


--jqhjfux4v4t4nrtq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 11:05:21AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Tue, 8 Jul 2025 19:00:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the sysctl tree got a conflict in:
> >=20
> >   kernel/panic.c
=2E..
> >   static const struct ctl_table kern_panic_table[] =3D {
> >   #ifdef CONFIG_SMP
> >   	{
> > @@@ -134,13 -183,16 +183,23 @@@
> >   		.mode           =3D 0644,
> >   		.proc_handler   =3D proc_douintvec,
> >   	},
> >  +	{
> >  +		.procname	=3D "panic_sys_info",
> >  +		.data		=3D &panic_print,
> >  +		.maxlen         =3D sizeof(panic_print),
> >  +		.mode		=3D 0644,
> >  +		.proc_handler	=3D sysctl_sys_info_handler,
> >  +	},
> > + #if (defined(CONFIG_X86_32) || defined(CONFIG_PARISC)) && \
> > + 	defined(CONFIG_DEBUG_STACKOVERFLOW)
> > + 	{
> > + 		.procname	=3D "panic_on_stackoverflow",
> > + 		.data		=3D &sysctl_panic_on_stackoverflow,
> > + 		.maxlen		=3D sizeof(int),
> > + 		.mode		=3D 0644,
> > + 		.proc_handler	=3D proc_dointvec,
> > + 	},
> > + #endif
> >   };
> >  =20
> >   static __init int kernel_panic_sysctls_init(void)
>=20
> This is now a conflict between the mm-nonmm-stable tree and Linus' tree.
Makes sense, as the sysctl PR was merged at the end of July. From the
point of view of sysctl, it should be handled in the same way as
expressed in this thread. Feel free to e-mail me if you need further
sysctl input on how to handle it.

Best

--=20

Joel Granados

--jqhjfux4v4t4nrtq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmiQZt0ACgkQupfNUreW
QU/TTwv9FQGDLD35tgwmFlS7e0bzcSVBfE8EaP05utm+tm7rIiVvhSHrGj5AquWh
K4hwblFcSwXjV5mg16/qqY2BFdFTFL7onZhtGwjo61SjzcEVtYgAxYB2EMZXjNsA
Z2w+lHm7In9octrs2rL1MF7a6dx9Qc173xCa+va6y9Xm4LcZeiZwMNA1ivxbIGmr
ySp99TlICVw/X8lXcFTrA+38dY8n3AYEfFt/wyg4VZjKgMeZvrTbem3aJEWT5+PA
df7X2Gu4K7MRs5Em0kHQ+mPjIJrL5D7+orvcNb8iwbyNu2F1gJ0MmzNpegFJhm1q
9yOCMC0QmLqkaE+OfzRe05EgTEBnl+TK7Da7Badiyz0W6oS0cYmwXW6jtAFvoohq
IKy0xdNUC1hl0R578W0in6QyFZG44DD1DgSAlriY5hVkNbQ5mT21PMJnonhjomRd
cfgUFalNLLq7Uw6a6mdxElnFfanmgBjLR7icYcSQtJTYq8i1cDieN5p5SK7LrFst
N1NFx6IE
=px0b
-----END PGP SIGNATURE-----

--jqhjfux4v4t4nrtq--

