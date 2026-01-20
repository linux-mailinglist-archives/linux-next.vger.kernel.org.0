Return-Path: <linux-next+bounces-9753-lists+linux-next=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-next@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDe1FqGtb2nxEwAAu9opvQ
	(envelope-from <linux-next+bounces-9753-lists+linux-next=lfdr.de@vger.kernel.org>)
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:30:25 +0100
X-Original-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874A478DF
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 17:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0BA597469B3
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 14:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0408843CEF7;
	Tue, 20 Jan 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5RlXDPc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8E2472A5;
	Tue, 20 Jan 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919461; cv=none; b=EUEwmARdSVipo1Wcethio8fI+OKGIzZOsn6cFSycm3MOSdW3G9WA37MIQiEOht3LjAenaYs0fgX7Nd0cBoZi2coQgyTuTSVGYdSDpi2AjCpHf21XxrYCNW11LrRIAJPgrHlTXFPxaubcpvh+jPbM865zjJKG7vn0r+KDbjFVesw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919461; c=relaxed/simple;
	bh=8kwLq8A6UNQfbJ+AhubQeU6mlyEurtih7K4BeillPc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WJDSHquj4ftytuw4FkfCFWa3K7Rk2OK90w7O5E4JewANaoo7inQakn4ko5OWVyPMw1k6kziQMFcnpX3VDsABOEJkKp5canQ0qpd+byiEAsz/Zk3D6zLzZSL8XjzoTLjjLu/XCM7SyIrgruie6idfQaFynZzU8Q5znmFcgDvTYv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5RlXDPc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC073C16AAE;
	Tue, 20 Jan 2026 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768919460;
	bh=8kwLq8A6UNQfbJ+AhubQeU6mlyEurtih7K4BeillPc0=;
	h=Date:From:To:Cc:Subject:From;
	b=o5RlXDPcG7+agj1oKLLXB4r4z0IS6zStphWgikSpLRsOdLFUPmO2DhAgPxnNDhZxi
	 fVuBEmEWl8hefSIUh+Qiy/YcL4HQBHZPH6EOYdw+CTuijAfFuMx9sRXaL0lYFYwFYc
	 Sh9iEUKm+p+GF4nWJZ5C8D/7o6heRknlshA99T6ywup5cq+geUFuZ5ai6wu7bLIkmJ
	 4epHVR7HmiQADLgeJB+otCLoTzYUnx6bJ05RJD2KIUh7sLw7BZgBkopiP6++TdLuwL
	 mprQskmuda8dn3ubEr+UPln+Xi5fzqLtMNicXJGzmnQF+nKBMt1AWZi7R6JIgDl4ju
	 c2X25+fh/ABbA==
Date: Tue, 20 Jan 2026 14:30:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Chen Ni <nichen@iscas.ac.cn>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm-next tree
Message-ID: <aW-Rn_qcNP2CgOm2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9jgTUlvssYY4I/1+"
Content-Disposition: inline
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-9753-lists,linux-next=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-next@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-next];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 2874A478DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--9jgTUlvssYY4I/1+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

between commit:

  f9c68b1c5be43 ("drm/mediatek: mtk_hdmi_v2: Remove unneeded semicolon")

=66rom the drm-next tree and commit:

  b626b1a1c9cca ("drm/bridge: refactor HDMI InfoFrame callbacks")

=66rom the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index d510ca8cfc4a5,d0e4440b74911..0000000000000
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

--9jgTUlvssYY4I/1+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvkZ8ACgkQJNaLcl1U
h9BcWgf/f1PZ+vimrziCa4UmeSm0BThty9/eQhnU7AQaPN6eBJK3xnkjPEVElaKK
vZmUvvBazSxIRd2Y2rUPBnG754LXtzBYWrg3KQraJZj91seqKmi6XN+aFpeKQJha
g9sCisXi5XIsxF2IFS1zYVU6P0P9J8oOnQ3ilNCwMbVMb/iYeuZN3IuW+Fe/zemz
ZGdK5spoTMmpqsP07IBdgQ6B1eaZ84SShGxILaOsS3eYFdu0jEJTm/Tdb3UOkVzr
5mWgGaE4tLPAPTJVvX3vmKXqzaH2egTPRUxIXORcI8x0KnY3eZARSWMTd0DuZbuy
Kd76V0digS1dvkh2+r3HAbzq1vxzUg==
=6n4G
-----END PGP SIGNATURE-----

--9jgTUlvssYY4I/1+--

