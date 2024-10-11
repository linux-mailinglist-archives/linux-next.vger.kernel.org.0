Return-Path: <linux-next+bounces-4236-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3059E999CCD
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 08:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2C08282361
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 06:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B700E207A30;
	Fri, 11 Oct 2024 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGimTfSh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA68199FB9;
	Fri, 11 Oct 2024 06:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628741; cv=none; b=KZOizKSaG0CB08Qxu28b6W6bhFncdjrfHXBd0KyxyHGJpz1nxNZPIJ2lFpW3//IESRb43DmxLHqvF65hrK7nz5kgNFudrOdG61anlZATd562eogeF4Xm72RUM9Vq4Q2D68x4J00glw3GmimGekVkWMKcwgnbrjWP588JhmBHPSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628741; c=relaxed/simple;
	bh=sphMNBtBq2JfrUeJmQL2z1LLFQ5kMF6n4tSy6orduao=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=u6yYCyiTc19lno9AjU0tO56a6MqJaR0DTH7WljRltDSOVemQdkXuCMrOPh6QRXEzpjddkNslB2j6O4e35NoGPbxBAXwFqva24YjNigsPWlaRKRkW5JW7q8mOBFn6wHVYwImTtysY84uA2bD0fpx9PK297bxRh5LwAuDBqNjEQ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGimTfSh; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso1438616a12.1;
        Thu, 10 Oct 2024 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728628739; x=1729233539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2kBgmzV6ulETe3DyOqW6uc5QGClyp437iqFLFY+6s0=;
        b=SGimTfShdb+x9C8Ng/+jNFAe5ruHgFDgi5xYm0cXPkt7Z/yuT71oVaKMNJxNfh0i7U
         99a77im4uFuR2i7sYVKbiWSk6PA2K9aJV/FGVN1xk/5lUhWh0RU/eyQ1K0MbpqWs27+l
         Q8DaJd6K+KeA80h3MfEYY7Vv8Wf7UFO+X0W4WO85o582tOUFhzQSlTTDeruFR6fZwIcI
         4/X/zxVCZARBu2RW1QsRYCR+B3qbj85/FEAO2NFHWWrjx9A0YKNWBmhy+86ydbSnj+CL
         D/1nLW/fWFwPP7aB7dm5fJhJedNOify/9mJNAdrHNTpKEg1Ok2k4AjenAV1m53cpF1XE
         6AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728628739; x=1729233539;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2kBgmzV6ulETe3DyOqW6uc5QGClyp437iqFLFY+6s0=;
        b=k1EVkucniS9guC0vILI2k2cxUb7Y/N/y+Pr1EGNp9YtYi7hbeB2HDYQDY7Mv19tRs0
         MPKaPhW631ixa0+Gdd51i/FHInl5E+3OrKxhHySZojVGDyPqnTsoEkImoTOv5ATUGykN
         WVZFLEzQZyfX6FX+V5/BBqhxLlcBoN/UYq7CqwHUKNlB56RVQ6bBRoKt7dE01Q+6EbTE
         VfWX5mAUAdFCaL1opsYkWpFp4qIyNTSWXaX3QI3ACCieqNpU8Iy6SrGxTmnNJQijSb2T
         0L5A+zQateXG75Ijm5hZSoc5SBbeaQ05/GTuG9Qu3QZhnz16jU7ZQhA5QeE01M4h91oB
         ezFg==
X-Forwarded-Encrypted: i=1; AJvYcCU60t+rlbBXjquo6VmBYdJ994yirFR3JSCwKAAyOZgVPOAhTOt/PAQM1py5qCHhWLTM7XHuVdluUnq/uHE=@vger.kernel.org, AJvYcCVjCWXJE/qtVQn9FAqmlNAbdDSCLpsPlvuN+9oCO+xMoCTZXGMn76G3CocLDj10+iFC5lDcCgtJqW7McQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzst68zk8bVBgm4NAq0KmS4+pPYT5cGLbL2I4pvISDSwlTgUBlX
	QBHTzbg20laCXLYsDJSetUxUOcxILm0LMuz85qGkzNmggt/qQBpv
X-Google-Smtp-Source: AGHT+IH0cXgr9GZyFgZfiuDBiO60nQHRHJzNkJryE0cZprdnCNHHOoYBBtde7jAGQaA94G9IrjeOmg==
X-Received: by 2002:a17:90a:68cc:b0:2e2:cef9:4d98 with SMTP id 98e67ed59e1d1-2e2f0c5510dmr2285493a91.25.1728628739507;
        Thu, 10 Oct 2024 23:38:59 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5facc8csm2482996a91.37.2024.10.10.23.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 23:38:59 -0700 (PDT)
Message-ID: <ade1016b-cbd2-45a2-a4ea-aef96d21288e@gmail.com>
Date: Fri, 11 Oct 2024 15:38:57 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: greg@kroah.com
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 sfr@canb.auug.org.au
References: <2024101127-scrubbed-unfilled-8b47@gregkh>
Subject: Re: linux-next: build warning for a long time
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2024101127-scrubbed-unfilled-8b47@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> On Fri, Oct 11, 2024 at 05:24:42PM +1100, Stephen Rothwell wrote:
>> Hi all,
>> 
>> From before the git era, an htmldocs build (if we had such a thing back
>> then) would complain like this:
>> 
>> Documentation/driver-api/usb/usb:164: drivers/usb/core/message.c:968: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget:804.
>> Declaration is '.. c:function:: int usb_string (struct usb_device *dev, int index, char *buf, size_t size)'.
>> 
>> I assume it is confused because we have documented both a function and a
>> data type called "usb_string".  The former in drivers/usb/core/message.c
>> and the latter in include/linux/usb/gadget.h.
>> 
>> There are about 46 references to the function and 105 to the struct.
>> We could rename the function to usb_string_utf8 ...
> 
> But usb strings are not in utf8 format :)
> 
> As C can handle this just fine, odds are sphinx should also be able to
> handle this?
> 
> thanks,
> 
> greg k-h


