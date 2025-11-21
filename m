Return-Path: <linux-next+bounces-9121-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72921C76B84
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 01:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 199903572A8
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 00:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05001A238C;
	Fri, 21 Nov 2025 00:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YPshsIu0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8004D13959D;
	Fri, 21 Nov 2025 00:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763684141; cv=none; b=psIabKHnFwITn9ufZaf4rdC6ltKYkX3RlIEuWKk3/DU3SCtjE7A68NZiYQRcRwGc9uufAiL48o/KMvtCKLTnVev/12kHA7qf3iZn6mEvyTONZ5q2aZNxenYIfiBrqWZbzn31aX2IpRSmAgeB6aWp2o5QCLu5U7Bl15aVVBQbFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763684141; c=relaxed/simple;
	bh=LtUokMCnKPxbgv3lw9BsIHqvVQCw/5AHURC54XXr/dA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uz4pF7zMfkTQvg5xYsO9w0ngapkN+fkzo6+tEaiDdMCeFiNDJqxxrDNn1ovHriPh5pvS8UnnP8XOCaGz4WvwuZ55wQj4dfUQ/+XL7YvzuG7eq6pLXn+pYHq+RLNqQQTY0nUvTkQryGEoIFdSElpJDrichKQDI0SrZYNBQ/H7Ngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YPshsIu0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763684135;
	bh=LZex6QUnreppDv/PiBRqVfYGpMXPgD1FbOpSoqduy60=;
	h=Date:From:To:Cc:Subject:From;
	b=YPshsIu0r2JPlXYZxDjsELy8/4Z/8ojtdAsR0RDa020MTWqdCFw5u1GHJUQC+ZLV5
	 x6PD3asqjAipOmdmKoMN9n8w5J6lkR137kAzrLCRwmDtGsw4J91ikk7bF9KLh+s3HO
	 R3cwbj+oar/IbUFC/CGd9QS3ZIVCIwRG3X80TCb9EXxGe4y1pOU9jxTrm7QFB2n7UN
	 iOXu8CFpd9mOyNIG3am5MqNih8PfZ3v1KPcURXkvkS3aj2fsCvLohEI7yJitjLMNtH
	 9MHNDJXE8eHTH7ossUpAsZArbCuduIZUdV0+h1QAIi9jl+Dx3cV0D66LZZjkOO2WJ0
	 2LhSa9pDaJaBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCG2b2bLPz4wBJ;
	Fri, 21 Nov 2025 11:15:34 +1100 (AEDT)
Date: Fri, 21 Nov 2025 11:15:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the reset tree
Message-ID: <20251121111534.7cdbfe5c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pPo7d+jpj0OwwVIjWyYkJPb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pPo7d+jpj0OwwVIjWyYkJPb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the reset tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/platform/x86/intel/chtwc_int33fe.c:80:12: error: 'struct software_n=
ode_ref_args' has no member named 'node'; did you mean 'swnode'?
   80 |         { .node =3D NULL },
      |            ^~~~
      |            swnode
drivers/platform/x86/intel/chtwc_int33fe.c: In function 'cht_int33fe_remove=
_nodes':
drivers/platform/x86/intel/chtwc_int33fe.c:193:33: error: 'struct software_=
node_ref_args' has no member named 'node'; did you mean 'swnode'?
  193 |         if (fusb302_mux_refs[0].node) {
      |                                 ^~~~
      |                                 swnode
drivers/platform/x86/intel/chtwc_int33fe.c:194:76: error: 'struct software_=
node_ref_args' has no member named 'node'; did you mean 'swnode'?
  194 |                 fwnode_handle_put(software_node_fwnode(fusb302_mux_=
refs[0].node));
      |                                                                    =
        ^~~~
      |                                                                    =
        swnode
drivers/platform/x86/intel/chtwc_int33fe.c:195:37: error: 'struct software_=
node_ref_args' has no member named 'node'; did you mean 'swnode'?
  195 |                 fusb302_mux_refs[0].node =3D NULL;
      |                                     ^~~~
      |                                     swnode
drivers/platform/x86/intel/chtwc_int33fe.c: In function 'cht_int33fe_add_no=
des':
drivers/platform/x86/intel/chtwc_int33fe.c:225:29: error: 'struct software_=
node_ref_args' has no member named 'node'; did you mean 'swnode'?
  225 |         fusb302_mux_refs[0].node =3D mux_ref_node;
      |                             ^~~~
      |                             swnode

Caused by commit

  d7cdbbc93c56 ("software node: allow referencing firmware nodes")

I have used the reset tree from next-20251120 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/pPo7d+jpj0OwwVIjWyYkJPb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkfryYACgkQAVBC80lX
0GwfHwf/W8K1z0WBHIvo2RCBomOXBTeXQJ74dENNAyBtINUgJUyeoRGVhGkGyUjL
qFMlsynE2uy3kpjxP9gA1jwrc3Cluq5TiKm+DJtJu/mN2nlsSYoCZQWMwQDuw8Qj
RHnusyuo3AJgW10aXDZaYC4CtIUDC6/l9g4CyNtYo1Sq5895uLDrvzbwTJzeSbKt
7Z7OsDvYEXzQRy3jCBkDmln5D1+kZIcYjZn9WX3UIUrDSQNsFUcwOgIi04qYg6IW
yUOzC4NHMWDzGg2U6fRw6CcrG/lpepBXyqBOKKDXVUNaCK5IjtqWuGOliwIF9pfd
Ailfw85Lp2QS5UWpC/AB/AomMpAz5Q==
=Mntp
-----END PGP SIGNATURE-----

--Sig_/pPo7d+jpj0OwwVIjWyYkJPb--

