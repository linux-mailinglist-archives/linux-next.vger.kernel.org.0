Return-Path: <linux-next+bounces-3586-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ADA96B4D8
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 10:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626691F29DB5
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 08:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263401CC8BF;
	Wed,  4 Sep 2024 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyGWI456"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5180D1CF5C5;
	Wed,  4 Sep 2024 08:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438940; cv=none; b=r++IXd4CoeTl/AITXi/tWOavmB0C7LmX8CzC0vbi22TNts3MkgwSJVhr8x7VIkQqx4ho6AAYLJqCL/h0Felfn9qBGUYjfKFzCjpJp3qYEE4Sai4O7J8W32kexw0iZyRSpY3/Ko6Pzmy4dKHF6t/IWr1mpihNFOE5CFrN9lOoZFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438940; c=relaxed/simple;
	bh=QL0QAEIxnsgU5BRclA2zcvFfRGe31nTeeoCG8FH1DYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYKd/m9CJqFnmMA5uyGtIwu6WXW/kXWxSDRVzuqu+5hvNduMGHd0eRstn0JsgrBQ1WASqrIfNqmbyRKXDeQM2dl1EpK0G/PLIKhYQEVixL8cnPGt1QtQFA9lXy3Zxc4EApA08lMgR5SHsM91BXHomBHINetLmKOPXmQ1ujOloSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyGWI456; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725438938; x=1756974938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QL0QAEIxnsgU5BRclA2zcvFfRGe31nTeeoCG8FH1DYc=;
  b=MyGWI456MHe0viEev5q7e6oj6B1KLAkZvhGXBSuA5M7ykHCvHbNek676
   GKG4X2I9IlPqlR6qb79VfxKHET+U8hhd+U3Y568co1WYNW3RByU4xWUL+
   qM4sXzoWiWitNrjROINCPQo1KU9k5ev9LjcOH8IfdJWxuXbepeXP5ReTv
   KlPRlIEBSae40eWsV8liouMaaPzSTd1wFPuSrq2tdYSSJtwwRR2S3NATb
   FAnPU0HCw8QV72WZaN9cavsBeKj15xkVVo5DqWekMsTSaKov2fHFP3sbp
   vDtM1FV6q4B0a9IGKa39Ji3x03aMG34mUCN3blggsRlVDiT4rkOw76iIe
   g==;
X-CSE-ConnectionGUID: IpoYqzPMSOmxlT0WdK2B4w==
X-CSE-MsgGUID: f5EFhZdNQpSmgfAGkC0yXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24244687"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="24244687"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 01:35:38 -0700
X-CSE-ConnectionGUID: 1Ux7KoU6Tb2vyQ3rD+dinQ==
X-CSE-MsgGUID: CcU2H083QzSP+cWqsMAI/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="69989847"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa003.jf.intel.com with SMTP; 04 Sep 2024 01:35:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 04 Sep 2024 11:35:34 +0300
Date: Wed, 4 Sep 2024 11:35:34 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <Ztgb1nQ79+eSZXil@kuha.fi.intel.com>
References: <20240904150522.0410150f@canb.auug.org.au>
 <2024090439-hexagon-imply-db4e@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024090439-hexagon-imply-db4e@gregkh>

On Wed, Sep 04, 2024 at 08:16:10AM +0200, Greg KH wrote:
> On Wed, Sep 04, 2024 at 03:05:22PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the usb tree got a conflict in:
> > 
> >   drivers/usb/typec/ucsi/ucsi.c
> > 
> > between commit:
> > 
> >   87eb3cb4ec61 ("usb: typec: ucsi: Fix cable registration")
> > 
> > from the usb.current tree and commit:
> > 
> >   73910c511b1a ("usb: typec: ucsi: Only assign the identity structure if the PPM supports it")
> > 
> > from the usb tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc drivers/usb/typec/ucsi/ucsi.c
> > index 17155ed17fdf,f0b5867048e2..000000000000
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@@ -993,11 -929,12 +939,12 @@@ static int ucsi_register_cable(struct u
> >   		break;
> >   	}
> >   
> > - 	desc.identity = &con->cable_identity;
> > + 	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> > + 		desc.identity = &con->cable_identity;
> >  -	desc.active = !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE &
> >  -			 con->cable_prop.flags);
> >  -	desc.pd_revision = UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(
> >  -	    con->cable_prop.flags);
> >  +	desc.active = !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE & cable_prop.flags);
> >  +
> >  +	if (con->ucsi->version >= UCSI_VERSION_2_1)
> >  +		desc.pd_revision = UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(cable_prop.flags);
> >   
> >   	cable = typec_register_cable(con->port, &desc);
> >   	if (IS_ERR(cable)) {
> > @@@ -1094,8 -1009,10 +1041,9 @@@ static int ucsi_register_partner(struc
> >   	if (pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD)
> >   		ucsi_register_device_pdos(con);
> >   
> > - 	desc.identity = &con->partner_identity;
> > + 	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> > + 		desc.identity = &con->partner_identity;
> >   	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
> >  -	desc.pd_revision = UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags);
> >   
> >   	partner = typec_register_partner(con->port, &desc);
> >   	if (IS_ERR(partner)) {
> 
> 
> Heikki, does this resolution look correct?  I knew there would be a
> conflict, just want to make sure we get it right.

It's correct.

thanks,

-- 
heikki

