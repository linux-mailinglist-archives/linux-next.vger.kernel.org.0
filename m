Return-Path: <linux-next+bounces-6461-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D4AA4923
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 12:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAC1C189DC93
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 10:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1187F25A2B9;
	Wed, 30 Apr 2025 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DG4fGBLl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7225A333
	for <linux-next@vger.kernel.org>; Wed, 30 Apr 2025 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009760; cv=none; b=OErdul0XV0KaIioDUPu8eNr8tCVxigHx9KOdNkmr8BdY7a9v/lqKGNhHwWro3Mq6S3ErryQdbV+aO1zY0kjxMpAgvC6eIdrZ2HEqqSgk8lmSpSchrjh4YaYyXckYBZ+MuyYFBoBsGn1/in/jt0VB/DrGCZ/z00Csyi1Fa5cJfYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009760; c=relaxed/simple;
	bh=JlLvldGIfDbHrnB5LrDceGt+7VtfTDEk9EgBP//rGyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nc4dtUaRiNEbclKscAgPkZU4zgQOdoJ/iHiedH8WGg8wd7OIdY+MnMdCN/T3/sUxK1wQvdJmUoeVORAuhm6Nu/1G4Qs8WQJ0m/XjIBP7v11ckJSlXoYTFCHzk78lOTyLYxl8eByRv4Wu9uKNQKNjWjacJnx3We7IsgGNZa9Lj1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DG4fGBLl; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736a7e126c7so6521547b3a.3
        for <linux-next@vger.kernel.org>; Wed, 30 Apr 2025 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746009758; x=1746614558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4gl3XU8JoJn5dwDW6OC+cxv1hib4kwdH98QGnhy+dmg=;
        b=DG4fGBLl7XAHMyiYPRpIQw1pTKIAMhdsH2z9e8JvuFys7Ef9CzDIf/E3Z7+WiC9rdJ
         ojseM2Zk8Gnz4fzcNUIGAbI87zJk2y/hjenhPCowerDToR4J8zqlcOo3G1V0UmwEIeZi
         wW2YR20mShYU4sEEye6A2DZRVlZs3bfPDfnQlEMCCggyvwjtNE37LUjRG+9OT16CQxKv
         nqlw3ckUUVo2bUALT5S80/jlG7TE92rmHQ1P366XHWdYvW3Hve5UI1XXVBCJiB0rkU8m
         eaWhEbVJtApin6MviF4HG8BvJSP+21nUfx6KofwMUPPvn1fbXa9W6NpWbMuOJMScvl9X
         y4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009758; x=1746614558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gl3XU8JoJn5dwDW6OC+cxv1hib4kwdH98QGnhy+dmg=;
        b=m5M/RCLFzPSnZbYoRN1ju+Fu0ZGJx6k4UmordqCYoZM/7sy2oieEbMghrEXqeChOKz
         5uEMIYvqjC9SbNX7PW2sykEVV38YSRQhLelyxMvOMoBwpLNpmMJUw2sf8lGAnzYRCQQp
         UwUyvTp7P9TSKTGXAcaBLgIDBTcxNXcNBS3pIfjzEm0zuZmWIXUFS1l3c4YtVVB99pmW
         W/aDWf2iphUEnRCmL+EaBpmYY06gM6rv9bdUDtmO3Byjvcnh15Zsph1dQUryTWJblfBG
         lV0ZJnh3+PYAfP9+YPL5D1RCh1CC/Ve3DXTIGlpioa5NJaMWYNx2RFqndcVBki7gUZxL
         kd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJXb+wqp7/CUY5O8x8ISF641vGiAMVGUAbMrCm4m2SnBKPQNA9Bu6FHq1+Vlq1rqxVtfLSARHjTAU+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhpn4t/NRBDEARtRrugN4nseNHL9LIrFltlNDRGBmD3/Xz2acg
	IvOd0Sh8eZxVbmeBCjStNRXFlgdnqL/H0gbdkuKZi9LlTChYbbwnRV6pDQwEWyY=
X-Gm-Gg: ASbGncvvmkef4jIiuc7Ui2akhJj0Pkol1F2Tli17rzidXuasR+mvYFPUCzy9sWtFFEF
	+z0ijDL8QiXpnVanw62wG+ZNtT5mSHEuvcdWN9GRZb6QZdL8gH1X8JR4LNTFFBOGSUP1mpREymi
	3lavB/ylGdwAIumnWf/Fy3dU9WzpLHZRtOyLzrfuthK25C/4OF8McUA5OqOrGFOujD/+2qE+/kp
	0LXdPtIO5ydPyqZB+PsZIlQWeWAVYEx0e7jsiRJzHVa/DN3mZ8aLIKzbT/4Ge6TMmzP5ZXwfcnz
	09GZ0nTQ8SXWf0lQhclc/JPcGLUZ6XXGg7zWLqwMHg==
X-Google-Smtp-Source: AGHT+IE5aoAUnm09kBy2axv3TvAAHpf075PJ6ak0Gwu1Lu258byCuGSU3Nwqt2mSHiDYVnppASvXrQ==
X-Received: by 2002:a05:6a21:8cc6:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-20aa457e4a4mr3055673637.38.1746009757697;
        Wed, 30 Apr 2025 03:42:37 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a9451csm1291575b3a.167.2025.04.30.03.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:42:36 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:12:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250430104234.dmwnn5ih232kfk4z@vireshk-i7>
References: <20250430202315.62bb1c1b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430202315.62bb1c1b@canb.auug.org.au>

On 30-04-25, 20:23, Stephen Rothwell wrote:
> Caused by commit
> 
>   a68f46e83747 ("rust: types: add `ForeignOwnable::PointedTo`")
> 
> interacting with commit
> 
>   254df142ab42 ("rust: cpufreq: Add initial abstractions for cpufreq framework")
> 
> from the cpufreq-arm tree.
> 
> I don't know how to fix this up, so I have dropped the rust-xarray tree
> for today.

Probably this:

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 49246e50f67e..82d20b999e6c 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -630,7 +630,7 @@ pub fn data<T: ForeignOwnable>(&mut self) -> Option<<T>::Borrowed<'_>> {
             None
         } else {
             // SAFETY: The data is earlier set from [`set_data`].
-            Some(unsafe { T::borrow(self.as_ref().driver_data) })
+            Some(unsafe { T::borrow(self.as_ref().driver_data.cast()) })
         }
     }

@@ -657,7 +657,7 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
             let data = Some(
                 // SAFETY: The data is earlier set by us from [`set_data`]. It is safe to take
                 // back the ownership of the data from the foreign interface.
-                unsafe { <T as ForeignOwnable>::from_foreign(self.as_ref().driver_data) },
+                unsafe { <T as ForeignOwnable>::from_foreign(self.as_ref().driver_data.cast()) },
             );
             self.as_mut_ref().driver_data = ptr::null_mut();
             data


Andreas, is your xarray-next branch immmutable ? I can rebase over the
change then.

-- 
viresh

