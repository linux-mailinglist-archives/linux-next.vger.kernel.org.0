Return-Path: <linux-next+bounces-2767-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 042CB91DFA0
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 14:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 368D71C214DE
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 12:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9407515886C;
	Mon,  1 Jul 2024 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSIJzG5k"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2D155381;
	Mon,  1 Jul 2024 12:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719837827; cv=none; b=GjNX6SFtC8XVN3h8TS43YNSeNfHS7eOU4suDbY2QOtO4n08iko3rEljZoEii/JEFkAnUWhUS0RP6Kp1IBxDIqrF4FBYAM7gDhQd5hcd7eNJaAqbp9Wu2nhkutspg0odnWw/sRvlq15EuPwgauHPQWLgMXIge9IyguO014f67TwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719837827; c=relaxed/simple;
	bh=YeBo7WeEfHrDjar+170g32UT5NI8xg7k30NX9nn6DDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFWWVx5Ds0ld+N5Wvx9R7hAP3dl6aNs8gZtLMM9/GmsaFPsUR9FskuvZfHMCxJ1xXZP2QaBYSSsih6TNJQx77OtdMXCob5WyabZZ8egvaZ6sV4AQ/Hl28LyQcVqtrGJQQiEwkcPV04n6TyAos1SkP6LMJNkduLF8It0X7CPiDG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSIJzG5k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7699C116B1;
	Mon,  1 Jul 2024 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719837826;
	bh=YeBo7WeEfHrDjar+170g32UT5NI8xg7k30NX9nn6DDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSIJzG5kE3e7rGZi40BjaTQT/5aPg4DFWj8Vm1JdG0gJVnpmtOUQpSPVgCx0fB0gM
	 QBb+Aj++c+X7axAYj/va2uHBCMv5DSYRdrRCzOjTyXtwJPsJmAsrgXd/t3vvxJk979
	 v5PF/L273JYv8bq2K2Py93P1Xoq0mGrX0/hMk3ZkdAyvInZteKAKPKLnWPp3ZJ0AOw
	 RrJ3KHCZBo2kZp18Eo27xiWDtCRQQFAzAQapbw5Ai2jEke04hBRnNqEBQWqLji2HrF
	 y2dzUy/nZzEeMgr71LJeczA4L6Ktils1i4fcrrm2sUexD3PPy0D7CJf6lihcbrjyMU
	 sqj9p8HSh1QHQ==
Date: Mon, 1 Jul 2024 14:43:41 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hid tree
Message-ID: <p3uo2zzvqgw5ym6dmbmhqdhjv2xgkocwcaulqmrunen3mgalge@2clqixaxpar3>
References: <20240701185104.52c159c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701185104.52c159c1@canb.auug.org.au>

Hi Stephen,

On Jul 01 2024, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hid tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> drivers/hid/hidraw.c: In function 'hidraw_send_report':
> drivers/hid/hidraw.c:143:63: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   143 |                 ret = __hid_hw_output_report(dev, buf, count, (__u64)file, false);
>       |                                                               ^
> drivers/hid/hidraw.c:154:56: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   154 |                                    HID_REQ_SET_REPORT, (__u64)file, false);
>       |                                                        ^
> drivers/hid/hidraw.c: In function 'hidraw_get_report':
> drivers/hid/hidraw.c:231:56: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   231 |                                    HID_REQ_GET_REPORT, (__u64)file, false);
>       |                                                        ^
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   67eccf151d76 ("HID: add source argument to HID low level functions")
> 
> I applied the following patch.

Thanks a lot for the report and the proposed patch. I've just finished
and published[0] my own version which enforces a u64 in the end. It's the
same approach that can be found in the kernel/bpf/helper.c file, which
is IMO slightly better than yours.

I think I'll apply all of the series[0] right now so you can drop this
patch below from your tree.

Cheers,
Benjamin

[0] https://lore.kernel.org/all/20240701-fix-cki-v2-2-20564e2e1393@kernel.org/

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 1 Jul 2024 18:36:36 +1000
> Subject: [PATCH] fix up for "HID: add source argument to HID low level
>  functions"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/hid/hidraw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
> index c2396916cdaa..34633f99f3e4 100644
> --- a/drivers/hid/hidraw.c
> +++ b/drivers/hid/hidraw.c
> @@ -140,7 +140,7 @@ static ssize_t hidraw_send_report(struct file *file, const char __user *buffer,
>  
>  	if ((report_type == HID_OUTPUT_REPORT) &&
>  	    !(dev->quirks & HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP)) {
> -		ret = __hid_hw_output_report(dev, buf, count, (__u64)file, false);
> +		ret = __hid_hw_output_report(dev, buf, count, (unsigned long)file, false);
>  		/*
>  		 * compatibility with old implementation of USB-HID and I2C-HID:
>  		 * if the device does not support receiving output reports,
> @@ -151,7 +151,7 @@ static ssize_t hidraw_send_report(struct file *file, const char __user *buffer,
>  	}
>  
>  	ret = __hid_hw_raw_request(dev, buf[0], buf, count, report_type,
> -				   HID_REQ_SET_REPORT, (__u64)file, false);
> +				   HID_REQ_SET_REPORT, (unsigned long)file, false);
>  
>  out_free:
>  	kfree(buf);
> @@ -228,7 +228,7 @@ static ssize_t hidraw_get_report(struct file *file, char __user *buffer, size_t
>  	}
>  
>  	ret = __hid_hw_raw_request(dev, report_number, buf, count, report_type,
> -				   HID_REQ_GET_REPORT, (__u64)file, false);
> +				   HID_REQ_GET_REPORT, (unsigned long)file, false);
>  
>  	if (ret < 0)
>  		goto out_free;
> -- 
> 2.43.0
> 
> -- 
> Cheers,
> Stephen Rothwell



