Return-Path: <linux-next+bounces-2687-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 078A991A6A2
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 14:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38F241C241E2
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 12:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9490015ECD3;
	Thu, 27 Jun 2024 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CU6TQ5EU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADF015E5AE;
	Thu, 27 Jun 2024 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719491638; cv=none; b=d7yfp4p+M+1kvdDxKSG1hAsDKnlm1bhHQJg61cz6xBmcBappHMj8TraD01GvAIyGpaBMh9a6ByN0/ngSlCWrPAJsCl6ourXEwCldlTipLL0whqF29CjfbUINwXNxeqrP+vRM1OWgReor0CY+VCyCNG+mluW9wvgUOK5fMBBLBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719491638; c=relaxed/simple;
	bh=sSF46U9uOeTBtbmD0ZWt4CD8lGWUFsb25+yTEfD+39Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dRDqtawhoggHXi8kMe8oSP/gbAPQVET2tEdiM1n6mJJ9I81Pz+5budrxT0vqw4w8VtjY1R7mrHMhvy1Fus0+kQjJJe3B46yc0M5EyhJ/HsHyr6kfBbeBnQQHD/JB35JJuc5GRMp3QTab8wKL3/7fPCCN3a0nT9m2D1tdZRyr/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CU6TQ5EU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29903C2BBFC;
	Thu, 27 Jun 2024 12:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719491638;
	bh=sSF46U9uOeTBtbmD0ZWt4CD8lGWUFsb25+yTEfD+39Q=;
	h=Date:From:To:Cc:Subject:From;
	b=CU6TQ5EUPmd+1VvOC3/2djRBQsnXzd5KaqmGTeJaRbQBmEVkKS75k8+T7hNeN8jpn
	 xXPbqR+zuUgwfO3+hxGATCAeCWiyytFtD8Esdej16MjAhtNxDgwJXl6M3qHp0l9kTg
	 HDq4BYVeWAkndr/gINRl16yJk2zZQGCxUyaiTKmJIf4eLCfxzw2+lQf5ODkWeLqdam
	 PBbZkG6qGGI1GUcl9svGiLxKXfUJk5YqQpErCVU6Ma4IurVb8WEivavRbUXG/LzV8O
	 6xyTGfJuXLeTy7nkrwkCkvS0UHTJO/vM3ftS8KUESSug4W9v8651dIlbtdpcuPRdX7
	 bFPoPWyuW9nKQ==
Date: Thu, 27 Jun 2024 13:33:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ipsec tree
Message-ID: <Zn1cMmFP_FwwjYTG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZC2OUwBwrStDHNsk"
Content-Disposition: inline


--ZC2OUwBwrStDHNsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the ipsec tree, today's linux-next build (KCONFIG_NAME)
failed like this:

ERROR: modpost: "xfrm_dev_state_delete" [net/xfrm/xfrm_user.ko] undefined!

Caused by commit

  07b87f9eea0c306750 ("xfrm: Fix unregister netdevice hang on hardware offload.")

I have used the tree from 20240626 instead.

--ZC2OUwBwrStDHNsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9XDEACgkQJNaLcl1U
h9C8lAf/XyFQl/RbJgMeoAuvbaograGeisu9KsUy1FsXMSSC7H9RCBdTQOPQ8f/X
bHvzeGIy3rOqCsIEXelXS4etbC/PKWuCefCXD4YckGVZYs2ZBF2TGDtSKl8aGsyT
sYqgsriZnssNk6TDVQAe2pBbG+xJV8mePUmWwfv38ij4cG3GJanzV0kKKOcF9qbZ
aYsq8AQnwLRjLJ41HKoSqR4Z0DD1yK0Nrp26xU4sFBEU9k/zlljDtREAk/0sfnXx
MIEf/QYouYIoqfen/mSH9W5XSlYal/uLytyp2bFYFsZhC9H3adl1Jgq0jqwf/nCB
SbBNMIS7aD1FLcwdljoqx3mvDEHRVg==
=aVeB
-----END PGP SIGNATURE-----

--ZC2OUwBwrStDHNsk--

