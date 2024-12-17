Return-Path: <linux-next+bounces-4984-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1139F4ADD
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 13:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 504B4188424B
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 12:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F791E47BA;
	Tue, 17 Dec 2024 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsSKvqXY"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0C812C475;
	Tue, 17 Dec 2024 12:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734438248; cv=none; b=Z/MoakdbC0hV37apOqUgQl/Ik+jxFQBOIQVj0cNJHLpmScjI74Xgz8Zub//Ai8etj3V1GpNecDPW7QEhnVzEeVpK9HmhqYLMCLHBNXQwSBGb8AYo9hUiW/n2X+lL2yjLGRUTvqaq2zu0ZHyrGf+Gm8I+uRpzT4C/ZxXu889LYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734438248; c=relaxed/simple;
	bh=kZF64qDhy+IRE2nxxEgjsEMQli9+NHZh+9Q4wtgg/k0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=exShb3znW5i8AVtgaSONTGws4s/jkVVSsKnj+IlRX4UIIYZXlIm5VegH892Ee5VQFnqvE9Ddg8gXklYiFkqTfh4GJbbOyY9qZpk2Id0P+WNpCADKZakqgzFCOdwKDWKiIZZ5cSWiIourRQTD2Z6R5joX+p0g68k+NZeQqIXe9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsSKvqXY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734438246; x=1765974246;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=kZF64qDhy+IRE2nxxEgjsEMQli9+NHZh+9Q4wtgg/k0=;
  b=PsSKvqXY7+bjygY3eFvw7NpAk0/a12uxqpRy+DC9PIxWX7V9Qqq/nK5L
   zYTddeQJi2QuLPb6tK3FqZN3R57JqrkjOMgs/fYY6E/j2kaerIdfKng9c
   BgvYSFC1Awy8aeD+8n99EK/MidpFaqJMiwYOoPYWkjuTBurFFNHwYq71k
   0Oeoz720REWWS+vOLt2Thqe0X3nh/O1zWdMGU8hBWHBFuIOZh+S3f76jq
   VUVttb8qYEn0LkdLhFo55iVzkzHtN7U6eE8FQ9MasVdvhDGL8tb0sIIS4
   9rmRl6YIHCij/Bo57PgH7mzIWGFsJIn99SaJVx2VkuOgt/JbSxSoT2YTl
   A==;
X-CSE-ConnectionGUID: KQYqChyCTDqJNCjbE4SSQQ==
X-CSE-MsgGUID: u6FHmuhRQGyKMvWSwki6qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="35082676"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="35082676"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 04:24:06 -0800
X-CSE-ConnectionGUID: KAJ6ZmkTTv6BClu0EgO7nA==
X-CSE-MsgGUID: dTX3D50ZQCCCBQn++vgp6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134863564"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 04:24:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Dec 2024 14:24:00 +0200 (EET)
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
    Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
In-Reply-To: <9166ecd7-7b73-4db6-9827-7e65fb06057b@t-8ch.de>
Message-ID: <810e0861-bcbd-65ca-1d4b-ec06213d2f27@linux.intel.com>
References: <20241217071748.5a05af89@canb.auug.org.au> <9166ecd7-7b73-4db6-9827-7e65fb06057b@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-975877738-1734437881=:924"
Content-ID: <10c16fb3-a4cc-34b3-d495-6f91fa39ae46@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-975877738-1734437881=:924
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <25b46763-e38f-942c-f939-a9aeb259dcc2@linux.intel.com>

On Mon, 16 Dec 2024, Thomas Wei=DFschuh wrote:
> On 2024-12-17 07:17:48+1100, Stephen Rothwell wrote:
> > Commit
> >=20
> >   f05a99b0d5f1 ("platform/x86: dell: dcdbas: Constify 'struct bin_attri=
bute'")
> >=20
> > is missing a Signed-off-by from its author.
>=20
> thanks for the hint.
>=20
> Ilpo, do you think you can fold my Sign-off into the commit:
>=20
> Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>

Thanks for the heads up.

I've added the signoff into the commit in my review-ilpo-next branch=20
where from it will eventually propagate into the for-next branch.

--=20
 i.
--8323328-975877738-1734437881=:924--

