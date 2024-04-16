Return-Path: <linux-next+bounces-1951-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91C8A7960
	for <lists+linux-next@lfdr.de>; Wed, 17 Apr 2024 01:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A88A284CBD
	for <lists+linux-next@lfdr.de>; Tue, 16 Apr 2024 23:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2D513AA2D;
	Tue, 16 Apr 2024 23:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eKuhO5D7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8603F13A3E8
	for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 23:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713311649; cv=none; b=paq1ILxTNgyIUzSKmOHrc+tT5oMWu3HiSOL9j+M/EqqMhqQYBN+zELHTDdmm3PYo/YxUc8fLwboMN5pNS1C4HYwG9yMVj0f4pkWGlyJbCJC4cTnxCgpgR3EMv/2aanx1B1AZfc3a9OzsT2Bqw+tm08BhEFTbrFgsh9XKrBULmpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713311649; c=relaxed/simple;
	bh=lELwXqX2GnBMmAHfLBmNlByJmdmG/bVTILIylDcO+sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHIN5Ug4XlwdbD/I9AYldd48Bb/zf9OOqCe9mxTwrOvLX3zs+2zf4S02B/IUZkNR0EFtG6EU/EIUnw113ltcbGQ8LI66V5DTrSAJnzYtQ8hcWnClBEWeFTHQflIpRvycLmwb3shBBubIc570QmVWLJiXt4IY/GCcNcKD71mOE3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eKuhO5D7; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ea0a6856d7so1590457a34.1
        for <linux-next@vger.kernel.org>; Tue, 16 Apr 2024 16:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713311647; x=1713916447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TR0TEYbFqb6c5b6HzlrOARuCR9bvnLhVJNRPXv/Uaxs=;
        b=eKuhO5D7NVn72l1tCE7RCzD/rUsZvcYyMJQfwJqLEZebFqp+49LbN5ZSV3euBbHikF
         3DJXX6vQjbW6r1osZKpWfI0JcEDY04hpWAcz21ALUw6oRP3NkAEXlyZ+MJKXWlV9ZhCU
         m0FvX21gH4jfmfPXX3TprnV1ulpwdOeVFSfnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713311647; x=1713916447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TR0TEYbFqb6c5b6HzlrOARuCR9bvnLhVJNRPXv/Uaxs=;
        b=DfobJXTac50+xV3YRWQTDa6/r1UmynjVAcMUSsZP0OMFYak4ZhgMr5BR40ahZHYv8O
         xwkYfBu+mbcrHqHTXVKI20gTazzUA11rnxCuJS+J6LG1jHukNsWbH6IqQjmGkvprpRdE
         TctH+7U0bywhIhVmE/nohXyiYezp+dbnXuFU/bh8UB9BvfaJ7WZl5ttpILbEGJXtsiDT
         QofIb8Ip8H7Kilmmzwv6/Zyy41VDpgG9+EiV/8BAhq7S4UYn9wlwDosINr8l1ww5XSOt
         CTqE5YROaDUD8by3YrAeutNZrPlv9JA6+NNeyFNH7l7OCHCTipCDl4IEN45KCuuzDGAb
         bMQA==
X-Forwarded-Encrypted: i=1; AJvYcCVms5fPpSVcgOHuDwWbZDbJLnNyToHiouKyb83MzQL0Bp8lmEhlnE/r5SpoNu8ZRQdBbAt847ZZd29i2brnBtDm/z8fds18pqrJSQ==
X-Gm-Message-State: AOJu0YzyxHZsjqbs1xjZ/AQq1509CdVTnNB+J1sCf6pVlIJthj3ZmwQQ
	4tW4DxgPniheDoJ8Gur7s68HojE4eaTcICX5Nq1I17mMH7l/Mrz+4Frwy9UsWaE=
X-Google-Smtp-Source: AGHT+IE0deEqv8RHKhl0RXyrVo47Iv1fvvJ8qSc+8jrpMU3Gj5qxW82X+IK0E4xoncbed3xqI33B5w==
X-Received: by 2002:a4a:bb18:0:b0:5aa:14ff:4128 with SMTP id f24-20020a4abb18000000b005aa14ff4128mr14940743oop.1.1713311647605;
        Tue, 16 Apr 2024 16:54:07 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ay27-20020a056820151b00b005a47a6b8f67sm2795689oob.29.2024.04.16.16.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 16:54:06 -0700 (PDT)
Message-ID: <69d0c6c6-ed82-410c-9102-09ed3b95ae05@linuxfoundation.org>
Date: Tue, 16 Apr 2024 17:54:05 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kselftest tree with the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: John Stultz <jstultz@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240412155545.7b8ad20b@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240412155545.7b8ad20b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/24 23:55, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kselftest tree got a conflict in:
> 
>    tools/testing/selftests/timers/valid-adjtimex.c
> 
> between commit:
> 
>    076361362122 ("selftests: timers: Fix valid-adjtimex signed left-shift undefined behavior")
> 
> from the tip tree and commit:
> 
>    8e222dcf92a8 ("selftests: timers: Fix valid-adjtimex signed left-shift undefined behavior")
> 
> from the kselftest tree.
> 

Thank you. I dropped 8e222dcf92a8 from linux-kselftest next

> Slightly different versions of the same patch (whitespace differences).
> 
> I fixed it up (I (arbitrarily) used the former version) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 

thanks,
-- Shuah

