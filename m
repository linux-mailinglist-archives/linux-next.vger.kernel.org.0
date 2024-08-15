Return-Path: <linux-next+bounces-3336-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DE7953DA7
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 00:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E141C20964
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 22:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F21156F4A;
	Thu, 15 Aug 2024 22:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OyQTVktB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E63156F3C;
	Thu, 15 Aug 2024 22:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723762669; cv=none; b=kdGIM6d2qnikuxtJa1GkzbQT+wWc14x6+VrCx5/iDS7dCwQaVy+LU1HKMz2xZGBmDb1jEGw8kC6vf4F5b+Xz87nC0sOulsMD6yNEsl4KUNHOm2FVrPyhyILiv+/4P6jqlHoUmj7cJYsEQeD6/1WHqlhZQOZ6i/lR5S5DxaLOvHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723762669; c=relaxed/simple;
	bh=ZD8JHRPSIZDW/NYI7azUH3ffzSWobGtKjbIHyZkRsg4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PCDNp+fb/YlFwGRhAKzObJOzb3yuHO9dWEKei7ChWYAEZKHC7io8KN+JmYwKGzggufOHcEqD9e7/jUUO+WiDcrb11sMTn37+qJgoFgNkFY/ZsWxkZIk9DSzwyNj2ZZIBsAWg0JfrTG3S+URRuHBCdaFOdWpWa3ZvJ+Yura2Qt9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OyQTVktB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734B4C4AF10;
	Thu, 15 Aug 2024 22:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1723762668;
	bh=ZD8JHRPSIZDW/NYI7azUH3ffzSWobGtKjbIHyZkRsg4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OyQTVktBCFZpCURQP2L0z92cpGaimWEpmonxX++VhyJigV0bqTHFmidKBpcw8Y7TF
	 osbLcQRqApt9Ql2clSWFRfelK3wJRdLd/bwcQ3XTqzOWKbV6Oe2WKeXyBXzdr8IgQX
	 PWXK7nlM1kPcJ/gI3SuOrKw5kWJggubYztWa/QSI=
Date: Thu, 15 Aug 2024 15:57:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20240815155747.078805324103e374b8dbc805@linux-foundation.org>
In-Reply-To: <20240815100645.25b7a87f@canb.auug.org.au>
References: <20240815095734.751c6ec5@canb.auug.org.au>
	<20240815100645.25b7a87f@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Aug 2024 10:06:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > 
> > Caused by commit
> > 
> >   2771559a5531 ("fault-inject: improve build for CONFIG_FAULT_INJECTION=n")
> > 
> > This is just whack-a-mole ... :-(
> 
> These files might also be worth a look:
> 
> $ git grep -l '\<debugfs_' $(git grep -L 'linux/debugfs.h' $(git grep -l 'linux/fault-inject.h'))
> drivers/gpu/drm/msm/msm_drv.c
> drivers/misc/xilinx_tmr_inject.c
> drivers/ufs/core/ufs-fault-injection.c
> include/linux/mmc/host.h
> include/ufs/ufshcd.h

yup, thanks, why not.

 drivers/gpu/drm/msm/msm_drv.c          |    1 +
 drivers/ufs/core/ufs-fault-injection.c |    1 +
 include/linux/mmc/host.h               |    1 +
 include/ufs/ufshcd.h                   |    1 +
 4 files changed, 4 insertions(+)

--- a/drivers/gpu/drm/msm/msm_drv.c~fault-inject-improve-build-for-config_fault_injection=n-fix-3
+++ a/drivers/gpu/drm/msm/msm_drv.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
+#include <linux/debugfs.h>
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
--- a/drivers/ufs/core/ufs-fault-injection.c~fault-inject-improve-build-for-config_fault_injection=n-fix-3
+++ a/drivers/ufs/core/ufs-fault-injection.c
@@ -3,6 +3,7 @@
 #include <linux/kconfig.h>
 #include <linux/types.h>
 #include <linux/fault-inject.h>
+#include <linux/debugfs.h>
 #include <linux/module.h>
 #include <ufs/ufshcd.h>
 #include "ufs-fault-injection.h"
--- a/include/linux/mmc/host.h~fault-inject-improve-build-for-config_fault_injection=n-fix-3
+++ a/include/linux/mmc/host.h
@@ -10,6 +10,7 @@
 #include <linux/sched.h>
 #include <linux/device.h>
 #include <linux/fault-inject.h>
+#include <linux/debugfs.h>
 
 #include <linux/mmc/core.h>
 #include <linux/mmc/card.h>
--- a/include/ufs/ufshcd.h~fault-inject-improve-build-for-config_fault_injection=n-fix-3
+++ a/include/ufs/ufshcd.h
@@ -17,6 +17,7 @@
 #include <linux/blk-mq.h>
 #include <linux/devfreq.h>
 #include <linux/fault-inject.h>
+#include <linux/debugfs.h>
 #include <linux/msi.h>
 #include <linux/pm_runtime.h>
 #include <linux/dma-direction.h>
_


