Return-Path: <linux-next+bounces-2706-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 184E291C459
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 19:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2E31F22221
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 17:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944A41C2339;
	Fri, 28 Jun 2024 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWWbyaIx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E18D1CD15;
	Fri, 28 Jun 2024 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719594224; cv=none; b=p5PFAokRdsANcTfssjeVHV0inRajcIIgNkCM3b2vJZy8d+kkGG8mM2BXxS269LRQo4UesT1gofH3n0/wVgEvyri8274mDH6/ZT3f3SrVtI0TUgNP4AegR/n8xBclPnWpBlCk9kuETb+suqSyd2OiNLKKhc6xczP41UNyKBP0vOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719594224; c=relaxed/simple;
	bh=POx1/uOZB245FBmusGgfUJEuxJZ5QwKWVHTEfLbKB3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pkHSnBDBWz9UcKgw0urFeX2QruKkvjZ8Ile0tgl3COKPnME/py6V4TyQEoU057qfpvMaTs6fZcfZLIyV0BHDs7ilWnJ2qo90msE3JXwcKp1qEDNtFcMEIksIPpftkjCZskY5JK2vH8jy9A4XWymLkn28jmUKB69pflMkTnGsf4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWWbyaIx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D17DC116B1;
	Fri, 28 Jun 2024 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719594224;
	bh=POx1/uOZB245FBmusGgfUJEuxJZ5QwKWVHTEfLbKB3c=;
	h=Date:From:To:Cc:Subject:From;
	b=tWWbyaIx9sWxHG1muZu1WUYRxAlF4z+kkav7+NUzp41wqho53eF3L53iD74P9yeYd
	 Pis4VQ4CeCAtHVUMJemulnSzfO0PhwySn2Cd/ozM40GEE9GWdn8zjFA4LiJH3KEdtS
	 vgZ/Z77DbXiAhG/Lr4ho4U9u28G6BmBo84eFlk+AjjytF5a6WVxidWVj1EnGYJiCOi
	 Aq4bq0g4nDLgWzNc8XYpRP6tFrc1HNZnF94dczj61+vgxNItFiB8e/9APwqs05lqCJ
	 EyhQ80GDbOJCF/AEQU/1/qucEiUYwhfjhZKaTLU+lwqiqVcrNv0B5wNUcorJ97ujvk
	 QnQGHVjiSZ0VQ==
Date: Fri, 28 Jun 2024 18:03:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
	Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: buildfailureaftermergeofthedrmtree@sirena.org.uk,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm
Message-ID: <Zn7s611xnutUFxR0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uOs/tamzhpjy196+"
Content-Disposition: inline


--uOs/tamzhpjy196+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function 'pf_get_threshold':
/tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1788:27: error: unused variable 'xe' [-Werror=unused-variable]
 1788 |         struct xe_device *xe = gt_to_xe(gt);
      |                           ^~
cc1: all warnings being treated as errors

Caused by commit

  629df234bfe73d ("drm/xe/pf: Introduce functions to configure VF thresholds")

I have used the tree from 20240627 instead.

--uOs/tamzhpjy196+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+7OoACgkQJNaLcl1U
h9AZ7Af7BkWNkwptMGFswj/tCDTgrJq/z+dXFYulloh54R2jxB/Mi+47dqpkBM7g
ZgIw8HD3dzN5t9voQsTvkuhecOhKXLXZBS6QE0CpO+B8DgIlD39yVzdzshNzhM0L
/1Q/OAgbXI42YqEFptlp4cBbYIJjtCQm9nzyavlWJZRjW24nPEoe4fKtRWVBypKA
nQYzY3K/BHtr19jfeTNMPzW0jSb0438F9csnctrS2xKYoxY70tlw/J2IbQAUUSld
JzqRnHMRXoGx7WRMCta91wCl99SIS/QTsU6dBTwBl/wivZDPZtx5SsjDivkjVXBY
NeG0kB5MK0FDpb5bEBAJNj787dQf7w==
=Zwag
-----END PGP SIGNATURE-----

--uOs/tamzhpjy196+--

