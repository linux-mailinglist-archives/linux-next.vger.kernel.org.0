Return-Path: <linux-next+bounces-8096-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFE2B35175
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 04:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C619201582
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 02:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9498061FCE;
	Tue, 26 Aug 2025 02:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NNlhrMQB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93DE2E413
	for <linux-next@vger.kernel.org>; Tue, 26 Aug 2025 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756174541; cv=none; b=SnQThmWj+wcWFkJkGflHtzjppLx4v4wjuoWGnsqB1sEJ0RQLtLrPwG629QJDIWe918OwCpGZOpuTJbUbu2qFiIb49j1oNBCZaB+Nibe/sgLvMX8HFvj09dm32uSci7MdDlyoVmzBLLsLoSdrn+/N4k0fLc69GlzaaJwKQSEMvsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756174541; c=relaxed/simple;
	bh=lNn91KbVZt1MO8O4XMP7lZJ2kB5e/przdBqRhbBK2+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=he48qrTlDOVE7TXPBnFmNiFIwlCF6OAS8++SpomGmn1unzcMoOCcP/8rbS6YCdJui5WK0MWhjEyi3nbLu61Y/JtKCK2dR2tUuFLxfNoVDAYZLWuqJcan8/Fw51Clldsww1H2igY231tLY6JS/hRbNABHDBRX1Aix07v7QQkW1BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NNlhrMQB; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso4379729b3a.1
        for <linux-next@vger.kernel.org>; Mon, 25 Aug 2025 19:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1756174539; x=1756779339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iv07/KZb2f9dDjde78c38QxQX9Rd8L9eycmeggHBGOU=;
        b=NNlhrMQB8JCAvjLKklda8N19vCFNFdK8gYcnGcAPb3B8Gl7iD3EzN8WhfDEwF0i3ai
         HmaEmHj3nAZjmea0CVqujske6JHRF22enEVXNEI/pGjhkinAlrjmSqEd4lP2Trui2hLV
         NBU5BYnklLHKPDlsSm5a1gPfx5yA4pVJbtQXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756174539; x=1756779339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iv07/KZb2f9dDjde78c38QxQX9Rd8L9eycmeggHBGOU=;
        b=Q5UjcIYdi6CY6TjZ1Wg1jcBBwja+ozmA7NRG1VeqXDr8648BzynjtdRaRO8CG33LoJ
         Jkn+yGTpr3cl4Q+yozuJSRbNe3XpdvQQS8ZF+5gxmQi5+uxGAQ1gTf+rvaX4Ltn86Zuv
         1b3aqawx/N5P8wFBDUJ5091b0KcFkPTZUZxBcJo7kp32CFdWed9rnsqtn5l1yZyoQbtR
         CZQ2XM5xE+IWL4r9ipGlkyKVd/PraZ1X55X+YRWuGChnnqH3ZDaUuwVFFy40mwpVqig8
         D88f8oMt8Y0VmiWVy2RwQJySS2oVR8Fs0X/TRIpp13A63RuUNsGC4RX+DNdtNaWk2Z2D
         ef3g==
X-Forwarded-Encrypted: i=1; AJvYcCVv513zmpjkE29oFZzYb/lvEwOfrx7/Q6nDJsE3ndarXAqV7NApGtzv0iq5btfxOSBllXMSf/7IBLy3@vger.kernel.org
X-Gm-Message-State: AOJu0YxSyci1DnKPT8NUYx6iwBzAor5InhyBbfe7XObUgua8X3MuYMq3
	Pocunxknb5b2uKHWcTxT0h1JZpAviID+jF7f21Cpq8HN/gkiXNfkR0n1nGDN1aFSprc=
X-Gm-Gg: ASbGnctyXFvh36Skefz1gNtj066Uix5MA88anmY3Yz925HBb6rl5xPsc2nCfSqlfU8j
	FGrLZ9/3blj4sKEdK68b8qtNE7jOF7jZguVIWStJstjcHCWoCnRdXF3VPjgPd3pkAVGh15+H4GO
	7riwBFT1CjouX2GpzxsROr+UXs2QSDbpsXW76FABs8BavbKOU/QwDHKAsNUlFh4K2G2dJ1RoV/r
	asvHf0oZPVuGZjXBYggPMGWp3gsDgz5Ryi7pSxTAGsXu9+FbsrFKKGlNjkv8XBVr5XC6CVZMGrn
	4dQl4sftLjryIlCGtqHz/5Y3qKQUpTYYguNXNI6q8wRu7RFzd2rzz2gkDJy6WWaQL8e+IXsDy+o
	pR1+xVA3IEOSl8G4wKWMepT6vXHke0Eemku22mQ==
X-Google-Smtp-Source: AGHT+IEl90DE1zmnqNRIEzCk3KpFZ8tkAbZvjeW5FkOiMTSV0pQ6tPOU2Y1tolJnm2RBcLKGj9Herw==
X-Received: by 2002:a17:902:c943:b0:246:7d53:d40a with SMTP id d9443c01a7336-2467d53d82emr141657515ad.12.1756174539032;
        Mon, 25 Aug 2025 19:15:39 -0700 (PDT)
Received: from [192.168.100.106] ([103.80.12.207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687a5fc5sm80869965ad.52.2025.08.25.19.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 19:15:38 -0700 (PDT)
Message-ID: <4d5bad8a-6afa-4284-8f78-b52e2cfedbf0@linuxfoundation.org>
Date: Mon, 25 Aug 2025 20:15:05 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kunit-next tree
To: David Gow <davidgow@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Marie Zhussupova <marievic@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250818120846.347d64b1@canb.auug.org.au>
 <1befd7ab-f343-450f-9484-0cef21fe2da8@linuxfoundation.org>
 <CABVgOSm2_FGfjQpUBttuUH5ZrMEqnaGkYVkN6N96wX7Qs8EE2Q@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CABVgOSm2_FGfjQpUBttuUH5ZrMEqnaGkYVkN6N96wX7Qs8EE2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/25 01:44, David Gow wrote:
> On Tue, 19 Aug 2025 at 00:32, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 8/17/25 20:08, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the kunit-next tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>
>> Thank you Stephen. I did a allmodconfig build on 6.17-rc1 base - didn't
>> see the error.
>>
>> Marie, David, can you take a look this. Looks like conflict with drm
>> in next?
>>
> 
> Thanks, Shuah. I've managed to reproduce this with:
> ./tools/testing/kunit/kunit.py run --arch x86_64 --kunitconfig
> drivers/gpu/drm/xe
> 
> These patches fix it (and a corresponding drm/xe test failure):
> https://lore.kernel.org/linux-next/20250819073434.1411114-1-davidgow@google.com/T/#t
> 
> Ideally, they'll be squashed into the corresponding patches, as
> otherwise there'd be some temporary breakage during bisections. I can
> squash these into the original series and re-send it out if that works
> best for you.
> 

David,

Please squash them and resend - also I see a kernel test robot
error in patch 1/2.

I was going to squash them, but I saw the kernel test robot error patch.

thanks,
-- Shuah

