Return-Path: <linux-next+bounces-4760-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3669C51F2
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 10:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835B21F25523
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 09:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81F920D51A;
	Tue, 12 Nov 2024 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SHuwT8Is"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD0020D4E2;
	Tue, 12 Nov 2024 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403654; cv=none; b=kbPwjh7yyywHUknX7vi5OmOjElLWl/U112iZrsS4zFbP4HdqmBaPPwOFMGXxNxuzmpV4ZCDwBAmYCP8bCmofV5cGJwPEQnfq8yIQnX6LSp5i71bMb8yh/vPn6SqriXbYNJJUSuog/MxXVDkdthPQXxH7TquLp/4MLDc63WOVvSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403654; c=relaxed/simple;
	bh=EqnM+7FL0yn+HvbkRWyqN7c9diesHq9nhHxNr1Rx69s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6FXdPp2FA6NvY6D/heYGSlE+cRFvIxUPdS6KXqwIdo5wHzu8HYupAVWkQgRb4iNh1P7wevcDOcvFnROot5ndKVoqO0mJfQSpJosjcdNgJi1DL9BHentSANnOSFzS9PkNdSA6qrTXIIBiiQyxfFWULIdosc4bGayC3dm4xB9xLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SHuwT8Is; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kD9qEzfplfmLiXHQ9sBzJfK1Ug1PQoTYDFewlNPE1Qs=; b=SHuwT8IsjB29F93FDYiQv0VvCM
	HM8qHD9ZJtDj5nmaYzILLErRN2bRTR65KPh25w9HvVuovyZbG8bMan5ejEQbQlujqC85rxAJ8WBHm
	3mLJobw+XEw61SsnwUMi6NixXmLeQB9eZgv/17+s54XLy9f6pwdu6canvzHAlZ9eouYXvrWZJcumh
	F+kWXppPfanRrBr3+XA7Js0GKHLEcr6HaH5fl7Z0IoniFdP4VA1PLtR//uF6kXhXgpHd0FBsCnl6z
	tdsLpMj7zAN9K1tIEtJ5Eh4XavI4GanD/9iFzIKdiv/YGwWkFLA7g20oZmS3s/86fajt0pu7IhZxI
	yEeucr+g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnB5-0000000D2Wo-3DG9;
	Tue, 12 Nov 2024 09:27:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1B610300478; Tue, 12 Nov 2024 10:27:15 +0100 (CET)
Date: Tue, 12 Nov 2024 10:27:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rong Xu <xur@google.com>
Subject: Re: linux-next: manual merge of the tip tree with the kbuild tree
Message-ID: <20241112092715.GM22801@noisy.programming.kicks-ass.net>
References: <20241112130136.52ffc457@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sPYZrYCvCExDYJF4"
Content-Disposition: inline
In-Reply-To: <20241112130136.52ffc457@canb.auug.org.au>


--sPYZrYCvCExDYJF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 01:01:36PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   tools/objtool/check.c
>=20
> between commits:
>=20
>   315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
>   0dcc2d106615 ("kbuild: Add Propeller configuration for kernel build")
>=20
> from the kbuild tree and commit:
>=20
>   d5173f753750 ("objtool: Exclude __tracepoints data from ENDBR checks")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc tools/objtool/check.c
> index 05a0fb4a3d1a,f7586f82b967..000000000000
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@@ -4557,8 -4573,7 +4573,9 @@@ static int validate_ibt(struct objtool_
>   		    !strcmp(sec->name, "__jump_table")			||
>   		    !strcmp(sec->name, "__mcount_loc")			||
>   		    !strcmp(sec->name, ".kcfi_traps")			||
>  +		    !strcmp(sec->name, ".llvm.call-graph-profile")	||
>  +		    !strcmp(sec->name, ".llvm_bb_addr_map")		||
> + 		    !strcmp(sec->name, "__tracepoints")			||
>   		    strstr(sec->name, "__patchable_function_entries"))
>   			continue;


Yeah, that is the correct resolution. Thanks!


--sPYZrYCvCExDYJF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmczH2gACgkQdkfhpEvA
5LpSIBAAmE9tyicFcJvOok3WwJCW8CBqWZzqUWhoTIVynrAeLiPCxCc4pCxTt8mu
RFBCVCCeybUv0PZH/+aqM3vHjmVg2tC8zKW+rE7i92ckY22s2oslIQvf4SCqIB1f
Ewjsh1ykyVoenU9/3iyN/DId7lpg6ZgbvFv0/sJJhV9MqXuHBfMyyg3bPkMgP+/y
+6jrYWya3HyMzL2H29Cb7ySG7EdT2/+wImtNPWCjxVcgjRAHmysa7Q3MbCm3IaR7
V0p1lf9mNAdqos3OlJScrzIKdZO5AsNY6uCckism+eLLWfIgnMJbUTwd4Onj0ZD7
WaJTuQJVg4CKK6nCrtPza31LVS4zhivVvRkJTApUAlUeh8x4CPqAlccDaE/BSBD+
rlY1BgSJcmpmyAamINwzOIiEpWm1qiE96AA63to5Nrz43UaM7sjsro9qWZk60Fu+
udZpPPrOOuubtfoHTLGD8tlTOzihaFd0b0aBqcrOpNbsSjA133mvZ1P0qJrn6DYF
Aa5gBayaZt0+0YohlNCTkiboReeSblKu2ufg8+INQHCVMhGu2QCaH6En5H9NANRE
BPDW0WU+TcoeavhX6rqMdEGj0KcYMKawNaFSO18bFbsoBKUuIgxWroGy4Q0x7f/X
lw76ls1569+e5rIBjZvuLjpHxIrKYqeKGutK2NiAm/2lSu2poj0=
=jI/I
-----END PGP SIGNATURE-----

--sPYZrYCvCExDYJF4--

