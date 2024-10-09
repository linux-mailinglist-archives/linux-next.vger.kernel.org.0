Return-Path: <linux-next+bounces-4195-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD0997739
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 23:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 147901F23330
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 21:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB0C1E2301;
	Wed,  9 Oct 2024 21:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="caAp8cCc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFE1DFE2B
	for <linux-next@vger.kernel.org>; Wed,  9 Oct 2024 21:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728507845; cv=none; b=copVtQ/kZ3hSsqp7oEOdydaCbkvF8aP7eOwzTXyrzyZs4+1DNJhmug2FLaG0HOUUKeJ24Im4i7w+iRqjrM4SquvkKLcsfcz7aXKStga8Aiac64vW+FatQP7a7fwnWWYmkGEfVS/abT6/w96HLpKURATJiu1Psd8k13cGmmP9sQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728507845; c=relaxed/simple;
	bh=IRyn45hp4bacUnVNdjlHeGO3IUZm8U0bflwaB5xU+VA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HjQJFxxhTVaHGNdQF5Arom570N3HFVRXE1KSU96Bt0f5vcNXGfaRBeP2/KMBlj0HWTIf2gwySWX8zTuPpICIf8xZIWWdd82khp7aG1QSSBegg8PNG4vRFCx/X4WU19TUrh76jPqECepBF80yDTLZfwsO9kF3hVlqBa/dFqUeplA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=caAp8cCc; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8354851fcabso9647839f.2
        for <linux-next@vger.kernel.org>; Wed, 09 Oct 2024 14:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728507842; x=1729112642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lbu3v7lc/5KDByWiBXSJyrqCdba8F8Y7c1FjXFUfqRo=;
        b=caAp8cCc7c9MmXOIG36C5nJwa97F9mHk/h4ywYz8LGybTlYf7xT3KjKINNGg4QocQ/
         ql0/QDXqpEEl2bXE0YfQ93i1obJQaqi4Up8RXSyNkkFR9ej4T7iIx/h9zRduQiJf+jQe
         /U/CBHCEU8HhLcHMxrI4zIpqeRy9XGedr6dJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728507842; x=1729112642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lbu3v7lc/5KDByWiBXSJyrqCdba8F8Y7c1FjXFUfqRo=;
        b=BEVhxCB2OGgjYxyJXFIP5XkBxFkAC2Dk75xHv1a8wBmIlsJrKxD9/C7W1ijXO3kMUC
         3ltMv1FTWWocaqaC7qT7SbCPb1Ef/MuH2acnOarcvS4SbcljNTrOrxiNnMXXyxD+1C5I
         J3FpEiD12L1YS8oWte5G/cuOZ0NiZQmYV1rdn4Zo/TEpB2gF0LT1ceb3/mwQcfi3fpS0
         qn0DRU1fcSjB5ON8mVGYpLSb45sO5yKvI2drRHg69zOWlK09ayxxKszadk7uhWaaHGj0
         vihn8iT2AH/NFKfjHMrJ0zhkxogZI3/u75L7IvUzBYJR6RXRcjFLvljZKZhWFdMhWKD4
         lmlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5FB94oOZgvflzFeG3FWEPcNkWqRS5DduJYuJ+uXvoLZFDieloB/4yutftT7EN3CCdIPSXZvjEDm3X@vger.kernel.org
X-Gm-Message-State: AOJu0YxnJjTNS27ZKpM3AlF5MIG7PyodmSg8oW1pgNbi1BGclwGEtgWQ
	6Yk2hMy4ykgwNF1kv44TIzZo4X0qTLPwQTlJ83kiNpHS7oRo/FOOooMJXD2g5RQ=
X-Google-Smtp-Source: AGHT+IGK7o2O24ZaAIvj+dA0rfE1ktIiX0yYTNSh3KDa45mflpVN70jibG1tJGrY7q4hcUdDolP81w==
X-Received: by 2002:a05:6602:1541:b0:832:123:c470 with SMTP id ca18e2360f4ac-8353d53953fmr463956439f.15.1728507842517;
        Wed, 09 Oct 2024 14:04:02 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83503b306d2sm235231439f.55.2024.10.09.14.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 14:04:02 -0700 (PDT)
Message-ID: <25172760-bb70-4343-b79f-8cd5f082122c@linuxfoundation.org>
Date: Wed, 9 Oct 2024 15:04:01 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kunit-next tree with the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Brendan Higgins <brendanhiggins@google.com>, David Gow
 <davidgow@google.com>, =?UTF-8?Q?Bruno_Sobreira_Fran=C3=A7a?=
 <brunofrancadevsec@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241004135527.1e2fc747@canb.auug.org.au>
 <51d2cb33-c0d3-4837-a22c-9c42a7a4818e@linuxfoundation.org>
 <20241009134255.8083566505456b4f1159a6d2@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241009134255.8083566505456b4f1159a6d2@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/24 14:42, Andrew Morton wrote:
> On Wed, 9 Oct 2024 09:11:19 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>>> I fixed it up (I used the latter version of lib/math/Makefile and see
>>> below the signature by the patch immediately below) and can carry the
>>> fix as necessary. This is now fixed as far as linux-next is concerned,
>>> but any non trivial conflicts should be mentioned to your upstream
>>> maintainer when your tree is submitted for merging.  You may also want
>>> to consider cooperating with the maintainer of the conflicting tree to
>>> minimise any particularly complex conflicts.
>>
>> Sorry for the delay on this. Thank you for fixing this up.
>>
>> Andrew,
>>
>> Looks like we might see more conflicts between mm and kunit trees
>> with the move from lib/ lib/tests/
>>
>> I dropped a couple of patches I couldn't apply. Would you like
>> me to drop this from kunit tree?
> 
> Yes please, it's mostly a lib/ thing.

Done.

Here is the link:

https://lore.kernel.org/all/20240924032200.167622-1-luis.hernandez093@gmail.com/
> 
> I can't actually find the original patch email.  f099bda563dd doesn't
> have a Link: to the submission (please update your scripts to fix
> this)  and the patch wasn't cc'ed to anything to which I subscribe
> (please prefer to cc linux-kernel on most patches because of this).
> 

Will do - thanks for the reminder.

thanks,
-- Shuah


