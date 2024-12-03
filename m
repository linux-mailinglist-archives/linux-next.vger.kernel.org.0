Return-Path: <linux-next+bounces-4867-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3BB9E2C6A
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 20:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DEB128312D
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 19:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C38205ADC;
	Tue,  3 Dec 2024 19:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlD/x7yY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137BB204F62;
	Tue,  3 Dec 2024 19:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733255578; cv=none; b=erFImipIIi/7YJ2eGGzLvx8KVy1FAF5q7YH3M4wdob+X5SRUIuKVNl+J68iTdmxSScdReZWCU7Jtd9dhw9j/XQGwUvoKOl9bBnrLyU3rxtLqRZKX7daHknS0pqmrSEsR61h8JRoMUHf8vFw2S3BRUgAyYR37Lx5//FSF5NHXzj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733255578; c=relaxed/simple;
	bh=ie5h+6CpGww4EvqMe8sRR1D6TyL6IN2CdvTaRNTfRB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baFjpIUcCooF67L0ArHHldYQtaCZfocUo1YNrXk1OtHUT4dMn/VZg2z152lrmhVYKE7lmwojtB4ZWd6jS0n42hjHo1+zA1g3DAyJ8h8NyvaF+ZFNKmzdn7zDb3VFnb/dF4xXkGreQByBVER5bMrkUy4knHhCvGqkOHbH/L20N0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlD/x7yY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21539e1d09cso56230435ad.1;
        Tue, 03 Dec 2024 11:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733255576; x=1733860376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7jNTWV+8gv1sP1pwmHNm1JBQRuq1KzrGOnDCul3WBmU=;
        b=UlD/x7yYf5dfg1jPp24Q8/X/NNN8OvwJ8qS0w3KGEWXG7tG9BDvuTjsPXqd/fYTxpb
         7XHeiY8pHk7aOcrEe3NcnGRS9l5cHQlBxJGOnwMdwX2VDDueQGDp2k6JIg7FCU8lSjeT
         j2vP/V28TW/Ensg23meahWmiziVgmMpA6gkO8xGQpj9rUktC1dPsgPvsxJkHyfUB/V6W
         We12UurVw8+GL+njXDc0TtEns+zR5cQfwzCmMoSnt3t+Ax6yKNogDW4qZLOWP5A3CRrS
         GX2j5UVx+KXINjoj8XUhUSg2ou1jtyCT2bpnVtJMYMd2a9hzc4KS9qBdUFYFNzK3TNkz
         TicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733255576; x=1733860376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jNTWV+8gv1sP1pwmHNm1JBQRuq1KzrGOnDCul3WBmU=;
        b=CFTpW0vVb6tg3KI8NZR2kXQRMNCj5o0gvnIXTCG5AxeMGTDQ7UWEhRpKNC5goftVHn
         39SeB95lzjAJAaezuzTHey3mUiNDL/f7tRLJ69IRnnTssVyBIz1rDK3fYordqPwB0LYN
         opW8FRVjmkG5AHpTQqLVrFLMK0FYf5c5etFDMsbHpoVXAAgRgIn4yk/ziLSs2V+Utu35
         aJDZ7x+G+M3LXceSFud96eOHArtwc2gfGuy/nkKSAfCjKtdTVwlEf8xBrGkHEtGVusct
         /xpdhM/+ptR4sbDDXIpNOin7KXT4OTV7x+nuis4DYYWSOG1ZZpYjI3x95+roUs99lSXJ
         OCGA==
X-Forwarded-Encrypted: i=1; AJvYcCW5ChLnthSN5FUMDkQYmWZWUmM+YyltxjAc8MwnDe5E8D+8PV9IEUzrbBeE0Cm3ORxPzzJZn5n2Oowx@vger.kernel.org
X-Gm-Message-State: AOJu0YwVsvdo6f7ktq01aYAPDi0GRs+HLmTaIFKflEbT66i3b40cZ/W9
	w9RUXF/Ht76J54B4Ado7uyNuORiAxYAOXER1PIlupHHZxuLorFPM1abnAQ==
X-Gm-Gg: ASbGnctQGyH+mkftbTf+7FHf9VwQhc1XI30GHBm6I/wcASomIcwk6EU5losm0H35Csq
	gv5Htg80mzLT9jfCJolVV8SDok6FXQzWI55VTDzve7tXQVoce6TUMud2cpj2y1WFMtAPCzblBv5
	Zf1EYskKezb5W01KeMwaHPqtH3FLr5jzd7XUva15nS1BIVMo6ecCUuEdk9vEkeE07d2If5r7GSf
	1jbVPESQ1Q7LhjPagP3pNJgBaTy7T8D49ulynavLjb82Unq34VuiHTlq2iE9DHqaQm/tcMwX+rK
	Uuasm1EdgSgFw/MQ7Q/Qr+c=
X-Google-Smtp-Source: AGHT+IFQj5ygVF12Vjd1JX0HqtF1mCI1f2Z/dwAH4ECKBi6ebdjhgLkcDmXNrtn/cQbT6imHAX1ysQ==
X-Received: by 2002:a17:902:d4c2:b0:215:b468:1a48 with SMTP id d9443c01a7336-215bd2001f9mr45261085ad.26.1733255576212;
        Tue, 03 Dec 2024 11:52:56 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7258bbbc565sm126340b3a.61.2024.12.03.11.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 11:52:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <24c61106-9928-4423-97b5-f43dc823d54d@roeck-us.net>
Date: Tue, 3 Dec 2024 11:52:54 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the hwmon-staging tree
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <Z09c_U2l8SqLQG-n@sirena.org.uk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z09c_U2l8SqLQG-n@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/24 11:33, Mark Brown wrote:
> Hi all,
> 
> After merging the hwmon-staging tree, today's linux-next build
> (x86 allmodconfig) failed like this:
> 
> In file included from /tmp/next/build/include/linux/module.h:22,
>                   from /tmp/next/build/include/linux/device/driver.h:21,
>                   from /tmp/next/build/include/linux/device.h:32,
>                   from /tmp/next/build/include/linux/hwmon-sysfs.h:10,
>                   from /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:9:
> /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:437:18: error: expected ',' or ';' before 'PMBUS'
>    437 | MODULE_IMPORT_NS(PMBUS);
>        |                  ^~~~~
> /tmp/next/build/include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
>     26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
>        |                                                             ^~~~
> /tmp/next/build/include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
>    299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
>        |                                 ^~~~~~~~~~~
> /tmp/next/build/drivers/hwmon/pmbus/tps25990.c:437:1: note: in expansion of macro 'MODULE_IMPORT_NS'
>    437 | MODULE_IMPORT_NS(PMBUS);
>        | ^~~~~~~~~~~~~~~~
> 
> Caused by an interaction with Linus' tree.  I have used the hwmon tree
> from 20241128 instead.

Yes, that is due to the MODULE_IMPORT_NS API change in the upstream kernel
that was pushed right after -rc1. I'll push a new version after I build tested it.

Guenter


