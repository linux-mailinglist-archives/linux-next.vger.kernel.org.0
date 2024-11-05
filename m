Return-Path: <linux-next+bounces-4617-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD789BC404
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 04:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A47282224
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 03:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827A5185923;
	Tue,  5 Nov 2024 03:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="E4slBiCB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D9E183CC9;
	Tue,  5 Nov 2024 03:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730778285; cv=none; b=Sivtvlq2N4OHH1tShnxODbhN0vjaux5j9CX/z/FWvFHKuztDaDZHrw/EouQBrZ72JOHBO8EeNL7gGRX9aF89KFGOBaavdLEu4LEUYJBmkVW9gvt5XiTruaIoSvo3nitpcyVY6NOGz0TuDcCQtqxV+1KZ5OhdfsbUfXSdzs46B2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730778285; c=relaxed/simple;
	bh=ZMIJ1QMBpMwinYOjDXlgaW4tX7wuHKAf2TSd+YOKoIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fg0RDPywq0R3O51FJaNNCzVMJk9XHF8tCbtPjrmVJvJ9pM6bdu18ZAccte9fgBsIhufyxLh+LWYIqMYk+rdT2dub+wU+8XiDPDXOkwHFpAfwyigzQEjlV/n5hZDehQ1HnkBtykmzzo+rNtQKsfATmeDjQADZRaDPYEJOmhJUd3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=E4slBiCB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730778274;
	bh=lUctEdvvWTVpaaLlyCFZ0Y/zWHdHD/DQDozK+5zDi3w=;
	h=Date:From:To:Cc:Subject:From;
	b=E4slBiCBIsdqkRDfKRAl7PRGvXUEnWu/lLTyX3jx3GM7QyZFlNpKEPwP2ftgc5KiK
	 IbdbTmTr6VgWvKnoWidCMXvlO5zi7cxdu8bjHT+SfvbTQ58n8zLl9dQTqcabpBVpl0
	 6ZYRMWXx0fKfl5cmsfeP3kPVGFYsWXvfEGIl6nWjnC1ivVmaIb20cZPY5YlkSbJQjr
	 Kp4aY+oMmBrd0Gv2xQguS3vM2xV+bH0hAwLYmAe8W84KQXqqIFnBGWcItvvhiAXXxJ
	 f+P7p7HGZsRijpMnemb3P1uG2EGfTnRadyp/zy8G7lEevbpv1kdKzo59MGsUWYnAA2
	 mJjPptjdbZvIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XjDjZ441mz4wy9;
	Tue,  5 Nov 2024 14:44:34 +1100 (AEDT)
Date: Tue, 5 Nov 2024 14:44:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the qcom tree
Message-ID: <20241105144435.1d80d910@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W5jOo6ftU15nlkQZAvC3=lu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W5jOo6ftU15nlkQZAvC3=lu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/cache/qcom,llcc.yaml

between commit:

  a83e18ca8358 ("dt-bindings: cache: qcom,llcc: Document the QCS8300 LLCC")

from the qcom tree and commit:

  f9759e2b5704 ("dt-bindings: cache: qcom,llcc: Fix X1E80100 reg entries")

from the devicetree tree.

I fixed it up (the 3 way diff comes out empty) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/W5jOo6ftU15nlkQZAvC3=lu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcplKMACgkQAVBC80lX
0GxgiAgApk3vNVeWbBgJXyj6PVTp8WXyPzbfaziKBT8EWvf4gXCZNB1PynuPN870
TT7Qsk9BEoTYxqSqeqzCO9MGpYYAW7o8YnCvMW/kwgfxKOApFo6EC/10phD+Xk3s
OR3J1qZqwYamBG/ZO5xIv8NV1qDUF48JsZMUK57SnlmMnAZthpa4Wmue0iENrIK4
7/SIl1WEqqiUDMmxbr4NDNBuQCQEkxHYay8BGG7U0Zo9jkovuybh13mdTblAduFm
rdWL4RfMIAlSzoa14y4RnvTysTRAPo9drxbQUqhiAWV5L4VCMDaHgqvdmCJluZSh
EIO/ZrRBaUBdu2gaIib6FF+YA7fUBA==
=5ulA
-----END PGP SIGNATURE-----

--Sig_/W5jOo6ftU15nlkQZAvC3=lu--

