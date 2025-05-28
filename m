Return-Path: <linux-next+bounces-6956-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D7AC61BA
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 08:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2D311BC0F50
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 06:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA16921577E;
	Wed, 28 May 2025 06:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cfNZ+ABh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3762F211A0E;
	Wed, 28 May 2025 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748412838; cv=none; b=P7oSRNFoknMc0a0gfXv/RBdSrlme0cBWLIKtFXpl4Gp8FO3pm3fxXloypXM5fub0JTwz76VdIlaLxXFoiV6QFSpSX3mbcVS/ff9U4rjCkpx+AREuMXvOScrKrZQlzD/agHDDLPSBEedUdwZxGkawlqNawUM8uIfakNXdSlS5h+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748412838; c=relaxed/simple;
	bh=eiT/vSc22rEGiAvVFZ5/ZWqinHH0e3XtVZ+udxaTsIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bR1khq8CNaOCRe6Agiq5fMu2D3dcUnd7jXxpFcIH0eC2a6nkX151ph0FPWAaQQMjsPy2wCtYiPG3GaWcpMzrYd4+lEYM/a/0ubegsMFqxu4y0o+3JC8R3Ptf389Bav2RqyvwLKS15cbTU7GFosmgh1FgZ+I1XR0Gds/M5YJ38/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cfNZ+ABh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748412827;
	bh=AifmlD6epwaraxjcxUJRxGnsd49Asu8Er1vCXQcUTVs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cfNZ+ABhXc53YvuOrV8s6xuFkbs26dgv/UxojMQSBtdcfkgdl4dF6EeJsPGMDFsZS
	 b1WyVHDeLSnqhZuyUHncTsZY2npJUWbqkzGg2gzGSsUSzhmuN8JvTsusQcj6sJ5klL
	 KyVvP6zCoXvfuV+d15KrgsLC7QMBt886kX5j1QThBuP4wkJ9OgmSaItXw933htYMSS
	 RZ4edILUd/QHqiNz6WRkWEaQzx38lxtvy7E9ONZOMoVEhBxaLnHbt0x3yaFU79nfo8
	 haf8cFR+p+P6F4791/+gd0GsmBEzKY2Xhg2y2giUcHi2Y3sTMZ/1M0sYrQANFPzk3D
	 HiylG6yLTSfCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6fMY1sm1z4wcg;
	Wed, 28 May 2025 16:13:45 +1000 (AEST)
Date: Wed, 28 May 2025 16:13:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Networking <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the net-next tree
Message-ID: <20250528161344.0533ae6b@canb.auug.org.au>
In-Reply-To: <20250507124900.4dad50d4@canb.auug.org.au>
References: <20250507124900.4dad50d4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o+MW=vr2532+4g+j=5kq6Tm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/o+MW=vr2532+4g+j=5kq6Tm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 7 May 2025 12:49:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c
>=20
> between commit:
>=20
>   a9843689e2de ("net: txgbe: add sriov function support")
>=20
> from the net-next tree and commit:
>=20
>   567b0a520912 ("net: Switch to irq_domain_create_*()")
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
>=20
> diff --cc drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c
> index 3b9e831cf0ef,f2c2bd257e39..000000000000
> --- a/drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c
> +++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c
> @@@ -198,9 -183,9 +198,9 @@@ int txgbe_setup_misc_irq(struct txgbe *
>   	if (wx->mac.type =3D=3D wx_mac_aml)
>   		goto skip_sp_irq;
>  =20
>  -	txgbe->misc.nirqs =3D 1;
>  +	txgbe->misc.nirqs =3D TXGBE_IRQ_MAX;
> - 	txgbe->misc.domain =3D irq_domain_add_simple(NULL, txgbe->misc.nirqs, =
0,
> - 						   &txgbe_misc_irq_domain_ops, txgbe);
> + 	txgbe->misc.domain =3D irq_domain_create_simple(NULL, txgbe->misc.nirq=
s, 0,
> + 						      &txgbe_misc_irq_domain_ops, txgbe);
>   	if (!txgbe->misc.domain)
>   		return -ENOMEM;
>  =20

This is now a conflict between the net-next tree and Linus' tree/

--=20
Cheers,
Stephen Rothwell

--Sig_/o+MW=vr2532+4g+j=5kq6Tm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2qZgACgkQAVBC80lX
0GwT7wf/fWQAj8OZZMVbej4HGWoEpYR1tA0t1tacM6TqEUm8ooLO0mCWNos1RlSq
OYcABZyMkEa+86zzL45PubNi+KKrAGQU2pphTVztZ12zYh18OcPgNWU8xasuL+TF
XSxrswGyAmPpN/YV+VJs3NNY5ALaPgd3gPkgUhXH3PAN21V027vZsrE5qCMCHz3D
zlXYd09X0tSVIej7BFUTJMCvNF+RxH2AtiGi+s//HgGqimfqiRI7iKzOESAfWlPF
w4VDOQGyLoOGJIcE1mpedhcYzbYGRHJ/T6UY4S/IC3oEF9Gt524oh0S2aHXcYxQA
4jyAx8u+NbG/A83VqPivI025yGBlLw==
=cjmD
-----END PGP SIGNATURE-----

--Sig_/o+MW=vr2532+4g+j=5kq6Tm--

