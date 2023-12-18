Return-Path: <linux-next+bounces-447-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4475F817C12
	for <lists+linux-next@lfdr.de>; Mon, 18 Dec 2023 21:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2571F23688
	for <lists+linux-next@lfdr.de>; Mon, 18 Dec 2023 20:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228EF73468;
	Mon, 18 Dec 2023 20:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f8AI2Eok"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A81173462
	for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 20:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7b720eb0ba3so45316339f.0
        for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 12:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702932064; x=1703536864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YC2ApcGCGW2qvE4CACJnSNbqSSoP/6ip8YOKi/ifCQU=;
        b=f8AI2EokwTzCVQhV8Ca/FQw8f0cRrntGm7QcfsnsYReFVlafZAcCYAURJOJc1krLY/
         j5P/dIS2yy3BKeZpxe3nXCdZrknftTg1b1PaOjbXPHgGI466I2hqPrdNcA7fydy9WUbG
         pPZiTShYRrn2QNh319GFRu1Gs+Z3j7Tr1x1jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702932064; x=1703536864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YC2ApcGCGW2qvE4CACJnSNbqSSoP/6ip8YOKi/ifCQU=;
        b=K58ASg/HEL4WB5GhI5j9EOOcrvXpOcFfCstZchxriKAQMj9JhxjsqmZhFSCyAzg3LN
         9sERD4/Ht1C4OH6l+69CwFpP5A6leIeoDmaI2VakWTu9ysRsk61yohlDVZJo2LCo3ugq
         T6+ALVVh7MHaRekywo3f/V+GbGYgmg4vUc20dkYRwj1QBTo6ta9dGMDBC6wtsvo/4x8v
         dbXffHrG/ILbnK2IxcZ3iq5l53Ek9CgOaB/tjg6Y5H/x/cCiM2UDPw/KBw6Bt0znnfYo
         nNeSVH2fE7fwwToqRN9B6l4o6YHIjqUkjrpoYUw8hgaph+HUwjxBHCeJGoVP1XDwPGpN
         Kb0w==
X-Gm-Message-State: AOJu0Yz7bt3/JQ+slC9+thN3OUsFRexGettkoVJAlcPzbZGJhZlQZW9v
	fGja4kTl/RnjVJyJIux2mmFXBg==
X-Google-Smtp-Source: AGHT+IEAxg8wQ3BT55l+ibiyWZRcTjVaSdclFylTnDELsS7wTXG4Npgb3NeFlj/URt6rkv4A7LnzZA==
X-Received: by 2002:a05:6e02:1d05:b0:35d:5779:4a5 with SMTP id i5-20020a056e021d0500b0035d577904a5mr29174645ila.0.1702932063952;
        Mon, 18 Dec 2023 12:41:03 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id bb15-20020a056e02000f00b0035d58d00b7bsm526194ilb.56.2023.12.18.12.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 12:41:03 -0800 (PST)
Message-ID: <e5bd5748-5e4c-432b-be04-ac763c5412b6@linuxfoundation.org>
Date: Mon, 18 Dec 2023 13:41:03 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the kunit-next tree with Linus' tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Brendan Higgins <brendanhiggins@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Rae Moar <rmoar@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231218154521.2394ed2c@canb.auug.org.au>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231218154521.2394ed2c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/23 21:45, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kunit-next tree got a conflict in:
> 
>    lib/kunit/test.c
> 
> between commit:
> 
>    2e3c94aed51e ("kunit: Reset suite counter right before running tests")
> 
> from Linus' tree and commit:
> 
>    6d696c4695c5 ("kunit: add ability to run tests after boot using debugfs")
> 
> from the kunit-next tree.
> 

Thank you Stephen. It is fixed now.

thanks,
-- Shuah


