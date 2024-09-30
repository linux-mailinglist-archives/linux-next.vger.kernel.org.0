Return-Path: <linux-next+bounces-4020-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275E98AEE1
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 23:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E8A72810FE
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 21:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF3A19DF4F;
	Mon, 30 Sep 2024 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzmYMmCO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E2A194082;
	Mon, 30 Sep 2024 21:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727730740; cv=none; b=SDEkds/wOoSDar77RCd5xfdzQW/tTvQKsXnSMrfBYpBPvPXr3CUMFUx0rsq+fDEN8dEyqlWiFGHYcsPlfYhNh0XIWaXYsJk3uTCq9T7AZlYjUFttHNvP85/Z0lGgDcwHOKNvNp2QIEJ/VW/5+3GMZPLUYtAsXYE5PsKJl8ypGV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727730740; c=relaxed/simple;
	bh=wJt/gNhZOVUZn/ldhidYmAiLYa/vVZmwQyMqc/NyBZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bX/GhfMGIzzs7h+qhzIwds0a8uOottOHGX8D3KixF6py8K2suo7KRj+xzofs2zxNQhxotrgTNl7dsnHybJH2jgE0ThC5N51W6FflGoGwxN2WKbe6BZApgzD7dPIdl+hdfd7b+s7hSv5LzAzgGt8TfrgkEWl98gpwh9vm+4qb0tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzmYMmCO; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2870ce5e9e8so1934938fac.3;
        Mon, 30 Sep 2024 14:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727730738; x=1728335538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tYtVStWV0qOXMgZPurFt8IgwQdmY6A/VuPkiOVua5zg=;
        b=bzmYMmCO/g4t4byHwoHF0YJplROLm1Ze37x7xuiKyDVm7hsjZEmoAdxXocJK+Xtg35
         dfQyz1xNwPNAgDQwEsCr6GsPrEO0RePnzf4qSJF6aYNj3ZSBH0FD+E0dRXZnM6NjIYBf
         dHs061d1mNHS1qIFXbuLFsr3Jfu4iZegsS8FP2VMxxKgmkZ2XQiFF40sOTlpJCHoPLr/
         PNSFNITUwbgKsZUwKakCQM2vHySq/DYvJeT4WXOP6P3lA+VziXZ+Fp/Umb7qQE5DpN2o
         S+3q7hcXBqHmLBVVJMh7+PgioVQbfsce3rhYieR6lQ8nwdBxB9r7fQ+9LwngGQFsufWr
         RgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727730738; x=1728335538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tYtVStWV0qOXMgZPurFt8IgwQdmY6A/VuPkiOVua5zg=;
        b=N91pjAUMo8z7s6TSHICx11tnNlVWHHXuKlDfHTiceM4dbRSQXUWwnV1aTsGMtpW4rY
         KOeEHRoS+Q/d0I36MIuJr2zA87lgi134j2olf/jm2JSnjmPUEu8oYBWwpAYprBQZBHZ0
         n63OEVipTY6fCsW/yQAn+kdABYcUpcgyqv57QfmEmAhXqk7LpGAfPHigLIDJ3IJ6Gd2J
         +MnNmqzROKY4gBIx/5kd16uQnruAYP3+xkNHy68J+lUm8n5sxh+fgEeP2i8Aa6MhLs+9
         0Xdv1z6wTgnF+CS4ZisP9WN/1NlJDF2GwLBKk0S7HsT08mAFues21W1R3phDEsPNGNst
         PZRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUma36Z1Pd3a5EjaSuE3t0X/MwEV3qa+NBSj8WSXpf6RrDHKXqC7z/dCX8jrwoh7CUFeT/G0cHdhV1bVA==@vger.kernel.org, AJvYcCX7H4bn19F4Q9K9yUE+QGRl9MPxN1IuObAiFHG5lJJ2GcnCUpDDsXBVKyMWQDzFjtS7rQNnIix7iDpbgzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb38S76jM1++4Fs7d/ddDdDOJsV0c9Lkdpdms+imC/PlGc68nh
	gaFEJkT+iA2t1AbRWP2nIbIGqn8ZejQM9kqKUX0YB/OdCb0H2Iap
X-Google-Smtp-Source: AGHT+IE1i/ztyLPOK5IOme+amI57KyrfldXRFMK3LKB3Kd7NGiA+37jZ2ZRyNK9acXIy0ZbG9kSb9w==
X-Received: by 2002:a05:6870:3281:b0:277:d16e:1425 with SMTP id 586e51a60fabf-28710ab1749mr10818249fac.20.1727730737700;
        Mon, 30 Sep 2024 14:12:17 -0700 (PDT)
Received: from [192.168.1.224] (syn-067-048-091-116.res.spectrum.com. [67.48.91.116])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2870f9c803asm2977250fac.55.2024.09.30.14.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 14:12:17 -0700 (PDT)
Message-ID: <f4547877-8aa2-45a0-b05d-624eb4e2d296@gmail.com>
Date: Mon, 30 Sep 2024 16:11:55 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hung tasks on shutdown in linux-next-202409{20,23,24,25}
To: Bert Karwatzki <spasswolf@web.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Tejun Heo <tj@kernel.org>
References: <20240929105329.4797-1-spasswolf@web.de>
Content-Language: en-US
From: stuart hayes <stuart.w.hayes@gmail.com>
In-Reply-To: <20240929105329.4797-1-spasswolf@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/2024 5:53 AM, Bert Karwatzki wrote:
> Summary: The introduction of async reboot in commit 8064952c6504
> ("driver core: shut down devices asynchronously") leads to frequent hangs on
> shutdown even after commit 4f2c346e6216 ("driver core: fix async device shutdown hang")
> is introduced.
> 
> I did some further experimenting (and lots of reboots ...) and found out that
> the bug is preemption related, for me it only occurs when using CONFIG_PREEMPT=y
> or CONFIG_PREEMPT_RT=y. When using CONFIG_PREEMPT_NONE=y or
> CONFIG_PREEMPT_VOLUNTARY=y everything works fine.
> 
> Test results (linux-next-20240925):
> PREEMPT_NONE		20 reboots, no fail
> PREEMPT_VOLUNTARY	20 reboots, no fail
> PREEMPT			3 reboots, 4th reboot failed
> PREEMPT_RT		2 reboots, 3rd reboot failed
> 
> The behaviour can be improved by increasing the number of min_active items
> in the async workqueue:
> 

Thank you for continuing to look at this! That is interesting data.

I see from an earlier message that drm_atomic_helper_dirtyfb is holding a lock when
the hang occurs:

> T115;4 locks held by kworker/7:2/343:
> T115; #0: ffff91ea00050d48 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x4a4/0x580
> T115; #1: ffffbaf182e07e58 ((work_completion)(&helper->damage_work)){+.+.}-{0:0}, at: process_one_work+0x1c7/0x580
> T115; #2: ffffbaf182e07d00 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_atomic_helper_dirtyfb+0x47/0x280
> T115; #3: ffff91ea13b80528 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0xbf/0x1b0

Except for NVMe drives, the shutdown process with the async shutdown patches should be
the same as the shutdown process without the patch--that is, the devices should be shut
down one after the other, in the same order... the only difference is that the individual
device shutdowns are scheduled in a workqueue where they wait for the previous device
shutdown to finish, instead of being shut down one at a time in a loop in the systemd
task.  So I'm wondering if the async shutdown could somehow exposing some sort of race in
a display device driver's shutdown function.

A full CPU backtrace (which you could get from setting /proc/sys/kernel/hung_task_all_cpu_backtrace
before reproducing the error) would be extremely helpful if you have the inclination... :)





