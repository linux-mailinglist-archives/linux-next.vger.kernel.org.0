Return-Path: <linux-next+bounces-2903-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0192C319
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 20:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A850EB24093
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 18:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E3F17B037;
	Tue,  9 Jul 2024 18:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TN8H2bbZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AF17B036
	for <linux-next@vger.kernel.org>; Tue,  9 Jul 2024 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720548558; cv=none; b=J7llC6nvmI0yUsQrKqs02cCIUtDryNHBkrE2yxloq5bdbBaiZr/heDOsN9lnmpZ1kddA8J1Xb7gXce8W9hYT2ZZm2dpr2qGwT8pMYJ07ih5quMaqhvt+MJRKMoSvssn+xc16zSMy65K1A4zd/Cknk8LGo83fYAm7t159e0Dl3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720548558; c=relaxed/simple;
	bh=Nedr5O72MMaCJZHo0lSW5X91GqQNSfgbP3hdBOw9eC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SX0MoL5bfCI2S/aow3cKi1SjowC8XKd4SkmwlWorHdwKArz5nQiHTWxp7LCqAAs4WMX7bq3fHf2MmZ08F0oACDu0dLxmuK4o92VcFoAkzRwBq0MemQXvT8801rabRipeikvrLfypFzGzgZqDPG7YKHEML+GMvCeMzBR6PUGKGww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TN8H2bbZ; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7f70a7470d3so11229439f.0
        for <linux-next@vger.kernel.org>; Tue, 09 Jul 2024 11:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720548556; x=1721153356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1E/FOgz2bzLAk7czsspwJRssUwyfo69Q4JV8FZsYC/0=;
        b=TN8H2bbZ7ibYoNF1/DHVfQSYP5qoFtQyexlE/dzeUFZbgg/QELjX7t0j2ngDxcA+iZ
         bHmZqjljGlnX/rOe2rfEGkxU0NO6qyvXOQFq7Fo77WzXMEIPjTHJY9QzeqIj/2qcp0kB
         T1QuH14XYCiZr20E2bLg/GX180keEh6mnqYZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720548556; x=1721153356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1E/FOgz2bzLAk7czsspwJRssUwyfo69Q4JV8FZsYC/0=;
        b=myzoEoVmN7wW0ZAcVLfXDHVEPubbwblJrxCUUTsltZjpwhHgTnoPAtu5xJ+whUqvPQ
         QDhtFHuT6iyMclfMJlo0x6Pl3kayncET3iysxcFCzE0+UBd1BwtzfBYHJjuuivBWuHRi
         q7yCueZS9E1B/ajbN4wsv+JkHm13lNkHyzJ1jRptG1MqMJ54UX0NiQSO6Wg6wDs70/bZ
         6ITHrxAhinD2hNugdkUr+eNA0z08EtgfZWXbdmMhGA0ycePrQbhw1H2xe6X951zC0GYe
         tkKDXY8xw+leWxLPmoB6DX4mERZg99cA7Ezlgqt221RbDE64CpcoNMmjEDz8keQCFe4Y
         Dm2A==
X-Forwarded-Encrypted: i=1; AJvYcCWxMDDgofAGFKQrfHKK1fKEtGT3lj/vvuBTZ7mW10gd4HQwe1HTl1HnuehF3l2P0krGkAD4C2SBkY+d33xvhIfPopT9OzAqualEjw==
X-Gm-Message-State: AOJu0YyvHN+/DTAEnTfBeVWC7rxsscpeNyxaMN26EJ6ehyVKua9A/NMB
	X+ZKM2U0lsxCqidbuWvj7ummWv4Kmfl+OVs+o5eDQ0MgDrLdKD+FUkNAMQr3bzM=
X-Google-Smtp-Source: AGHT+IHeHnBu5isyAddwI1V9QJx7d99P47RZ/yrGAW+PJhY/k0T9TJ/9xtTL5eHYe0IzkmsubRMkRg==
X-Received: by 2002:a05:6602:3413:b0:7f8:bfcd:db53 with SMTP id ca18e2360f4ac-8000269672bmr385534639f.1.1720548556008;
        Tue, 09 Jul 2024 11:09:16 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c0b1b0d41csm612367173.38.2024.07.09.11.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 11:09:15 -0700 (PDT)
Message-ID: <bb8602f1-71f9-438d-91b9-6793250648ea@linuxfoundation.org>
Date: Tue, 9 Jul 2024 12:09:14 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the random tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240709180829.65e8967d@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240709180829.65e8967d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/24 02:08, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the kselftest-fixes tree as different
> commits (but the same patches):
> 
>    868680ffba11 ("selftests/vDSO: remove duplicate compiler invocations from Makefile")
>    7bb79ef48b9d ("selftests/vDSO: remove partially duplicated "all:" target in Makefile")
>    14cd1a877fc6 ("selftests/vDSO: fix clang build errors and warnings")
> 
> These are already causing an unnecessary conflict
> :-( Maybe you could just merge the kselftest-fixes tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git#fixes),
> but first make sure that it won't be rebased.
> 

They are now in Linus's mainline. :)

thanks,
-- Shuah

