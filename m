Return-Path: <linux-next+bounces-9339-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0228BCA5A3A
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 23:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FB9E30F7E94
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 22:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F1532C94F;
	Thu,  4 Dec 2025 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="LUViUrmq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22D2E1730
	for <linux-next@vger.kernel.org>; Thu,  4 Dec 2025 22:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764888276; cv=none; b=Kkf3P91NbJ6bQz3+qIqo3aFKRMG0qZwzU/GkwdkkHmYYQNixqSGZAvdihufiLCIn/8lUC/motUyUi+wAlyrkk52rXFMPFeOxGRxoo0ot47tAu9hppnbDapKFCrx4/5bOyKQFo48KeKSBIUryC24dUiITE9oo41BRM0poD09HQnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764888276; c=relaxed/simple;
	bh=bYWm1GFzUk1QgWAnsA653nNK/YCXbyDnkU+Vflu2/0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVnrldhSg6TOuyBXW5ikbw+P49yFyE6e+jsuNIOZ2Z1D2M8T5Iw6rBL7YOH+22SNBKFNO631LhSyT22fvr5CkmgIpCXl4kH/HKTNUVK7qxdkXmnl3RS4ck90WrpG9xU/BZaVUAu2rMFV0bzQRMMfT/umMtRnXSmByaNCe8rs78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=LUViUrmq; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-3eae4e590a4so699258fac.1
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2025 14:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1764888273; x=1765493073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93Q2ycDF0H/A5tkS4HU6XkHJjwsAZ47t4WJfES3tsHo=;
        b=LUViUrmqStmVqpH2UVNoL67hguQxcrkzN8kndKrgAQcuCr6bxH5UpW+w/DKr6WSYaj
         dNbXLy6BuX0v4O/FvZ5q9NbVKjl/ZJcFnCiWhLocVxSavHwEDEM82rqn3T9Ugj50Ap3m
         oB52UOk9z0AvQ98oLZGVCvSQR2P0lrw9+x+sVuim2FlH92POIb/bh08D78CUHfBjGkV7
         E8Fu4hRckR3qRBnaAiJzqsPZo7lntC491SO85/oJhszPdlYNSukZDJ0bV+862jw7+99P
         JsXVpTd09DRclGAFcaIMe/fqIwPJUGxFLAj16zZDpB5HE55zwyeFpkBhPqUNL2JF88Ug
         OLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764888273; x=1765493073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93Q2ycDF0H/A5tkS4HU6XkHJjwsAZ47t4WJfES3tsHo=;
        b=J3ia17XL2/3h8ZOlqZP1mH7VsI5Mh/2LJlzFcuqFdugMYF4ZL1UW6WUZ+cOloHjH6Z
         xCO4HPktzGHbAqRIG5AHE3pIT2cA1fSOUKyfvO4bcla3akiqSxZGf3+C3Cy09cvQ90aV
         RnM0IaEFFEuVbmekOZslI5TD0D/oAUu6jfkHmsWjtwKPsLHYXYGJxWjDsqq9G2KpCCbj
         mzWTwRuh09WAxbAgv11pNBq9BO1SGVuAwimpzGIygQRUTmrbuQ84z2uTBoMEjhF/ksrM
         0BxvLjSf5wLZ6GfySMU40HXdI7tbO/KACYzKBqolBXA9fteiSpWn+NqxeU0SHanvJyjZ
         /mjw==
X-Forwarded-Encrypted: i=1; AJvYcCWl5B9DL8dJmuoU6jRdno/4hTxSTcCyP65VMKHAB4ktYBnXy91ztmOp5/qzuHUAYf3K0Yd3jYQW1Hhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+SNeGKsIDLw5PJIrjTvfHubgEmQppnCzPEPlvWu9AainQSeB2
	NJN0G7HIhMZnjGLPSXHYezDX5Qsgksw3S/EosdcRjRQWLJABhKTBqlXfVO1OQo2o1/RgStywZfh
	sasiwVcs=
X-Gm-Gg: ASbGncvCBnJVXSpdfFXNMFu9oBCjq3LJ36i/lrPCmIH30QT9ds7vvplgdmSv9P1oroy
	ZB4XkX5j2uIPyboIQdXFCXGd6zPxBiNjdrJ29fDwDox4jLbf0CHie71QDDyT/pVfd2wBAvigeqe
	wppZ3Ohp4+Tlz27ciisS016wNZUi2M/meA02yff2ac6RHLHWetNXv48xfm3yEGWX0HmRq5t9bI8
	cRqW8ggQ7dC91Gk8vWSLywRQPl+cNYuaVxuvTWO9YmutrcvCt/6huqAHSTuKcOW4Tj/yu63fTAQ
	j9VTl/O+x4suWICV5G/xJB8KCtnkBnA0bRXXxmnIW+QHLNnl2u6lx3JpREo+9F/p1tVXweB1I9c
	uPDOqsqwHUZX0vLGSw5J5uS/G0HJXBTaYOuByNmX4QjkBZewVL+RS5iVC+GPUvx74nRtczNB6fM
	YHoKikj+m2
X-Google-Smtp-Source: AGHT+IEgBNMtqrKvQCP8Ex/ODbIIpN4uazCSRtzQ2bx4zWlnWAy7eytkf11z3e5mjibz2fTyBcTpQg==
X-Received: by 2002:a05:6808:1df5:b0:450:b1a9:e7a3 with SMTP id 5614622812f47-4536e52e723mr3314111b6e.42.1764888273385;
        Thu, 04 Dec 2025 14:44:33 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-453800cb61esm1290825b6e.14.2025.12.04.14.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 14:44:32 -0800 (PST)
Message-ID: <22d2c50f-2011-453a-a7f0-8cd59a6b3043@kernel.dk>
Date: Thu, 4 Dec 2025 15:44:32 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: shechenglong <shechenglong@xfusion.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251205091900.0dbcbe4a@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251205091900.0dbcbe4a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/4/25 3:19 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   4ce1aeacddb0 ("block: fix comment for op_is_zone_mgmt() to include RESET_ALL")
> 
> Fixes tag
> 
>   Fixes: 12a1c93 ("block: fix op_is_zone_mgmt() to handle REQ_OP_ZONE_RESET_ALL")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

Since we'll re-do the nvme merge, I'll just fix this one up in the process.

-- 
Jens Axboe


