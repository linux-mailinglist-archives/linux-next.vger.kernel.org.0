Return-Path: <linux-next+bounces-8968-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5BC5A7D9
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 00:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76E324E854B
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 23:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905082EA174;
	Thu, 13 Nov 2025 23:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="q/rGNkI8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CEE2EBB8C
	for <linux-next@vger.kernel.org>; Thu, 13 Nov 2025 23:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763075251; cv=none; b=Hrpf3YzN+6AGclramZNHFizZF7I0MLy/QeWisB2MK7pdAfQcxXnX5uJweXuLkc2S2nFasc09vuuaFUq/f0pzeuH+4ccoOcx8c1zZRZFdmiyKuyJahiKCIaF+wHYy4WRmHZXslUEZHSZDQhe8GmAisSjDXByg/LjLaGetE58jj4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763075251; c=relaxed/simple;
	bh=nf0H1kppdKtzDoM/BsO5lJFn+BuqyCsIP6T8f/8jRkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2H5ynj7dlj5GVRjC3REPqRKdXPMWf1IVRELwx+rXpoRiVi+fZlbmHVYP7AssycF9YNE8dEaygHKzjvivuLsi6i+u5TrYlBE3DLUE6k75kchmjzH8SMR03FigEI88B2YqSjXw5cOdp18Fes/wDPt78mtquTDULeU5waRwUY+RqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=q/rGNkI8; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-9486251090eso58607139f.2
        for <linux-next@vger.kernel.org>; Thu, 13 Nov 2025 15:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1763075248; x=1763680048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HHpDhmqGuM5yiA0Fm9EChebQbNBURelVa116p/LmHL4=;
        b=q/rGNkI8Oaj3SWKltaq7ZxhtTEmrFQZalPVUDJRIGeb+aduQgeXC7UxIA+LbFZYwhq
         gYWnErgGowzpAie0EJpDopRVfCMowrD5tBLASpHCxw9+mjWcLj0zvhhjWwhjAFI+I/CX
         04vbwc7p5zh/36vZJgEIMDaTxFFYFd7oGqMWCyuOxagbbujLLrAWo/lrXFH7rgCjJEwc
         Br/XPOd5gdHFiDHzAWVgXf4XPpNqCnwbvdfLvdouiouSWevQXEYKRmEZptlGUFsd7+E0
         Jq9Tz9gVhhb/w4bwj6I2rRz/YH7u/1frMldW1BE3Ll7Gf6g8QW9i0u4t4VRNGOOSy4Zh
         PD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763075248; x=1763680048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHpDhmqGuM5yiA0Fm9EChebQbNBURelVa116p/LmHL4=;
        b=fdMmIEu93jRq1nk0K8ljCXeBKthRvESs7WyKwjAecS7cMYKiEKmDkGk1/i5KyNKkyb
         T9QeSt2nxzG+BY2kQKrIopAWGYWRS3ADadAmH/DlOHNj6gheOby5Ko+Iys+nV2tIaONU
         8JvCGcnpPAmCpEvPJVaAYwYgukvpOuVlWDh1ON4vk8L25NC1jdi9Lvnmy14ocfkL/mT5
         PpdHuVfF7Q6jLQNoaY3XaGoRuuw3869oeZqKb1sMSt/zJ5dv5XWbHHDO8wsdDVxGzHqd
         cBK8Sn+J8fbQP7sUMllZqEJ3yvt2XDYPVuO4qkLRTJjYiCWF4cmmDXB+TTF2CLY7UMIW
         uUYA==
X-Forwarded-Encrypted: i=1; AJvYcCU5JjxeDJHFmGIrElscXbn1X+ukq2qZLpdbF6VGhqXBED3mioY27wNdmEopCF3o5TINQEaek4iaMhx3@vger.kernel.org
X-Gm-Message-State: AOJu0YwEfau+pQZDSRqnjGFdY2mGm6iIH2XgQEdi6Z1GBW76MYXVhtUe
	qV/9agJ4NqT2JLsBxLdvSwUwyaCyWFSgc3KS4a21iC//q2K2oxOSu+iaCzytr2iMTYJI/NLGaDL
	rOokc
X-Gm-Gg: ASbGncursUz2+V7NMLQkaDghlz9Yu8NZnYGkmuIU6I+N+JodFFC1bUls9kQW7B/88nD
	lvENbXC0yPuGoIi+5c1ir2KdOhMz92FyNR2TNwEm3ooIK9EDI4gEUTzB9FdI49R2VqZtACsjIoc
	231lfDMjEoB/Y2S92CRLTIbEVZ1b8ICu58BezJNf0rcnZZiH87OBU+/EMZ3gx+kUvRriD/9B7xo
	K8r3nPQVJuvlGTY3AzeKdFMQXYTzjIHMnbr3Rcj5lZEqTxOrKjo2wH71DXF+IM2/82TOsP4Fizp
	/HqvzVOnlD8FR/tBwjsGWM2Ll6pbh2hRXrwdOdFcaJgccQl3B9zM1IONbanc89MrFOEK3AgI9Fc
	U9H8r127m4EMDn67qxvupLEQhlNqO+9QlCQe2w4Q2cGx8Z0k/QQ9fsv1PZ9673sTDf24XA3CLFg
	==
X-Google-Smtp-Source: AGHT+IG7lQTwHq9Mq76hvczjKYJHGRZNktitB0aDxW2Fbaryk9sQVNyf31AhVps5n6qHpNMFmj1XPw==
X-Received: by 2002:a05:6602:1246:b0:948:a544:154b with SMTP id ca18e2360f4ac-948e0d21c05mr138498339f.4.1763075248091;
        Thu, 13 Nov 2025 15:07:28 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-948d2bac8c3sm110162639f.9.2025.11.13.15.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 15:07:27 -0800 (PST)
Message-ID: <48eff55b-f100-4057-8ff3-1d4b2089533d@kernel.dk>
Date: Thu, 13 Nov 2025 16:07:25 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251114090436.2811f38e@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251114090436.2811f38e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/25 3:04 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   7b2038b1b1d4 ("dm: fix zone reset all operation processing")
> 
> Fixes tag
> 
>   Fixes: db9aed869f34 ("block: introduce disk_report_zone()").
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: fdb9aed869f3 ("block: introduce disk_report_zone()")

Guys, that's now three funky shas that have never existed in my tree.
Can we please exercise a bit more diligence in actually tagging patches
correctly?

Stephen, can't sort them out now, as they are deeper in the stack. So I
guess we'll have to live with these two as well... And I guess I really
need to get my scripts setup to catch these kinds of errors, sadly.

-- 
Jens Axboe

