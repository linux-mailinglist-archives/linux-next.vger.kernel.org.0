Return-Path: <linux-next+bounces-4377-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFC79ABAE1
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 03:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5B91C21465
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 01:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A9C20328;
	Wed, 23 Oct 2024 01:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="T4d4JAlc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C6E29CA
	for <linux-next@vger.kernel.org>; Wed, 23 Oct 2024 01:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729646059; cv=none; b=oGmL4Fnz5rB0J+q2MNqHT+E0qMWSotH4kaOCVYzlbXZU6XsH9Fxx+MNCS7v2hvt/s88UD74ymlu6ZHDOxrfybiSZpOdIa2p+XV/1mrcQHaECLNT5WzjfPPcVyhBuR2qNm8hfVVcUOiKO2gBv7WIhdvUw1h7YJBdqwQNi5XEFPm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729646059; c=relaxed/simple;
	bh=i/fb2TGN/0hbxeCo+vsMA3TOw8xxxeaJTm/6ddVBNT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijD+uSuU2a1SQ2xYqBIJS8fRVL/AGSpP5em5zXacRgaPTBxqGOwogz+IscT5IBs1D2K6Os1QbO5HUlH52IqBJatSlQ2Re1qAM1M+lTWX7qT1QTTr1SQ6clydR2w0PFJDSfsHwL4uS7w2GgGcR2jy2JKmcvNxQS8rrQXFRai49GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=T4d4JAlc; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-718186b5c4eso2317827a34.2
        for <linux-next@vger.kernel.org>; Tue, 22 Oct 2024 18:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729646057; x=1730250857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBMX9XSvCTqxyEsI8dGZy5i0R+AMQRgfKJfND5aCkw8=;
        b=T4d4JAlcOsrPhyPyQyRnURh9a619F86BYZHueDmqLBrnyGUCKm+SsJXl/LCA0frI66
         e5y7n6oCPfXQpFzQ+qubck7TfO89T9VBua5SJK0EJ1HdUBcJwSRFJbBSf/nuPrVSFQAB
         Ymr602jvbN+0rzaVksnaz2LB+xZ21SN6IPqDdlXfRNhvLqO76bMs9AhUWIiouSWubdAW
         FdSM257e5YIYf12JJ/4RSVinxElFIerJkNwLrlWWs1mgQFW5fWVyBdbbisES7lMbwy98
         ZTQptX0H/cTN1lkrrabW1Y+sSukdJ4MbCJIDgAOmOIiPhvRVXChQ+DyXeqz/tA/wucnf
         ZOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729646057; x=1730250857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBMX9XSvCTqxyEsI8dGZy5i0R+AMQRgfKJfND5aCkw8=;
        b=vrcXFSgOOwPkIo4kwI4xX1UnDgJWoVrcSP8wm+t2PpefJRsXxa5VKJdLhwdmrL9JUx
         T1RkuFI1FbmhG10xvFBhJv+bNEFpfeu4Y0hhMSfpsMeEIA0/DdxjvF2qUCdpWKOV2031
         VkBxbePy0kTN7KOt8WBrhdK0ycBFaFqsJbf+Ym7dfPiKikjXO4maM5c9S+jkF1z2kN4G
         tqHAyApkF/07zlCb2d+C0o3+34i4K+S83emnWZKvpJJKAAJ226JhmgFdqK4aPG2JNuiI
         HnldP9El+PWBrtOAy+Lv+J4EQLXK8eO0OgVH+7FAnIURrcQhbaklpxFN5jeRI6lSKsMZ
         KR6g==
X-Forwarded-Encrypted: i=1; AJvYcCV/Nf9TqneWSe3s0gDC1oDxT37Bd9/I2y/VYZrudXOcDiElLtjxuXdhaWDxQB97Eq9aexUL5Fh7fqnA@vger.kernel.org
X-Gm-Message-State: AOJu0YyVl6vGCWU0aEk5fK1y2JZ1P3WNBu9YGTlJhsmGV2F+asprjr2V
	04htk0vokrQI8PI3QzWN0XAyD9zh0uSMU7/x4EN03cthSx7BD+ijaxSuqnS61X0=
X-Google-Smtp-Source: AGHT+IGzehqz1HMkN16yEyr/3tx8KtWHL5vnppeJytoAc9iw8z0cLNNK5rz78JbRhFQy3v4j1i1O4g==
X-Received: by 2002:a05:6830:3494:b0:718:1957:4b88 with SMTP id 46e09a7af769-7184b2a8017mr1021273a34.2.1729646057222;
        Tue, 22 Oct 2024 18:14:17 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab1dc6bsm5693234a12.23.2024.10.22.18.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 18:14:16 -0700 (PDT)
Message-ID: <8d057adb-c7e4-4324-a963-7fedc40ceed5@kernel.dk>
Date: Tue, 22 Oct 2024 19:14:15 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Bart Van Assche <bvanassche@acm.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241023095914.61b9eafa@canb.auug.org.au>
 <7aaf90a8-4734-4819-b29c-42f8f8b857ac@acm.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <7aaf90a8-4734-4819-b29c-42f8f8b857ac@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/22/24 5:31 PM, Bart Van Assche wrote:
> On 10/22/24 3:59 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> In commit
>>
>>    6fbd7e0472b7 ("blk-mq: Make blk_mq_quiesce_tagset() hold the tag list mutex less long")
>>
>> Fixes tag
>>
>>    Fixes: commit 414dd48e882c ("blk-mq: add tagset quiesce interface")
>>
>> has these problem(s):
>>
>>    - leading word 'commit' unexpected
> 
> Jens, please let me know if you want me to post a second version of that
> patch.

I fixed it up - for future reference, I recommend adding:

[core]
	abbrev = 12
[pretty]
	fixes = Fixes: %h (\"%s\")

to ~/.gitconfig and then you can just do:

axboe@m2max ~/gi/linux (for-next)> git fixes 414dd48e882c5a39e7bd01b096ee6497eb3314b0
Fixes: 414dd48e882c ("blk-mq: add tagset quiesce interface")

and get the correctly formatted line. Whenever people try and
make them up, they always get it slightly wrong.

-- 
Jens Axboe


