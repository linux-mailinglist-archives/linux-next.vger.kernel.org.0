Return-Path: <linux-next+bounces-6790-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B1DAB826B
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 11:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 057BB7B5B19
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 09:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDBB29670A;
	Thu, 15 May 2025 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCUpFO0e"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFBC289E2B;
	Thu, 15 May 2025 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300977; cv=none; b=b70T36wHO6at0159ZG820/Xz1+uPPXH1i4fL+cfYy/uDNVJn4r23d4wssYjSTsD6+LMjhdnKW6vRcWtrUq1hnGJQMoy2EntG7snX9HgI4iovaWaTtKinlS9pJ/6qWvObHG89BiAVplGQW6kpQsfPm1x//HpczzJCov00T4pSm8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300977; c=relaxed/simple;
	bh=/XyyqdAFLfTvtOdOvYOEoJsJo0ZYtebZv7lzp117MMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwPGCPkbvWBm/Y5I8i+XRKMX//OTsZcg6itFfopvSV5QHIqvELLTIMrSAPe6lWLEUX0vVgyOmKNZ1qdwGDHpvw8KITbUlEwVK4TogeKqrnq31W5s5Oeck5/n4S9YRpHDq+tkfdXWJM8LflwmGHqmSFqpuU/OFp8BHSbGirxh6+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCUpFO0e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D210FC4CEE7;
	Thu, 15 May 2025 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747300975;
	bh=/XyyqdAFLfTvtOdOvYOEoJsJo0ZYtebZv7lzp117MMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCUpFO0eiIjGdw2hwNIPSSFvC/uEEfkQJOSf59VgMbLwO1KrXvu4mxn8XCEFAZ7Ar
	 +czvu6eBWzzP75vIKtFwdPXoGDI6llAjQI7SQ7D/Dj33j9++KihkhMVdsdSVJMXfn4
	 zIDyQNdB1O+P/kuJiUMndXDEidK5gNOyYRrgtqGqD5Yz/ZLeizaARnCrdq6SzLHP4J
	 2fGdl7w70LA34d6h4Zp2NyHz9w7quPzdGHpWfjsDjtaCvdqFKVszOwPnL1YrK+uhFL
	 P66NQilQG4sq3vBfbsciXZCTA+AmEiIn4XOyyWKkW6ISF7uiArNLMGVkAw9vXDILNv
	 3qIGrIf3nY+IQ==
Date: Thu, 15 May 2025 11:22:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	PDx86 ML <platform-driver-x86@vger.kernel.org>,
	Suma Hegde <suma.hegde@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <aCWyatvDQEG5l6NV@gmail.com>
References: <20250515164620.071d70e3@canb.auug.org.au>
 <bce51c8f-56c2-3a44-b590-149627398b7a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bce51c8f-56c2-3a44-b590-149627398b7a@linux.intel.com>


* Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:

> On Thu, 15 May 2025, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > After merging the drivers-x86 tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/platform/x86/amd/hsmp/hwmon.c: In function 'hsmp_hwmon_write':
> > drivers/platform/x86/amd/hsmp/hwmon.c:38:16: error: implicit declaration of function 'hsmp_send_message' [-Wimplicit-function-declaration]
> >    38 |         return hsmp_send_message(&msg);
> >       |                ^~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   92c025db52bb ("platform/x86/amd/hsmp: Report power via hwmon sensors")
> > 
> > I have used the drivers-x86 tree from next-20250514 for today.
> 
> Hi Stephen,
> 
> This is a direct result of moving a pdx86 related header behind my back:
> 
> https://lore.kernel.org/all/20250413084144.3746608-5-mingo@kernel.org/
> 
> That change wasn't sent to the relevant MAINTAINERS entries (and obviously 
> then does not contain my ack either).

Sorry about that! I always try to over- Cc:, but missed you this time.

> Ingo, any suggestion how to deal with this breakage? Do you have e.g. 
> an IB which I could pull into pdx86 tree which has only these header 
> moves?

I'm not sure that's needed, the above build failure is not really a 
build failure caused by the platform-drivers-x86.git tree, it is a 
semantic merge conflict that should be resolved at the linux-next level 
I think. (And which conflict should be mentioned to Linus by whoever 
sends their tree second.)

Stephen, could you apply the patch below perhaps?

If not then I'll add back an <asm/amd_hsmp.h> wrapper to the x86 tree.

Thanks,

	Ingo

================>
 drivers/platform/x86/amd/hsmp/hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86/amd/hsmp/hwmon.c
index 7ffb61e0ef62..0cc9a742497f 100644
--- a/drivers/platform/x86/amd/hsmp/hwmon.c
+++ b/drivers/platform/x86/amd/hsmp/hwmon.c
@@ -7,7 +7,7 @@
  * This file provides hwmon implementation for HSMP interface.
  */
 
-#include <asm/amd_hsmp.h>
+#include <asm/amd/hsmp.h>
 
 #include <linux/device.h>
 #include <linux/err.h>

