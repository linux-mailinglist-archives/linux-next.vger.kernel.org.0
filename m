Return-Path: <linux-next+bounces-164-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 070897FFE44
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 23:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40FEA1C20B76
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 22:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459176167B;
	Thu, 30 Nov 2023 22:03:48 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id B4121D40;
	Thu, 30 Nov 2023 14:03:44 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 352B41042;
	Thu, 30 Nov 2023 14:04:31 -0800 (PST)
Received: from bogus (unknown [10.57.42.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8413F73F;
	Thu, 30 Nov 2023 14:03:43 -0800 (PST)
Date: Thu, 30 Nov 2023 22:01:37 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scmi tree
Message-ID: <20231130220137.pglo3n5g3n5zuudy@bogus>
References: <20231201085914.4ad45eb2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201085914.4ad45eb2@canb.auug.org.au>

On Fri, Dec 01, 2023 at 08:59:14AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scmi tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arm-linux-gnueabi-ld: drivers/firmware/arm_scmi/perf.o: in function `scmi_dvfs_freq_set':
> perf.c:(.text+0xc8c): undefined reference to `__aeabi_uldivmod'
> 
> Caused by commit
> 
>   eb55fbef8913 ("firmware: arm_scmi: Fix possible frequency truncation when using level indexing mode")
> 
> I have used the scmi tree from next-20231130 for today.

Thanks for the report, I will fix it ASAP.


-- 
Regards,
Sudeep

