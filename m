Return-Path: <linux-next+bounces-4266-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4699DDC0
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 07:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DC8BB21D00
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 05:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08F2176FB6;
	Tue, 15 Oct 2024 05:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MOhm1N+z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD2178362;
	Tue, 15 Oct 2024 05:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728971745; cv=none; b=sSfzwO40zyUfdWaXimENS2Ww/JLfvn+12a5UGk78XiyHqyH143nLjUxbrTXFAmxwzdiYG0k8kDD7ZCRO2TJRwruVfHNXjjHxCZmK9mo0z+N976rRx4VR0EhlCRskhKGPs1cOdjPt+g/C4QMboUdZ5Itowz3l2zZmOa7eEuakobQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728971745; c=relaxed/simple;
	bh=lBmtohuTDPWE90XRl0KZpe9ndEb6usdKtqvk3d6xLQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z8NyqgowHqdRFGys5+i0Imk9TrPzs9bTQtIb/KzcRoiHkLGSOz4fe9XeO1Lcn0iiujjzYPR8W41FHih5ZVjrDzDsbXQmW5kz8Tw1li7MvKO5U4yRAZnKsxCM4z0OTxkIjxHUxWx8SArFj7K8Y5txvIaejOsnQepmLZbKnpnzAEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MOhm1N+z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728971738;
	bh=s+8/iAcFNKvwtQu4NVYqQmv9auEE6mJ7XmXb0R+e2yo=;
	h=Date:From:To:Cc:Subject:From;
	b=MOhm1N+z3HIZ6/eHgXzzwB8f7luNK9U6Hd3El+tPK9crRV1QAD2iOo6iJLZVqx07B
	 oW1rwwVhQDydt5dY2pl264UF2DA7g0/NBy3TsxbFt/Kxn/DMTsNHE4rUvIbpF3QQmP
	 wJ1MUcNSEe/fd9NFDFxk/7LpDQDRQ+/KmGGDLwPBfDQI1xQ3oUrUwNiV2xflOHtGbn
	 k2OxLfPRDbDOGSXnNvGdZiGLSVFM72rloh6zQ5WA9COCtg14YiqeOxjPGFpu7Yio1k
	 AXF05muu7iuidmpyoYomgAjheDzMqiNz4hPmkEBWV9JhKTSbaTwcWT3SCq3xyqCYmW
	 10XwI7L9M8TRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSNcV3lNgz4wb7;
	Tue, 15 Oct 2024 16:55:38 +1100 (AEDT)
Date: Tue, 15 Oct 2024 16:55:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Dave Penkler <dpenkler@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the staging tree
Message-ID: <20241015165538.634707e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RHhcJ_.P=z/kWD5EKO.7Z1a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RHhcJ_.P=z/kWD5EKO.7Z1a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: warning: discarding dynamic section .glink
ld: warning: discarding dynamic section .plt
ld: linkage table error against `nec7210_board_online'
ld: stubs don't match calculated size
ld: can not build stubs: bad value
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_t1_dela=
y':
fmh_gpib.c:(.text+0x5e8): undefined reference to `nec7210_t1_delay'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_serial_=
poll_status':
fmh_gpib.c:(.text+0x70c): undefined reference to `nec7210_serial_poll_statu=
s'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_seconda=
ry_address':
fmh_gpib.c:(.text+0x7e4): undefined reference to `nec7210_secondary_address'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_primary=
_address':
fmh_gpib.c:(.text+0x898): undefined reference to `nec7210_primary_address'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_update_=
status':
fmh_gpib.c:(.text+0x958): undefined reference to `nec7210_update_status'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_paralle=
l_poll_response':
fmh_gpib.c:(.text+0xa18): undefined reference to `nec7210_parallel_poll_res=
ponse'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_paralle=
l_poll':
fmh_gpib.c:(.text+0xad8): undefined reference to `nec7210_parallel_poll'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_paralle=
l_poll_configure':
fmh_gpib.c:(.text+0xb98): undefined reference to `nec7210_parallel_poll_con=
figure'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_disable=
_eos':
fmh_gpib.c:(.text+0xc4c): undefined reference to `nec7210_disable_eos'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_enable_=
eos':
fmh_gpib.c:(.text+0xce4): undefined reference to `nec7210_enable_eos'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_remote_=
enable':
fmh_gpib.c:(.text+0xd98): undefined reference to `nec7210_remote_enable'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_interfa=
ce_clear':
fmh_gpib.c:(.text+0xe58): undefined reference to `nec7210_interface_clear'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_request=
_system_control':
fmh_gpib.c:(.text+0xf18): undefined reference to `nec7210_request_system_co=
ntrol'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_go_to_s=
tandby':
fmh_gpib.c:(.text+0xfcc): undefined reference to `nec7210_go_to_standby'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_take_co=
ntrol':
fmh_gpib.c:(.text+0x1098): undefined reference to `nec7210_take_control'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_command=
':
fmh_gpib.c:(.text+0x1170): undefined reference to `nec7210_command'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_write':
fmh_gpib.c:(.text+0x123c): undefined reference to `nec7210_write'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_read':
fmh_gpib.c:(.text+0x133c): undefined reference to `nec7210_read'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_device_=
match':
fmh_gpib.c:(.text+0x15d0): undefined reference to `gpib_match_device_path'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init.is=
ra.0':
fmh_gpib.c:(.text+0x3164): undefined reference to `nec7210_board_reset'
ld: fmh_gpib.c:(.text+0x31a4): undefined reference to `nec7210_set_handshak=
e_mode'
ld: fmh_gpib.c:(.text+0x335c): undefined reference to `nec7210_board_online'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_att=
ach_impl':
fmh_gpib.c:(.text+0x35a0): undefined reference to `gpib_pci_get_device'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_pci_det=
ach':
fmh_gpib.c:(.text+0x5018): undefined reference to `nec7210_board_reset'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_detach':
fmh_gpib.c:(.text+0x5508): undefined reference to `nec7210_board_reset'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_re=
ad_countable':
fmh_gpib.c:(.text+0x6168): undefined reference to `nec7210_set_reg_bits'
ld: fmh_gpib.c:(.text+0x6180): undefined reference to `nec7210_set_reg_bits'
ld: fmh_gpib.c:(.text+0x6634): undefined reference to `nec7210_set_reg_bits'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_wr=
ite_countable':
fmh_gpib.c:(.text+0x6f1c): undefined reference to `nec7210_set_reg_bits'
ld: fmh_gpib.c:(.text+0x6f34): undefined reference to `nec7210_set_reg_bits'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:fmh_gpib.c:(.text+0x6f98): mor=
e undefined references to `nec7210_set_reg_bits' follow
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_interna=
l_interrupt':
fmh_gpib.c:(.text+0x80a4): undefined reference to `push_gpib_event'
ld: fmh_gpib.c:(.text+0x80c4): undefined reference to `nec7210_interrupt_ha=
ve_status'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_cal=
lback':
fmh_gpib.c:(.text+0x887c): undefined reference to `nec7210_set_reg_bits'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_fifo_re=
ad':
fmh_gpib.c:(.text+0x8a84): undefined reference to `nec7210_set_reg_bits'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_dma_wri=
te':
fmh_gpib.c:(.text+0x95d8): undefined reference to `nec7210_set_reg_bits'
ld: fmh_gpib.c:(.text+0x95f0): undefined reference to `nec7210_set_reg_bits'
ld: fmh_gpib.c:(.text+0x9a88): undefined reference to `nec7210_set_reg_bits'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o:fmh_gpib.c:(.text+0xac38): mor=
e undefined references to `nec7210_set_reg_bits' follow
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_exit_mo=
dule':
fmh_gpib.c:(.exit.text+0x38): undefined reference to `gpib_unregister_drive=
r'
ld: fmh_gpib.c:(.exit.text+0x44): undefined reference to `gpib_unregister_d=
river'
ld: fmh_gpib.c:(.exit.text+0x50): undefined reference to `gpib_unregister_d=
river'
ld: fmh_gpib.c:(.exit.text+0x5c): undefined reference to `gpib_unregister_d=
river'
ld: drivers/staging/gpib/fmh_gpib/fmh_gpib.o: in function `fmh_gpib_init_mo=
dule':
fmh_gpib.c:(.init.text+0x100): undefined reference to `gpib_register_driver'
ld: fmh_gpib.c:(.init.text+0x110): undefined reference to `gpib_register_dr=
iver'
ld: fmh_gpib.c:(.init.text+0x120): undefined reference to `gpib_register_dr=
iver'
ld: fmh_gpib.c:(.init.text+0x130): undefined reference to `gpib_register_dr=
iver'

Caused by commit

  8e4841a0888c ("staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver")

I have marked that driver as BROKEN for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/RHhcJ_.P=z/kWD5EKO.7Z1a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcOA9oACgkQAVBC80lX
0GxwIQf/YlYnm+uL9UoKmExQbFhfpwPr1zGN/QwhWgdmGtbVJXgjun1Nzs7EfolR
f5qzLvFPOri+iB9114VsSzx5y3Gxl6EYofJVdp5hgC1qmXZZ+B6y5RDRdgtuHd4p
mzKz5ZYGKa6HUKuadC+CkGcHRMNn1UhKmCUHNn5HULkph22y85OxwEPymSailDmf
ux9ewdxoezeDBHxx6VGjXn9mCpNXzrfx7wE0n++Rv+YtVNhQ6m1e9ZMvFV1UplAd
NMDR02jBShHZDPgetT+vExo6f9dYxSxkGtHGeNnD9cFggl06J1tn0s6OL4yJW6kZ
Y+bG+pZ4FwJwRuMx6l6nO7czp3OFZw==
=ki0/
-----END PGP SIGNATURE-----

--Sig_/RHhcJ_.P=z/kWD5EKO.7Z1a--

