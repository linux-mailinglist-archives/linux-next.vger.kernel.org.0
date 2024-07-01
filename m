Return-Path: <linux-next+bounces-2758-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC35291DB7E
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 11:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78960283A03
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D664912FF63;
	Mon,  1 Jul 2024 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TVD9kKHW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC36A85628;
	Mon,  1 Jul 2024 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826335; cv=none; b=c3N4GFL5U7IxaDIPIOFLein4HJq5JCmH2VdMTs6pyULBFOr7xtr7i370Hrd4G5XwzCIF3VbVjY3YnACLLdM4/LUxjxE/WrsRWLXkJPG5/uYJ8bILT0bp8MWcKDXyapuyaPxQCbFWzb7bV5DAW2tCsEK401x6oaVcanFdK6t+OGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826335; c=relaxed/simple;
	bh=P7xTVsBROMSbcBq28yaSjSvLTrkppNQWNyDAJDykPnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uDg+4kQtH+5Y1ntwDV9w2MtGWFcm8GM1DkbSeLrhajxZ3J+wnMynqkdyevdniEQ6cIJPX3phYlg0lPT4QaOrGGFznY2TN5z6+adgRA8qwYRCmwbQJw0r/8b7UYG5O1fWoc4OkgJpWbPG26jYL1WmCTqE+1Bh7BAlHQ7dpziduCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TVD9kKHW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719826331;
	bh=qc2yv5cEQW2IMGQ0wARBrKGy7sIwV7LvyR5VAIiaePQ=;
	h=Date:From:To:Cc:Subject:From;
	b=TVD9kKHWl248pzwSV5hIcg2Vx5kjcQ0sOpjOyaRLsn3DVkW42DvsOtZ4xH1b3qjQ7
	 17u6q1gNqQsmMT2N77SFPHYGzxNiH0+UocKxvjEW/0vebarsyrEBhuCIrQY14lNKMR
	 b5aP9NZ5ywQvYvrk2PRLhnC3BJpi0edYWwyQKoDk402s/moW16qtBd8afMiRn01E6F
	 h9E58OZlO7Kg667yaezolM1AbTWDNdPvdHLPZ/uaVTtpVLcpqnpHdpBC2/6pSwA7EG
	 xN3cbG+70CGu40VZS2LcCFVMtKx9tgrSEEC6Oo7gBW88aonMKRmivo7c6m6YLZgrsw
	 AaKE9Bne9amSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCLRH4Sg4z4xM7;
	Mon,  1 Jul 2024 19:32:11 +1000 (AEST)
Date: Mon, 1 Jul 2024 19:32:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the hid tree
Message-ID: <20240701193210.7b105db8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mdzmdgvBVF3pyOAv2SZtLx_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mdzmdgvBVF3pyOAv2SZtLx_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hid tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/hid/hid-bpf:185: include/linux/hid_bpf.h:144: ERROR: Unexpect=
ed indentation.
Documentation/hid/hid-bpf:185: include/linux/hid_bpf.h:145: WARNING: Block =
quote ends without a blank line; unexpected unindent.
Documentation/hid/hid-bpf:185: include/linux/hid_bpf.h:147: ERROR: Unexpect=
ed indentation.
Documentation/hid/hid-bpf:185: include/linux/hid_bpf.h:167: ERROR: Unexpect=
ed indentation.

Introduced by commits

  8bd0488b5ea5 ("HID: bpf: add HID-BPF hooks for hid_hw_raw_requests")
  9286675a2aed ("HID: bpf: add HID-BPF hooks for hid_hw_output_report")

--=20
Cheers,
Stephen Rothwell

--Sig_/mdzmdgvBVF3pyOAv2SZtLx_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCd5oACgkQAVBC80lX
0GwFIQf8COPVl/LJ1NDCPmQm037G/QUN7orpD2ZrerxiU6FNcY8iFq35wg5qSVYe
8csv1WTtzCvYMlWCt3x9NV8dXDshvhj7oGgf91aK4+MIC7BjiX8Rb7vc97jNI9xR
W3XfU35b6NdxerF1Wn5hAzEzoYLJsNZ9qHPR2/HyDQbCByUC+M4wupyLzFrevTiw
crSm8nOKRluptAUmKY1iAFJWXbjtzMljFrkmx47hSEkv3oikha/eZrkvfbUh6YMa
cyPyl7Kv/7RWkUriNoTbZIC/cnWG+im077RMmPOfHmAYQJqmmVfZUpycTDo8Zw5j
teK+LO3R2wP1M0Dsi9viKUvjHFdqwg==
=aECq
-----END PGP SIGNATURE-----

--Sig_/mdzmdgvBVF3pyOAv2SZtLx_--

