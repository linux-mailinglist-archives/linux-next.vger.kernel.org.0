Return-Path: <linux-next+bounces-6467-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15542AA4984
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 13:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F30201BC4DF7
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 11:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D56E25D544;
	Wed, 30 Apr 2025 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTEld37w"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F30025D212;
	Wed, 30 Apr 2025 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011266; cv=none; b=pV5GUQM/yEXDPjW0XUdvSZrdp1jAB6gQ6r8fRMY+gn9zLi36+/nuwHhWarv8B4fACp7OzJw5Jhn2GfINE3qYHpVRzTWQaYSPUfvoTXpWyZzW2viFhbsL4QnveMG5SNrH5NYItWMqEreIQmmtFNE5ZeiTqB+m1qdqXeP4JGwVH2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011266; c=relaxed/simple;
	bh=k98vyJOrhGXfV4+9TGgMxw9o1fP98FDdf5g9qnNMc8A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Yl6Z6N/nNVa/K4IqWS5s/H6GbQSRBiPmUfiawH0iULdVx7JNp6fljw+MWyhLQmG75PfYK8cjjZen/ORP5JSIWK0zqRRIke4r/sQFIsx09iNiHJiXa/BHg3AIqFrtoj+Os3ZcXU0x6TKC8xZYlDTmhEN7XYArs+Kk3X4vRBMSO0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTEld37w; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746011264; x=1777547264;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=k98vyJOrhGXfV4+9TGgMxw9o1fP98FDdf5g9qnNMc8A=;
  b=dTEld37wnfG3m3MpJQZjyl9iYZjS3o8xdGPe19F7VfOlWZGgY4xfxzYq
   bJAbGoArCsF58KXzOFXVnEr3Z34ZrNnCIasU0E5MbWIrvhx7qxFQDqPtY
   8y/8w0SUUDRBKNJIn+7bOMCkE2lBJGNGJx1RcLb75jM/Xs/xe5b4ATcGi
   QwTDa20crQoDSueCkjyecZZKEcJ/GdRv4wPqVeIrh6dTf2vBzrRgu9wzX
   +C4MFpA/+sFWY6HOnNeJkPbqL0OX+LoRUFH95eyQ2VmV7HPqEgFuWzWqs
   thAgpv6hR59PR1EN20eAFQmw00dCnqXl0jHhKJB+BW4ok5FnPcPzWnHBz
   A==;
X-CSE-ConnectionGUID: NAITMSGBR6Ky35t1O+G8mw==
X-CSE-MsgGUID: soJdht6zT1uq70zR7jISLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="70168087"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="70168087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:07:44 -0700
X-CSE-ConnectionGUID: wJnZkUqMQfmmHNP6Lgbz0Q==
X-CSE-MsgGUID: +ImuwMxMQ5ym49kypaX/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="139071514"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:07:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Apr 2025 14:07:38 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
    Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
In-Reply-To: <CAGwozwGpqpOYUhfubpCN_BME0h3Kg_eGLdcPkPbQ3OQcg=Usyg@mail.gmail.com>
Message-ID: <95c839a5-35b0-34b0-f22e-6bc45c6729b8@linux.intel.com>
References: <20250430204517.75d88615@canb.auug.org.au> <CAGwozwEd3B3H4iKjn5YrLOzHpXajqsPVEVVmzHc=wEAz23AR4g@mail.gmail.com> <b423debe-95a4-2e9a-bb80-d5086576200f@linux.intel.com> <CAGwozwGpqpOYUhfubpCN_BME0h3Kg_eGLdcPkPbQ3OQcg=Usyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-154004619-1746011258=:7433"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-154004619-1746011258=:7433
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 30 Apr 2025, Antheas Kapenekakis wrote:

> On Wed, 30 Apr 2025 at 12:56, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Wed, 30 Apr 2025, Antheas Kapenekakis wrote:
> >
> > > On Wed, 30 Apr 2025 at 12:45, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> > > >
> > > > Hi all,
> > > >
> > > > After merging the drivers-x86 tree, today's linux-next build (htmld=
ocs)
> > > > produced this warning:
> > > >
> > > > Documentation/hwmon/index.rst:19: WARNING: toctree contains referen=
ce to nonexisting document 'hwmon/oxpec' [toc.not_readable]
> > > >
> > > > Introduced by commit
> > > >
> > > >   fe812896e55d ("platform/x86: oxpec: Move hwmon/oxp-sensors to pla=
tform/x86")
> > >
> > > Hm,
> > > after removing the documentation I might have left an erroneous oxcec
> > > entry in the documentation file.
> > >
> > > In some previous versions of the series the hwmon doc file was rename=
d
> > > but in the final one it is removed. So this file should not be introd=
uced.
> > >
> > > Should I do a fixup commit?
> >
> > Yes please. I'll fold that into the original commit if it is easy enoug=
h
> > to do which is what I expect to be case here.
>=20
> I am not at my computer with my kernel tree. I will do that later
> today if needed.
>=20
> Looking at the diff:
>=20
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -189,7 +189,7 @@ Hardware Monitoring Kernel Drivers
>     nzxt-kraken3
>     nzxt-smart2
>     occ
> -   oxp-sensors
> +   oxpec <-- This needs to be removed
>     pc87360
>     pc87427
>     pcf8591
>=20
> If modifying the initial commit, it is probably easier for you to fix
> it now. Otherwise I will send a fixes later today (~8 hours).

It has been removed in the review-ilpo-next branch. Thanks all.

--=20
 i.

--8323328-154004619-1746011258=:7433--

