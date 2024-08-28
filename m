Return-Path: <linux-next+bounces-3472-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AF49622A7
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 10:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 140BA1C20D5B
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 08:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1007215AAB1;
	Wed, 28 Aug 2024 08:49:03 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704EA15854A;
	Wed, 28 Aug 2024 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724834943; cv=none; b=V9uI1lwf2uZKidaq2oHV8kHqR+UvBAUXYQcWKuWEY26ek35YvkxMIPb+QDGj2bdxghPxuvQjH7SWAZVYU9mCzdZtSFS1xJuW1T72vqmqA7EikXWpeOjMnCvRQLAkES2/uad73n7rOABco0zEMQ726jgwrw9TX0+DqeLXIiwog4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724834943; c=relaxed/simple;
	bh=KAOwlm9bE+8qI+mlfJz2TOtvmzmouEQwaxj4VMfmz88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXPGUzgiYUSVLf5lAA13fHtaAtwkFINngVfbOCMgcfJmar2FP0m415tsOP0y/gx0Wle9Q1oElTECSP6q8dV+8wC6795tqkOij3JuLgW71/oiHNeaCyZJDf5BqgQQU09j4reygsr5LwPr5qMZ5UAJ/wmCpgRpTYnnP9Qv3/4k20Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2CF1DA7;
	Wed, 28 Aug 2024 01:49:26 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF1AF3F762;
	Wed, 28 Aug 2024 01:48:59 -0700 (PDT)
Date: Wed, 28 Aug 2024 09:48:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scmi tree
Message-ID: <Zs7kebuQ363_IHia@bogus>
References: <20240828101531.38e633d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828101531.38e633d8@canb.auug.org.au>

On Wed, Aug 28, 2024 at 10:15:31AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scmi tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: missing MODULE_LICENSE() in drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.o
> ERROR: modpost: missing MODULE_LICENSE() in drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.o
> 
> Caused by commit
> 
>   00bdb213e944 ("firmware: arm_scmi: add initial support for i.MX MISC protocol")
> 
> I have used the scmi tree from next-20240827 for today.
> 

Sorry for that, it will be fixed for tomorrow. Thanks for the report.

-- 
Regards,
Sudeep

