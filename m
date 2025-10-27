Return-Path: <linux-next+bounces-8715-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D6CC0C54C
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 09:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A40B83BA864
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 08:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97AA39ACF;
	Mon, 27 Oct 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="p/rNVq55"
X-Original-To: linux-next@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF82E8B76
	for <linux-next@vger.kernel.org>; Mon, 27 Oct 2025 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554202; cv=none; b=VY/rDPHB212F7AAg/kFAwCOEzUYI2rFCGpgO9k75vuNJ47vJChvqCquYyWdIch4OG9ZGCITdgarqcl18t/Q3fZrL9zb+nNll+2ww2AbocC4M7SSdDVBXgM6g9MoUNKqFJKlL/TpS9xcY2E6mmEy70Bn/wPOjNeFpw2NHzzsOmcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554202; c=relaxed/simple;
	bh=OHJoJm1w9nF6f+uXWZekSb2w4XxFMvVh6TIEKNomyvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=PQ8Fr8mmf8j68CrF6WN3q351dh56WZxjupE2B1wx/1Rh4/tUcu3ZYW2cDVzh/FrTB/35JyjVNwG6i07ijpvmf+cwHFVouEVNxSZ3lVTyIMTrles9UwT4L6rxlKJfgdcwPB+MYWIOk8vfJFpx8vakyDqPdoIaH6eYCgHVbeId2+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=p/rNVq55; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251027083633euoutp014e8fe6c4871f63c5dca103af3ca02a54~yTDSfWeVs0049400494euoutp012
	for <linux-next@vger.kernel.org>; Mon, 27 Oct 2025 08:36:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251027083633euoutp014e8fe6c4871f63c5dca103af3ca02a54~yTDSfWeVs0049400494euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761554193;
	bh=GDGC8uUu63JMe8QRZvn607R80kUDIHwPrRJNpeAHqEM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=p/rNVq55LrUzibYQ9+OQV5ZpJ8wb7/IwdFL2Tt4jeSfsN4FO1/mrboCaRvwWhvq6N
	 AOxv6+boN3SRN95PR3AxqE1W4Ykvau7q3tKgaiGWSl/ylH/OBecOY8GeXeEBAbHMM+
	 SS1KTFKq/d1SCHycEhbjAl9xUbpRiSsnMCUf5Z2M=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251027083632eucas1p22bb444c70987522a5601a2c2725199cb~yTDSOTEYo0953409534eucas1p2g;
	Mon, 27 Oct 2025 08:36:32 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251027083632eusmtip18ae16c04c9155f397db1d7adf1c68321~yTDRyZLbN0599805998eusmtip1Y;
	Mon, 27 Oct 2025 08:36:32 +0000 (GMT)
Message-ID: <b81e9451-f363-4adf-9b20-e2e9bb55b92d@samsung.com>
Date: Mon, 27 Oct 2025 09:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the pwm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>, Peter Colberg
	<pcolberg@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda
	<ojeda@kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20251027125148.7f7d8ed6@canb.auug.org.au>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251027083632eucas1p22bb444c70987522a5601a2c2725199cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251027015241eucas1p1784b974d0c150e8c3513f32401205669
X-EPHeader: CA
X-CMS-RootMailID: 20251027015241eucas1p1784b974d0c150e8c3513f32401205669
References: <CGME20251027015241eucas1p1784b974d0c150e8c3513f32401205669@eucas1p1.samsung.com>
	<20251027125148.7f7d8ed6@canb.auug.org.au>



On 10/27/25 02:51, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pwm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> error[E0277]: the trait bound `core::result::Result<core::pin::Pin<Box<Th1520PwmPlatformDriver, Kmalloc>>, kernel::error::Error>: PinInit<Th1520PwmPlatformDriver, kernel::error::Error>` is not satisfied
>    --> drivers/pwm/pwm_th1520.rs:331:10
>     |
> 331 |     ) -> Result<Pin<KBox<Self>>> {
>     |          ^^^^^^^^^^^^^^^^^^^^^^^ unsatisfied trait bound
>     |
>     = help: the trait `PinInit<Th1520PwmPlatformDriver, kernel::error::Error>` is not implemented for `Result<Pin<Box<Th1520PwmPlatformDriver, Kmalloc>>, Error>`
>             but trait `PinInit<core::pin::Pin<Box<Th1520PwmPlatformDriver, Kmalloc>>, kernel::error::Error>` is implemented for it
>     = help: for that trait implementation, expected `core::pin::Pin<Box<Th1520PwmPlatformDriver, Kmalloc>>`, found `Th1520PwmPlatformDriver`
> note: required by a bound in `kernel::platform::Driver::{synthetic#0}`
>    --> rust/kernel/platform.rs:196:15
>     |
> 196 |     ) -> impl PinInit<Self, Error>;
>     |               ^^^^^^^^^^^^^^^^^^^^ required by this bound in `Driver::{synthetic#0}`
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0277`.
> 
> Caused by commit
> 
>   fb3957af9ec6 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
> 
> presumably interacting with something merged earlier in my tree.
> If someone could provide me with an appropriate merge resolution, I will
> apply it.
> 
> I have used the pwm tree from next-20251024 for today.
> 

Hi,
I believe this would fix the problem:
diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 0ad38b78be85..dd554574adc8 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -328,7 +328,7 @@ impl platform::Driver for Th1520PwmPlatformDriver {
     fn probe(
         pdev: &platform::Device<Core>,
         _id_info: Option<&Self::IdInfo>,
-    ) -> Result<Pin<KBox<Self>>> {
+    ) -> impl PinInit<Self, Error> {
         let dev = pdev.as_ref();
         let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
 
@@ -365,7 +365,7 @@ fn probe(
 
         pwm::Registration::register(dev, chip)?;
 
-        Ok(KBox::new(Th1520PwmPlatformDriver, GFP_KERNEL)?.into())
+        Ok(Th1520PwmPlatformDriver)
     }
 }
 

This is caused by change in fn probe, caused by this commit [1].

[1] - https://lore.kernel.org/all/20251016125544.15559-1-dakr@kernel.org/


Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

