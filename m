Return-Path: <linux-next+bounces-7028-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588FACCAD8
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 17:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F6C18902D0
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 16:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A1723BF91;
	Tue,  3 Jun 2025 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyzjKTOO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF992C325E;
	Tue,  3 Jun 2025 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748966383; cv=none; b=msrGpBqpLpdhPHH9+WaRh4pAXyDj30ojSS5JILFNKwcQo9TL8yQ1VxtXJAU6j38XSrHh7ZcoTwJP59LvMgYsLM5tpiIHXAvf0YaF7WDl3GQ20dALqNkBsnHkHSWtNt2TeJ2WSqDaJMHuXVj+apTpNAOer9hIuLp50I9GH4TQo30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748966383; c=relaxed/simple;
	bh=S9rFyqEqfGykqpsB1Q1dXB4ySJhX94m8PwN7l2iyDzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSfuGkDo+hfcU5mjLESDk9KJQxwQoiiJV11eL+FLfU00vKaXi5/nX6uXsUpYXaNwQblF8Bbs7PMtS08n118h5rZUGip5CKh43TKfz+e2FeJ+rsucK+lP4hCQjzc5bcx5KULYFiNnKq+ReYCp1yGc86kwDgQvj8fwKgoRaJRFea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyzjKTOO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742caef5896so4878472b3a.3;
        Tue, 03 Jun 2025 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748966381; x=1749571181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=byvTZd8dGHi3GYuLA8Z6BPGWPQmb1AIbB7Z5ZeFCEco=;
        b=HyzjKTOOlmmKstZqXaYg2m+Ed0S1eE8c3K0AQVkHIlVP8TUm7nh1uNHO/+2Zs/hSIw
         xAXyjrKnwQiKZPOnx2l6dZJUp5ZeS9iJvnte627u1lgCHlAnrpaU219gkixHaJYXEd67
         mQdPGWPFYGYVfe/vmD0ir8MceUuuaXXVGP9bdsgsakfsgwlEo8vrzJ92TQ4y0oitQtyH
         JiX7GOKPT4LjwQWGLY749ItNyl9/TszZOmdRNN47/BdxvROVqrbeSEx6hMY8v7+QUkCh
         e3IyLRVhwMYzofWxDO4Ujqz2CzWtgN9YyrgdOcqlZdoWp9p5tf3l3N0f9E5AnsSUgzUV
         ggdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748966381; x=1749571181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byvTZd8dGHi3GYuLA8Z6BPGWPQmb1AIbB7Z5ZeFCEco=;
        b=vhwoiQjYVAKlqUZvg3TEKN8m2vFUaoJ6C+4eXDkAagOyfs9LTYvmAvhQJMZEQ0SDU6
         3Dvu/b+sTnoKcDGBPdDBScJBbHSWbrggaqkHsG3e7Yq/lRm3GLcCnplZW+VuUUwLCtHZ
         5qsp2v22qC3BN4x8YlwVLORipvjistYHMiPfLvFedolZVhl51/80zR15rrkVZqIAT6ZA
         XjvUo1ENIA55qkXH3olH5jXYdVGBl+hqpHrxBJlZLa8bzCVZz4kJ7aQDsBWvg+Ob1IU5
         d5luTgat1bGKl8W7+vCUYoigubS0Uh5OoH6/AEAH7NRTYe98NFYQ/2l17s938v3CEkov
         5KXg==
X-Forwarded-Encrypted: i=1; AJvYcCV6codfnAV/fv6cCdaX3u29Wao2rEg+MsWBhRsxgrAhgmFjeh2Q1Dt5EOiLbcC6BtNYiO1ERdUEu6Wtdpk=@vger.kernel.org, AJvYcCWmwLo3xWEUMlz1yUIVzqHcpGznGGnbTYu67ca167b49JydhcUHWFxwKGsh1ZFfcIpa44pELuglB3aJcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOSGmVCPZLRh24xALQ3WhlcwqPf5IXbtfOjxxMZcczIYYdDnVI
	uDlNX6Xsle8zj+elT9SwG+63wEbYnHyry91tgdrH6H56FlFXqkMMBHs3
X-Gm-Gg: ASbGncsFFQdQYVftfWVry64NVF1PmS46u7DYlcshv7/z1d8qA6shwPVg1PA6tXS8hSA
	NJUVSJqXJOK/LiwdjNgspLChA8LiUGz1/b+ENMmULSIT0ppZu6XcHWoz6khOivsq7XXhL6e2uD9
	ZwA4WxjnDP4IZUGXK2+u4o6yTEKeavtul1FS0IPv03J0qE0smcZKzbmCo+pSUAYZdQT41qkrFPt
	OcT+Cx2Ayf46aQOkPczwImtAn20oy1SAkbwegoW8qQTBh4Y7mmfBmFzV2ykTLyKxa/IVEbE2zly
	mLcXMkSHGz3P4NHq0uIplxUf85ZQERDBQNsu7E4AzsTXUmeixa4AlxKMLgxXruYkQ7RYV+E4XsZ
	LrUkJPPbIADAikyE40goz2T2E
X-Google-Smtp-Source: AGHT+IFl2MIAa/z34V+Rv3EN4B0t8IhoHEo3bTs1kto5CMUTPpbgS7oT1AGsVgoQyBYY0F33ub6Ktg==
X-Received: by 2002:a05:6a00:1a89:b0:740:91e4:8107 with SMTP id d2e1a72fcca58-747bd863bb4mr25107570b3a.0.1748966380784;
        Tue, 03 Jun 2025 08:59:40 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed4399sm9593589b3a.77.2025.06.03.08.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 08:59:40 -0700 (PDT)
Message-ID: <4ec0dba9-8fdd-42a7-946e-0ae06905bb68@gmail.com>
Date: Tue, 3 Jun 2025 08:59:38 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the char-misc tree with the broadcom
 tree
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Akshay Gupta <akshay.gupta@amd.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250603142730.084cf0a4@canb.auug.org.au>
 <2025060350-porous-clutter-88fc@gregkh>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <2025060350-porous-clutter-88fc@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 22:11, Greg KH wrote:
> On Tue, Jun 03, 2025 at 02:27:30PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the char-misc tree got conflicts in:
>>
>>    drivers/misc/Kconfig
>>    drivers/misc/Makefile
>>
>> between commit:
>>
>>    d04abc60a903 ("misc: rp1: RaspberryPi RP1 misc driver")
>>
>> from the broadcom tree and commit:
>>
>>    e15658676405 ("hwmon/misc: amd-sbi: Move core sbrmi from hwmon to misc")
>>
>> from the char-misc tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc drivers/misc/Kconfig
>> index e12e445a10fa,0de7c35f6fe5..000000000000
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@@ -660,5 -647,5 +659,6 @@@ source "drivers/misc/uacce/Kconfig
>>    source "drivers/misc/pvpanic/Kconfig"
>>    source "drivers/misc/mchp_pci1xxxx/Kconfig"
>>    source "drivers/misc/keba/Kconfig"
>>   +source "drivers/misc/rp1/Kconfig"
>> + source "drivers/misc/amd-sbi/Kconfig"
>>    endmenu
>> diff --cc drivers/misc/Makefile
>> index 9ed1c3d8dc06,b628044fb74e..000000000000
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@@ -75,4 -73,4 +74,5 @@@ lan966x-pci-objs		:= lan966x_pci.
>>    lan966x-pci-objs		+= lan966x_pci.dtbo.o
>>    obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
>>    obj-y				+= keba/
>>   +obj-$(CONFIG_MISC_RP1)		+= rp1/
>> + obj-y				+= amd-sbi/
> 
> This is fine, but why are new drivers being added to trees during the
> -rc1 merge window period?

I applied Andrea's pull request adding the RP1 drivers to get a head 
start on what merge conflicts we would get and some build coverage by 
the robots.
-- 
Florian

