Return-Path: <linux-next+bounces-4352-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CCD9A7023
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 18:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 878CD2812A3
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 16:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9541E570F;
	Mon, 21 Oct 2024 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="TZAnD6hu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7261E1C22
	for <linux-next@vger.kernel.org>; Mon, 21 Oct 2024 16:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729529580; cv=none; b=MBCwsgoLXhrqJb/gfhXqQqLrEgIpEZuV3J/uqc2jWTNXhSK6sjh8akUCk9c+dlL+O+KTBVArGqrHo5/p+GYrzmqvPwN+FKtYXVEATX6KWnYylqJStKLe6FwBrJHzD8I9aePUp8xREdTrxKCFd51IH/JlF4TU8CrG3KzVgRTSr8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729529580; c=relaxed/simple;
	bh=BpnLZMowJalrbQKUv23P7u9lcA6cVv0aDf/cLXF9Cgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHnGCIExiMSz5xtFuHqoeWJOodxvVrozNdktKSEffCAoypVA8Fq82/76d7tjMwHBDk7qNf0fAG1v5ID5+Y+WrEWi1LuGoioW5RzzseRfD1EY+XJCdU+aWhdfl/RzqaKAWxQgnHaBJGmglfjc4/H3VHr0lmfkRRIIVnfWsSS/kpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=TZAnD6hu; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a3c00f2c75so17051895ab.2
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2024 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729529576; x=1730134376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gfh0Sg6Ju5mOvFo4y0H7LztT2uP3kP9lZo3T9Q32ISI=;
        b=TZAnD6hum6zANwepzCGs8qvOY/7IylFC81kS7Bn4nzqAW6sqI38j6YkQ1BKExNYfjH
         aY1SiB7srX+JJoJuR6t1EGxI4+lQubnw+cZfSakh5f6ejzD0mWL3OhI9aqgwEAtmTdZj
         z0B5QMJxbJ8Rz/C+QOm1jI2cOBApXILlsJ30uEIfEBn1rJARR6to/VSDMe+7IsjpUQyj
         PSducra5Hv7zZxEnDJd3bQbgB1HOXCFn71/LEd8ZJx9jyKMV1ZZZJvAugcVEpDtBIA+0
         uHhFHrdKbKHYPLNKj4va40IgmmfFxIAWbyiPZAT5C5SJRW78kPme2xI7E6CtNeSZHoWf
         pD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729529576; x=1730134376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gfh0Sg6Ju5mOvFo4y0H7LztT2uP3kP9lZo3T9Q32ISI=;
        b=TcR+2O190BEvNR51bMLIT4tG2VIteedGI9IiVmvApzstBifD2JLLFe5LCmh3R3takn
         98+5zyCW0saq8/Fd0/6kI/Q/7G2MIC1AnQtix/i2qYaQc4xaAtYrLv1XMjN5aIAiAtlw
         A8KwJ3oM5LleZMYlXK77MnJFAFa86JB9DlBqFKTyFecjWgMAxkQvOCzMUfT2KEV3uu2Y
         SdEKAEqZ1OGQWGqMU+//qFEwGJwgQS9bS4gyJI7hyun5PXPMu2Gz1xAQ8PJV3UNHjbK/
         BwLHWQwh+la224ugpA0UKfi9p1zN8soWrVTF2rz136+h3XhNygRAEvWoCav2bg+1qhGp
         P8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlKHi0cTRfq44gE765Q9oStTSbXLW2Jtcs6WRws2qeE9TZbvm4WCgVhYmdT86g7/uFhhab6i3XSRKB@vger.kernel.org
X-Gm-Message-State: AOJu0YyJke/210znPEdCEwqd7Ba3jpQmEVGBJdXu2WPPiI+sOVtPopJk
	aby3MFqfxjHoncQCF95a2+1sQJmYqdvwR+uV9f7/VU6Kyi+PZ5SzVjfpnCTmK1wvuflu6nNLaHu
	I
X-Google-Smtp-Source: AGHT+IHgIdN+JiAiTnsRm5UTY+2lg8bIR9zHN/yKc4d9aueVUi/2xx+2pYTCq9c/VJYIUPz83ozKlw==
X-Received: by 2002:a05:6e02:b2a:b0:3a0:8d60:8b7d with SMTP id e9e14a558f8ab-3a3f4060bfbmr122347365ab.11.1729529576137;
        Mon, 21 Oct 2024 09:52:56 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a400b634d4sm12614975ab.58.2024.10.21.09.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 09:52:55 -0700 (PDT)
Message-ID: <dc1b937f-7695-4b55-8981-b36dd0baf761@kernel.dk>
Date: Mon, 21 Oct 2024 10:52:54 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Breno Leitao <leitao@debian.org>, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241021120631.5ed43983@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241021120631.5ed43983@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/24 7:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   block/elevator.c
> 
> between commit:
> 
>   b4ff6e93bfd0 ("elevator: do not request_module if elevator exists")
> 
> from Linus' tree and commit:
> 
>   a2c17a5ea44f ("block: return void from the queue_sysfs_entry load_module method")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I'll cooperate better with myself :-)

Merge looks good - just did it on my end too for my for-next branch, and
it's identical. Your next pull of the block for-next branch should merge
cleanly.

-- 
Jens Axboe

