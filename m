Return-Path: <linux-next+bounces-6503-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DEAA6E60
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 11:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DF5817730B
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 09:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54175226D07;
	Fri,  2 May 2025 09:44:14 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EF221FF56;
	Fri,  2 May 2025 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179054; cv=none; b=RUcSg9GXKIC6msSBbsBOuMPOnyaUV3Ua3GbxMYZXAXIEhoEMJ4Qr8YbORUXdEoGtpp2iGv9putY1533uEnSXZN4ExE8yWQKDu/Hi8ii80Xb4CzZ7HhW5P1Ng1AymkzcrIRQXuvR+eijgeHMpqlpAS9VQ5NX9EtJBCuteYDQRucI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179054; c=relaxed/simple;
	bh=oKLhf/lh8OuTFUcFcrcpmYigUvotPKD3o6yW2F3BE2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxGk3R5KxunbE3aAgUdr91h0kUVaPs0ZirAcwO1NlP+pPFA/OrGLKL96Y+mYlN8YLKzEHv7uKIa9bhG+hZOUTmVYEhTn8T8enXhVKHEF33URlDEPsATozY6cmmZ8RS3oaBpDYXJM34Lq7mlMIpRRkaaHQUVRnLN6GnrqYSz9Svw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A8FF106F;
	Fri,  2 May 2025 02:44:01 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28D833F673;
	Fri,  2 May 2025 02:44:08 -0700 (PDT)
Date: Fri, 2 May 2025 10:44:05 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scmi tree
Message-ID: <20250502-aquatic-grebe-of-infinity-fbf10e@sudeepholla>
References: <20250502193708.62e01d11@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502193708.62e01d11@canb.auug.org.au>

On Fri, May 02, 2025 at 07:37:08PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scmi tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/firmware/arm_scmi/quirks.c: In function 'scmi_quirk_signature':
> drivers/firmware/arm_scmi/quirks.c:208:24: error: implicit declaration of function 'partial_name_hash' [-Wimplicit-function-declaration]
>   208 |                 hash = partial_name_hash(tolower(*p++), hash);
>       |                        ^~~~~~~~~~~~~~~~~
> drivers/firmware/arm_scmi/quirks.c:209:18: error: implicit declaration of function 'end_name_hash' [-Wimplicit-function-declaration]
>   209 |         hash32 = end_name_hash(hash);
>       |                  ^~~~~~~~~~~~~
> drivers/firmware/arm_scmi/quirks.c:211:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
>   211 |         kfree(signature);
>       |         ^~~~~
> 
> Caused by commit
> 
>   81ce8d705821 ("firmware: arm_scmi: Add common framework to handle firmware quirks")
> 
> I have disabled CONFIG_ARM_SCMI_QUIRKS for today.

Thanks for the report and just disabling CONFIG_ARM_SCMI_QUIRKS for now.
We will get it fixed before next linux-next merge.

-- 
Regards,
Sudeep

